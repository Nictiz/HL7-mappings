<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
   <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
   <xsl:include href="../hl7/hl7_2_ada_hl7_include.xsl"/>
   
    <xsl:variable name="oidOrganizerAllergyIntolerance">2.16.840.1.113883.2.4.3.11.60.66.10.20</xsl:variable>
    <xsl:variable name="oidOrganizerEpisode">2.16.840.1.113883.2.4.3.11.60.66.10.16</xsl:variable>
    
    <xsl:variable name="oidAllergyIntoleranceAct">2.16.840.1.113883.2.4.3.11.60.66.10.215</xsl:variable>
    <xsl:variable name="oidAllergyIntoleranceObservation">2.16.840.1.113883.2.4.3.11.60.66.10.216</xsl:variable>
    
    <xsl:variable name="oidEpisodeAct">2.16.840.1.113883.2.4.3.11.60.66.10.212</xsl:variable>
    <xsl:variable name="oidEpisodeProblem">2.16.840.1.113883.2.4.3.11.60.66.10.213</xsl:variable>
    
    <xsl:variable name="oidCriticalityObservation">2.16.840.1.113883.2.4.3.11.60.66.10.218</xsl:variable>
    <xsl:variable name="oidNoteObservation">2.16.840.1.113883.2.4.3.11.60.66.10.221</xsl:variable>
    <xsl:variable name="oidReactionObservation">2.16.840.1.113883.2.4.3.11.60.66.10.217</xsl:variable>
    <xsl:variable name="oidSeverityObservation">2.16.840.1.113883.2.4.3.11.60.66.10.219</xsl:variable>
    <xsl:variable name="oidRouteOfExposureObservation">2.16.840.1.113883.2.4.3.11.60.66.10.220</xsl:variable>
    
    <xsl:template name="handleII">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="elmName" as="xs:string" required="yes"/>
        
        <xsl:for-each select="$in">
            <xsl:element name="{$elmName}">
                <xsl:if test="@extension">
                    <xsl:attribute name="value" select="@extension"/>
                </xsl:if>
                <xsl:copy-of select="@root"/>
                <xsl:copy-of select="@nullFlavor"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <!-- for codeMap expect one or more elements like this:
        <map inCode="xx" inCodeSystem="yy" code=".." codeSystem=".." codeSystemName=".." codeSystemVersion=".." displayName=".."/>
        
        If input @code | @codeSystem matches, copy the other attributes from this element. Expected at minimum @code, @codeSystem, @displayName, others optional
    -->
    <!-- CS has no codeSystem has to be supplied from external. Usually oidHL7ActStatus or oidHL7RoleStatus
        CS also has no displayName. The code, e.g. active or completed, normally reflects the displayName too so copy code to displayName
    -->
    <xsl:template name="handleCS">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="codeSystem" as="xs:string" required="yes"/>
        <xsl:param name="elmName" as="xs:string" required="yes"/>
        <xsl:param name="codeMap" as="element()*"/>
        
        <xsl:variable name="rewrite" as="element()*">
            <xsl:for-each select="$in">
                <xsl:element name="{name(.)}">
                    <xsl:copy-of select="@*"/>
                    <xsl:if test="not(@codeSystem)">
                        <xsl:attribute name="codeSystem" select="$codeSystem"/>
                    </xsl:if>
                    <xsl:if test="not(@displayName)">
                        <xsl:attribute name="displayName" select="@code"/>
                    </xsl:if>
                    <xsl:copy-of select="node()"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:variable>
        <xsl:call-template name="handleCV">
            <xsl:with-param name="in" select="$rewrite"/>
            <xsl:with-param name="elmName" select="$elmName"/>
            <xsl:with-param name="codeMap" select="$codeMap"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="handleCV">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="elmName" as="xs:string" required="yes"/>
        <xsl:param name="codeMap" as="element()*"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="theCode" select="@code"/>
            <xsl:variable name="theNullFlavor" select="@nullFlavor"/>
            <xsl:variable name="theCodeSystem">
                <xsl:choose>
                    <xsl:when test="$theCode">
                        <xsl:value-of select="@codeSystem"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$oidHL7NullFlavor"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="out" as="element()">
                <xsl:choose>
                    <xsl:when test="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]">
                        <xsl:copy-of select="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]"/>
                    </xsl:when>
                    <xsl:when test="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]">
                        <xsl:copy-of select="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            
            <xsl:element name="{$elmName}">
                <xsl:copy-of select="$out/@code"/>
                <xsl:copy-of select="$out/@codeSystem"/>
                <xsl:copy-of select="$out/@codeSystemName"/>
                <xsl:copy-of select="$out/@codeSystemVersion"/>
                <xsl:copy-of select="$out/@displayName"/>
                <xsl:copy-of select="$out/@nullFlavor"/>
                <xsl:if test="hl7:originalText">
                    <xsl:attribute name="originalText" select="hl7:originalText"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="handleBL">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="elmName" as="xs:string" required="yes"/>
        
        <xsl:for-each select="$in">
            <xsl:element name="{$elmName}">
                <xsl:copy-of select="@value"/>
                <xsl:copy-of select="@nullFlavor"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="handleST">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="elmName" as="xs:string" required="yes"/>
        
        <xsl:for-each select="$in">
            <xsl:element name="{$elmName}">
                <xsl:if test="text()[not(normalize-space() = '')]">
                    <xsl:attribute name="value" select="."/>
                </xsl:if>
                <xsl:copy-of select="@nullFlavor"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="handleTS">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="elmName" as="xs:string" required="yes"/>
        
        <xsl:for-each select="$in">
            <xsl:element name="{$elmName}">
                <xsl:if test="@value">
                    <xsl:variable name="precision" select="nf:determine_date_precision(@value)"/>
                    <xsl:attribute name="value" select="nf:formatHL72XMLDate(@value, $precision)"/>
                </xsl:if>
                <xsl:copy-of select="@nullFlavor"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <!-- Copy name parts as faithful as possible to HCIM 2017 nl.zorg.part.NameInformation. Calculate name usage code. Submit unstructured name in last_name -->
    <xsl:template name="handleENtoNameInformation">
        <xsl:param name="in" as="element()*" required="yes"/>
        <xsl:param name="language" as="xs:string?">en-US</xsl:param>
        
        <!-- Element names based on language -->
        <xsl:variable name="elmNameInformation">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">name_information</xsl:when>
                <xsl:otherwise>naamgegevens</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmFirstNames">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">first_names</xsl:when>
                <xsl:otherwise>voornamen</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmGivenName">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">given_name</xsl:when>
                <xsl:otherwise>roepnaam</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmInitials">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">initals</xsl:when>
                <xsl:otherwise>initialen</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmNameUsage">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">name_usage</xsl:when>
                <xsl:otherwise>naamgebruik</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmLastName">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">last_name</xsl:when>
                <xsl:otherwise>geslachtsnaam</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmLastNamePrefix">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">prefix</xsl:when>
                <xsl:otherwise>voorvoegsels</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmLastNameLastName">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">last_name</xsl:when>
                <xsl:otherwise>geslachtsnaam</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmLastNamePartner">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">last_name_partner</xsl:when>
                <xsl:otherwise>geslachtsnaam_partner</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmLastNamePartnerPrefix">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">partner_prefix</xsl:when>
                <xsl:otherwise>voorvoegsels_partner</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmLastNamePartnerLastName">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">partner_last_name</xsl:when>
                <xsl:otherwise>geslachtsnaam_partner</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <!-- See for the HL7 spec of name: http://www.hl7.nl/wiki/index.php/DatatypesR1:PN -->
        <xsl:for-each select="$in">
            <xsl:choose>
                <xsl:when test="*">
                    <xsl:variable name="firstNames" select="normalize-space(string-join(hl7:given[tokenize(@qualifier, '\s') = 'BR' or not(@qualifier)], ' '))"/>
                    <xsl:variable name="givenName" select="normalize-space(string-join(hl7:given[tokenize(@qualifier, '\s') = 'CL'], ' '))"/>
                    <xsl:variable name="initials" select="normalize-space(string-join(hl7:given[tokenize(@qualifier, '\s') = 'IN'], ''))"/>
                    <xsl:variable name="nameUsage">
                        <xsl:choose>
                            <xsl:when test="hl7:family[tokenize(@qualifier, '\s') = 'BR'] and empty(hl7:family[tokenize(@qualifier, '\s') = 'SP'])">
                                <xsl:element name="{$elmNameUsage}">
                                    <xsl:attribute name="localId">1</xsl:attribute>
                                    <xsl:attribute name="code">NL1</xsl:attribute>
                                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                                    <xsl:attribute name="displayName">Eigen geslachtsnaam</xsl:attribute>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="hl7:family[tokenize(@qualifier, '\s') = 'SP'] and empty(hl7:family[not(tokenize(@qualifier, '\s') = 'SP')])">
                                <xsl:element name="{$elmNameUsage}">
                                    <xsl:attribute name="localId">2</xsl:attribute>
                                    <xsl:attribute name="code">NL2</xsl:attribute>
                                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                                    <xsl:attribute name="displayName">Geslachtsnaam partner</xsl:attribute>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="hl7:family[tokenize(@qualifier, '\s') = 'SP']/following-sibling::hl7:family[not(@qualifier) or tokenize(@qualifier, '\s') = 'BR']">
                                <xsl:element name="{$elmNameUsage}">
                                    <xsl:attribute name="localId">3</xsl:attribute>
                                    <xsl:attribute name="code">NL3</xsl:attribute>
                                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                                    <xsl:attribute name="displayName">Geslachtsnaam partner gevolgd door eigen geslachtsnaam</xsl:attribute>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="hl7:family[tokenize(@qualifier, '\s') = 'BR']/following-sibling::hl7:family[tokenize(@qualifier, '\s') = 'SP']">
                                <xsl:element name="{$elmNameUsage}">
                                    <xsl:attribute name="localId">4</xsl:attribute>
                                    <xsl:attribute name="code">NL4</xsl:attribute>
                                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                                    <xsl:attribute name="displayName">Eigen geslachtsnaam gevolgd door geslachtsnaam partner</xsl:attribute>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:element name="{$elmNameUsage}">
                                    <xsl:attribute name="localId">5</xsl:attribute>
                                    <xsl:attribute name="code">UNK</xsl:attribute>
                                    <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                                    <xsl:attribute name="displayName">Unknown</xsl:attribute>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="last_name" select="normalize-space(string-join(hl7:family[tokenize(@qualifier, '\s') = 'BR' or not(@qualifier)], ''))"/>
                    <xsl:variable name="last_name_prefix">
                        <xsl:if test="hl7:prefix">
                            <xsl:choose>
                                <!-- prefix of type VV and BR, don't look any further -->
                                <xsl:when test="hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][tokenize(@qualifier, '\s') = 'BR']">
                                    <xsl:value-of select="normalize-space(string-join(hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][tokenize(@qualifier, '\s') = 'BR'], ''))"/>
                                </xsl:when>
                                <!-- prefix of type VV and no family with qualifier, assume BR for both -->
                                <xsl:when test="hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][not(hl7:family/@qualifier)]">
                                    <xsl:value-of select="normalize-space(string-join(hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][not(hl7:family/@qualifier)], ''))"/>
                                </xsl:when>
                                <!-- prefix of type VV and first following sibling family with qualifier BR, assume BR for both -->
                                <xsl:when test="hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'BR']]">
                                    <xsl:value-of select="normalize-space(string-join(hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'BR']], ''))"/>
                                </xsl:when>
                                <!-- prefix without qualifier and no family with qualifier, assume BR for both -->
                                <xsl:when test="hl7:prefix[not(@qualifier)][not(hl7:family/@qualifier)]">
                                    <xsl:value-of select="normalize-space(string-join(hl7:prefix[not(@qualifier)][not(hl7:family/@qualifier)], ''))"/>
                                </xsl:when>
                                <!-- prefix without qualifier and first following sibling family with qualifier BR, assume BR for both -->
                                <xsl:when test="hl7:prefix[not(@qualifier)][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'BR']]">
                                    <xsl:value-of select="normalize-space(string-join(hl7:prefix[not(@qualifier)][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'BR']], ''))"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:variable>
                    <xsl:variable name="last_name_partner" select="normalize-space(string-join(hl7:family[tokenize(@qualifier, '\s') = 'SP'], ''))"/>
                    <xsl:variable name="last_name_partner_prefix">
                        <xsl:if test="hl7:prefix">
                            <xsl:choose>
                                <!-- prefix of type VV and BR, don't look any further -->
                                <xsl:when test="hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][tokenize(@qualifier, '\s') = 'SP']">
                                    <xsl:value-of select="normalize-space(string-join(hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][tokenize(@qualifier, '\s') = 'SP'], ''))"/>
                                </xsl:when>
                                <!-- prefix of type VV and first following sibling family with qualifier SP, assume SP for both -->
                                <xsl:when test="hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'SP']]">
                                    <xsl:value-of select="normalize-space(string-join(hl7:prefix[tokenize(@qualifier, '\s') = 'VV'][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'SP']], ''))"/>
                                </xsl:when>
                                <!-- prefix without qualifier and first following sibling family with qualifier SP, assume SP for both -->
                                <xsl:when test="hl7:prefix[not(@qualifier)][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'SP']]">
                                    <xsl:value-of select="normalize-space(string-join(hl7:prefix[not(@qualifier)][following-sibling::hl7:family[1][tokenize(@qualifier, '\s') = 'SP']], ''))"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:variable>
                    
                    <xsl:element name="{$elmNameInformation}">
                        <xsl:if test="string-length($firstNames) gt 0">
                            <xsl:element name="{$elmFirstNames}">
                                <xsl:attribute name="value" select="$firstNames"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="string-length($givenName) gt 0">
                            <xsl:element name="{$elmGivenName}">
                                <xsl:attribute name="value" select="$givenName"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="string-length($initials) gt 0">
                            <xsl:element name="{$elmInitials}">
                                <xsl:attribute name="value" select="$initials"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:copy-of select="$nameUsage"/>
                        <xsl:if test="string-length($last_name) gt 0">
                            <xsl:element name="{$elmLastName}">
                                <xsl:if test="string-length($last_name_prefix) gt 0">
                                    <xsl:element name="{$elmLastNamePrefix}">
                                        <xsl:attribute name="value" select="$last_name_prefix"/>
                                    </xsl:element>
                                </xsl:if>
                                <xsl:element name="{$elmLastName}">
                                    <xsl:attribute name="value" select="$last_name"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="string-length($last_name_partner) gt 0">
                            <xsl:element name="{$elmLastNamePartner}">
                                <xsl:if test="string-length($last_name_partner_prefix) gt 0">
                                    <xsl:element name="{$elmLastNamePartnerPrefix}">
                                        <xsl:attribute name="value" select="$last_name_partner_prefix"/>
                                    </xsl:element>
                                </xsl:if>
                                <xsl:element name="{$elmLastNamePartner}">
                                    <xsl:attribute name="value" select="$last_name_partner"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <!-- No name parts.... submit as last name only... -->
                    <xsl:element name="{$elmNameInformation}">
                        <xsl:element name="{$elmLastName}">
                            <xsl:element name="{$elmLastName}">
                                <xsl:attribute name="value" select="."/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    <!-- Copy address parts as faithful as possible to HCIM 2017 nl.zorg.part.AddressInformation. Calculate address code. Submit unstructured address in street
        Note: copies @code and @codeSystem for city, county and country too...
    -->
    <xsl:template name="handleADtoAddressInformation">
        <xsl:param name="in" as="element()*" required="yes"/>
        <xsl:param name="language" as="xs:string?">en-US</xsl:param>
        
        <!-- Element names based on language -->
        <xsl:variable name="elmAddressInformation">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">address_information</xsl:when>
                <xsl:otherwise>adresgegevens</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmStreet">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">street</xsl:when>
                <xsl:otherwise>straat</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHouseNumber">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">house_number</xsl:when>
                <xsl:otherwise>huisnummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHouseNumberLetter">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">house_number_letter</xsl:when>
                <xsl:otherwise>huisnummerletter</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHouseNumberAddition">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">house_number_addition</xsl:when>
                <xsl:otherwise>huisnummertoevoeging</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHouseNumberIndication">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">house_number_indication</xsl:when>
                <xsl:otherwise>aanduiding_bij_nummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmPostcode">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">postcode</xsl:when>
                <xsl:otherwise>postcode</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmPlaceOfResidence">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">place_of_residence</xsl:when>
                <xsl:otherwise>woonplaats</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmMunicipality">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">municipality</xsl:when>
                <xsl:otherwise>gemeente</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmCountry">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">country</xsl:when>
                <xsl:otherwise>land</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAdditionalInformation">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">additional_information</xsl:when>
                <xsl:otherwise>additionele_informatie</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAddressType">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">address_type</xsl:when>
                <xsl:otherwise>adres_soort</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:for-each select="$in">
            <xsl:variable name="theUse" select="tokenize(@use, '\s')"/>
            <xsl:variable name="addressType">
                <xsl:for-each select="distinct-values($theUse)">
                    <xsl:choose>
                        <xsl:when test=". = 'PST'">
                            <xsl:element name="{$elmAddressType}">
                                <xsl:attribute name="localId">1</xsl:attribute>
                                <xsl:attribute name="code">PST</xsl:attribute>
                                <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                <xsl:attribute name="displayName">Postal Addres</xsl:attribute>
                            </xsl:element>
                        </xsl:when>
                        <xsl:when test=". = 'HP'">
                            <xsl:element name="{$elmAddressType}">
                                <xsl:attribute name="localId">1</xsl:attribute>
                                <xsl:attribute name="code">HP</xsl:attribute>
                                <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                <xsl:attribute name="displayName">Primary Home</xsl:attribute>
                            </xsl:element>
                        </xsl:when>
                        <xsl:when test=". = 'PHYS'">
                            <xsl:element name="{$elmAddressType}">
                                <xsl:attribute name="localId">1</xsl:attribute>
                                <xsl:attribute name="code">PHYS</xsl:attribute>
                                <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                <xsl:attribute name="displayName">Visit Address</xsl:attribute>
                            </xsl:element>
                        </xsl:when>
                        <xsl:when test=". = 'TMP'">
                            <xsl:element name="{$elmAddressType}">
                                <xsl:attribute name="localId">1</xsl:attribute>
                                <xsl:attribute name="code">TMP</xsl:attribute>
                                <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                <xsl:attribute name="displayName">Tempory Address</xsl:attribute>
                            </xsl:element>
                        </xsl:when>
                        <xsl:when test="$theUse = 'WP'">
                            <xsl:element name="{$elmAddressType}">
                                <xsl:attribute name="localId">1</xsl:attribute>
                                <xsl:attribute name="code">WP</xsl:attribute>
                                <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                <xsl:attribute name="displayName">Work Place</xsl:attribute>
                            </xsl:element>
                        </xsl:when>
                        <xsl:when test=". = 'HV'">
                            <xsl:element name="{$elmAddressType}">
                                <xsl:attribute name="localId">1</xsl:attribute>
                                <xsl:attribute name="code">HV</xsl:attribute>
                                <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                <xsl:attribute name="displayName">Vacation Home</xsl:attribute>
                            </xsl:element>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:choose>
                <xsl:when test="*">
                    <xsl:for-each select="*[not(self::hl7:streetName | self::hl7:houseNumber | self::hl7:buildingNumberSuffix | self::hl7:unitID | self::hl7:additionalLocator | self::hl7:postalCode | self::hl7:city | self::hl7:county | self::hl7:country | self::hl7:desc)]">
                        <xsl:message>WARNING: Address contains unsupported address part: <xsl:value-of select="name()"/></xsl:message>
                    </xsl:for-each>
                    
                    <xsl:variable name="street" select="hl7:streetName[not(. = '')]"/>
                    <xsl:variable name="houseNumber" select="hl7:houseNumber[not(. = '')]"/>
                    <xsl:variable name="houseNumberLetter" select="hl7:buildingNumberSuffix[not(. = '')]"/>
                    <xsl:variable name="houseNumberAddition" select="hl7:unitID[not(. = '')]"/>
                    <xsl:variable name="houseNumberIndication" select="hl7:additionalLocator[not(. = '')]"/>
                    <xsl:variable name="postcode" select="hl7:postalCode[not(. = '')]"/>
                    <xsl:variable name="placeOfResidence" select="hl7:city[not(. = '')]"/>
                    <xsl:variable name="municipality" select="hl7:county[not(. = '')]"/>
                    <xsl:variable name="country" select="hl7:country[not(. = '')]"/>
                    <xsl:variable name="additionalInformation" select="hl7:desc[not(. = '')]"/>
                    <xsl:element name="{$elmAddressInformation}">
                        <xsl:if test="$street">
                            <xsl:element name="{$elmStreet}">
                                <xsl:attribute name="value" select="$street"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$houseNumber">
                            <xsl:element name="{$elmHouseNumber}">
                                <xsl:attribute name="value" select="$houseNumber"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$houseNumberLetter">
                            <xsl:element name="{$elmHouseNumberLetter}">
                                <xsl:attribute name="value" select="$houseNumberLetter"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$houseNumberAddition">
                            <xsl:element name="{$elmHouseNumberAddition}">
                                <xsl:attribute name="value" select="$houseNumberAddition"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$houseNumberIndication">
                            <xsl:element name="{$elmHouseNumberIndication}">
                                <xsl:attribute name="value" select="$houseNumberIndication"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$postcode">
                            <xsl:element name="{$elmPostcode}">
                                <xsl:attribute name="value" select="$postcode"/>
                            </xsl:element>
                        </xsl:if>
                        <!-- Codes? -->
                        <xsl:if test="$placeOfResidence">
                            <xsl:element name="{$elmPlaceOfResidence}">
                                <xsl:attribute name="value" select="$placeOfResidence"/>
                                <xsl:copy-of select="@code"/>
                                <xsl:copy-of select="@codeSystem"/>
                            </xsl:element>
                        </xsl:if>
                        <!-- Codes? -->
                        <xsl:if test="$municipality">
                            <xsl:element name="{$elmMunicipality}">
                                <xsl:attribute name="value" select="$municipality"/>
                                <xsl:copy-of select="@code"/>
                                <xsl:copy-of select="@codeSystem"/>
                            </xsl:element>
                        </xsl:if>
                        <!-- Codes? -->
                        <xsl:if test="$country">
                            <xsl:element name="{$elmCountry}">
                                <xsl:attribute name="value" select="$country"/>
                                <xsl:copy-of select="@code"/>
                                <xsl:copy-of select="@codeSystem"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="$additionalInformation">
                            <xsl:element name="{$elmAdditionalInformation}">
                                <xsl:attribute name="value" select="$additionalInformation"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:copy-of select="$addressType"/>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="{$elmAddressInformation}">
                        <!-- No address parts... submit as street -->
                        <xsl:element name="{$elmAdditionalInformation}">
                            <xsl:attribute name="value" select="."/>
                        </xsl:element>
                        <xsl:copy-of select="$addressType"/>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    <!-- Copy contact parts as faithful as possible to HCIM 2017 nl.zorg.part.ContactInformation. Calculate contact type code. -->
    <xsl:template name="handleTELtoContactInformation">
        <xsl:param name="in" as="element()*" required="yes"/>
        <xsl:param name="language" as="xs:string?">en-US</xsl:param>
        
        <!-- Element names based on language -->
        <xsl:variable name="elmContactInformation">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">contact_information</xsl:when>
                <xsl:otherwise>contactgegevens</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmTelephoneNumbers">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">telephone_numbers</xsl:when>
                <xsl:otherwise>telefoonnummers</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmTelephoneNumber">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">telephone_number</xsl:when>
                <xsl:otherwise>telefoonnummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmTelecomType">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">telecom_type</xsl:when>
                <xsl:otherwise>telecom_type</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmNumberType">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">number_type</xsl:when>
                <xsl:otherwise>nummer_soort</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmEmailAddresses">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">email_addresses</xsl:when>
                <xsl:otherwise>emailadressen</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmEmailAddress">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">email_address</xsl:when>
                <xsl:otherwise>emailadres</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmEmailAddressType">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">email_address_type</xsl:when>
                <xsl:otherwise>email_soort</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:if test="$in">
            <xsl:variable name="telephoneNumbers" select=".[matches(@value, '^(tel|fax):')] | .[matches(@value, '^[\d\s\(\)+-]$')]"/>
            <xsl:variable name="emailAddresses" select=".[matches(@value, '^mailto:')] | .[matches(@value, '.+@[^\.]+\.')]"/>
            
            <xsl:element name="{$elmContactInformation}">
                <xsl:if test="$telephoneNumbers">
                    <xsl:element name="{$elmTelephoneNumbers}">
                        <xsl:for-each select="$telephoneNumbers">
                            <xsl:variable name="theUse" select="tokenize(@use, '\s')"/>
                            <xsl:variable name="telecomType" as="element()?">
                                <xsl:choose>
                                    <xsl:when test="matches(replace(normalize-space(@value), '[^\d]', ''), '^(31)?0[12345789]')">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="localId">1</xsl:attribute>
                                            <xsl:attribute name="code">LL</xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.40.4.22.1</xsl:attribute>
                                            <xsl:attribute name="displayName">Landline</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="starts-with(@value, 'fax:')">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="localId">2</xsl:attribute>
                                            <xsl:attribute name="code">FAX</xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.40.4.22.1</xsl:attribute>
                                            <xsl:attribute name="displayName">Fax</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="tokenize(@use, '\s') = 'MC'">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="localId">3</xsl:attribute>
                                            <xsl:attribute name="code">MC</xsl:attribute>
                                            <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                            <xsl:attribute name="displayName">Mobiele telefoon</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="tokenize(@use, '\s') = 'PG'">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="localId">4</xsl:attribute>
                                            <xsl:attribute name="code">PG</xsl:attribute>
                                            <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                            <xsl:attribute name="displayName">Pager</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="numberType" as="element()?">
                                <xsl:choose>
                                    <xsl:when test="$theUse = 'HP'">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="localId">1</xsl:attribute>
                                            <xsl:attribute name="code">HP</xsl:attribute>
                                            <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                            <xsl:attribute name="displayName">Primary Home</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="$theUse = 'TMP'">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="localId">1</xsl:attribute>
                                            <xsl:attribute name="code">HP</xsl:attribute>
                                            <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                            <xsl:attribute name="displayName">Temporary Address</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="$theUse = 'WP'">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="localId">1</xsl:attribute>
                                            <xsl:attribute name="code">HP</xsl:attribute>
                                            <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                            <xsl:attribute name="displayName">Work place</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            
                            <xsl:element name="{$elmTelephoneNumber}">
                                <xsl:attribute name="value" select="@value"/>
                            </xsl:element>
                            <xsl:if test="$telecomType">
                                <xsl:copy-of select="$telecomType"/>
                            </xsl:if>
                            <xsl:if test="$numberType">
                                <xsl:copy-of select="$numberType"/>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="$emailAddresses">
                    <xsl:element name="{$elmEmailAddresses}">
                        <xsl:for-each select="$emailAddresses">
                            <xsl:variable name="theUse" select="tokenize(@use, '\s')"/>
                            <xsl:variable name="emailType" as="element()?">
                                <xsl:choose>
                                    <xsl:when test="$theUse = 'HP'">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="localId">1</xsl:attribute>
                                            <xsl:attribute name="code">HP</xsl:attribute>
                                            <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                            <xsl:attribute name="displayName">Primary Home</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="$theUse = 'WP'">
                                        <xsl:element name="{$elmTelecomType}">
                                            <xsl:attribute name="localId">1</xsl:attribute>
                                            <xsl:attribute name="code">HP</xsl:attribute>
                                            <xsl:attribute name="codeSystem" select="$oidHL7AddressUse"/>
                                            <xsl:attribute name="displayName">Work place</xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            
                            <xsl:element name="{$elmEmailAddress}">
                                <xsl:attribute name="value" select="@value"/>
                            </xsl:element>
                            <xsl:if test="$emailType">
                                <xsl:copy-of select="$emailType"/>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:if>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- CDArecordTargetSDTC-NL-BSN-Minimal -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.2_20170602000000">
        <xsl:param name="in" select="."/>
        <xsl:param name="elementName" as="xs:string?"/>
        <xsl:param name="language">en-US</xsl:param>
        
        <!-- Element names -->
        <xsl:variable name="elmPatient">
            <xsl:choose>
                <xsl:when test="not(empty($elementName))">
                    <xsl:value-of select="$elementName"/>
                </xsl:when>
                <xsl:when test="$language = 'en-US'">patient</xsl:when>
                <xsl:otherwise>patient</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmPatientIdentificationNumber">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">patient_identification_number</xsl:when>
                <xsl:otherwise>patient_identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmDateOfBirth">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">date_of_birth</xsl:when>
                <xsl:otherwise>geboortedatum</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmGender">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">gender</xsl:when>
                <xsl:otherwise>geslacht</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmMultipleBirthInd">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">multiple_birth_indicator</xsl:when>
                <xsl:otherwise>meerling_indicator</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmDeceasedInd">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">deceased_indicator</xsl:when>
                <xsl:otherwise>overlijdens_indicator</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmDeceasedDate">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">date_of_death</xsl:when>
                <xsl:otherwise>datum_overlijden</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:element name="{$elmPatient}">
            <xsl:call-template name="handleENtoNameInformation">
                <xsl:with-param name="in" select="$in/hl7:patient/hl7:name"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="handleADtoAddressInformation">
                <xsl:with-param name="in" select="$in/hl7:patient/hl7:addr"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <!--<xsl:call-template name="handleTELtoContactInformation">
                <xsl:with-param name="in" select="$in/hl7:patient/hl7:telecom"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>-->
            <xsl:call-template name="handleII">
                <xsl:with-param name="in" select="$in/hl7:id"/>
                <xsl:with-param name="elmName" select="$elmPatientIdentificationNumber"/>
            </xsl:call-template>
            <xsl:call-template name="handleTS">
                <xsl:with-param name="in" select="$in/hl7:patient/hl7:birthTime"/>
                <xsl:with-param name="elmName" select="$elmDateOfBirth"/>
            </xsl:call-template>
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="$in/hl7:patient/hl7:administrativeGenderCode"/>
                <xsl:with-param name="elmName" select="$elmGender"/>
            </xsl:call-template>
            <xsl:call-template name="handleBL">
                <xsl:with-param name="in" select="$in/hl7:patient/*:multipleBirthInd"/>
                <xsl:with-param name="elmName" select="$elmMultipleBirthInd"/>
            </xsl:call-template>
            <!--<xsl:call-template name="handleBL">
                <xsl:with-param name="in" select="$in/hl7:patient/*:deceasedInd"/>
                <xsl:with-param name="elmName" select="$elmDeceasedInd"/>
            </xsl:call-template>
            <xsl:call-template name="handleTS">
                <xsl:with-param name="in" select="$in/hl7:patient/*:deceasedTime"/>
                <xsl:with-param name="elmName" select="$elmDeceasedDate"/>
            </xsl:call-template>-->
        </xsl:element>
    </xsl:template>
    
    <!-- Ketenzorg KEZO Author (Body) -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9025_20140403162802">
        <xsl:param name="in" select="."/>
        <xsl:param name="elementName" as="xs:string?"/>
        <xsl:param name="language">en-US</xsl:param>
        <xsl:param name="typeCode" as="attribute()?"/>
        
        <!-- Element name -->
        <xsl:variable name="elmHealthProfessional">
            <xsl:choose>
                <xsl:when test="not(empty($elementName))">
                    <xsl:value-of select="$elementName"/>
                </xsl:when>
                <xsl:when test="$language = 'en-US'">health_professional</xsl:when>
                <xsl:otherwise>zorgverlener</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHealthProfessionalIdentificationNumber">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">health_professional_identification_number</xsl:when>
                <xsl:otherwise>zorgverlener_identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmSpecialism">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">specialty</xsl:when>
                <xsl:otherwise>specialisme</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHealthProfessionalRole">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">health_professional_role</xsl:when>
                <xsl:otherwise>zorgverleners_rol</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:element name="{$elmHealthProfessional}">
            <xsl:call-template name="handleII">
                <xsl:with-param name="in" select="hl7:id"/>
                <xsl:with-param name="elmName" select="$elmHealthProfessionalIdentificationNumber"/>
            </xsl:call-template>
            <xsl:call-template name="handleENtoNameInformation">
                <xsl:with-param name="in" select="hl7:assignedPerson/hl7:name"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="hl7:code"/>
                <xsl:with-param name="elmName" select="$elmSpecialism"/>
            </xsl:call-template>
            <xsl:call-template name="handleADtoAddressInformation">
                <xsl:with-param name="in" select="hl7:addr"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="handleTELtoContactInformation">
                <xsl:with-param name="in" select="hl7:telecom"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9002_20111219000000">
                <xsl:with-param name="in" select="hl7:representedOrganization"/>
            </xsl:call-template>
            <xsl:choose>
                <xsl:when test="$typeCode = 'RESP'">
                    <xsl:element name="{$elmHealthProfessionalRole}">
                        <xsl:attribute name="code" select="$typeCode"/>
                        <xsl:attribute name="codeSystem" select="$oidHL7ParticipationType"/>
                        <xsl:attribute name="displayName">Responsible Party</xsl:attribute>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$typeCode = 'REF'">
                    <xsl:element name="{$elmHealthProfessionalRole}">
                        <xsl:attribute name="code" select="$typeCode"/>
                        <xsl:attribute name="codeSystem" select="$oidHL7ParticipationType"/>
                        <xsl:attribute name="displayName">Referrer</xsl:attribute>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$typeCode = 'PRF'">
                    <xsl:element name="{$elmHealthProfessionalRole}">
                        <xsl:attribute name="code" select="$typeCode"/>
                        <xsl:attribute name="codeSystem" select="$oidHL7ParticipationType"/>
                        <xsl:attribute name="displayName">Performer</xsl:attribute>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$typeCode = 'SPRF'">
                    <xsl:element name="{$elmHealthProfessionalRole}">
                        <xsl:attribute name="code" select="$typeCode"/>
                        <xsl:attribute name="codeSystem" select="$oidHL7ParticipationType"/>
                        <xsl:attribute name="displayName">Secondary Performer</xsl:attribute>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$typeCode = 'CON'">
                    <xsl:element name="{$elmHealthProfessionalRole}">
                        <xsl:attribute name="code" select="$typeCode"/>
                        <xsl:attribute name="codeSystem" select="$oidHL7ParticipationType"/>
                        <xsl:attribute name="displayName">Consultant</xsl:attribute>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$typeCode = 'ATND'">
                    <xsl:element name="{$elmHealthProfessionalRole}">
                        <xsl:attribute name="code" select="$typeCode"/>
                        <xsl:attribute name="codeSystem" select="$oidHL7ParticipationType"/>
                        <xsl:attribute name="displayName">Attender</xsl:attribute>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$typeCode">
                    <xsl:element name="{$elmHealthProfessionalRole}">
                        <xsl:attribute name="code">OTH</xsl:attribute>
                        <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                        <xsl:attribute name="displayName">Other</xsl:attribute>
                        <xsl:attribute name="originalText" select="$typeCode"/>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
    <!-- Ketenzorg PART CDA Organization -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9002_20111219000000">
        <xsl:param name="in" select="."/>
        <xsl:param name="elementName" as="xs:string?"/>
        <xsl:param name="language">en-US</xsl:param>
        
        <xsl:variable name="elmHealthcareProvider">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">healthcare_provider</xsl:when>
                <xsl:otherwise>zorgaanbieder</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHealthcareProviderIdentificationNumber">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">healthcare_provider_identification_number</xsl:when>
                <xsl:otherwise>zorgaanbieder_identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHealthcareProviderName">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">organization_name</xsl:when>
                <xsl:otherwise>organisatienaam</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHealthcareProviderType">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">organization_type</xsl:when>
                <xsl:otherwise>organisatie_type</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:for-each select="$in">
            <xsl:element name="{$elmHealthcareProvider}">
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="elmName" select="$elmHealthcareProviderIdentificationNumber"/>
                </xsl:call-template>
                <xsl:call-template name="handleST">
                    <xsl:with-param name="in" select="hl7:name"/>
                    <xsl:with-param name="elmName" select="$elmHealthcareProviderName"/>
                </xsl:call-template>
                <xsl:call-template name="handleTELtoContactInformation">
                    <xsl:with-param name="in" select="hl7:telecom"/>
                    <xsl:with-param name="language" select="$language"/>
                </xsl:call-template>
                <xsl:call-template name="handleADtoAddressInformation">
                    <xsl:with-param name="in" select="hl7:addr"/>
                    <xsl:with-param name="language" select="$language"/>
                </xsl:call-template>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:code"/>
                    <xsl:with-param name="elmName" select="$elmHealthcareProviderType"/>
                </xsl:call-template>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:function name="nf:determine_date_precision">
        <xsl:param name="input-hl7-date"/>
        <xsl:choose>
            <xsl:when test="string-length($input-hl7-date) &lt;= 8">day</xsl:when>
            <xsl:when test="string-length($input-hl7-date) > 8">second</xsl:when>
            <xsl:otherwise>not_supported</xsl:otherwise>
        </xsl:choose>
    </xsl:function>
   
    <xsl:function name="nf:format2HL7Date" as="xs:string?">
        <xsl:param name="dateTime"/>
        <!-- precision determines the picture of the date format, currently only use case for day, minute or second. Seconds is the default. -->
        <xsl:param name="precision"/>
        <xsl:variable name="picture" as="xs:string?">
            <xsl:choose>
                <xsl:when test="upper-case($precision) = ('MINUTE', 'MINUUT', 'MINUTES', 'MINUTEN', 'MIN', 'M')">[Y0001][M01][D01][H01][m01]</xsl:when>
                <xsl:otherwise>[Y0001][M01][D01][H01][m01][s01]</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="normalize-space($dateTime) castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime($dateTime), $picture)"/>
            </xsl:when>
            <xsl:when test="normalize-space($dateTime) castable as xs:date">
                <xsl:value-of select="format-date(xs:date($dateTime), '[Y0001][M01][D01]')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$dateTime"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <!-- copy an element with all of it's contents in comments -->
    <xsl:template name="copyElementInComment">
        <xsl:param name="element"/>
        <xsl:text disable-output-escaping="yes">
                       &lt;!--</xsl:text>
        <xsl:for-each select="$element">
            <xsl:call-template name="copyWithoutComments"/>
        </xsl:for-each>
        <xsl:text disable-output-escaping="yes">--&gt;
</xsl:text>
    </xsl:template>
    <!-- copy without comments -->
    <xsl:template name="copyWithoutComments">
        <xsl:copy>
            <xsl:for-each select="@* | *">
                <xsl:call-template name="copyWithoutComments"/>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
