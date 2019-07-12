<!-- 
    Copyright © Nictiz
    
    This program is free software; you can redistribute it and/or modify it under the terms 
    of the GNU General Public License as published by the Free Software Foundation; 
    either version 3 of the License, or (at your option) any later version.
    
    This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
    without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
    See the GNU General Public License for more details.
    
    See http://www.gnu.org/licenses/gpl.html
-->
<!-- 
    Produces one or more full ADA Mapping Community files in an output directory relative to the working dir, as starting point for 
    the tedious work on documenting mappings from HL7 V3 to the ADA format that represents a transaction
    
    One community per transaction in the ADA definition file (see param ada below) is produced.
    
    Expected input: kz-development-en-US-transactions.xml from (development) publication
        How to obtain: use the /decor/services/RetrieveProject service to get the transaction-xpath from an existing version/release of your project
        If you need to create it from your current project, e.g. after updating template mappings but before you are ready for an actual new 
        publication, you can produce a 'development' release from the Project form Version Info tab. You'll activate a recently added option for 
        that after clicking the 'release' option
    
    Expected param: ketenzorg3.0-ada.xml which is the ADA definition file. This is used as an index for reading the input
        How to obtain: create one based on https://www.art-decor.org/mediawiki/index.php?title=ADA_Documentation#ADA_Definitions
        It uses the definition file by processing only those transactionDatasets/dataset elements from the input that match 
        //view[@type = 'crud']/@transactionId + @transactionEffectiveDate from the definition file.
-->
<!-- History
    2019-07-11 AH Initial version
    2019-07-12 AH Added documentation
-->
<xsl:stylesheet xmlns:local="http://art-decor.org/functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="#all">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>
    
    <!-- Version label to be used in @name, @displayName and filename of the community -->
    <xsl:param name="versionLabel" select="(/*/@versionLabel[not(. = '')], /*/@versionDate[. castable as xs:dateTime])[1]" as="xs:string?"/>
    <!-- Language for community desc -->
    <xsl:param name="language" as="xs:string?">en-US</xsl:param>
    <!-- These are read/write users. guest has read access by default -->
    <xsl:param name="users" as="xs:string">arianne alexander</xsl:param>
    <!-- The ADA definition file to use as index on the input -->
    <xsl:param name="ada" as="xs:string">ketenzorg3.0-ada.xml</xsl:param>
    
    <xsl:template match="/" exclude-result-prefixes="#all">
        <xsl:for-each select="transactionDatasets/dataset">
            <xsl:variable name="trid" select="@transactionId"/>
            <xsl:variable name="tred" select="@transactionEffectiveDate"/>
            <xsl:if test="$transactions[@transactionId = $trid][@transactionEffectiveDate = $tred]">
                <xsl:variable name="communityName"><xsl:call-template name="doCommunityName"/></xsl:variable>
                
                <xsl:result-document href="output/community-{$communityName}.xml" indent="yes" omit-xml-declaration="yes">
                    <xsl:element name="{$communityFramework/name()}">
                        <xsl:copy-of select="$communityFramework/@*"/>
                        <xsl:attribute name="name" select="$communityName"/>
                        <xsl:attribute name="displayName">
                            <xsl:call-template name="doCommunityDisplayName"/>
                        </xsl:attribute>
                        <xsl:call-template name="doCommunityDescription"/>
                        <xsl:copy-of select="$communityFramework/access"/>
                        <xsl:copy-of select="$communityFramework/prototype"/>
                        <associations>
                            <xsl:for-each select=".//concept[not(ancestor::history | ancestor::conceptList)]">
                                <!--<xsl:comment><xsl:value-of select="name[1]"/></xsl:comment>-->
                                <xsl:choose>
                                    <xsl:when test=".[implementation/@xpath | implementation/xpath | ancestor::concept[implementation/@shortName = ('address_information', 'name_information', 'contact_information')]]">
                                        <association>
                                            <object type="DE" ref="{@id}" flexibility="{@effectiveDate}"/>
                                            <data type="mapType"><xsl:value-of select="(valueDomain/@type, @type)[1]"/></data>
                                            <data type="mapConcept">
                                                <xsl:variable name="currentImplementation" select="implementation" as="element()*"/>
                                                <xsl:variable name="parentImplementation" as="xs:string?">
                                                    <xsl:variable name="parents" as="element()*">
                                                        <xsl:for-each select="$currentImplementation/xpath">
                                                            <xsl:variable name="xpath" select="."/>
                                                            <xsl:copy-of select="$currentImplementation/../ancestor::concept[implementation[starts-with($xpath, @xpath)]]"/>
                                                        </xsl:for-each>
                                                    </xsl:variable>
                                                    
                                                    <xsl:copy-of select="(ancestor::concept[@id = $parents/@id]/implementation/@xpath)[last()]"/>
                                                </xsl:variable>
                                                <xsl:choose>
                                                    <xsl:when test="$currentImplementation/@xpath">
                                                        <xsl:value-of select="replace($currentImplementation/@xpath, 'hl7:|cda:', '')"/>
                                                    </xsl:when>
                                                    <xsl:when test="count($currentImplementation/xpath[starts-with(., $parentImplementation)]) = 1">
                                                        <xsl:value-of select="replace($currentImplementation/xpath[starts-with(., $parentImplementation)], 'hl7:|cda:', '')"/>
                                                    </xsl:when>
                                                    <xsl:when test="$currentImplementation/xpath">
                                                        <xsl:for-each select="$currentImplementation/xpath">
                                                            <div>
                                                                <xsl:value-of select="replace(., 'hl7:|cda:', '')"/>
                                                            </div>
                                                        </xsl:for-each>
                                                    </xsl:when>
                                                    <xsl:when test="ancestor::concept[implementation/@shortName = 'address_information']">
                                                        <xsl:choose>
                                                            <xsl:when test="implementation/@shortName = 'street'">
                                                                <xsl:text>./streetName</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'house_number'">
                                                                <xsl:text>./houseNumber</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'house_number_letter'">
                                                                <xsl:text>./buildingNumberSuffix</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'house_number_addition'">
                                                                <xsl:text>./buildingNumberSuffix</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'house_number_indication'">
                                                                <xsl:text>./additionalLocator</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'postcode'">
                                                                <xsl:text>./postalCode</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'place_of_residence'">
                                                                <xsl:text>./city</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'municipality'">
                                                                <xsl:text>./county</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'country'">
                                                                <xsl:text>./country</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'additional_information'">
                                                                <xsl:text>./unitID</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'address_type'">
                                                                <xsl:text>./@use</xsl:text>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:message terminate="yes">Unsupported particle: <xsl:value-of select="implementation/@shortName"/></xsl:message>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:when>
                                                    <xsl:when test="ancestor::concept[implementation/@shortName = 'name_information']">
                                                        <xsl:choose>
                                                            <xsl:when test="implementation/@shortName = 'first_names'">
                                                                <xsl:text>./given[not(tokenize(@qualifier, '\s') = 'IN')]</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'initials'">
                                                                <xsl:text>./given[tokenize(@qualifier, '\s') = 'IN']</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'given_name'">
                                                                <xsl:text>./given[tokenize(@qualifier, '\s') = 'CL']</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'prefix' and parent::concept[implementation/@shortName = 'last_name']">
                                                                <xsl:text>./prefix[tokenize(@qualifier, '\s') = 'VV'][not(tokenize(@qualifier, '\s') = 'SP')]</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'partner_prefix' and parent::concept[implementation/@shortName = 'last_name_partner']">
                                                                <xsl:text>./prefix[tokenize(@qualifier, '\s') = 'VV'][tokenize(@qualifier, '\s') = 'SP']</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'last_name' and parent::concept[implementation/@shortName = 'last_name']">
                                                                <xsl:text>./family[not(tokenize(@qualifier, '\s') = 'SP')]</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'partner_last_name'">
                                                                <xsl:text>./family[tokenize(@qualifier, '\s') = 'SP']</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'last_name_partner'"/>
                                                            <xsl:when test="implementation/@shortName = 'last_name'"/>
                                                            <xsl:when test="implementation/@shortName = 'name_usage'"/>
                                                            <xsl:otherwise>
                                                                <xsl:message terminate="yes">Unsupported particle: <xsl:value-of select="implementation/@shortName"/></xsl:message>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:when>
                                                    <xsl:when test="ancestor::concept[implementation/@shortName = 'contact_information']">
                                                        <xsl:choose>
                                                            <xsl:when test="implementation/@shortName = 'telephone_number'">
                                                                <xsl:text>.[starts-with(@value, 'tel:') or starts-with(@value, 'fax:') or not(matches(@value, '^[a-z]+:'))]</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'telecom_type'">
                                                                <xsl:text>./@use</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'number_type'">
                                                                <xsl:text>./@use</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'email_address'">
                                                                <xsl:text>.[starts-with(@value, 'mailto:')]</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'email_address_type'">
                                                                <xsl:text>./@use</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="implementation/@shortName = 'telephone_numbers'"/>
                                                            <xsl:when test="implementation/@shortName = 'email_addresses'"/>
                                                            <xsl:otherwise>
                                                                <xsl:message terminate="yes">Unsupported particle: <xsl:value-of select="implementation/@shortName"/></xsl:message>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </data>
                                            <data type="mapCard">
                                                <xsl:value-of select="@minimumMultiplicity"/>
                                                <xsl:text>..</xsl:text>
                                                <xsl:value-of select="@maximumMultiplicity"/>
                                            </data>
                                            <xsl:choose>
                                                <xsl:when test="implementation/@shortName = 'address_usage' and ancestor::concept[implementation/@shortName = 'address_information']">
                                                    <data type="mapDescription">
                                                        Het element buildingNumberSuffix bevat, indien aanwezig, huisletter en/of huisnummertoevoeging.
                                                        <p><b>Export</b></p>
                                                        <ul>
                                                        <li>Als er zowel een huisletter als een huisnummertoevoeging bekend is: de huisletter komt eerst, dan een spatie en tenslotte de huisnummertoevoeging. Deze samengestelde waarde wordt doorgegeven in de buildingNumberSuffix.</li>
                                                        <li>Als er alleen een huisnummertoevoeging bekend is, wordt deze in de buildingNumberSuffix doorgegeven.</li>
                                                        <li>Als er alleen een huisletter bekend is, wordt deze in de buildingNumberSuffix doorgegeven.</li>
                                                        </ul>
                                                        <p><b>Import</b></p>
                                                        <ul>
                                                        <li>Als de buildingNumberSuffix uit één karakter bestaat, dan wordt de waarde als huisletter geïmporteerd.</li>
                                                        <li>Als de buildingNumberSuffix uit meer dan één karakter bestaat en het tweede karakter is geen spatie, dan wordt de waarde als huisnummertoevoeging geïmporteerd.</li>
                                                        <li>Als de buildingNumberSuffix uit meer dan één karakter bestaat en het tweede karakter is wel een spatie, dan wordt het gedeelte voor de spatie (het eerste karakter) als huisletter geïmporteerd, en het gedeelte na de spatie (de rest) als huisnummertoevoeging.</li>
                                                        </ul>
                                                    </data>
                                                </xsl:when>
                                                <xsl:when test="implementation/@shortName = 'name_usage' and ancestor::concept[implementation/@shortName = 'name_information']">
                                                    <data type="mapDescription">Naamvolgorde wordt afgeleid uit HL7v3 elementvolgorde:
                                                        <ul>
                                                            <li>NL1: family en geen family[tokenize(@qualifier, '\s') = 'SP']</li>
                                                            <li>NL2: family[tokenize(@qualifier, '\s') = 'SP'] en geen family[not(tokenize(@qualifier, '\s') = 'SP')]</li>
                                                            <li>NL3: family[tokenize(@qualifier, '\s') = 'SP']/following-sibling::family[not(tokenize(@qualifier, '\s') = 'SP')]</li>
                                                            <li>NL4: family[not(tokenize(@qualifier, '\s') = 'SP')]/following-sibling::family[tokenize(@qualifier, '\s') = 'SP']</li>
                                                            <li>UNK in andere gevallen</li>
                                                        </ul>
                                                    </data>
                                                </xsl:when>
                                            </xsl:choose>
                                        </association>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:for-each>
                        </associations>
                    </xsl:element>
                </xsl:result-document>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Takes community display name and replaces whitespace with hyphens -->
    <xsl:template name="doCommunityName" match="dataset" as="xs:string">
        <xsl:variable name="dn" as="xs:string">
            <xsl:call-template name="doCommunityDisplayName"/>
        </xsl:variable>
        <!--<xsl:value-of select="@prefix"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="replace(../@versionDate, '[^\d]', '')"/>
        <xsl:text>-v3-</xsl:text>
        <xsl:value-of select="@shortName"/>
        <xsl:text>-to-Dataset</xsl:text>-->
        <xsl:value-of select="replace(normalize-space($dn), ' ', '-')"/>
    </xsl:template>
    
    <!-- Format "[project prefix]-[versionLabel] v3 [data set name] to Dataset", e.g. "kz-3.0.2 v3 Alerts Response to Dataset"
        Can be called using a different language to influence this part "[data set name] to Dataset"
    -->
    <xsl:template name="doCommunityDisplayName" match="dataset" as="xs:string">
        <xsl:param name="lang" select="$language"/>
        <!-- the versionLabel or a date string yyyymmmdd -->
        <xsl:variable name="vd" select="normalize-space(($versionLabel[not(. = '')], replace(substring(string(current-dateTime()), 1, 10), '-', ''))[1])"/>
        <!-- rewrite versionLabel to semver major(.minor(.patch)?)?(-prerelease string)(+build string) if possible by removing something like 'v' or 'v ' (or capital V)
            v3.0.2 or v 3.0.2 will be 3.0.2
            
            any other string is copied as-is
        -->
        <xsl:variable name="dn">
            <xsl:value-of select="@prefix"/>
            <xsl:choose>
                <!-- 1.0.0 1.0 1 -->
                <!-- 1.0.0-alpha, 1.0.0-alpha.1, 1.0.0-0.3.7, 1.0.0-x.7.z.92 -->
                <!-- 1.0.0-alpha+001, 1.0.0+20130313144700, 1.0.0-beta+exp.sha.5114f85 -->
                <xsl:when test="matches($vd, '^[Vv]\s*\d+(\.\d+){0,2}(-[\dA-Za-z\.-]+)?(\+[\dA-Za-z\.-]+)?$')">
                    <xsl:value-of select="replace($vd, '^[Vv]\s*', '')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$vd"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text> v3 </xsl:text>
            <xsl:value-of select="replace((name[@language = $lang], name)[1], '[/:]', '')"/>
            <xsl:choose>
                <xsl:when test="$lang = 'nl-NL'">
                    <xsl:text> naar Dataset</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> to Dataset</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:value-of select="string-join($dn, '')"/>
    </xsl:template>
    
    <!-- Returns community display name in <desc language="$language"> element. If language != nl-NL then adds a second nl-NL desc element  -->
    <xsl:template name="doCommunityDescription" match="dataset" as="element()+">
        <desc language="{$language}"><xsl:call-template name="doCommunityDisplayName"/></desc>
        <xsl:if test="not($language = 'nl-NL')">
            <desc language="nl-NL">
                <xsl:call-template name="doCommunityDisplayName">
                    <xsl:with-param name="lang">nl-NL</xsl:with-param>
                </xsl:call-template>
            </desc>
        </xsl:if>
    </xsl:template>
    
    <!-- Index the ADA definition file -->
    <xsl:variable name="transactions" select="doc($ada)//view[@type = 'crud'][@transactionId]" as="element()*"/>
    
    <!-- Basics for a mapping community -->
    <xsl:variable name="communityFramework" as="element(community)">
        <community name="" projectId="{/transactionDatasets/@projectId}" displayName="">
            <desc language="{$language}"></desc>
            <access>
                <author username="guest" rights="r"/>
                <xsl:for-each-group select="tokenize(normalize-space($users), '\s')" group-by=".">
                    <author username="{current-group()[1]}" rights="rw"/>
                </xsl:for-each-group>
            </access>
            <prototype>
                <data type="mapType" label="Type" datatype="enum">
                    <desc language="nl-NL">Datatype</desc>
                    <desc language="en-US">Data type</desc>
                    <enumValue>boolean</enumValue>
                    <enumValue>blob</enumValue>
                    <enumValue>count</enumValue>
                    <enumValue>code</enumValue>
                    <enumValue>datetime</enumValue>
                    <enumValue>decimal</enumValue>
                    <enumValue>group</enumValue>
                    <enumValue>identifier</enumValue>
                    <enumValue>quantity</enumValue>
                    <enumValue>string</enumValue>
                </data>
                <data type="mapConcept" label="Concept" datatype="text">
                    <desc language="nl-NL">Mapping naar concept</desc>
                    <desc language="en-US">Mapping to concept</desc>
                </data>
                <data type="mapCard" label="Card" datatype="text">
                    <desc language="nl-NL">Kardinaliteit / verplichting</desc>
                    <desc language="en-US">Cardinality / conformance</desc>
                </data>
                <data type="mapDescription" label="Description" datatype="text">
                    <desc language="nl-NL">Omschrijving met uitleg over de mapping</desc>
                    <desc language="en-US">Description containing further explanation about mapping</desc>
                </data>
                <data type="xpath" label="XPath" datatype="text">
                    <desc language="nl-NL">XPath expressie naar XML waarde. Neem op 'complex' als de mapping niet in één xpath expressie is te vatten</desc>
                    <desc language="en-US">XPath expression to XML value. Enter 'complex' when the mapping cannot be expressed in one xpath expression</desc>
                </data>
            </prototype>
        </community>
    </xsl:variable>
</xsl:stylesheet>