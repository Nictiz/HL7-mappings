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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:f="http://hl7.org/fhir" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:util="urn:hl7:utilities" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../hl7/hl7_2_ada_hl7_include.xsl"/>
    <xsl:import href="../../fhir_2_ada/fhir/fhir_2_ada_fhir_include.xsl"/>
    <xsl:import href="../../util/comment.xsl"/>
    <xsl:import href="../../util/units.xsl"/>
    <xsl:import href="../../util/datetime.xsl"/>
    <xsl:import href="../../util/mp-functions.xsl"/>

    <xsl:output method="xml" indent="yes"/>
    <!-- ada output language -->
    <xsl:param name="language">nl-NL</xsl:param>
    <xsl:param name="logLevel" select="$logINFO" as="xs:string"/>

    <xsl:param name="transaction-name">beschikbaarstellen_medicatiegegevens</xsl:param>

    <xsl:variable name="templateId-medicatieafspraak" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9324', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9275', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9233', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9235', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9241', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9216'"/>
    <xsl:variable name="templateId-wisselend_doseerschema" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9380'"/>
    <xsl:variable name="templateId-verstrekkingsverzoek" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9356', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9301', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9257'"/>
    <xsl:variable name="templateId-toedieningsafspraak" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9332', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9299', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9259', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9256'"/>
    <xsl:variable name="templateId-medicatietoediening" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9373'"/>

    <xsl:variable name="templateId-stoptype" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9372', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9067'"/>
    <xsl:variable name="templateId-redenVanVoorschrijven" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9316', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9160'"/>
    <xsl:variable name="templateId-redenWijzigenOfStaken" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9370', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9270'"/>


    <xsl:variable name="templateId-verstrekking" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9364', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9294', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9255'"/>
    <xsl:variable name="templateId-medicatiegebruik" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9322', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9279', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9250', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9246', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9208'"/>
    <xsl:variable name="templateId-medicamenteuze-behandeling">2.16.840.1.113883.2.4.3.11.60.20.77.10.9084</xsl:variable>

    <xsl:variable name="templateId-lichaamsgewicht" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.121.10.19', '2.16.840.1.113883.2.4.3.11.60.7.10.28', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9123'"/>
    <xsl:variable name="templateId-lichaamslengte" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.7.10.30', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9122'"/>
    <xsl:variable name="templateId-labuitslag" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.7.10.31'"/>

    <xsl:variable name="maCode" as="xs:string*" select="'33633005', '16076005'"/>
    <xsl:variable name="vvCode" as="xs:string*" select="'33633005', '16076005'"/>
    <xsl:variable name="wdsCode" as="xs:string*" select="'395067002'"/>
    <xsl:variable name="taCode" as="xs:string*" select="'422037009'"/>
    <xsl:variable name="mveCode" as="xs:string*" select="'52711000146108'"/>
    <xsl:variable name="mgbCode" as="xs:string*" select="'6', '422979000'"/>

    <!-- toedienschema -->
    <xsl:variable name="templateId-toedienschema" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9359', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9319', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9309', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9149'"/>

    <!-- relatie_naar_afspraak_of_gebruik -->
    <xsl:variable name="template-id-rel-ma">2.16.840.1.113883.2.4.3.11.60.20.77.10.9086</xsl:variable>
    <xsl:variable name="template-id-rel-ta">2.16.840.1.113883.2.4.3.11.60.20.77.10.9101</xsl:variable>
    <xsl:variable name="template-id-rel-gb">2.16.840.1.113883.2.4.3.11.60.20.77.10.9176</xsl:variable>
    <xsl:variable name="template-id-rel-afspr-gebr" select="($template-id-rel-ma, $template-id-rel-ta, $template-id-rel-gb)"/>


    <xd:doc>
        <xd:desc>Helper template for the relations for general practitioners</xd:desc>
        <xd:param name="in">The hl7 building block which has the relations in entryRelationships. Defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="_huisartsenRelaties">
        <xsl:param name="in" select="."/>

        <!-- relatie contact -->
        <xsl:for-each select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:encounter">
            <relatie_contact>
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="elemName">identificatienummer</xsl:with-param>
                </xsl:call-template>
            </relatie_contact>
        </xsl:for-each>

        <!-- relatie zorgepisode -->
        <xsl:for-each select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:act[hl7:code[@code = 'CONC'][@codeSystem = '2.16.840.1.113883.5.6']]">
            <relatie_zorgepisode>
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="elemName">identificatienummer</xsl:with-param>
                </xsl:call-template>
            </relatie_zorgepisode>
        </xsl:for-each>

    </xsl:template>


    <xd:doc>
        <xd:desc>Helper template for toedieningsweg for MP 9 2.0</xd:desc>
        <xd:param name="inHl7">The HL7 element which contains the toedieningsweg, typically rateQuantity</xd:param>
    </xd:doc>
    <xsl:template name="_toedieningssnelheid92">
        <xsl:param name="inHl7" as="element()*" select="."/>
        <xsl:for-each select="$inHl7">
            <xsl:variable name="ucum-rate-eenheden" select="./*/@unit"/>
            <xsl:variable name="ucum-rate-eenheid">
                <xsl:if test="
                        every $i in $ucum-rate-eenheden
                            satisfies $i = $ucum-rate-eenheden[1]">
                    <xsl:value-of select="$ucum-rate-eenheden[1]"/>
                </xsl:if>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="string-length($ucum-rate-eenheid) gt 0">
                    <toedieningssnelheid>
                        <waarde>
                            <xsl:for-each select="hl7:low">
                                <minimum_waarde value="{@value}"/>
                            </xsl:for-each>
                            <xsl:for-each select="hl7:center">
                                <nominale_waarde value="{@value}"/>
                            </xsl:for-each>
                            <xsl:for-each select="hl7:high">
                                <maximum_waarde value="{@value}"/>
                            </xsl:for-each>
                        </waarde>
                        <xsl:variable name="ucum-eenheid" select="substring-before($ucum-rate-eenheid, '/')"/>
                        <eenheid>
                            <xsl:call-template name="UCUM2GstdBasiseenheid">
                                <xsl:with-param name="UCUM" select="$ucum-eenheid"/>
                            </xsl:call-template>
                        </eenheid>
                        <xsl:variable name="ucum-tijdseenheid" select="substring-after($ucum-rate-eenheid, '/')"/>
                        <!-- tijdseenheid is usually of a format like: ml/h -->
                        <!-- however, a format like ml/2.h (milliliter per 2 hours) is also allowed in UCUM and the datamodel -->
                        <!-- however, all the occurences of rate unit (min and max) must be equal to one another -->
                        <xsl:variable name="firstChar" select="substring(translate($ucum-tijdseenheid, '0123456789.', ''), 1, 1)"/>
                        <xsl:variable name="beforeFirstChar" select="substring-before($ucum-tijdseenheid, $firstChar)"/>
                        <xsl:variable name="ucum-tijdseenheid-value">
                            <xsl:choose>
                                <xsl:when test="string-length($beforeFirstChar) gt 0">
                                    <xsl:value-of select="substring-before($beforeFirstChar, '.')"/>
                                </xsl:when>
                                <xsl:otherwise>1</xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="ucum-tijdseenheid-unit" select="concat($firstChar, substring-after($ucum-tijdseenheid, $firstChar))"/>
                        <tijdseenheid value="{$ucum-tijdseenheid-value}" unit="{nf:convertTime_UCUM2ADA_unit($ucum-tijdseenheid-unit)}"/>
                    </toedieningssnelheid>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="level" select="$logERROR"/>
                        <xsl:with-param name="terminate" select="false()"/>
                        <xsl:with-param name="msg">Cannot output "toedieningssnelheid" because the ratequantity/*/@unit are not all equal, found: "<xsl:value-of select="string-join($ucum-rate-eenheden, ' and ')"/>".</xsl:with-param>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>

    </xsl:template>

    <xd:doc>
        <xd:desc> Outputs the contents of zorgaanbieder in 9.0.7 verstrekker </xd:desc>
    </xd:doc>
    <xsl:template name="_verstrekkerContents907">
        <xsl:for-each select="hl7:id">
            <xsl:variable name="elemName">zorgaanbieder_identificatie_nummer</xsl:variable>
            <xsl:call-template name="handleII">
                <xsl:with-param name="elemName" select="$elemName"/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- organisatienaam has 1..1 R in MP 9 ADA transactions, but is not always present in HL7 input messages.  -->
        <!-- fill with nullFlavor if necessary -->
        <xsl:variable name="elemName">organisatie_naam</xsl:variable>
        <xsl:element name="{$elemName}">
            <xsl:choose>
                <xsl:when test="hl7:name">
                    <xsl:attribute name="value" select="hl7:name/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>

        </xsl:element>

        <!-- contactgegevens -->
        <xsl:call-template name="handleTELtoContactInformation">
            <xsl:with-param name="in" select="hl7:telecom"/>
            <xsl:with-param name="language" select="$language"/>
            <xsl:with-param name="outputTelecomType" select="false()"/>


        </xsl:call-template>

        <!-- adresgegevens -->
        <!-- address information -->
        <xsl:call-template name="handleADtoAddressInformation">
            <xsl:with-param name="in" select="hl7:addr"/>
            <xsl:with-param name="language" select="$language"/>


        </xsl:call-template>

    </xsl:template>

    <xd:doc>
        <xd:desc> Outputs the contents of zorgaanbieder </xd:desc>
    </xd:doc>
    <xsl:template name="_zorgaanbieder-contents">
        <xsl:for-each select="hl7:id">
            <xsl:variable name="elemName">zorgaanbieder_identificatienummer</xsl:variable>
            <xsl:call-template name="handleII">
                <xsl:with-param name="elemName" select="$elemName"/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- organisatienaam has 1..1 R in MP 9 ADA transactions, but is not always present in HL7 input messages.  -->
        <!-- fill with nullFlavor if necessary -->
        <xsl:variable name="elemName">organisatie_naam</xsl:variable>
        <xsl:element name="{$elemName}">
            <xsl:choose>
                <xsl:when test="hl7:name">
                    <xsl:attribute name="value" select="hl7:name/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>

        </xsl:element>

        <!-- contactgegevens -->
        <xsl:call-template name="handleTELtoContactInformation">
            <xsl:with-param name="in" select="hl7:telecom"/>
            <xsl:with-param name="language" select="$language"/>
            <xsl:with-param name="outputTelecomType" select="false()"/>


        </xsl:call-template>

        <!-- adresgegevens -->
        <!-- address information -->
        <xsl:call-template name="handleADtoAddressInformation">
            <xsl:with-param name="in" select="hl7:addr"/>
            <xsl:with-param name="language" select="$language"/>


        </xsl:call-template>


    </xsl:template>

    <xd:doc>
        <xd:desc>Creates ada attributes taking a hl7 code element as input</xd:desc>
        <xd:param name="current-hl7-code">The hl7 code element for which to create the attributes</xd:param>
    </xd:doc>
    <xsl:template name="mp9-code-attribs">
        <xsl:param name="current-hl7-code" as="element()?" select="."/>

        <xsl:for-each select="$current-hl7-code">
            <xsl:choose>
                <xsl:when test=".[@code]">
                    <xsl:copy-of select="@code | @codeSystem | @codeSystemName | @codeSystemVersion | @displayName"/>
                </xsl:when>
                <xsl:when test=".[@nullFlavor]">
                    <xsl:attribute name="code" select="./@nullFlavor"/>
                    <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                    <xsl:attribute name="displayName" select="$hl7NullFlavorMap[@hl7NullFlavor = @nullFlavor]/@displayName"/>
                    <xsl:for-each select="hl7:originalText">
                        <xsl:attribute name="originalText" select="."/>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to output ada dagdeel element based on input HL7 PIVL</xd:desc>
        <xd:param name="PIVL_TS-HD">The input "hour of day" (HD) PIVL_TS</xd:param>
    </xd:doc>
    <xsl:template name="mp9-dagdeel">
        <xsl:param name="PIVL_TS-HD" as="element()?"/>

        <xsl:for-each select="$daypartMap[@hl7PIVLPhaseLow = $PIVL_TS-HD/hl7nl:phase/hl7nl:low/@value][@hl7PIVLPhaseHigh = $PIVL_TS-HD/hl7nl:phase/hl7nl:high/@value]">
            <dagdeel code="{@code}" displayName="{@displayName}" codeSystem="{@codeSystem}" codeSystemName="{@codeSystemName}"/>
        </xsl:for-each>

    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="current-hl7-mar"/>
        <xd:param name="hl7-pivl"/>
    </xd:doc>
    <xsl:template name="mp9-doseerinstructie-from-mp612-cyclisch">
        <xsl:param name="current-hl7-mar"/>
        <xsl:param name="hl7-pivl"/>
        <xsl:comment>mp9-doseerinstructie-from-mp612-cyclisch</xsl:comment>
        <!-- herhaalperiode_cyclisch_schema -->
        <xsl:variable name="hl7-herhaal-periode" select="$hl7-pivl[hl7:phase[hl7:width]]/hl7:period"/>
        <!-- er mag er maar eentje zijn, als er toch meerdere zijn die niet gelijk zijn dan geen gestructureerde informatie in de output -->
        <xsl:variable name="hl7-herhaal-periode-string">
            <xsl:for-each select="$hl7-herhaal-periode">
                <item>
                    <xsl:value-of select="concat(./@value, ./@unit)"/>
                </item>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="aantal_distinct_cyclisch" select="count(distinct-values($hl7-herhaal-periode-string/item))"/>
        <xsl:variable name="aantal-delen-cyclisch" select="count($hl7-herhaal-periode)"/>
        <xsl:choose>
            <!-- $aantal-delen-cyclisch should be one less than the amount of pivls. One pivl should indicate how often to take the medicin, the other represents the cyclical schedule -->
            <!-- if only a cyclical schedule is communicated that is still outputted, but it is not communicated then how many times a day the medication should be taken -->
            <xsl:when test="$aantal_distinct_cyclisch = 1 and ($aantal-delen-cyclisch = count($hl7-pivl) - 1 or $aantal-delen-cyclisch = count($hl7-pivl))">
                <xsl:for-each select="$hl7-herhaal-periode[1]">
                    <herhaalperiode_cyclisch_schema value="{@value}" unit="{@unit}"/>
                </xsl:for-each>
                <!-- doseerinstructie -->
                <xsl:for-each select="$hl7-pivl[hl7:phase[hl7:width]]">
                    <doseerinstructie>
                        <!-- volgnummer niet opnemen, is altijd 1 voor deze conversie -->
                        <!-- doseerduur cyclisch schema -->
                        <xsl:for-each select="hl7:phase/hl7:width">
                            <doseerduur value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                        </xsl:for-each>
                        <!-- dosering, in 6.12 kan er maar één zijn per mar dus per doseerinstructie -->
                        <!-- in MP 9 mag dosering weer herhalen binnen een doseerinstructie, maar dit kan niet met 6.12 -->
                        <dosering>
                            <!-- keerdosis -->
                            <xsl:call-template name="mp9-keerdosis">
                                <xsl:with-param name="hl7-doseQuantity" select="$current-hl7-mar/hl7:doseQuantity"/>
                            </xsl:call-template>
                            <!-- toedieningsschema -->
                            <toedieningsschema>
                                <xsl:call-template name="mp9-vaste-frequentie-from-mp-612">
                                    <xsl:with-param name="current-hl7-pivl" select="$hl7-pivl[not(hl7:phase)]"/>
                                </xsl:call-template>
                            </toedieningsschema>
                            <!-- zo nodig -->
                            <xsl:if test="./ancestor::hl7:medicationAdministrationRequest/hl7:precondition/hl7:observationEventCriterion/hl7:code | ./ancestor::hl7:medicationAdministrationRequest/hl7:maxDoseQuantity">
                                <xsl:call-template name="mp9-zonodig">
                                    <xsl:with-param name="max-dose" select="./ancestor::hl7:medicationAdministrationRequest/hl7:maxDoseQuantity"/>
                                    <xsl:with-param name="zonodig-code" select="./ancestor::hl7:medicationAdministrationRequest/hl7:precondition/hl7:observationEventCriterion/hl7:code"/>
                                </xsl:call-template>
                            </xsl:if>
                            <!-- toedieningssnelheid en toedieningsduur niet ondersteund in 6.12-->
                        </dosering>
                    </doseerinstructie>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$aantal_distinct_cyclisch gt 1">
                        <xsl:call-template name="util:logMessage">
                            <xsl:with-param name="level" select="$logWARN"/>
                            <xsl:with-param name="terminate" select="false()"/>
                            <xsl:with-param name="msg">Found more than one 'herhaalperiode_cyclisch_schema' in input. Cannot convert this and the corresponding doseerinstructie(s) into structured output. Please refer to textual description.</xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="not($aantal-delen-cyclisch = count($hl7-pivl))">
                        <xsl:call-template name="util:logMessage">
                            <xsl:with-param name="level" select="$logWARN"/>
                            <xsl:with-param name="terminate" select="false()"/>
                            <xsl:with-param name="msg">Found a combination of cyclic and non-cyclic dosing schedules.  Cannot convert this and the corresponding doseerinstructie(s) into structured output.Please refer to textual description.</xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="."/>
                        <xsl:call-template name="util:logMessage">
                            <xsl:with-param name="level" select="$logERROR"/>
                            <xsl:with-param name="terminate" select="false()"/>
                            <xsl:with-param name="msg">Unexpected error. Cannot convert doseerinstructie(s) into structured output.</xsl:with-param>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="current-hl7-mar"/>
    </xd:doc>
    <xsl:template name="mp9-doseerinstructie-from-mp612-eenmalig">
        <xsl:param name="current-hl7-mar"/>
        <xsl:comment>mp9-doseerinstructie-from-mp612-eenmalig</xsl:comment>
        <xsl:for-each select="$current-hl7-mar">
            <doseerinstructie>
                <!-- volgnummer niet opnemen, is altijd 1 voor deze conversie -->
                <!-- dosering, in 6.12 kan er maar één zijn per mar dus per doseerinstructie -->
                <!-- in MP 9 mag dosering weer herhalen binnen een doseerinstructie, maar dit kan niet met 6.12 -->
                <dosering>
                    <!-- keerdosis -->
                    <xsl:call-template name="mp9-keerdosis">
                        <xsl:with-param name="hl7-doseQuantity" select="hl7:doseQuantity"/>
                    </xsl:call-template>
                    <toedieningsschema>
                        <frequentie>
                            <aantal>
                                <vaste_waarde value="1"/>
                            </aantal>
                        </frequentie>
                    </toedieningsschema>
                </dosering>
            </doseerinstructie>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Doseerinstructie met toedientijd(en) voor MP 6.12</xd:desc>
        <xd:param name="current-hl7-mar">Het huidige HL7 element voor medicationAdministrationRequest</xd:param>
        <xd:param name="hl7-pivl">Het HL7 element met PIVL_TS</xd:param>
    </xd:doc>
    <xsl:template name="mp9-doseerinstructie-from-mp612-tijden">
        <xsl:param name="current-hl7-mar"/>
        <xsl:param name="hl7-pivl"/>
        <xsl:comment>mp9-doseerinstructie-from-mp612-tijden</xsl:comment>
        <xsl:for-each select="$current-hl7-mar">
            <doseerinstructie>
                <!-- volgnummer niet opnemen, is altijd 1 voor deze conversie -->
                <!-- dosering, in 6.12 kan er maar één zijn per mar dus per doseerinstructie -->
                <!-- in MP 9 mag dosering weer herhalen binnen een doseerinstructie, maar dit kan niet met 6.12 -->
                <dosering>
                    <!-- keerdosis -->
                    <xsl:call-template name="mp9-keerdosis">
                        <xsl:with-param name="hl7-doseQuantity" select="hl7:doseQuantity"/>
                    </xsl:call-template>

                    <!-- toedieningsschema -->
                    <toedieningsschema>
                        <!-- only output frequentie if the hl7:period is more than one day ánd an integer -->
                        <!-- once a day is implicit in toedieningstijd: take at noon daily, only need to add frequence when it is take at noon every other day... -->
                        <!-- a time with an interval of more then once a day does not make sense -->
                        <!-- not does a specific with an interval of a partial day (i.e. take at noon every 1,5 day does not make sense) -->
                        <xsl:choose>
                            <xsl:when test="$hl7-pivl[1]/hl7:period[@value = '1'][@unit = 'd']"><!-- Do nothing, no need to output frequency of once a day --></xsl:when>
                            <xsl:when test="$hl7-pivl[1]/hl7:period[not(@unit = 'd')]">
                                <xsl:comment>Found a schedule with a specific time and an interval unequal to 'd'. This is not allowed.</xsl:comment>
                            </xsl:when>
                            <!-- frequency must be the same in all pivl's, let's take the first -->
                            <xsl:when test="$hl7-pivl[1]/hl7:period[@value castable as xs:integer and @value &gt; 1]">
                                <!-- let's output the frequency -->
                                <frequentie>
                                    <aantal>
                                        <vaste_waarde value="1"/>
                                    </aantal>
                                    <tijdseenheid value="{$hl7-pivl[1]/hl7:period/@value}" unit="{nf:convertTime_UCUM2ADA_unit($hl7-pivl[1]/hl7:period/@unit)}"/>
                                </frequentie>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="terminate" select="false()"/>
                                    <xsl:with-param name="msg">Unexpected error with contents of period in toedieningsschema for toedieningstijd</xsl:with-param>
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:for-each select="$hl7-pivl[hl7:phase/hl7:center]">
                            <!-- toedientijd -->
                            <xsl:choose>
                                <xsl:when test="hl7:period[@value castable as xs:integer and xs:integer(@value) ge 1][@unit = 'd']">
                                    <!-- output the toedieningstijd -->
                                    <xsl:call-template name="handleTS">
                                        <xsl:with-param name="in" select="hl7:phase/hl7:center"/>
                                        <xsl:with-param name="elemName">toedientijd</xsl:with-param>
                                        <xsl:with-param name="vagueDate" select="true()"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!-- Do nothing -->
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </toedieningsschema>
                    <xsl:if test="./hl7:precondition/hl7:observationEventCriterion/hl7:code | ./ancestor::hl7:medicationAdministrationRequest/hl7:maxDoseQuantity">
                        <xsl:call-template name="mp9-zonodig">
                            <xsl:with-param name="max-dose" select="./ancestor::hl7:medicationAdministrationRequest/hl7:maxDoseQuantity"/>
                            <xsl:with-param name="zonodig-code" select="hl7:precondition/hl7:observationEventCriterion/hl7:code"/>
                        </xsl:call-template>
                    </xsl:if>
                    <!-- toedieningssnelheid en toedieningsduur niet ondersteund in 6.12-->

                </dosering>
            </doseerinstructie>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Convert from 6.12 to MP-9 ada datamodel. Variabele frequentie (1 à 2 maal per dag) in effectiveTime of comp, 2 mars, 1 vast, 1 zo nodig, parallel, zelfde keerdosis</xd:desc>
        <xd:param name="hl7-mar">The HL7 medicationAdministrationRequest's, should be 2</xd:param>
    </xd:doc>
    <xsl:template name="mp9-doseerinstructie-from-mp612-var-freq">
        <xsl:param name="hl7-mar" as="element(hl7:medicationAdministrationRequest)*"/>
        <xsl:comment>mp9-doseerinstructie-from-mp612-var-freq</xsl:comment>
        <xsl:choose>
            <xsl:when test="count($hl7-mar) = 2">
                <doseerinstructie>
                    <!-- volgnummer niet opnemen, is altijd 1 voor deze conversie -->
                    <!-- dosering, in 6.12 kan er maar één zijn per mar dus per doseerinstructie -->
                    <!-- in MP 9 mag dosering weer herhalen binnen een doseerinstructie, maar dit kan niet met 6.12 -->
                    <dosering>
                        <!-- keerdosis, must be the same in first and second hl7-mar, so simply take the first mar -->
                        <xsl:call-template name="mp9-keerdosis">
                            <xsl:with-param name="hl7-doseQuantity" select="$hl7-mar[1]/hl7:doseQuantity"/>
                        </xsl:call-template>
                        <toedieningsschema>
                            <xsl:variable name="min_frequentie_one_decimal" select="nf:one_decimal($hl7-mar[not(hl7:precondition)]//hl7:period/@value)"/>
                            <xsl:variable name="min_frequentie_decimal" select="$min_frequentie_one_decimal - floor($min_frequentie_one_decimal)"/>
                            <xsl:variable name="max_frequentie_one_decimal" select="nf:one_decimal($hl7-mar[hl7:precondition]//hl7:period/@value)"/>
                            <xsl:variable name="max_frequentie_decimal" select="$max_frequentie_one_decimal - floor($max_frequentie_one_decimal)"/>
                            <!-- only output the structured frequentie if the one decimal rounded to 0 -->
                            <xsl:choose>
                                <xsl:when test="$min_frequentie_decimal = 0 and $max_frequentie_decimal = 0">
                                    <frequentie>
                                        <aantal>
                                            <min value="{round($min_frequentie_one_decimal)}"/>
                                            <max value="{round($min_frequentie_one_decimal + $max_frequentie_one_decimal)}"/>
                                        </aantal>
                                        <tijdseenheid value="{nf:tijdseenheid-aantal($hl7-mar[1]//hl7:period/@value)}" unit="{nf:convertTime_UCUM2ADA_unit($hl7-mar[1]//hl7:period/@unit)}"/>
                                    </frequentie>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="util:logMessage">
                                        <xsl:with-param name="level" select="$logERROR"/>
                                        <xsl:with-param name="terminate" select="false()"/>
                                        <xsl:with-param name="msg">At least one of the periods from the input hl7 cannot be properly converted to a frequency integer. 
                                            Fixed period = <xsl:value-of select="$hl7-mar[not(hl7:precondition)]//hl7:period/@value"/>
                                            <xsl:value-of select="$hl7-mar[not(hl7:precondition)]//hl7:period/@unit"/> resulting in frequency/aantal/min rounded to one decimal of: <xsl:value-of select="$min_frequentie_one_decimal"/>
                                            As Needed (zo nodig) period = <xsl:value-of select="$hl7-mar[hl7:precondition]//hl7:period/@value"/>
                                            <xsl:value-of select="$hl7-mar[hl7:precondition]//hl7:period/@unit"/> resulting in frequency/aantal/max rounded to one decimal of: <xsl:value-of select="$max_frequentie_one_decimal"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </toedieningsschema>
                        <!-- eventueel een maximale dosering -->
                        <xsl:choose>
                            <xsl:when test="count($hl7-mar/hl7:maxDoseQuantity) = 1">
                                <xsl:call-template name="mp9-zonodig">
                                    <xsl:with-param name="max-dose" select="$hl7-mar/hl7:maxDoseQuantity"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="deep-equal($hl7-mar[1]/hl7:maxDoseQuantity, $hl7-mar[2]/hl7:maxDoseQuantity)">
                                <xsl:call-template name="mp9-zonodig">
                                    <xsl:with-param name="max-dose" select="$hl7-mar[1]/hl7:maxDoseQuantity"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="terminate" select="false()"/>
                                    <xsl:with-param name="msg">Found conflicting maxDoseQuantity, both "<xsl:value-of select="string-join($hl7-mar[hl7:precondition]/hl7:maxDoseQuantity//@*, ' ')"/>" and "<xsl:value-of select="string-join($hl7-mar[not(hl7:precondition)]/hl7:maxDoseQuantity//@*, ' ')"/>". Cannot output the maxDose in structured format, refer to text.</xsl:with-param>
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- toedieningssnelheid en toedieningsduur niet ondersteund in 6.12-->
                    </dosering>
                </doseerinstructie>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="util:logMessage">
                    <xsl:with-param name="level" select="$logERROR"/>
                    <xsl:with-param name="terminate" select="false()"/>
                    <xsl:with-param name="msg">Unexpected amount of medicationAdministrationRequests, expected 2 but received: <xsl:value-of select="count($hl7-mar)"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="current-hl7-mar"/>
        <xd:param name="hl7-pivl"/>
    </xd:doc>
    <xsl:template name="mp9-doseerinstructie-from-mp612-freq">
        <xsl:param name="current-hl7-mar"/>
        <xsl:param name="hl7-pivl"/>
        <xsl:comment>mp9-doseerinstructie-from-mp612-freq</xsl:comment>
        <xsl:for-each select="$current-hl7-mar">
            <doseerinstructie>
                <!-- volgnummer niet opnemen, is altijd 1 voor deze conversie -->
                <!-- dosering, in 6.12 kan er maar één zijn per mar dus per doseerinstructie -->
                <!-- in MP 9 mag dosering weer herhalen binnen een doseerinstructie, maar dit kan niet met 6.12 -->
                <dosering>
                    <!-- keerdosis -->
                    <xsl:call-template name="mp9-keerdosis">
                        <xsl:with-param name="hl7-doseQuantity" select="hl7:doseQuantity"/>
                    </xsl:call-template>
                    <toedieningsschema>
                        <xsl:call-template name="mp9-vaste-frequentie-from-mp-612">
                            <xsl:with-param name="current-hl7-pivl" select="$hl7-pivl"/>
                        </xsl:call-template>
                    </toedieningsschema>
                    <!-- eventueel een zo nodig criterium -->
                    <xsl:if test="./hl7:precondition/hl7:observationEventCriterion/hl7:code | ./hl7:maxDoseQuantity">
                        <xsl:call-template name="mp9-zonodig">
                            <xsl:with-param name="max-dose" select="hl7:maxDoseQuantity"/>
                            <xsl:with-param name="zonodig-code" select="hl7:precondition/hl7:observationEventCriterion/hl7:code"/>
                        </xsl:call-template>
                    </xsl:if>
                    <!-- toedieningssnelheid en toedieningsduur niet ondersteund in 6.12-->
                </dosering>
            </doseerinstructie>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Make an MP 9 ada gebruiksinstructie from MP 6-12 HL7 xml</xd:desc>
        <xd:param name="effectiveTimes-eenmalig">The hl7 effectiveTimes for one time use</xd:param>
        <xd:param name="hl7-current-comp">The current hl7 component being handled, for example an administration agreement</xd:param>
        <xd:param name="mar-sorted">The sorted hl7 medicationadministrationrequest's. Created using copy-of, there is an issue with QName namespace resolve in Saxon 9.9.1.7</xd:param>
    </xd:doc>
    <xsl:template name="mp9-gebruiksinstructie-from-mp612-2">
        <xsl:param name="effectiveTimes-eenmalig"/>
        <xsl:param name="hl7-current-comp" select="." as="element()?"/>
        <xsl:param name="mar-sorted"/>
        <!-- gebruiksinstructie -->
        <xsl:comment>mp9-gebruiksinstructie-from-mp612-2</xsl:comment>
        <gebruiksinstructie>
            <!-- omschrijving -->
            <xsl:variable name="omschrijving">
                <!-- alleen unieke teksten: filter identieke teksten weg -->
                <xsl:for-each select="distinct-values($mar-sorted/hl7:text/text())">
                    <xsl:if test="position() > 1">; </xsl:if>
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <omschrijving value="{$omschrijving}"/>
            <!-- toedieningsweg -->
            <toedieningsweg>
                <xsl:choose>
                    <xsl:when test="$mar-sorted/hl7:routeCode">
                        <xsl:call-template name="mp9-code-attribs">
                            <!-- moeten allemaal dezelfde toedieningsweg hebben voor 1 verstrekking, we nemen de eerste -->
                            <xsl:with-param name="current-hl7-code" select="($mar-sorted/hl7:routeCode)[1]"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- Niet aanwezig in input 6.12 xml -->
                        <xsl:attribute name="code" select="'NI'"/>
                        <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                        <xsl:attribute name="displayName" select="'geen informatie'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </toedieningsweg>
            <!-- aanvullende_instructie -->
            <!-- ontdubbelen met for-each-group, staat in 6.12 bij iedere MAR en in 9 op een hoger niveau -->
            <xsl:for-each-group select="$mar-sorted/hl7:support2/hl7:medicationAdministrationInstruction/hl7:code[@code]" group-by="@code">
                <xsl:for-each-group select="current-group()" group-by="@codeSystem">
                    <xsl:for-each select="current-group()[1]">
                        <aanvullende_instructie>
                            <xsl:call-template name="mp9-code-attribs">
                                <xsl:with-param name="current-hl7-code" select="."/>
                            </xsl:call-template>
                        </aanvullende_instructie>
                    </xsl:for-each>
                </xsl:for-each-group>
            </xsl:for-each-group>
            <xsl:for-each-group select="$mar-sorted/hl7:support2/hl7:medicationAdministrationInstruction/hl7:code[@nullFlavor]" group-by="@nullFlavor">
                <xsl:for-each-group select="current-group()" group-by="hl7:originalText">
                    <xsl:for-each select="current-group()[1]">
                        <aanvullende_instructie>
                            <xsl:call-template name="mp9-code-attribs">
                                <xsl:with-param name="current-hl7-code" select="."/>
                            </xsl:call-template>
                        </aanvullende_instructie>
                    </xsl:for-each>
                </xsl:for-each-group>
            </xsl:for-each-group>
            <!-- ondersteun alleen de meest voorkomende schema's, zie 
         https://informatiestandaarden.nictiz.nl/wiki/7phcy:V6.12.7_HL7v3-domeinspecificatie_Pharmacy#medicationAdministrationRequest.effectiveTime -->
            <!-- DUS NIET: op- en afbouwschema's, dat moeten geankerde intervallen zijn in meerdere mar's - (nog) niet ondersteund -->
            <xsl:variable name="hl7-pivl" select="$mar-sorted//*[replace(xs:string(@xsi:type), '(.*:)?(.+)', '$2') = 'PIVL_TS']"/>
            <xsl:variable name="hl7-ivl" select="$mar-sorted//*[replace(xs:string(@xsi:type), '(.*:)?(.+)', '$2') = 'IVL_TS']"/>
            <xsl:variable name="parallel" as="xs:boolean">
                <!-- are all encountered mar's parallel, i.e. no opbouw/afbouw schedule -->
                <xsl:choose>
                    <xsl:when test="not($hl7-ivl/hl7:low/@value)">
                        <xsl:value-of select="true()"/>
                    </xsl:when>
                    <xsl:when test="count(distinct-values($hl7-ivl/hl7:low/@value)) = 1">
                        <xsl:value-of select="true()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="false()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:choose>
                <!-- eenmalig gebruik, in 1 mar met 1 eenmalige effectiveTime -->
                <xsl:when test="count($effectiveTimes-eenmalig[@value]) = 1 and count($mar-sorted) = 1">
                    <xsl:call-template name="mp9-doseerinstructie-from-mp612-eenmalig">
                        <xsl:with-param name="current-hl7-mar" select="$mar-sorted"/>
                    </xsl:call-template>
                </xsl:when>
                <!-- frequentie, in 1 mar in 1 PIVL_TS (zonder phase) -->
                <xsl:when test="count($mar-sorted) = 1 and not($hl7-pivl[hl7:phase]) and (count($hl7-pivl[not(hl7:phase)]) = 1 or not($hl7-pivl))">
                    <xsl:call-template name="mp9-doseerinstructie-from-mp612-freq">
                        <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
                        <xsl:with-param name="current-hl7-mar" select="$mar-sorted"/>
                    </xsl:call-template>
                </xsl:when>
                <!-- variabele frequentie in effectiveTime of comp, 2 mars, 1 vast, 1 zo nodig, parallel -->
                <!-- fix for MP-176 : extra check on only one precondition in one of the MAR's -->
                <xsl:when test="$parallel and count($mar-sorted) = 2 and count($mar-sorted[hl7:precondition]) = 1 and count($mar-sorted[hl7:precondition/hl7:observationEventCriterion/hl7:code[@code = $NHGZoNodigNumeriek and @codeSystem = $oidNHGTabel25BCodesNumeriek]]) = 1">
                    <xsl:choose>
                        <xsl:when test="deep-equal($mar-sorted[1]/hl7:doseQuantity, $mar-sorted[2]/hl7:doseQuantity)">
                            <!-- x à y maal per tijdseenheid een bepaalde keerdosis, bijv. 1 à 2 maal per dag 1 stuk -->
                            <xsl:comment>variabele frequentie in effectiveTime of comp, 2 mars, 1 vast, 1 zo nodig, parallel, zelfde keerdosis</xsl:comment>
                            <!-- let's make a frequentie with a min/max -->
                            <xsl:call-template name="mp9-doseerinstructie-from-mp612-var-freq">
                                <xsl:with-param name="hl7-mar" select="$mar-sorted"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:comment>variabele frequentie in effectiveTime of comp, 2 mars, 1 vast, 1 zo nodig, parallel, verschillende keerdosis</xsl:comment>
                            <xsl:for-each select="$mar-sorted">
                                <xsl:variable name="hl7-pivl" select=".//*[replace(xs:string(@xsi:type), '(.*:)?(.+)', '$2') = 'PIVL_TS']"/>
                                <xsl:call-template name="mp9-doseerinstructie-from-mp612-freq">
                                    <xsl:with-param name="current-hl7-mar" select="."/>
                                    <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- variabele frequentie in effectiveTime of comp, 2 mars, minimaal een precondition (indien 1 is die anders dan de 1137, want anders eerder gematcht), parallel -->
                <xsl:when test="count($mar-sorted) = 2 and (count($mar-sorted[hl7:precondition]) gt 0 or $mar-sorted[hl7:precondition/hl7:observationEventCriterion/hl7:code[not(@code = $NHGZoNodigNumeriek and @codeSystem = $oidNHGTabel25BCodesNumeriek)]]) and $parallel">
                    <xsl:comment>variabele frequentie in effectiveTime of comp, 2 mars, minimaal een precondition (indien 1 is die anders dan de 1137, want anders eerder gematcht), parallel</xsl:comment>
                    <xsl:for-each select="$mar-sorted">
                        <xsl:variable name="hl7-pivl" select=".//*[replace(xs:string(@xsi:type), '(.*:)?(.+)', '$2') = 'PIVL_TS']"/>
                        <xsl:call-template name="mp9-doseerinstructie-from-mp612-freq">
                            <xsl:with-param name="current-hl7-mar" select="."/>
                            <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </xsl:when>
                <!-- cyclisch schema (pil) in 1 mar -->
                <xsl:when test="$hl7-pivl[hl7:phase/hl7:width][hl7:period] and count($mar-sorted) = 1">
                    <xsl:call-template name="mp9-doseerinstructie-from-mp612-cyclisch">
                        <xsl:with-param name="current-hl7-mar" select="$mar-sorted"/>
                        <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
                    </xsl:call-template>
                </xsl:when>
                <!-- toedientijden - 1 mar, meerdere comps of 1 comp of 1 effectiveTime met tijd, frequentie moet overal hetzelfde zijn en in dagen -->
                <xsl:when test="count($mar-sorted) = 1 and $hl7-pivl[hl7:phase/hl7:center] and count(distinct-values($hl7-pivl/hl7:period/@value)) = 1 and not($hl7-pivl[hl7:period/@unit != 'd'])">
                    <xsl:call-template name="mp9-doseerinstructie-from-mp612-tijden">
                        <xsl:with-param name="current-hl7-mar" select="$mar-sorted"/>
                        <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <!-- de rest (nog) niet gestructureerd opleveren -->
                    <xsl:comment>Non-supported (complex) dosing scheduled encountered in 6.12. No structured output, please refer to textual description.</xsl:comment>
                    <!-- maar wel de maximale dosering, indien aanwezig in 1 MAR-->
                    <xsl:if test="count($mar-sorted) = 1 and $mar-sorted/hl7:maxDoseQuantity[.//@value]">
                        <doseerinstructie>
                            <dosering>
                                <xsl:call-template name="mp9-zonodig">
                                    <!-- don't pass the zo_nodig code, only the max-dose here -->
                                    <xsl:with-param name="max-dose" select="$mar-sorted/hl7:maxDoseQuantity"/>
                                </xsl:call-template>
                            </dosering>
                        </doseerinstructie>
                    </xsl:if>

                </xsl:otherwise>
            </xsl:choose>
        </gebruiksinstructie>
    </xsl:template>

    <xd:doc>
        <xd:desc>907</xd:desc>
        <xd:param name="in">input hl7 component</xd:param>
    </xd:doc>
    <xsl:template name="mp9-gebruiksinstructie-from-mp9" match="hl7:*" mode="HandleInstructionsforuse">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <!-- still can refactor with new generic functions -->
            <xsl:variable name="elemName">gebruiksinstructie</xsl:variable>
            <xsl:element name="{$elemName}">

                <!-- omschrijving -->
                <xsl:for-each select="hl7:text">
                    <omschrijving value="{./text()}"/>
                </xsl:for-each>
                <!-- toedieningsweg -->
                <xsl:for-each select="hl7:routeCode">
                    <xsl:variable name="elemName">toedieningsweg</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- aanvullende_instructie -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9085']/hl7:code">
                    <xsl:variable name="elemName">aanvullende_instructie</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:variable name="hl7Doseerinstructie" select="hl7:entryRelationship[hl7:substanceAdministration/hl7:templateId/@root = $templateId-toedienschema]"/>
                <!-- herhaalperiode_cyclisch_schema -->
                <!-- er mag er maar eentje zijn -->
                <xsl:for-each select="$hl7Doseerinstructie/hl7:substanceAdministration/hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'SXPR_TS')]/hl7:comp[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-nl:v3', 'PIVL_TS')][not(@alignment)][hl7nl:phase[hl7nl:width]]/hl7nl:period">
                    <xsl:variable name="elemName">herhaalperiode_cyclisch_schema</xsl:variable>
                    <xsl:call-template name="handlePQ">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- doseerinstructie -->
                <xsl:for-each select="$hl7Doseerinstructie">
                    <xsl:variable name="elemName">doseerinstructie</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <!-- volgnummer -->
                        <xsl:for-each select="hl7:sequenceNumber">
                            <xsl:variable name="elemName">volgnummer</xsl:variable>
                            <xsl:call-template name="handleINT">
                                <xsl:with-param name="elemName" select="$elemName"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <!-- doseerduur -->
                        <xsl:variable name="elemName">doseerduur</xsl:variable>
                        <xsl:choose>
                            <!-- doseerduur in Cyclisch doseerschema. -->
                            <xsl:when test="hl7:substanceAdministration/hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'SXPR_TS')][hl7:comp[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-nl:v3', 'PIVL_TS')][not(@alignment)][hl7nl:period][hl7nl:phase[hl7nl:width]]]/hl7:comp/hl7nl:phase/hl7nl:width">
                                <xsl:for-each select="hl7:substanceAdministration/hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'SXPR_TS')][hl7:comp[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-nl:v3', 'PIVL_TS')][not(@alignment)][hl7nl:period][hl7nl:phase[hl7nl:width]]]/hl7:comp/hl7nl:phase/hl7nl:width">
                                    <xsl:call-template name="mp9-duration">
                                        <xsl:with-param name="elemName" select="$elemName"/>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:when>
                            <!-- overige gevallen -->
                            <xsl:otherwise>
                                <xsl:for-each select="hl7:substanceAdministration/hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]/hl7:width">
                                    <xsl:call-template name="mp9-duration">
                                        <xsl:with-param name="elemName" select="$elemName"/>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- dosering -->
                        <xsl:for-each select="hl7:substanceAdministration">
                            <xsl:variable name="elemName">dosering</xsl:variable>
                            <xsl:element name="{$elemName}">
                                <!-- keerdosis -->
                                <xsl:for-each select="hl7:doseQuantity">
                                    <xsl:variable name="elemName">keerdosis</xsl:variable>
                                    <xsl:element name="{$elemName}">
                                        <!-- aantal -->
                                        <xsl:variable name="elemName">aantal</xsl:variable>
                                        <xsl:element name="{$elemName}">
                                            <xsl:for-each select="hl7:low/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <min value="{@value}"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="hl7:center/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <vaste_waarde value="{@value}"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="hl7:high/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <max value="{@value}"/>
                                            </xsl:for-each>
                                        </xsl:element>
                                        <xsl:for-each select="(*/hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                                            <eenheid>
                                                <xsl:call-template name="mp9-code-attribs">
                                                    <xsl:with-param name="current-hl7-code" select="."/>
                                                </xsl:call-template>
                                            </eenheid>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:for-each>

                                <!-- toedieningsschema -->
                                <!-- er moet een PIVL_TS zijn om een toedieningsschema te maken -->
                                <xsl:if test=".//*[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-nl:v3', 'PIVL_TS')]">
                                    <xsl:variable name="elemName">toedieningsschema</xsl:variable>
                                    <xsl:element name="{$elemName}">
                                        <!-- eenvoudig doseerschema met alleen één frequentie of X tot Y keer per dag -->
                                        <xsl:for-each select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-nl:v3', 'PIVL_TS')][xs:string(@isFlexible) = 'true' or hl7nl:frequency/hl7nl:numerator/hl7nl:uncertainRange][not(@alignment)][hl7nl:frequency][not(hl7nl:phase)]">
                                            <xsl:if test="(not(exists(@isFlexible) or xs:string(@isFlexible) = 'false') and hl7nl:frequency/hl7nl:numerator/hl7nl:uncertainRange)">
                                                <!-- this is unexpected, @isFlexible should have been true, however seems how
                                                hl7nl:frequency/hl7nl:numerator/hl7nl:uncertainRange is present we assume flexibility
                                                let's at least output a debug message-->
                                                <xsl:call-template name="util:logMessage">
                                                    <xsl:with-param name="level" select="$logWARN"/>
                                                    <xsl:with-param name="terminate" select="false()"/>
                                                    <xsl:with-param name="msg">Encountered a PIVL_TS with @isFlexibility false or absent, but with hl7nl:frequency/hl7nl:numerator/hl7nl:uncertainRange (which can only occur with flexible schedule). Still outputting this in ada as frequency, in order to minimise information loss. However: please fix the HL7v3 instance, since this is incorrect according to template specfications.</xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:if>
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"/>
                                        </xsl:for-each>

                                        <!-- Eenvoudig doseerschema met alleen één interval.-->
                                        <xsl:for-each select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-nl:v3', 'PIVL_TS')][(xs:string(@isFlexible) = 'false' or not(@isFlexible))][not(@alignment)][hl7nl:frequency[hl7nl:numerator/@value]]">
                                            <!-- interval -->
                                            <xsl:variable name="elemName">interval</xsl:variable>
                                            <xsl:variable name="interval-value" select="format-number(number(hl7nl:frequency/hl7nl:denominator/@value) div number(./hl7nl:frequency/hl7nl:numerator/@value), '0.####')"/>
                                            <xsl:element name="{$elemName}">
                                                <xsl:for-each select="$interval-value">
                                                    <xsl:attribute name="value" select="$interval-value"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="hl7nl:frequency/hl7nl:denominator/@unit">
                                                    <xsl:attribute name="unit" select="nf:convertTime_UCUM2ADA_unit(.)"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="hl7nl:frequency/@nullFlavor">
                                                    <xsl:attribute name="nullFlavor" select="."/>
                                                </xsl:for-each>
                                            </xsl:element>
                                        </xsl:for-each>

                                        <!-- Eenvoudig doseerschema met alleen vast tijdstip.-->
                                        <xsl:for-each select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-nl:v3', 'PIVL_TS')][not(@alignment)][hl7nl:phase[not(hl7nl:width)]]">
                                            <is_flexibel>
                                                <xsl:copy-of select="nf:getIsFlexible(.)"/>
                                            </is_flexibel>
                                            <xsl:variable name="elemName">toedientijd</xsl:variable>
                                            <xsl:call-template name="handleTS">
                                                <xsl:with-param name="in" select="hl7nl:phase/hl7nl:low"/>
                                                <xsl:with-param name="elemName" select="$elemName"/>
                                                <xsl:with-param name="vagueDate" select="true()"/>
                                            </xsl:call-template>
                                        </xsl:for-each>

                                        <!-- Doseerschema met toedieningsduur. -->
                                        <xsl:for-each select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-nl:v3', 'PIVL_TS')][not(@alignment)][not(hl7nl:period)][hl7nl:phase[hl7nl:width]]">
                                            <xsl:comment>Doseerschema met toedieningsduur.</xsl:comment>
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"/>

                                            <xsl:for-each select="hl7nl:phase/hl7nl:low">
                                                <!-- output the toedieningstijd -->
                                                <xsl:variable name="elemName">toedientijd</xsl:variable>
                                                <xsl:call-template name="handleTS">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="elemName" select="$elemName"/>
                                                    <xsl:with-param name="vagueDate" select="true()"/>
                                                </xsl:call-template>
                                            </xsl:for-each>
                                        </xsl:for-each>

                                        <!--Doseerschema met meer dan één vast tijdstip.-->
                                        <xsl:variable name="doseSchema" select="hl7:effectiveTime[hl7:comp[not(@alignment)][hl7nl:period][hl7nl:phase[not(hl7nl:width)]]][not(hl7:comp/@alignment)][not(hl7:comp[not(hl7nl:period)])][not(hl7:comp[not(hl7nl:phase[not(hl7nl:width)])])]/hl7:comp"/>
                                        <xsl:if test="$doseSchema">
                                            <is_flexibel>
                                                <xsl:copy-of select="nf:getIsFlexible($doseSchema)"/>
                                            </is_flexibel>
                                            <xsl:for-each select="$doseSchema">
                                                <xsl:call-template name="handleTS">
                                                    <xsl:with-param name="in" select="hl7nl:phase/hl7nl:low"/>
                                                    <xsl:with-param name="elemName">toedientijd</xsl:with-param>

                                                    <xsl:with-param name="vagueDate" select="true()"/>
                                                </xsl:call-template>
                                            </xsl:for-each>
                                        </xsl:if>

                                        <!-- Cyclisch doseerschema. -->
                                        <xsl:for-each select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'SXPR_TS')][hl7:comp[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-nl:v3', 'PIVL_TS')][not(@alignment)][hl7nl:period][hl7nl:phase[hl7nl:width]]]/hl7:comp[hl7nl:frequency]">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"/>
                                        </xsl:for-each>

                                        <!-- Eenmalig gebruik of aantal keren gebruik zonder tijd. -->
                                        <xsl:for-each select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-nl:v3', 'PIVL_TS')][not(@alignment)][hl7nl:count]/hl7nl:count">
                                            <frequentie>
                                                <aantal>
                                                    <xsl:choose>
                                                        <xsl:when test="@value">
                                                            <vaste_waarde value="{@value}"/>
                                                        </xsl:when>
                                                        <xsl:when test="hl7nl:uncertainRange[.//(@value | @nullFlavor)]">
                                                            <xsl:for-each select="hl7nl:uncertainRange/hl7nl:low[@value | @nullFlavor]">
                                                                <xsl:call-template name="handleINT">
                                                                    <xsl:with-param name="elemName">min</xsl:with-param>
                                                                    <xsl:with-param name="in" select="."/>
                                                                </xsl:call-template>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="hl7nl:uncertainRange/hl7nl:high[@value | @nullFlavor]">
                                                                <xsl:call-template name="handleINT">
                                                                    <xsl:with-param name="elemName">max</xsl:with-param>
                                                                    <xsl:with-param name="in" select="."/>
                                                                </xsl:call-template>
                                                            </xsl:for-each>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </aantal>
                                            </frequentie>
                                        </xsl:for-each>

                                        <!-- Doseerschema één keer per week op één weekdag. -->
                                        <xsl:for-each select="hl7:effectiveTime[@alignment = 'DW']">
                                            <xsl:for-each select="hl7nl:period">
                                                <frequentie>
                                                    <aantal>
                                                        <!-- altijd 1, 1 keer per week of 1 keer per 2 weken et cetera -->
                                                        <vaste_waarde value="1"/>
                                                    </aantal>
                                                    <tijdseenheid value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                                                </frequentie>
                                            </xsl:for-each>
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123_only_phase_low">
                                                <xsl:with-param name="current_PIVL" select="."/>
                                            </xsl:call-template>
                                        </xsl:for-each>

                                        <!-- Complexer doseerschema met weekdag(en). -->
                                        <xsl:for-each select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'SXPR_TS')][hl7:comp/@alignment = 'DW']">
                                            <xsl:comment>Complexer doseerschema met weekdag(en).</xsl:comment>
                                            <!-- de frequentie van inname op de weekdag, bijvoorbeeld: 3x per dag iedere woensdag. 3x per dag is dan de frequentie hier -->
                                            <xsl:for-each select="hl7:comp[xs:string(@isFlexible) = 'true' and hl7nl:frequency]">
                                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"/>
                                            </xsl:for-each>
                                            <!-- Als niet alle weekdagen in deze dosering dezelfde toedientijden en period (frequentie van 1 maal per week of 1 maal per 2 weken) 
                                                hebben (wat in HL7 kán), dan voldoet deze doseerinstructie 
                                                niet aan het MP-9 datamodel, want daarvoor moet een separate - parallelle - dosering worden aangemaakt -->
                                            <!-- deze variablel days-with-times verzamelt de relevante gegevens uit hl7 in een overzichtelijk geheel -->
                                            <xsl:variable name="days-with-times" as="element(days)*">
                                                <xsl:for-each select="hl7:comp[@alignment = 'DW']">
                                                    <xsl:variable name="hl7-weekdag" select="substring(./hl7nl:phase/hl7nl:low/@value, 1, 8)"/>
                                                    <xsl:variable name="hl7-tijd" select="substring(./hl7nl:phase/hl7nl:low/@value, 9, 6)"/>
                                                    <xsl:variable name="hl7-period" select="hl7nl:period"/>
                                                    <xsl:variable name="weekdag-xml-date" select="nf:formatHL72XMLDate($hl7-weekdag, 'DAY')"/>
                                                    <days value="{nf:day-of-week($weekdag-xml-date)}" period-value="{$hl7-period/@value}" period-unit="{$hl7-period/@unit}">
                                                        <xsl:if test="string-length($hl7-tijd) gt 0">
                                                            <xsl:attribute name="time" select="$hl7-tijd"/>
                                                        </xsl:if>
                                                    </days>
                                                </xsl:for-each>
                                            </xsl:variable>
                                            <!-- deze variable groepeert de $days-with-times per dag -->
                                            <xsl:variable name="day-with-times" as="element(day)*">
                                                <xsl:for-each-group select="$days-with-times" group-by="./@value">
                                                    <day value="{@value}">
                                                        <xsl:for-each select="current-group()">
                                                            <xsl:sort select="./@time"/>
                                                            <times period-value="{@period-value}" period-unit="{@period-unit}">
                                                                <xsl:if test="./@time">
                                                                    <xsl:attribute name="value" select="./@time"/>
                                                                </xsl:if>
                                                            </times>
                                                        </xsl:for-each>
                                                    </day>
                                                </xsl:for-each-group>
                                            </xsl:variable>
                                            <!-- Deze variable groepeert de $days-with-times per frequentie. Er mag eigenlijk maar 1 frequentie zijn.... -->
                                            <xsl:variable name="frequency-with-daytimes" as="element(frequency)*">
                                                <xsl:for-each-group select="$days-with-times" group-by="./concat(@period-value, @period-unit)">
                                                    <frequency value="{@period-value}" unit="{@period-unit}">
                                                        <xsl:for-each-group select="current-group()" group-by="./@value">
                                                            <day value="{@value}">
                                                                <xsl:for-each select="current-group()">
                                                                    <xsl:sort select="./@time"/>
                                                                    <times period-value="{@period-value}" period-unit="{@period-unit}">
                                                                        <xsl:if test="./@time">
                                                                            <xsl:attribute name="value" select="./@time"/>
                                                                        </xsl:if>
                                                                    </times>
                                                                </xsl:for-each>
                                                            </day>
                                                        </xsl:for-each-group>
                                                    </frequency>
                                                </xsl:for-each-group>
                                            </xsl:variable>
                                            <!-- Deze variabele groeperen voor de tijden en zet het geheel in mp9-datamodelformaat -->
                                            <xsl:variable name="times-days-mp9-datamodel">
                                                <xsl:if test="count($frequency-with-daytimes) = 1 and $frequency-with-daytimes[concat(@value, @unit) ne '1wk']">
                                                    <frequentie value="{$frequency-with-daytimes/@value}" unit="{$frequency-with-daytimes/@unit}"/>
                                                </xsl:if>
                                                <xsl:for-each-group select="$day-with-times" group-by="string-join(./times/@value, '')">
                                                    <xsl:variable name="last-group" select="last()"/>
                                                    <times group-key="{current-grouping-key()}" last-group="{$last-group}">
                                                        <xsl:for-each select="./times/@value">
                                                            <toedientijd value="{.}"/>
                                                        </xsl:for-each>
                                                        <xsl:for-each select="current-group()">
                                                            <weekdag value="{@value}"/>
                                                        </xsl:for-each>
                                                    </times>
                                                </xsl:for-each-group>
                                            </xsl:variable>
                                            <!-- there may be only one frequency in $frequency-with-daytimes and one times group in $times-days-mp9-datamodel, 
                                                otherwise this schedule does not conform to MP9-datamodel... -->
                                            <xsl:choose>
                                                <xsl:when test="count($frequency-with-daytimes) = 1 and count($times-days-mp9-datamodel/times) = 1">
                                                    <!-- Frequentie wanneer anders dan 1 keer per week -->
                                                    <xsl:for-each select="$times-days-mp9-datamodel/frequentie">
                                                        <frequentie>
                                                            <aantal>
                                                                <vaste_waarde value="1"/>
                                                            </aantal>
                                                            <tijdseenheid value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                                                        </frequentie>
                                                    </xsl:for-each>
                                                    <!-- Eerst alle toedientijden -->
                                                    <xsl:for-each select="$times-days-mp9-datamodel/times/toedientijd">
                                                        <toedientijd value="{nf:formatHL72VagueAdaDate(nf:appendDate2DateOrTime(concat('19700101',./@value)), nf:determine_date_precision(concat('19700101',./@value)))}"/>
                                                    </xsl:for-each>
                                                    <!-- Daarna alle weekdagen -->
                                                    <is_flexibel>
                                                        <xsl:copy-of select="nf:getIsFlexible(hl7:comp)"/>
                                                    </is_flexibel>

                                                    <!-- Daarna alle weekdagen -->
                                                    <xsl:for-each select="$times-days-mp9-datamodel/times/weekdag">
                                                        <weekdag>
                                                            <xsl:call-template name="mp9-weekdag-attribs">
                                                                <xsl:with-param name="day-of-week" select="./@value"/>
                                                            </xsl:call-template>
                                                        </weekdag>
                                                    </xsl:for-each>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:comment>The dosage schedule does not comply to MP-9 datamodel, please refer to text for the correct dosage information.</xsl:comment>
                                                    <xsl:comment>Found (illegal) structure:</xsl:comment>
                                                    <xsl:call-template name="copyElementInComment">
                                                        <xsl:with-param name="element" select="$day-with-times"/>
                                                    </xsl:call-template>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>

                                        <!-- Doseerschema met één dagdeel -->
                                        <xsl:for-each select="hl7:effectiveTime[@alignment = 'HD']">
                                            <xsl:call-template name="mp9-dagdeel">
                                                <xsl:with-param name="PIVL_TS-HD" select="."/>
                                            </xsl:call-template>
                                        </xsl:for-each>

                                        <!-- Complexer doseerschema met meer dan één dagdeel. -->
                                        <xsl:variable name="doseSchema" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'SXPR_TS')][hl7:comp/@alignment = 'HD']/hl7:comp"/>
                                        <xsl:if test="$doseSchema">
                                            <xsl:for-each select="$doseSchema">
                                                <xsl:call-template name="mp9-dagdeel">
                                                    <xsl:with-param name="PIVL_TS-HD" select="."/>
                                                </xsl:call-template>
                                            </xsl:for-each>
                                        </xsl:if>

                                    </xsl:element>
                                </xsl:if>
                                <!-- zo nodig -->
                                <xsl:if test="(hl7:precondition/hl7:criterion/hl7:code | hl7:maxDoseQuantity)[.//(@code | @nullFlavor | @value | @unit)]">
                                    <zo_nodig>
                                        <xsl:for-each select="hl7:precondition/hl7:criterion/hl7:code">
                                            <criterium>
                                                <code>
                                                    <xsl:call-template name="mp9-code-attribs">
                                                        <xsl:with-param name="current-hl7-code" select="."/>
                                                    </xsl:call-template>
                                                </code>
                                                <!-- no use case for omschrijving, omschrijving is in code/@originalText -->
                                            </criterium>
                                        </xsl:for-each>
                                        <xsl:for-each select="hl7:maxDoseQuantity[.//(@value | @unit)]">
                                            <maximale_dosering>
                                                <aantal value="{hl7:numerator/@value}"/>
                                                <xsl:for-each select="(hl7:numerator/hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                                                    <eenheid>
                                                        <xsl:call-template name="mp9-code-attribs">
                                                            <xsl:with-param name="current-hl7-code" select="."/>
                                                        </xsl:call-template>
                                                    </eenheid>
                                                </xsl:for-each>
                                                <xsl:for-each select="hl7:denominator[@value | @unit]">
                                                    <tijdseenheid value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(@unit)}"/>
                                                </xsl:for-each>
                                            </maximale_dosering>
                                        </xsl:for-each>

                                    </zo_nodig>
                                </xsl:if>
                                <!-- toedieningssnelheid -->
                                <xsl:for-each select="hl7:rateQuantity">
                                    <xsl:variable name="ucum-rate-eenheden" select="./*/@unit"/>
                                    <xsl:variable name="ucum-rate-eenheid">
                                        <xsl:if test="
                                                every $i in $ucum-rate-eenheden
                                                    satisfies $i = $ucum-rate-eenheden[1]">
                                            <xsl:value-of select="$ucum-rate-eenheden[1]"/>
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="string-length($ucum-rate-eenheid) gt 0">
                                            <toedieningssnelheid>
                                                <waarde>
                                                    <xsl:for-each select="hl7:low">
                                                        <min value="{@value}"/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="hl7:center">
                                                        <vaste_waarde value="{@value}"/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="hl7:high">
                                                        <max value="{@value}"/>
                                                    </xsl:for-each>
                                                </waarde>
                                                <xsl:variable name="ucum-eenheid" select="substring-before($ucum-rate-eenheid, '/')"/>
                                                <eenheid>
                                                    <xsl:call-template name="UCUM2GstdBasiseenheid">
                                                        <xsl:with-param name="UCUM" select="$ucum-eenheid"/>
                                                    </xsl:call-template>
                                                </eenheid>
                                                <xsl:variable name="ucum-tijdseenheid" select="substring-after($ucum-rate-eenheid, '/')"/>
                                                <!-- tijdseenheid is usually of a format like: ml/h -->
                                                <!-- however, a format like ml/2.h (milliliter per 2 hours) is also allowed in UCUM and the datamodel -->
                                                <!-- however, all the occurences of rate unit (min and max) must be equal to one another -->
                                                <xsl:variable name="firstChar" select="substring(translate($ucum-tijdseenheid, '0123456789.', ''), 1, 1)"/>
                                                <xsl:variable name="beforeFirstChar" select="substring-before($ucum-tijdseenheid, $firstChar)"/>
                                                <xsl:variable name="ucum-tijdseenheid-value">
                                                    <xsl:choose>
                                                        <xsl:when test="string-length($beforeFirstChar) gt 0">
                                                            <xsl:value-of select="substring-before($beforeFirstChar, '.')"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>1</xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:variable>
                                                <xsl:variable name="ucum-tijdseenheid-unit" select="concat($firstChar, substring-after($ucum-tijdseenheid, $firstChar))"/>
                                                <tijdseenheid value="{$ucum-tijdseenheid-value}" unit="{nf:convertTime_UCUM2ADA_unit($ucum-tijdseenheid-unit)}"/>
                                            </toedieningssnelheid>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:call-template name="util:logMessage">
                                                <xsl:with-param name="level" select="$logERROR"/>
                                                <xsl:with-param name="terminate" select="false()"/>
                                                <xsl:with-param name="msg">Cannot output "toedieningssnelheid" because the ratequantity/*/@unit are not all equal, found: "<xsl:value-of select="string-join($ucum-rate-eenheden, ' and ')"/>".</xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                                <!-- Doseerschema met toedieningsduur. -->
                                <xsl:for-each select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-nl:v3', 'PIVL_TS')][not(@alignment)][not(hl7nl:period)]/hl7nl:phase/hl7nl:width">
                                    <toedieningsduur value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                                </xsl:for-each>
                                <!-- Doseerschema één keer per week op één weekdag met toedieningsduur -->
                                <xsl:for-each select="hl7:effectiveTime[@alignment = 'DW']/hl7nl:phase/hl7nl:width">
                                    <toedieningsduur value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                                </xsl:for-each>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>gebruiksinstructie mp9 2.0</xd:desc>
        <xd:param name="in">input hl7 component, such as the hl7 MA/TA/MGB/WDS</xd:param>
    </xd:doc>
    <xsl:template name="mp92-gebruiksinstructie-from-mp9" match="hl7:*" mode="HandleInstructionsforuse">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <!-- still can refactor with new generic functions -->
            <gebruiksinstructie>

                <!-- omschrijving -->
                <xsl:for-each select="hl7:text">
                    <omschrijving value="{./text()}"/>
                </xsl:for-each>

                <!-- toedieningsweg -->
                <xsl:for-each select="hl7:routeCode">
                    <xsl:variable name="elemName">toedieningsweg</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- aanvullende_instructie -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9085']/hl7:code">
                    <xsl:variable name="elemName">aanvullende_instructie</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <xsl:variable name="hl7Doseerinstructie" select="hl7:entryRelationship[hl7:substanceAdministration/hl7:templateId/@root = $templateId-toedienschema]"/>

                <!-- herhaalperiode_cyclisch_schema -->
                <!-- er mag er functioneel maar eentje zijn als er technisch herhaald is moet het identiek zijn, we nemen de eerste -->
                <xsl:for-each select="($hl7Doseerinstructie/hl7:substanceAdministration/f:effectiveTime/f:modifierExtension[@url = $urlExtRepeatPeriodCyclical])[1]/f:valueDuration">
                    <xsl:call-template name="Duration-to-hoeveelheid">
                        <xsl:with-param name="adaElementName">herhaalperiode_cyclisch_schema</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- doseerinstructie -->
                <xsl:for-each select="$hl7Doseerinstructie">
                    <doseerinstructie>

                        <!-- doseerduur -->
                        <xsl:for-each select="hl7:substanceAdministration/f:effectiveTime/f:repeat/f:boundsDuration">
                            <xsl:call-template name="Duration-to-hoeveelheid">
                                <xsl:with-param name="adaElementName">doseerduur</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>

                        <!-- volgnummer -->
                        <xsl:for-each select="hl7:sequenceNumber">
                            <xsl:call-template name="handleINT">
                                <xsl:with-param name="elemName">volgnummer</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>

                        <!-- dosering -->
                        <xsl:for-each select="hl7:substanceAdministration">
                            <xsl:variable name="elemName">dosering</xsl:variable>
                            <dosering>
                                <!-- keerdosis -->
                                <xsl:for-each select="hl7:doseQuantity">
                                    <keerdosis>
                                        <!-- aantal -->
                                        <aantal>
                                            <xsl:for-each select="hl7:low/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <minimum_waarde value="{@value}"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="hl7:center/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <nominale_waarde value="{@value}"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="hl7:high/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <maximum_waarde value="{@value}"/>
                                            </xsl:for-each>
                                        </aantal>
                                        <xsl:for-each select="(*/hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                                            <eenheid>
                                                <xsl:call-template name="mp9-code-attribs">
                                                    <xsl:with-param name="current-hl7-code" select="."/>
                                                </xsl:call-template>
                                            </eenheid>
                                        </xsl:for-each>
                                    </keerdosis>
                                </xsl:for-each>

                                <!-- toedieningsschema, create for f:repeat if it has stuf other then doseerduur / toedieningsduur / herhaalperiode_cyclisch_schema -->

                                <xsl:for-each select="f:effectiveTime/f:repeat[*[not(self::f:boundsDuration | self::f:duration | self::f:durationUnit | self::modifierExtension[@url = $urlExtRepeatPeriodCyclical])]]">
                                    <toedieningsschema>
                                        <xsl:if test="(f:frequency | f:frequencyMax | f:period | f:periodUnit) and not(f:extension[@url = $urlTimingExact]/f:valueBoolean/@value = 'true')">
                                            <frequentie>
                                                <aantal>
                                                    <xsl:if test="f:frequencyMax[@value] and f:frequency[@value]">
                                                        <minimum_waarde value="{f:frequency/@value}"/>
                                                    </xsl:if>
                                                    <xsl:if test="not(f:frequencyMax[@value]) and f:frequency[@value]">
                                                        <nominale_waarde value="{f:frequency/@value}"/>
                                                    </xsl:if>
                                                    <xsl:if test="f:frequencyMax[@value]">
                                                        <maximum_waarde value="{f:frequencyMax/@value}"/>
                                                    </xsl:if>
                                                    <!-- if there is not frequency(Max), assume 1 -->
                                                    <xsl:if test="not(f:frequency[@value]) and not(f:frequencyMax[@value])">
                                                        <nominale_waarde value="1"/>
                                                    </xsl:if>
                                                </aantal>
                                                <xsl:if test="(f:period | f:periodUnit)[@value]">
                                                    <tijdseenheid value="{f:period/@value}" unit="{nf:convertTime_UCUM_FHIR2ADA_unit(f:periodUnit/@value)}"/>
                                                </xsl:if>
                                            </frequentie>
                                        </xsl:if>
                                        <xsl:if test="(f:frequency[@value ne '1'] or f:frequencyMax[@value]) and f:extension[@url = $urlTimingExact]/f:valueBoolean/@value = 'true'">
                                            <xsl:call-template name="util:logMessage">
                                                <xsl:with-param name="level" select="$logERROR"/>
                                                <xsl:with-param name="msg">Encountered a frequency value other than 1 (found: <xsl:value-of select="f:frequency/@value"/>) or a frequencyMax/@value (<xsl:value-of select="f:frequencyMax/@value"/>) with timing-exact. This is unexpected. Not outputting interval to ada, but outputting frequentie instead</xsl:with-param>
                                            </xsl:call-template>
                                            <frequentie>
                                                <aantal>
                                                    <xsl:if test="f:frequencyMax[@value] and f:frequency[@value]">
                                                        <minimum_waarde value="{f:frequency/@value}"/>
                                                    </xsl:if>
                                                    <xsl:if test="not(f:frequencyMax[@value]) and f:frequency[@value]">
                                                        <nominale_waarde value="{f:frequency/@value}"/>
                                                    </xsl:if>
                                                    <xsl:if test="f:frequencyMax[@value]">
                                                        <maximum_waarde value="{f:frequencyMax/@value}"/>
                                                    </xsl:if>
                                                </aantal>
                                                <xsl:if test="(f:period | f:periodUnit)[@value]">
                                                    <tijdseenheid value="{f:period/@value}" unit="{nf:convertTime_UCUM_FHIR2ADA_unit(f:periodUnit/@value)}"/>
                                                </xsl:if>
                                            </frequentie>
                                        </xsl:if>

                                        <!-- weekdag -->
                                        <xsl:for-each select="f:dayOfWeek[@value]">
                                            <xsl:for-each select="$weekdayMap[@fhirDayOfWeek = current()/@value]">
                                                <weekdag code="{@code}" displayName="{@displayName}" codeSystem="{@codeSystem}"/>
                                            </xsl:for-each>
                                        </xsl:for-each>

                                        <!-- dagdeel -->
                                        <xsl:for-each select="f:when[@value]">
                                            <xsl:for-each select="$daypartMap[@fhirWhen = current()/@value]">
                                                <dagdeel code="{@code}" displayName="{@displayName}" codeSystem="{@codeSystem}"/>
                                            </xsl:for-each>
                                        </xsl:for-each>

                                        <!-- toedientijd -->
                                        <xsl:for-each select="f:timeOfDay[@value]">
                                            <toedientijd value="{@value}" datatype="time"/>
                                        </xsl:for-each>
                                        <!-- is_flexibel -->
                                        <xsl:for-each select="f:extension[@url = $urlTimingExact]/f:valueBoolean">
                                            <is_flexibel value="{not(@value='true')}"/>
                                        </xsl:for-each>
                                        <!-- interval -->
                                        <xsl:if test="f:frequency[@value = '1'] and not(f:frequencyMax[@value]) and f:period and f:periodUnit and f:extension[@url = $urlTimingExact]/f:valueBoolean/@value = 'true'">
                                            <interval value="{f:period/@value}" unit="{nf:convertTime_UCUM_FHIR2ADA_unit(f:periodUnit/@value)}"/>
                                        </xsl:if>
                                    </toedieningsschema>
                                </xsl:for-each>

                                <!-- zo nodig -->
                                <xsl:if test="(hl7:precondition/hl7:criterion/hl7:code | hl7:maxDoseQuantity)[.//(@code | @nullFlavor | @value | @unit)]">
                                    <zo_nodig>
                                        <xsl:for-each select="hl7:precondition/hl7:criterion/hl7:code">
                                            <criterium>
                                                <criterium>
                                                    <xsl:call-template name="mp9-code-attribs">
                                                        <xsl:with-param name="current-hl7-code" select="."/>
                                                    </xsl:call-template>
                                                </criterium>
                                                <!-- no use case for omschrijving, omschrijving is in code/@originalText -->
                                            </criterium>
                                        </xsl:for-each>
                                        <xsl:for-each select="hl7:maxDoseQuantity[.//(@value | @unit)]">
                                            <maximale_dosering>
                                                <aantal value="{hl7:numerator/@value}"/>
                                                <xsl:for-each select="(hl7:numerator/hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                                                    <eenheid>
                                                        <xsl:call-template name="mp9-code-attribs">
                                                            <xsl:with-param name="current-hl7-code" select="."/>
                                                        </xsl:call-template>
                                                    </eenheid>
                                                </xsl:for-each>
                                                <xsl:for-each select="hl7:denominator[@value | @unit]">
                                                    <tijdseenheid value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(@unit)}"/>
                                                </xsl:for-each>
                                            </maximale_dosering>
                                        </xsl:for-each>

                                    </zo_nodig>
                                </xsl:if>

                                <!-- toedieningssnelheid -->
                                <xsl:call-template name="_toedieningssnelheid92">
                                    <xsl:with-param name="inHl7" select="hl7:rateQuantity"/>
                                </xsl:call-template>

                                <!-- toedieningsduur -->
                                <xsl:for-each select="f:effectiveTime/f:repeat[f:duration | f:durationUnit]">
                                    <toedieningsduur>
                                        <tijds_duur value="{f:duration/@value}" unit="{nf:convertTime_UCUM_FHIR2ADA_unit(f:durationUnit/@value)}"/>
                                    </toedieningsduur>
                                </xsl:for-each>

                            </dosering>
                        </xsl:for-each>
                    </doseerinstructie>
                </xsl:for-each>
            </gebruiksinstructie>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc>hlt 2 ada mp9 gebruiksinstructie from mp910</xd:desc>
        <xd:param name="in">input hl7 component, the 'thing', for example medicationagreement, administrationagreement, medicationuse,
            that contains the entryRelationship with Instructions for use</xd:param>
    </xd:doc>
    <xsl:template name="mp9-gebruiksinstructie-from-mp910" match="hl7:*" mode="HandleInstructionsforuse910">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <!-- gebruiksinstructie -->
            <gebruiksinstructie>

                <!-- omschrijving -->
                <xsl:for-each select="hl7:text">
                    <omschrijving value="{./text()}"/>
                </xsl:for-each>
                <!-- toedieningsweg -->
                <xsl:for-each select="hl7:routeCode">
                    <xsl:variable name="elemName">toedieningsweg</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- aanvullende_instructie -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9085']/hl7:code">
                    <xsl:variable name="elemName">aanvullende_instructie</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:variable name="hl7Doseerinstructie" select="hl7:entryRelationship[hl7:substanceAdministration/hl7:templateId/@root = $templateId-toedienschema]"/>
                <!-- herhaalperiode_cyclisch_schema -->
                <xsl:variable name="hl7HerhaalPeriod" select="$hl7Doseerinstructie/hl7:substanceAdministration/hl7:effectiveTime/hl7:comp[not(@alignment)][hl7nl:phase[hl7nl:width]]/hl7nl:period"/>
                <!-- er mag er maar eentje zijn -->
                <xsl:for-each-group select="$hl7HerhaalPeriod" group-by="concat(@value, @unit)">
                    <xsl:choose>
                        <xsl:when test="last() gt 1">
                            <!-- we found more than one herhaalperiode_cyclisch_schema, that should not have happened, ouch! -->
                            <xsl:variable name="message">Found more than one herhaalperiode_cyclisch_schema (<xsl:value-of select="string-join($hl7HerhaalPeriod/(@value | @unit), ' ')"/>) in one usage instruction, that should not have happened. We can't output it. Please check your HL7.</xsl:variable>
                            <xsl:if test="position() = 1">
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="msg" select="$message"/>
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="terminate" select="false()"/>
                                </xsl:call-template>
                                <xsl:comment><xsl:value-of select="$message"/></xsl:comment>
                            </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="handlePQ">
                                <xsl:with-param name="elemName">herhaalperiode_cyclisch_schema</xsl:with-param>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:for-each-group>

                <!-- doseerinstructie, group sequencenumber and doseerduur -->
                <xsl:for-each-group select="$hl7Doseerinstructie" group-by="concat(hl7:sequenceNumber/@value, hl7:substanceAdministration/hl7:effectiveTime/hl7:width/concat(@value, @unit))">
                    <doseerinstructie>
                        <!-- volgnummer -->
                        <xsl:for-each select="(current-group()/hl7:sequenceNumber)[1]">
                            <xsl:call-template name="handleINT">
                                <xsl:with-param name="elemName">volgnummer</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>

                        <!-- doseerduur -->
                        <xsl:variable name="elemName">doseerduur</xsl:variable>
                        <xsl:variable name="hl7Doseerduur" select="$hl7Doseerinstructie/hl7:substanceAdministration/hl7:effectiveTime/hl7:width"/>
                        <xsl:variable name="hl7DoseerduurCyclisch" select="hl7:substanceAdministration/hl7:effectiveTime[hl7:comp[not(@alignment)][hl7nl:period][hl7nl:phase[hl7nl:width]]]/hl7:comp/hl7nl:phase/hl7nl:width"/>
                        <xsl:choose>
                            <!-- doseerduur in Cyclisch doseerschema. -->
                            <xsl:when test="$hl7DoseerduurCyclisch">
                                <xsl:for-each select="$hl7DoseerduurCyclisch">
                                    <xsl:call-template name="mp9-duration">
                                        <xsl:with-param name="elemName" select="$elemName"/>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:when>
                            <!-- overige gevallen -->
                            <xsl:otherwise>
                                <xsl:for-each select="(current-group()/hl7:substanceAdministration/hl7:effectiveTime/hl7:width)[1]">
                                    <xsl:call-template name="mp9-duration">
                                        <xsl:with-param name="elemName" select="$elemName"/>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:otherwise>
                        </xsl:choose>

                        <!-- dosering -->
                        <xsl:for-each select="current-group()/hl7:substanceAdministration">
                            <dosering>
                                <!-- keerdosis -->
                                <xsl:for-each select="hl7:doseQuantity">
                                    <xsl:variable name="elemName">keerdosis</xsl:variable>
                                    <xsl:element name="{$elemName}">
                                        <!-- aantal -->
                                        <xsl:variable name="elemName">aantal</xsl:variable>
                                        <xsl:element name="{$elemName}">
                                            <xsl:for-each select="hl7:low/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <min value="{@value}"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="hl7:center/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <vaste_waarde value="{@value}"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="hl7:high/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <max value="{@value}"/>
                                            </xsl:for-each>
                                        </xsl:element>
                                        <xsl:for-each select="(*/hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                                            <eenheid>
                                                <xsl:call-template name="mp9-code-attribs">
                                                    <xsl:with-param name="current-hl7-code" select="."/>
                                                </xsl:call-template>
                                            </eenheid>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:for-each>

                                <!-- toedieningsschema -->
                                <!-- er moet een PIVL_TS zijn om een toedieningsschema te maken -->
                                <xsl:if test=".//*[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-nl:v3', 'PIVL_TS')]">
                                    <toedieningsschema>
                                        <!-- eenvoudig doseerschema met één PIVL in effectiveTime-->
                                        <xsl:variable name="PivlEffectiveTime" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-nl:v3', 'PIVL_TS')]"/>
                                        <xsl:if test="$PivlEffectiveTime">

                                            <!-- Eenvoudig doseerschema met alleenéén (variabele) frequentie.-->
                                            <xsl:for-each select="$PivlEffectiveTime[xs:string(@isFlexible) = 'true' or hl7nl:frequency/hl7nl:numerator/hl7nl:uncertainRange][not(@alignment)][hl7nl:frequency][not(hl7nl:phase)]">
                                                <xsl:comment>Eenvoudig doseerschema met alleen één (variabele) frequentie.</xsl:comment>
                                                <xsl:if test="(not(exists(@isFlexible) or xs:string(@isFlexible) = 'false') and hl7nl:frequency/hl7nl:numerator/hl7nl:uncertainRange)">
                                                    <!-- this is unexpected, @isFlexible should have been true, however seems how
                                                hl7nl:frequency/hl7nl:numerator/hl7nl:uncertainRange is present we assume flexibility
                                                let's at least output a debug message-->
                                                    <xsl:call-template name="util:logMessage">
                                                        <xsl:with-param name="level" select="$logWARN"/>
                                                        <xsl:with-param name="terminate" select="false()"/>
                                                        <xsl:with-param name="msg">Encountered a PIVL_TS with @isFlexibility false or absent, but with hl7nl:frequency/hl7nl:numerator/hl7nl:uncertainRange (which can only occur with flexible schedule). Still outputting this in ada as frequency, in order to minimise information loss. However: please fix the HL7v3 instance, since this is incorrect according to template specfications.</xsl:with-param>
                                                    </xsl:call-template>
                                                </xsl:if>
                                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"/>
                                                <!-- is_flexibel -->
                                                <is_flexibel>
                                                    <xsl:copy-of select="nf:getIsFlexible(.)"/>
                                                </is_flexibel>
                                            </xsl:for-each>

                                            <!-- Eenvoudig doseerschema met alleen één interval.-->
                                            <xsl:for-each select="$PivlEffectiveTime[(xs:string(@isFlexible) = 'false' or not(@isFlexible))][not(@alignment)][hl7nl:frequency[hl7nl:numerator/@value]][not(hl7nl:phase)]">
                                                <!-- interval -->
                                                <xsl:comment>Eenvoudig doseerschema met alleen één interval.</xsl:comment>
                                                <xsl:call-template name="mp9-interval"/>
                                                <!-- is_flexibel, is not applicable for interval (implicitly false) -->
                                            </xsl:for-each>

                                            <!-- Eenvoudig doseerschema met één vast tijdstip. -->
                                            <xsl:for-each select="$PivlEffectiveTime[not(@alignment)][hl7nl:phase[hl7nl:low][not(hl7nl:width)]][hl7nl:period]">
                                                <xsl:if test="not(hl7nl:period[@value = 1][@unit = 'd'])">
                                                    <!-- Hmmm, officially unexpected stuff -->
                                                    <xsl:variable name="message">Unexpected period which is not compliant with templates. Expected period to be 1 day but found: <xsl:value-of select="string-join(hl7nl:period/(@value | @unit), ' ')"/>. Please check your HL7. However, since there is only one period, we can output this information in ada frequentie to prevent information loss.</xsl:variable>
                                                    <xsl:call-template name="util:logMessage">
                                                        <xsl:with-param name="msg" select="$message"/>
                                                        <xsl:with-param name="level" select="$logERROR"/>
                                                        <xsl:with-param name="terminate" select="false()"/>
                                                    </xsl:call-template>
                                                    <xsl:comment><xsl:value-of select="$message"/></xsl:comment>
                                                    <frequentie>
                                                        <aantal>
                                                            <vaste_waarde value="1"/>
                                                        </aantal>
                                                        <tijdseenheid value="{hl7nl:period/@value}" unit="{nf:convertTime_UCUM2ADA_unit(hl7nl:period/@unit)}"/>
                                                    </frequentie>
                                                </xsl:if>
                                                <!-- output the toedieningstijd -->
                                                <xsl:call-template name="handleTS">
                                                    <xsl:with-param name="in" select="hl7nl:phase/hl7nl:low"/>
                                                    <xsl:with-param name="elemName">toedientijd</xsl:with-param>
                                                    <xsl:with-param name="vagueDate" select="true()"/>
                                                </xsl:call-template>
                                                <!-- is_flexibel -->
                                                <is_flexibel>
                                                    <xsl:copy-of select="nf:getIsFlexible(.)"/>
                                                </is_flexibel>
                                            </xsl:for-each>

                                            <!-- Eenmalig gebruik of aantal keren gebruik zonder tijd. -->
                                            <xsl:for-each select="$PivlEffectiveTime[not(@alignment)]/hl7nl:count">
                                                <frequentie>
                                                    <aantal>
                                                        <xsl:choose>
                                                            <xsl:when test="@value">
                                                                <vaste_waarde value="{@value}"/>
                                                            </xsl:when>
                                                            <xsl:when test="hl7nl:uncertainRange[.//(@value | @nullFlavor)]">
                                                                <xsl:for-each select="hl7nl:uncertainRange/hl7nl:low[@value | @nullFlavor]">
                                                                    <xsl:call-template name="handleINT">
                                                                        <xsl:with-param name="elemName">min</xsl:with-param>
                                                                        <xsl:with-param name="in" select="."/>
                                                                    </xsl:call-template>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="hl7nl:uncertainRange/hl7nl:high[@value | @nullFlavor]">
                                                                    <xsl:call-template name="handleINT">
                                                                        <xsl:with-param name="elemName">max</xsl:with-param>
                                                                        <xsl:with-param name="in" select="."/>
                                                                    </xsl:call-template>
                                                                </xsl:for-each>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                    </aantal>
                                                </frequentie>
                                                <!-- is_flexibel -->
                                                <is_flexibel>
                                                    <xsl:copy-of select="nf:getIsFlexible(..)"/>
                                                </is_flexibel>
                                            </xsl:for-each>

                                            <!-- Doseerschema één keer per week op één weekdag. -->
                                            <xsl:for-each select="$PivlEffectiveTime[@alignment = 'DW']">
                                                <xsl:for-each select="hl7nl:period">
                                                    <!-- 1 maal per week is impliciet bij weekdag, dus die hoeft niet in ada output -->
                                                    <xsl:if test="not(@value = 1 and @unit = 'wk')">
                                                        <frequentie>
                                                            <aantal>
                                                                <!-- altijd 1, 1 keer per week of 1 keer per 2 weken et cetera -->
                                                                <vaste_waarde value="1"/>
                                                            </aantal>
                                                            <tijdseenheid value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(@unit)}"/>
                                                        </frequentie>
                                                    </xsl:if>
                                                </xsl:for-each>
                                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123_only_phase_low">
                                                    <xsl:with-param name="current_PIVL" select="."/>
                                                </xsl:call-template>
                                            </xsl:for-each>

                                            <!-- Doseerschema met één dagdeel -->
                                            <xsl:for-each select="$PivlEffectiveTime[@alignment = 'HD']">
                                                <!-- is_flexibel -->
                                                <is_flexibel>
                                                    <xsl:copy-of select="nf:getIsFlexible(.)"/>
                                                </is_flexibel>
                                                <xsl:call-template name="mp9-dagdeel">
                                                    <xsl:with-param name="PIVL_TS-HD" select="."/>
                                                </xsl:call-template>
                                            </xsl:for-each>

                                            <!-- Doseerschema met toedieningsduur  -->
                                            <!-- legacy version 910 or before: en eventueel toedieningstijd. -->
                                            <xsl:for-each select="$PivlEffectiveTime[not(@alignment)][not(hl7nl:period)][hl7nl:phase[hl7nl:width]]">
                                                <xsl:comment>Doseerschema met toedieningsduur.</xsl:comment>
                                                <!-- frequentie -->
                                                <xsl:variable name="hl7Toedientijd" as="element(hl7nl:low)*" select="hl7nl:phase/hl7nl:low[string-length(@value) gt 9]"/>
                                                <xsl:if test="(xs:string(@isFlexible) = 'true' or $hl7Toedientijd) and hl7nl:frequency[.//(@value | @unit)]">
                                                    <!-- don't output frequentie when it is once a day and is combined with toedientijd -->
                                                    <xsl:if test="not($hl7Toedientijd and hl7nl:frequency[hl7nl:numerator/@value = '1'][hl7nl:denominator[@value = '1' and @unit = 'd']])">
                                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"/>
                                                    </xsl:if>
                                                </xsl:if>
                                                <!-- interval, not in combination with toedientijd only with isFlexible false -->
                                                <xsl:variable name="hl7IntervalBln" as="xs:boolean" select="not(xs:string(@isFlexible) = 'true') and not($hl7Toedientijd) and hl7nl:frequency[.//(@value | @unit)]"/>
                                                <xsl:if test="$hl7IntervalBln">
                                                    <xsl:call-template name="mp9-interval"/>
                                                </xsl:if>
                                                <!-- toedientijd -->
                                                <xsl:for-each select="$hl7Toedientijd">
                                                    <xsl:call-template name="handleTS">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="elemName">toedientijd</xsl:with-param>
                                                        <xsl:with-param name="vagueDate" select="true()"/>
                                                    </xsl:call-template>
                                                </xsl:for-each>
                                                <!-- is_flexibel -->
                                                <!-- not applicable when interval has been outputted (implicitly false) -->
                                                <xsl:if test="not($hl7IntervalBln)">
                                                    <is_flexibel>
                                                        <xsl:copy-of select="nf:getIsFlexible(.)"/>
                                                    </is_flexibel>
                                                </xsl:if>
                                            </xsl:for-each>


                                            <!-- legacy version 910 or before -->
                                            <!-- Doseerschema één keer per week op één weekdag met toedieningsduur -->
                                            <xsl:for-each select="hl7:effectiveTime[@alignment = 'DW']/hl7nl:phase/hl7nl:width">
                                                <toedieningsduur value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                                            </xsl:for-each>

                                        </xsl:if>

                                        <!--  <!-\- Doseerschema met toedieningsduur gecombineerd met meerdere toedientijden -\->
                                        <xsl:variable name="doseSchema" as="element(hl7:comp)*" select="hl7:effectiveTime[hl7:comp[hl7nl:phase[hl7nl:width]]][not(hl7:comp/@alignment)][not(hl7:comp[hl7nl:period])]/hl7:comp"/>
                                        <xsl:if test="$doseSchema">
                                            <xsl:comment>Doseerschema met toedieningsduur gecombineerd met meerdere toedientijden.</xsl:comment>
                                            <!-\- frequentie, we evaluate the first hl7:comp in $doseSchema, should all be the same for frequency. @isFlexible is not important here, since it applies to toedientijd -\->
                                            <xsl:variable name="doseFrequency" as="element()?" select="($doseSchema[hl7nl:frequency[.//(@value | @unit)]])[1]"/>
                                            <xsl:if test="$doseFrequency">
                                                <!-\- don't output frequentie when it is once a day and is combined with toedientijd -\->
                                                <xsl:if test="not($doseFrequency[string-length(hl7nl:phase/hl7nl:low/@value) gt 9][hl7nl:frequency[hl7nl:numerator/@value = '1'][hl7nl:denominator[@value = '1' and @unit = 'd']]])">
                                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339">
                                                        <xsl:with-param name="in" select="$doseFrequency"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                            </xsl:if>
                                            <!-\- interval is not applicable in combination with toedientijd -\->
                                            <!-\- output the toedieningstijd -\->
                                            <xsl:variable name="hl7Toedientijd" as="element(hl7nl:low)*" select="$doseSchema/hl7nl:phase/hl7nl:low[string-length(@value) gt 9]"/>
                                            <xsl:for-each select="$hl7Toedientijd">
                                                <xsl:variable name="elemName">toedientijd</xsl:variable>
                                                <xsl:call-template name="handleTS">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="elemName" select="$elemName"/>
                                                    <xsl:with-param name="vagueDate" select="true()"/>
                                                </xsl:call-template>
                                            </xsl:for-each>
                                            <!-\- is_flexibel -\->
                                            <xsl:element name="is_flexibel">
                                                <xsl:choose>
                                                    <xsl:when test="$doseSchema[xs:string(@isFlexible) = 'false']">
                                                        <!-\- there is at least one non-flexible time, so is_flexibel must be false -\->
                                                        <xsl:attribute name="value">false</xsl:attribute>
                                                    </xsl:when>
                                                    <xsl:when test="$doseSchema[xs:string(@isFlexible) = 'true'] and not($doseSchema[xs:string(@isFlexible) != 'true'])">
                                                        <!-\- none of the @isFlexible are false, so all must be true -\->
                                                        <xsl:attribute name="value">true</xsl:attribute>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <!-\- we don't know -\->
                                                        <xsl:attribute name="nullFlavor">UNK</xsl:attribute>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:element>
                                        </xsl:if>
-->

                                        <!-- Complexer doseerschema met weekdag(en). -->
                                        <xsl:for-each select="hl7:effectiveTime[hl7:comp/@alignment = 'DW']">
                                            <xsl:comment>Complexer doseerschema met weekdag(en).</xsl:comment>
                                            <!-- de frequentie van inname op de weekdag, bijvoorbeeld: 3x per dag iedere woensdag. 3x per dag is dan de frequentie hier -->
                                            <xsl:for-each select="hl7:comp[xs:string(@isFlexible) = 'true' and hl7nl:frequency]">
                                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"/>
                                            </xsl:for-each>

                                            <!-- Als niet alle weekdagen in deze dosering dezelfde toedientijden en period (frequentie van 1 maal per week of 1 maal per 2 weken) 
                                                hebben (wat in HL7 kán), dan voldoet deze doseerinstructie 
                                                niet aan het MP-9 datamodel, want daarvoor moet een separate - parallelle - dosering worden aangemaakt -->
                                            <!-- deze variabele days-with-times verzamelt de relevante gegevens uit hl7 in een overzichtelijk geheel -->
                                            <xsl:variable name="days-with-times" as="element(days)*">
                                                <xsl:for-each select="hl7:comp[@alignment = 'DW']">
                                                    <xsl:variable name="hl7-weekdag" select="substring(./hl7nl:phase/hl7nl:low/@value, 1, 8)"/>
                                                    <xsl:variable name="hl7-tijd" select="substring(./hl7nl:phase/hl7nl:low/@value, 9, 6)"/>
                                                    <xsl:variable name="hl7-period" select="hl7nl:period"/>
                                                    <xsl:variable name="weekdag-xml-date" select="nf:formatHL72XMLDate($hl7-weekdag, 'DAY')"/>
                                                    <days value="{nf:day-of-week($weekdag-xml-date)}" period-value="{$hl7-period/@value}" period-unit="{$hl7-period/@unit}">
                                                        <xsl:if test="string-length($hl7-tijd) gt 0">
                                                            <xsl:attribute name="time" select="$hl7-tijd"/>
                                                        </xsl:if>
                                                    </days>
                                                </xsl:for-each>
                                            </xsl:variable>
                                            <!-- deze variable groepeert de $days-with-times per dag -->
                                            <xsl:variable name="day-with-times" as="element(day)*">
                                                <xsl:for-each-group select="$days-with-times" group-by="./@value">
                                                    <day value="{@value}">
                                                        <xsl:for-each select="current-group()">
                                                            <xsl:sort select="./@time"/>
                                                            <times period-value="{@period-value}" period-unit="{@period-unit}">
                                                                <xsl:if test="./@time">
                                                                    <xsl:attribute name="value" select="./@time"/>
                                                                </xsl:if>
                                                            </times>
                                                        </xsl:for-each>
                                                    </day>
                                                </xsl:for-each-group>
                                            </xsl:variable>
                                            <!-- Deze variable groepeert de $days-with-times per frequentie. Er mag eigenlijk maar 1 frequentie zijn.... -->
                                            <xsl:variable name="frequency-with-daytimes" as="element(frequency)*">
                                                <xsl:for-each-group select="$days-with-times" group-by="./concat(@period-value, @period-unit)">
                                                    <frequency value="{@period-value}" unit="{@period-unit}">
                                                        <xsl:for-each-group select="current-group()" group-by="./@value">
                                                            <day value="{@value}">
                                                                <xsl:for-each select="current-group()">
                                                                    <xsl:sort select="./@time"/>
                                                                    <times period-value="{@period-value}" period-unit="{@period-unit}">
                                                                        <xsl:if test="./@time">
                                                                            <xsl:attribute name="value" select="./@time"/>
                                                                        </xsl:if>
                                                                    </times>
                                                                </xsl:for-each>
                                                            </day>
                                                        </xsl:for-each-group>
                                                    </frequency>
                                                </xsl:for-each-group>
                                            </xsl:variable>
                                            <!-- Deze variabele groeperen voor de tijden en zet het geheel in mp9-datamodelformaat -->
                                            <xsl:variable name="times-days-mp9-datamodel">
                                                <xsl:if test="count($frequency-with-daytimes) = 1 and $frequency-with-daytimes[concat(@value, @unit) ne '1wk']">
                                                    <frequentie value="{$frequency-with-daytimes/@value}" unit="{$frequency-with-daytimes/@unit}"/>
                                                </xsl:if>
                                                <xsl:for-each-group select="$day-with-times" group-by="string-join(./times/@value, '')">
                                                    <xsl:variable name="last-group" select="last()"/>
                                                    <times group-key="{current-grouping-key()}" last-group="{$last-group}">
                                                        <xsl:for-each select="./times/@value">
                                                            <toedientijd value="{.}"/>
                                                        </xsl:for-each>
                                                        <xsl:for-each select="current-group()">
                                                            <weekdag value="{@value}"/>
                                                        </xsl:for-each>
                                                    </times>
                                                </xsl:for-each-group>
                                            </xsl:variable>
                                            <!-- there may be only one frequency in $frequency-with-daytimes and one times group in $times-days-mp9-datamodel, 
                                                otherwise this schedule does not conform to MP9-datamodel... -->
                                            <xsl:choose>
                                                <xsl:when test="count($frequency-with-daytimes) = 1 and count($times-days-mp9-datamodel/times) = 1">
                                                    <!-- Frequentie wanneer anders dan 1 keer per week -->
                                                    <xsl:for-each select="$times-days-mp9-datamodel/frequentie">
                                                        <frequentie>
                                                            <aantal>
                                                                <vaste_waarde value="1"/>
                                                            </aantal>
                                                            <tijdseenheid value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(@unit)}"/>
                                                        </frequentie>
                                                    </xsl:for-each>
                                                    <!-- Eerst alle toedientijden die in weekdag PIVL_TS opgepikt zijn -->
                                                    <xsl:for-each select="$times-days-mp9-datamodel/times/toedientijd">
                                                        <toedientijd value="{nf:formatHL72VagueAdaDate(nf:appendDate2DateOrTime(concat('19700101', @value)), nf:determine_date_precision(concat('19700101', @value)))}"/>
                                                    </xsl:for-each>
                                                    <!-- De toedientijden die in een losse PIVL_TS staan (dus niet ín de weekdag PIVL_TS) -->
                                                    <xsl:for-each select="hl7:comp[not(@alignment)][hl7nl:phase[not(hl7nl:width)]][hl7nl:period[@value = '1'][@unit = 'd']]">
                                                        <toedientijd value="{nf:formatHL72VagueAdaDate(nf:appendDate2DateOrTime(hl7nl:phase/hl7nl:low/@value), nf:determine_date_precision(hl7nl:phase/hl7nl:low/@value))}"/>
                                                    </xsl:for-each>
                                                    <!-- is_flexibel -->
                                                    <is_flexibel>
                                                        <xsl:copy-of select="nf:getIsFlexible(hl7:comp)"/>
                                                    </is_flexibel>

                                                    <!-- Daarna alle weekdagen -->
                                                    <xsl:for-each select="$times-days-mp9-datamodel/times/weekdag">
                                                        <weekdag>
                                                            <xsl:call-template name="mp9-weekdag-attribs">
                                                                <xsl:with-param name="day-of-week" select="./@value"/>
                                                            </xsl:call-template>
                                                        </weekdag>
                                                    </xsl:for-each>

                                                    <!-- en de eventuele dagdelen -->
                                                    <xsl:for-each select="hl7:comp[@alignment = 'HD']">
                                                        <xsl:call-template name="mp9-dagdeel">
                                                            <xsl:with-param name="PIVL_TS-HD" select="."/>
                                                        </xsl:call-template>
                                                    </xsl:for-each>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:call-template name="util:logMessage">
                                                        <xsl:with-param name="level" select="$logERROR"/>
                                                        <xsl:with-param name="msg">The dosage schedule does not comply to MP-9 datamodel, please refer to text for the correct dosage information.</xsl:with-param>
                                                        <xsl:with-param name="terminate" select="false()"/>
                                                    </xsl:call-template>
                                                    <xsl:comment>The dosage schedule does not comply to MP-9 datamodel, please refer to text for the correct dosage information.</xsl:comment>
                                                    <xsl:comment>Found (illegal) structure:</xsl:comment>
                                                    <xsl:call-template name="copyElementInComment">
                                                        <xsl:with-param name="element" select="$day-with-times"/>
                                                    </xsl:call-template>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>

                                        <!-- Complexer doseerschema met minimaal één dagdeel, maar zonder weekdag want die is hierboven al gedaan. -->
                                        <xsl:variable name="doseSchema" select="hl7:effectiveTime[not(hl7:comp/@alignment = 'DW')][hl7:comp/@alignment = 'HD']/hl7:comp"/>
                                        <xsl:if test="$doseSchema">
                                            <!-- frequentie, flexibel of een toedientijd aanwezig -->
                                            <xsl:for-each select="$doseSchema[hl7nl:frequency][@isFlexible = 'true' or (../hl7:comp[not(@alignment)][hl7nl:phase[not(hl7nl:width)]])]">
                                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"/>
                                            </xsl:for-each>

                                            <!-- is_flexibel -->
                                            <is_flexibel>
                                                <xsl:copy-of select="nf:getIsFlexible($doseSchema)"/>
                                            </is_flexibel>

                                            <!-- dagdeel -->
                                            <xsl:for-each select="$doseSchema[@alignment = 'HD']">
                                                <xsl:call-template name="mp9-dagdeel">
                                                    <xsl:with-param name="PIVL_TS-HD" select="."/>
                                                </xsl:call-template>
                                            </xsl:for-each>

                                        </xsl:if>

                                        <!-- Complexer doseerschema zonder weekdag of dagdeel -->
                                        <xsl:variable name="doseSchema" select="hl7:effectiveTime[not(hl7:comp/@alignment = ('DW', 'HD'))]/hl7:comp"/>
                                        <xsl:if test="$doseSchema">

                                            <!-- frequentie, isFlexible true or a comp with toedientijd -->
                                            <xsl:for-each select="$doseSchema[hl7nl:frequency][@isFlexible = 'true' or ($doseSchema[not(@alignment)][hl7nl:phase[not(hl7nl:width)]])]">
                                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"/>
                                            </xsl:for-each>

                                            <!-- interval, isFlexible false zonder toedientijd -->
                                            <xsl:for-each select="$doseSchema[hl7nl:frequency][@isFlexible = 'false'][not($doseSchema[not(@alignment)][hl7nl:phase[not(hl7nl:width)]])]">
                                                <xsl:call-template name="mp9-interval"/>
                                            </xsl:for-each>

                                            <!-- toedientijd -->
                                            <xsl:for-each select="$doseSchema[not(@alignment)][hl7nl:phase[hl7nl:low][not(hl7nl:width)]][hl7nl:period]">
                                                <xsl:choose>
                                                    <xsl:when test="not(hl7nl:period[@value = 1][@unit = 'd'])">
                                                        <!-- Hmmm, unexpected stuff -->
                                                        <xsl:variable name="message">Unexpected period which is not compliant with templates. Expected period to be 1 day but found: <xsl:value-of select="string-join(hl7nl:period/(@value | @unit), ' ')"/>. Please check your HL7. Cannot output this toedientijd (<xsl:value-of select="hl7nl:phase/hl7nl:low/@value"/>).</xsl:variable>
                                                        <xsl:call-template name="util:logMessage">
                                                            <xsl:with-param name="msg" select="$message"/>
                                                            <xsl:with-param name="level" select="$logERROR"/>
                                                            <xsl:with-param name="terminate" select="false()"/>
                                                        </xsl:call-template>
                                                        <xsl:comment><xsl:value-of select="$message"/></xsl:comment>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:call-template name="handleTS">
                                                            <xsl:with-param name="in" select="hl7nl:phase/hl7nl:low"/>
                                                            <xsl:with-param name="elemName">toedientijd</xsl:with-param>
                                                            <xsl:with-param name="vagueDate" select="true()"/>
                                                        </xsl:call-template>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:for-each>

                                            <!-- is_flexibel -->
                                            <is_flexibel>
                                                <xsl:copy-of select="nf:getIsFlexible($doseSchema)"/>
                                            </is_flexibel>

                                        </xsl:if>
                                    </toedieningsschema>
                                </xsl:if>

                                <!-- zo nodig -->
                                <xsl:if test="(hl7:precondition/hl7:criterion/hl7:code | hl7:maxDoseQuantity)[.//(@code | @nullFlavor | @value | @unit)]">
                                    <zo_nodig>
                                        <xsl:for-each select="hl7:precondition/hl7:criterion/hl7:code">
                                            <criterium>
                                                <code>
                                                    <xsl:call-template name="mp9-code-attribs">
                                                        <xsl:with-param name="current-hl7-code" select="."/>
                                                    </xsl:call-template>
                                                </code>
                                                <!-- no use case for omschrijving, omschrijving is in code/@originalText -->
                                            </criterium>
                                        </xsl:for-each>
                                        <xsl:for-each select="hl7:maxDoseQuantity[.//(@value | @unit)]">
                                            <maximale_dosering>
                                                <aantal value="{hl7:numerator/@value}"/>
                                                <xsl:for-each select="(hl7:numerator/hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                                                    <eenheid>
                                                        <xsl:call-template name="mp9-code-attribs">
                                                            <xsl:with-param name="current-hl7-code" select="."/>
                                                        </xsl:call-template>
                                                    </eenheid>
                                                </xsl:for-each>
                                                <xsl:for-each select="hl7:denominator[@value | @unit]">
                                                    <tijdseenheid value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(@unit)}"/>
                                                </xsl:for-each>
                                            </maximale_dosering>
                                        </xsl:for-each>

                                    </zo_nodig>
                                </xsl:if>
                                <!-- toedieningssnelheid -->
                                <xsl:for-each select="hl7:rateQuantity">
                                    <xsl:variable name="ucum-rate-eenheden" select="./*/@unit"/>
                                    <xsl:variable name="ucum-rate-eenheid">
                                        <xsl:if test="
                                                every $i in $ucum-rate-eenheden
                                                    satisfies $i = $ucum-rate-eenheden[1]">
                                            <xsl:value-of select="$ucum-rate-eenheden[1]"/>
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="string-length($ucum-rate-eenheid) gt 0">
                                            <toedieningssnelheid>
                                                <waarde>
                                                    <xsl:for-each select="hl7:low">
                                                        <min value="{@value}"/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="hl7:center">
                                                        <vaste_waarde value="{@value}"/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="hl7:high">
                                                        <max value="{@value}"/>
                                                    </xsl:for-each>
                                                </waarde>
                                                <xsl:variable name="ucum-eenheid" select="substring-before($ucum-rate-eenheid, '/')"/>
                                                <eenheid>
                                                    <xsl:call-template name="UCUM2GstdBasiseenheid">
                                                        <xsl:with-param name="UCUM" select="$ucum-eenheid"/>
                                                    </xsl:call-template>
                                                </eenheid>
                                                <xsl:variable name="ucum-tijdseenheid" select="substring-after($ucum-rate-eenheid, '/')"/>
                                                <!-- tijdseenheid is usually of a format like: ml/h -->
                                                <!-- however, a format like ml/2.h (milliliter per 2 hours) is also allowed in UCUM and the datamodel -->
                                                <!-- however, all the occurences of rate unit (min and max) must be equal to one another -->
                                                <xsl:variable name="firstChar" select="substring(translate($ucum-tijdseenheid, '0123456789.', ''), 1, 1)"/>
                                                <xsl:variable name="beforeFirstChar" select="substring-before($ucum-tijdseenheid, $firstChar)"/>
                                                <xsl:variable name="ucum-tijdseenheid-value">
                                                    <xsl:choose>
                                                        <xsl:when test="string-length($beforeFirstChar) gt 0">
                                                            <xsl:value-of select="substring-before($beforeFirstChar, '.')"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>1</xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:variable>
                                                <xsl:variable name="ucum-tijdseenheid-unit" select="concat($firstChar, substring-after($ucum-tijdseenheid, $firstChar))"/>
                                                <tijdseenheid value="{$ucum-tijdseenheid-value}" unit="{nf:convertTime_UCUM2ADA_unit($ucum-tijdseenheid-unit)}"/>
                                            </toedieningssnelheid>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:call-template name="util:logMessage">
                                                <xsl:with-param name="level" select="$logERROR"/>
                                                <xsl:with-param name="terminate" select="false()"/>
                                                <xsl:with-param name="msg">Cannot output "toedieningssnelheid" because the ratequantity/*/@unit are not all equal, found: "<xsl:value-of select="string-join($ucum-rate-eenheden, ' and ')"/>".</xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                                <!-- Doseerschema met toedieningsduur. -->
                                <xsl:for-each select="(//*[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-nl:v3', 'PIVL_TS')][not(@alignment)][not(hl7nl:period)]/hl7nl:phase/hl7nl:width)[1]">
                                    <toedieningsduur value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                                </xsl:for-each>
                            </dosering>
                        </xsl:for-each>
                    </doseerinstructie>
                </xsl:for-each-group>
            </gebruiksinstructie>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handles usage period pattern from MP9 2.0 bouwstenen (based on zib2020)</xd:desc>
        <xd:param name="IVL_TS">The HL7 IVL_TS for the usage period</xd:param>
        <xd:param name="elemName">The ada element name to be outputted, defaults to gebruiksperiode</xd:param>
    </xd:doc>
    <xsl:template name="mp92-gebruiksperiode">
        <xsl:param name="IVL_TS" as="element()?" select="."/>
        <xsl:param name="elemName" as="xs:string">gebruiksperiode</xsl:param>

        <!-- do not use the handlePQ template since the mp ada time unit does not comply to the assumptions in that template -->

        <xsl:for-each select="$IVL_TS[hl7:low | hl7:width | hl7:high]">
            <xsl:element name="{$elemName}">

                <!-- gebruiksperiode_start -->
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="$IVL_TS/hl7:low"/>
                    <xsl:with-param name="elemName">start_datum_tijd</xsl:with-param>
                    <xsl:with-param name="vagueDate" select="true()"/>
                    <xsl:with-param name="datatype">datetime</xsl:with-param>
                </xsl:call-template>

                <!-- gebruiksperiode_eind -->
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="$IVL_TS/hl7:high"/>
                    <xsl:with-param name="elemName">eind_datum_tijd</xsl:with-param>
                    <xsl:with-param name="vagueDate" select="true()"/>
                    <xsl:with-param name="datatype">datetime</xsl:with-param>
                </xsl:call-template>

                <!-- duur -->
                <xsl:for-each select="$IVL_TS/hl7:width[@value]">
                    <tijds_duur>
                        <xsl:attribute name="value" select="@value"/>
                        <xsl:attribute name="unit" select="nf:convertTime_UCUM2ADA_unit(./@unit)"/>
                    </tijds_duur>
                </xsl:for-each>

            </xsl:element>
        </xsl:for-each>

    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="inputValue"/>
    </xd:doc>
    <xsl:template name="mp9-gebruiksperiode-eind">
        <xsl:param name="inputValue"/>
        <gebruiksperiode_eind value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime($inputValue), nf:determine_date_precision($inputValue))}"/>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="inputValue"/>
        <xd:param name="nullFlavor"/>
    </xd:doc>
    <xsl:template name="mp9-gebruiksperiode-start">
        <xsl:param name="inputValue"/>
        <xsl:param name="nullFlavor"/>
        <xsl:choose>
            <xsl:when test="string-length($inputValue) gt 0">
                <gebruiksperiode_start value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime($inputValue), nf:determine_date_precision($inputValue))}"/>
            </xsl:when>
            <xsl:when test="string-length($nullFlavor) gt 0">
                <gebruiksperiode_start nullFlavor="{$nullFlavor}"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Converts HL7v3 input gender to ada gender. Completes codeSystemName and displayName if not input. Creates nullFlavor UNK if input is unknown.</xd:desc>
        <xd:param name="current-administrativeGenderCode">HL7v3 input element for gender</xd:param>
    </xd:doc>
    <xsl:template name="mp9-geslacht">
        <xsl:param name="current-administrativeGenderCode" select="."/>
        <xsl:variable name="concept-id-ada-geslacht">2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19831</xsl:variable>
        <xsl:call-template name="handleCV">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="elemName">geslacht</xsl:with-param>
            <xsl:with-param name="codeMap" as="element()*">
                <map inCode="F" inCodeSystem="{$oidHL7AdministrativeGender}" codeSystemName="AdministrativeGender" displayName="Vrouw"/>
                <map inCode="M" inCodeSystem="{$oidHL7AdministrativeGender}" codeSystemName="AdministrativeGender" displayName="Man"/>
                <map inCode="UN" inCodeSystem="{$oidHL7AdministrativeGender}" codeSystemName="AdministrativeGender" displayName="Ongedifferentieerd"/>
                <map inCode="UNK" inCodeSystem="{$oidHL7NullFlavor}" codeSystemName="NullFlavor" displayName="{$hl7NullFlavorMap[@hl7NullFlavor = 'UNK']/@displayName}"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="hl7-num-or-denom"/>
    </xd:doc>
    <xsl:template name="mp9-ingredient-eenheid">
        <xsl:param name="hl7-num-or-denom" select="." as="element()?"/>
        <!-- @unit kán leeg zijn als de default waarde '1' is, dus stuks -->
        <!-- @unit is ook leeg als de waarde gerepresenteerd wordt door een nullFlavor, wat vooral legaal is bij nullFlavor QS - aanvullen tot -->
        <xsl:choose>
            <xsl:when test="$hl7-num-or-denom[@value]">
                <xsl:for-each select="$hl7-num-or-denom[@value]">
                    <xsl:choose>
                        <xsl:when test="hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                            <xsl:for-each select="hl7:translation">
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- translate UCUM unit to Gstd -->
                            <xsl:call-template name="UCUM2GstdBasiseenheid">
                                <xsl:with-param name="UCUM">
                                    <xsl:choose>
                                        <xsl:when test="./@unit">
                                            <xsl:value-of select="./@unit"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="'1'"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$hl7-num-or-denom[@nullFlavor]">
                <xsl:variable name="currentNullFlavor" select="./@nullFlavor"/>
                <xsl:attribute name="code" select="$currentNullFlavor"/>
                <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                <xsl:attribute name="displayName" select="$hl7NullFlavorMap[@hl7NullFlavor = $currentNullFlavor]/@displayName"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- no value, no nullFlavor, let's set a default nullFlavor  -->
                <xsl:attribute name="code">NI</xsl:attribute>
                <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                <xsl:attribute name="displayName">geen informatie</xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="hl7-num-or-denom"/>
    </xd:doc>
    <xsl:template name="mp9-ingredient-waarde">
        <xsl:param name="hl7-num-or-denom" as="node()"/>
        <xsl:variable name="gstd-translation" select="$hl7-num-or-denom/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]"/>
        <xsl:choose>
            <xsl:when test="$gstd-translation">
                <xsl:attribute name="value" select="$gstd-translation/@value"/>
            </xsl:when>
            <xsl:when test="./@nullFlavor">
                <xsl:attribute name="nullFlavor" select="./@nullFlavor"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="value" select="./@value"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc>Ingrediënt waarde en eenheid</xd:desc>
        <xd:param name="hl7-num-or-denom">HL7 nominator or denominator</xd:param>
    </xd:doc>
    <xsl:template name="mp-ingredient-waarde-en-eenheid">
        <xsl:param name="hl7-num-or-denom"/>

        <!-- waarde -->
        <xsl:for-each select="$hl7-num-or-denom">
            <xsl:variable name="ada-elemName">waarde</xsl:variable>
            <xsl:element name="{$ada-elemName}">
                <xsl:call-template name="mp9-ingredient-waarde">
                    <xsl:with-param name="hl7-num-or-denom" select="$hl7-num-or-denom"/>
                </xsl:call-template>
            </xsl:element>
            <xsl:variable name="ada-elemName">eenheid</xsl:variable>
            <xsl:element name="{$ada-elemName}">
                <xsl:call-template name="mp9-ingredient-eenheid">
                    <xsl:with-param name="hl7-num-or-denom" select="$hl7-num-or-denom"/>
                </xsl:call-template>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an ada interval element based on a HL7-PIVL_TS.</xd:desc>
        <xd:param name="in">the HL7 PIVL_TS which contains the interval, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="mp9-interval">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:for-each select="$in">
            <xsl:variable name="interval-value" select="format-number(number(hl7nl:frequency/hl7nl:denominator/@value) div number(./hl7nl:frequency/hl7nl:numerator/@value), '0.####')"/>
            <interval>
                <xsl:for-each select="$interval-value">
                    <xsl:attribute name="value" select="$interval-value"/>
                </xsl:for-each>
                <xsl:for-each select="hl7nl:frequency/hl7nl:denominator/@unit">
                    <xsl:attribute name="unit" select="nf:convertTime_UCUM2ADA_unit(.)"/>
                </xsl:for-each>
                <xsl:for-each select="hl7nl:frequency/@nullFlavor">
                    <xsl:attribute name="nullFlavor" select="."/>
                </xsl:for-each>
            </interval>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an ada keerdosis element based on a HL7 input.</xd:desc>
        <xd:param name="hl7-doseQuantity"/>
    </xd:doc>
    <xsl:template name="mp9-keerdosis">
        <xsl:param name="hl7-doseQuantity"/>
        <xsl:comment>mp9-keerdosis</xsl:comment>
        <!-- keerdosis -->
        <!-- only output if all units are the same -->
        <xsl:if test="not($hl7-doseQuantity)">
            <xsl:comment>geen keerdosis in input</xsl:comment>
        </xsl:if>
        <xsl:if test="count(distinct-values($hl7-doseQuantity//hl7:translation[@codeSystem = $oidGStandaardBST902THES2]/@code)) = 1">
            <xsl:for-each select="$hl7-doseQuantity">
                <keerdosis>
                    <aantal>
                        <xsl:for-each select="hl7:low/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                            <min value="{@value}"/>
                        </xsl:for-each>
                        <xsl:for-each select="hl7:center/hl7:translation[@codeSystem = $oidGStandaardBST902THES2] | ./hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                            <vaste_waarde value="{@value}"/>
                        </xsl:for-each>
                        <xsl:for-each select="hl7:high/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                            <max value="{@value}"/>
                        </xsl:for-each>
                    </aantal>
                    <xsl:for-each select="(.//hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                        <eenheid>
                            <xsl:call-template name="mp9-code-attribs">
                                <xsl:with-param name="current-hl7-code" select="."/>
                            </xsl:call-template>
                        </eenheid>
                    </xsl:for-each>
                </keerdosis>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="hl7-name"/>
    </xd:doc>
    <xsl:template name="mp9-naamgebruik">
        <xsl:param name="hl7-name"/>
        <xsl:choose>
            <xsl:when test="hl7:family[@qualifier = 'BR' or not(@qualifier)] and not(hl7:family[@qualifier = 'SP'])">
                <naamgebruik value="1" code="NL1" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Eigen geslachtsnaam"/>
            </xsl:when>
            <xsl:when test="hl7:family[@qualifier = 'SP'] and not(hl7:family[@qualifier = 'BR' or not(@qualifier)])">
                <naamgebruik value="2" code="NL2" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Geslachtsnaam partner"/>
            </xsl:when>
            <xsl:when test="hl7:family[@qualifier = 'SP'] and not(hl7:family[@qualifier = 'SP']/ancestor::hl7:family[@qualifier = 'BR' or not(@qualifier)])">
                <naamgebruik value="3" code="NL3" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Geslachtsnaam partner gevolgd door eigen geslachtsnaam"/>
            </xsl:when>
            <xsl:when test="hl7:family[@qualifier = 'BR' or not(@qualifier)] and not(hl7:family[@qualifier = 'BR' or not(@qualifier)]/ancestor::hl7:family[@qualifier = 'SP'])">
                <naamgebruik value="4" code="NL4" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Eigen geslachtsnaam gevolgd door geslachtsnaam partner"/>
            </xsl:when>
            <xsl:otherwise>
                <naamgebruik value="5" code="OTH" codeSystem="{$oidHL7NullFlavor}" displayName="Onbekend"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="current-hl7-name"/>
    </xd:doc>
    <xsl:template name="mp9-naamgegevens">
        <!-- naam binnen patiënt -->
        <xsl:param name="current-hl7-name" select="."/>
        <!-- See for the HL7 spec of name: http://www.hl7.nl/wiki/index.php/DatatypesR1:PN -->
        <naamgegevens>
            <!-- ongestructureerde_naam -->
            <xsl:for-each select="$current-hl7-name[text()][not(child::*)]">
                <ongestructureerde_naam>
                    <xsl:attribute name="value">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </ongestructureerde_naam>
            </xsl:for-each>
            <!-- voornamen -->
            <xsl:for-each select="$current-hl7-name[hl7:given[contains(@qualifier, 'BR') or not(@qualifier)][text()[not(. = '')]]]">
                <xsl:variable name="voornamen_concatted">
                    <xsl:for-each select="hl7:given[contains(@qualifier, 'BR') or not(@qualifier)][text()[not(. = '')]]">
                        <xsl:value-of select="concat(./text(), ' ')"/>
                    </xsl:for-each>
                </xsl:variable>
                <voornamen value="{normalize-space($voornamen_concatted)}"/>
            </xsl:for-each>
            <!-- initialen -->
            <xsl:for-each select="$current-hl7-name[hl7:given[contains(@qualifier, 'BR') or not(@qualifier) or @qualifier = 'IN']]">
                <!-- in HL7 mogen de initialen van officiële voornamen niet herhaald / gedupliceerd worden in het initialen veld -->
                <!-- in de zib moeten de initialen juist compleet zijn, dus de initialen hier toevoegen van de officiële voornamen -->
                <xsl:variable name="initialen_concatted">
                    <xsl:for-each select="hl7:given[contains(@qualifier, 'BR') or not(@qualifier)]">
                        <xsl:for-each select="tokenize(., ' ')">
                            <xsl:value-of select="concat(substring(., 1, 1), '.')"/>
                        </xsl:for-each>
                    </xsl:for-each>
                    <xsl:for-each select="hl7:given[@qualifier = 'IN']">
                        <xsl:value-of select="./text()"/>
                    </xsl:for-each>
                </xsl:variable>
                <initialen value="{$initialen_concatted}"/>
            </xsl:for-each>
            <xsl:for-each select="$current-hl7-name[hl7:given[contains(@qualifier, 'CL')]][text()[not(. = '')]]">
                <xsl:variable name="roepnamen_concatted">
                    <xsl:for-each select="hl7:given[contains(@qualifier, 'CL')][text()[not(. = '')]]">
                        <xsl:value-of select="concat(./text(), ' ')"/>
                    </xsl:for-each>
                </xsl:variable>
                <roepnaam value="{normalize-space($roepnamen_concatted)}"/>
            </xsl:for-each>
            <xsl:call-template name="mp9-naamgebruik">
                <xsl:with-param name="hl7-name" select="$current-hl7-name"/>
            </xsl:call-template>
            <xsl:for-each select="$current-hl7-name/hl7:family[@qualifier = 'BR' or not(@qualifier)][text()[not(. = '')]]">
                <geslachtsnaam>
                    <xsl:for-each select="./preceding-sibling::hl7:prefix[@qualifier = 'VV'][position() = 1][text()[not(. = '')]]">
                        <voorvoegsels>
                            <xsl:attribute name="value" select="./text()"/>
                        </voorvoegsels>
                    </xsl:for-each>
                    <achternaam value="Eigengeslachtsnaam">
                        <xsl:attribute name="value" select="./text()"/>
                    </achternaam>
                </geslachtsnaam>
            </xsl:for-each>
            <xsl:for-each select="$current-hl7-name/hl7:family[@qualifier = 'SP'][string-length(text()) gt 0]">
                <geslachtsnaam_partner>
                    <xsl:for-each select="./preceding-sibling::hl7:prefix[@qualifier = 'VV'][position() = 1][text()[not(. = '')]]">
                        <voorvoegsels_partner value="van ">
                            <xsl:attribute name="value" select="./text()"/>
                        </voorvoegsels_partner>
                    </xsl:for-each>
                    <achternaam_partner value="Partner">
                        <xsl:attribute name="value" select="./text()"/>
                    </achternaam_partner>
                </geslachtsnaam_partner>
            </xsl:for-each>
        </naamgegevens>
    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template to make a time duration</xd:desc>
        <xd:param name="in">Optional, but without it, no output. HL7 PQ element (may be more than one) to be converted to ada duration</xd:param>
        <xd:param name="elemName">Optional, ada xml element for output, defaults to 'duur'</xd:param>
    </xd:doc>
    <xsl:template name="mp9-duration">
        <xsl:param name="in" as="element()*" select="."/>
        <xsl:param name="elemName" as="xs:string*">duur</xsl:param>

        <xsl:for-each select="$in">
            <xsl:element name="{$elemName}">
                <xsl:for-each select="@value">
                    <xsl:attribute name="value" select="."/>
                </xsl:for-each>
                <xsl:for-each select="@unit">
                    <xsl:attribute name="unit" select="nf:convertTime_UCUM2ADA_unit(.)"/>
                </xsl:for-each>
                <xsl:for-each select="@nullFlavor">
                    <xsl:attribute name="nullFlavor" select="."/>
                </xsl:for-each>

            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="current-dispense-event"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-mbh"/>
        <xd:param name="transaction">Which transaction is the context of this translation. Currently known: beschikbaarstellen_medicatiegegevens or beschikbaarstellen_verstrekkingenvertaling </xd:param>
    </xd:doc>
    <xsl:template name="mp9-toedieningsafspraak-from-mp612">
        <xsl:param name="current-dispense-event" select="." as="element()?"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-mbh"/>
        <xsl:param name="transaction" as="xs:string?">beschikbaarstellen_medicatiegegevens</xsl:param>
        <xsl:variable name="xsd-toedieningsafspraak-complexType" select="$xsd-mbh//xs:element[@name = 'toedieningsafspraak']/@type"/>
        <xsl:variable name="xsd-toedieningsafspraak" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningsafspraak-complexType]"/>
        <!-- let's sort the available hl7:medicationAdministrationRequest's in chronological order -->
        <!-- mar = medicationAdministrationRequest  -->
        <xsl:variable name="mar-sorted" as="element(hl7:medicationAdministrationRequest)*">
            <xsl:for-each select="$current-dispense-event/hl7:product/hl7:dispensedMedication/hl7:therapeuticAgentOf/hl7:medicationAdministrationRequest">
                <xsl:sort data-type="number" select="nf:appendDate2DateTime((.//hl7:effectiveTime | .//hl7:comp)[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]/hl7:low/@value)"/>
                <!-- tested this with xsl:sequence, but the later use of for-each to iterate through the variable $mar does not respect the sorted order, 
                  but takes the input order from the input xml -->
                <!-- the xslt2 perform-sort function has the same result (probably for same reason, since it uses sequence as well) -->
                <!-- so we are using copy-of here to preserve order, even though it is known to perform worse -->
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <!--issue MP-371 cannot use $mar-sorted because copy-of causes namespace-uri-from-QName to fail -->
        <!-- variable that contains all IVL_TS in all of the medicationAdministrationRequest's -->
        <xsl:variable name="IVL_TS" as="element()*" select="$current-dispense-event/hl7:product/hl7:dispensedMedication/hl7:therapeuticAgentOf/hl7:medicationAdministrationRequest//(hl7:effectiveTime | hl7:comp)[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>

        <!-- toedieningsafspraak -->
        <xsl:for-each select="$current-dispense-event">
            <toedieningsafspraak>
                <!-- gebruiksperiode-start -->
                <!-- in 6.12 kun je alleen een conclusie trekken over gebruiksperiode-start, als álle MARs een IVL_TS/low/@value hebben -->
                <xsl:if test="not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]/hl7:low/@value)])">
                    <!-- er kunnen er meer dan 1 zijn in 6.12 - neem de laagste low als gebruiksperiode startdatum -->
                    <!-- omdat $mar gesorteerd is, is dat de eerste $IVL_TS -->
                    <xsl:call-template name="mp9-gebruiksperiode-start">
                        <xsl:with-param name="inputValue" select="$IVL_TS[1]/hl7:low/@value"/>


                    </xsl:call-template>
                </xsl:if>
                <!-- gebruiksperiode-start bij eenmalig gebruik-->
                <xsl:variable name="effectiveTimes-eenmalig" select="$mar-sorted/hl7:effectiveTime[not(@xsi:type) or (resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'TS'))]"/>
                <xsl:choose>
                    <xsl:when test="count($effectiveTimes-eenmalig[not(@nullFlavor)]) = 1">
                        <xsl:comment>gebruiksperiode-start bij eenmalig gebruik</xsl:comment>
                        <xsl:call-template name="mp9-gebruiksperiode-start">
                            <xsl:with-param name="inputValue" select="$effectiveTimes-eenmalig/@value"/>


                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="count($effectiveTimes-eenmalig[@nullFlavor]) = 1">
                        <xsl:comment>gebruiksperiode-start nullFlavor</xsl:comment>
                        <xsl:call-template name="mp9-gebruiksperiode-start">
                            <xsl:with-param name="nullFlavor" select="$effectiveTimes-eenmalig/@nullFlavor"/>


                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="count($effectiveTimes-eenmalig) = 0"><!-- do nothing --></xsl:when>
                    <xsl:otherwise>
                        <xsl:comment>Found more then one instruction for eenmalig gebruik. Not supported to convert this into structured information for gebruiksperiode-start</xsl:comment>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- gebruiksperiode-eind -->
                <!-- in 6.12 kun je een conclusie trekken over gebruiksperiode-eind, als álle MARs een IVL_TS/high/@value hebben óf allemaal een start en een width-->
                <!--  zonder startdatum 'zweven' de periodes en kun je geen uitspraak doen over totale gebruiksduur-->
                <!--  zonder width is de gebruiksperiode tot nader order en wordt deze niet opgenomen-->
                <xsl:choose>
                    <!-- alle MARs IVL_TS/high/@value-->
                    <xsl:when test="not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]/hl7:high/@value)])">
                        <!-- er kunnen er meer dan 1 zijn in 6.12 - neem de hoogste high als gebruiksperiode einddatum -->
                        <xsl:variable name="eind-datums" as="element()*">
                            <xsl:for-each select="$IVL_TS/hl7:high[@value]">
                                <xsl:sort data-type="number" select="nf:appendDate2DateTime(./@value)"/>
                                <xsl:sequence select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:call-template name="mp9-gebruiksperiode-eind">
                            <xsl:with-param name="inputValue" select="$eind-datums[last()]/@value"/>


                        </xsl:call-template>
                    </xsl:when>
                    <!-- alle MAR's een low én een width bij meer dan 1 MAR -->
                    <xsl:when test="$current-dispense-event[count(.//hl7:medicationAdministrationRequest) gt 1] and not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]/(hl7:low/@value and hl7:width[@unit = 'd']/@value))])">
                        <!-- alle mar's hebben een low en een width. einddatums uitrekenen -->
                        <xsl:variable name="einddatums" as="element()*">
                            <xsl:for-each select="$IVL_TS">
                                <xsl:variable name="hl7-start-datum" select="hl7:low/@value"/>
                                <!-- width is altijd in dagen in 6.12 -->
                                <xsl:variable name="hl7-width-in-days" select="hl7:width/@value"/>
                                <!-- TODO: als van $hl7-start-datum geen dateTime kan worden gemaakt, valt dit hier om: -->
                                <xsl:variable name="xml-start-datum" as="xs:dateTime" select="xs:dateTime(nf:formatHL72XMLDate(nf:appendDate2DateTime($hl7-start-datum), 'SECOND'))"/>
                                <xsl:variable name="xml-eind-datum" select="xs:dateTime($xml-start-datum + xs:dayTimeDuration(concat('P', $hl7-width-in-days, 'D')))"/>
                                <xml-eind-datum value="{$xml-eind-datum}"/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="einddatums-sorted" as="xs:dateTime*">
                            <xsl:for-each select="$einddatums/@value">
                                <xsl:sort data-type="text" select="."/>
                                <xsl:copy-of select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:call-template name="mp9-gebruiksperiode-eind">
                            <xsl:with-param name="inputValue" select="nf:format2HL7Date(xs:string($einddatums-sorted[last()]), 'seconds')"/>


                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
                <!-- identificatie -->
                <xsl:if test="$transaction = 'beschikbaarstellen_medicatiegegevens'">
                    <!-- identificatie -->
                    <xsl:comment>The toedieningsafspraak/id is converted from the medicationDispenseEvent/id. Same root, extension string preconcatenated.</xsl:comment>
                    <xsl:for-each select="hl7:id[@extension]">
                        <identificatie root="{@root}" value="{concat('TAConverted_', ./@extension)}"/>
                    </xsl:for-each>
                </xsl:if>
                <!-- er is geen afspraakdatum in een 6.12 verstrekkingenbericht -->
                <!-- benaderen met verstrekkingsdatum -->
                <xsl:comment>Afspraakdatum is benaderd met de verstrekkingsdatum (medicationDispenseEvent/effectiveTime)</xsl:comment>
                <!-- afspraakdatum -->
                <xsl:for-each select="hl7:effectiveTime[@value]">
                    <afspraakdatum>
                        <xsl:attribute name="value" select="nf:formatHL72XMLDate(./@value, nf:determine_date_precision(./@value))"/>
                    </afspraakdatum>
                </xsl:for-each>
                <!-- gebruiksperiode -->
                <!-- alleen gebruiksperiode output bij 1 MAR die een width heeft, en bij meerder MAR's berekenen we indien mogelijk de einddatum -->
                <xsl:if test="$current-dispense-event[count(.//hl7:medicationAdministrationRequest) = 1]">
                    <xsl:for-each select="$IVL_TS/hl7:width[@value]">
                        <gebruiksperiode value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                    </xsl:for-each>
                </xsl:if>
                <!-- geannuleerd indicator en stoptype wordt niet ondersteund in 6.12, geen output hiervoor-->
                <!--<geannuleerd_indicator value="UNK"/>
             <stoptype value="1" code="1" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1" displayName="Onderbreking"/>-->
                <!-- verstrekker -->
                <xsl:for-each select="hl7:responsibleParty/hl7:assignedCareProvider/hl7:representedOrganization">
                    <verstrekker>
                        <!-- zorgaanbieder -->
                        <zorgaanbieder>
                            <xsl:call-template name="mp9-zorgaanbieder">
                                <xsl:with-param name="hl7-current-organization" select="."/>
                            </xsl:call-template>
                        </zorgaanbieder>
                    </verstrekker>
                </xsl:for-each>
                <!-- reden afspraak wordt niet ondersteund in 6.12 -->
                <!--         <reden_afspraak value="reden afspraak TA"/>-->
                <!-- geneesmiddel_bij_toedieningsafspraak  -->
                <xsl:for-each select=".//hl7:product/hl7:dispensedMedication/hl7:MedicationKind">
                    <geneesmiddel_bij_toedieningsafspraak>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </geneesmiddel_bij_toedieningsafspraak>
                </xsl:for-each>

                <xsl:call-template name="mp9-gebruiksinstructie-from-mp612-2">
                    <xsl:with-param name="effectiveTimes-eenmalig" select="$effectiveTimes-eenmalig"/>
                    <xsl:with-param name="hl7-current-comp" select="."/>
                    <xsl:with-param name="mar-sorted" select="$mar-sorted"/>
                </xsl:call-template>
                <!-- 6.12 kent geen aanvullende informatie en toelichting in vrije tekst -->
                <!--<aanvullende_informatie value="16" code="16" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.14.2053" displayName="Melding lareb"/>
         <toelichting value="toelichting bij TA"/>-->
                <!-- MP 6.1x heeft wel een relatie naar het voorschrift (medicatieafspraak + verstrekkingsverzoek) maar geen relatie naar de bouwsteen medicatieafspraak. -->
                <!-- 1..1 R in beschikbaarstellen_medicatiegegevens dus een nullFlavor -->
                <xsl:if test="$transaction = 'beschikbaarstellen_medicatiegegevens'">
                    <relatie_naar_medicatieafspraak>
                        <identificatie value="NI" root="{$oidHL7NullFlavor}"/>
                    </relatie_naar_medicatieafspraak>
                </xsl:if>
            </toedieningsafspraak>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle an hl7 dispenseEvent and create an ada toedieningsafspraak element.</xd:desc>
        <xd:param name="current-dispense-event">The input hl7 dispenseEvent, defaults to context.</xd:param>
        <xd:param name="transaction">Which transaction is the context of this translation. Currently known: beschikbaarstellen_medicatiegegevens or beschikbaarstellen_verstrekkingenvertaling </xd:param>
    </xd:doc>
    <xsl:template name="mp9-toedieningsafspraak-from-mp612-907">
        <xsl:param name="current-dispense-event" select="." as="element()?"/>
        <xsl:param name="transaction" select="$transaction-name"/>
        <!-- let's sort the available hl7:medicationAdministrationRequest's in chronological order -->
        <!-- mar = medicationAdministrationRequest  -->
        <xsl:variable name="mar-sorted" as="element(hl7:medicationAdministrationRequest)*">
            <xsl:for-each select="$current-dispense-event/hl7:product/hl7:dispensedMedication/hl7:therapeuticAgentOf/hl7:medicationAdministrationRequest">
                <xsl:sort data-type="number" select="nf:appendDate2DateTime((.//hl7:effectiveTime | .//hl7:comp)[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]/hl7:low/@value)"/>
                <!-- tested this with xsl:sequence, but the later use of for-each to iterate through the variable $mar does not respect the sorted order, 
                  but takes the input order from the input xml -->
                <!-- the xslt2 perform-sort function has the same result (probably for same reason, since it uses sequence as well) -->
                <!-- so we are using copy-of here to preserve order, even though it is known to perform worse -->
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </xsl:variable>


        <!--issue MP-371 cannot use $mar-sorted because copy-of causes namespace-uri-from-QName to fail -->
        <!-- variable that contains all IVL_TS in all of the medicationAdministrationRequest's -->
        <xsl:variable name="IVL_TS" as="element()*" select="$current-dispense-event/hl7:product/hl7:dispensedMedication/hl7:therapeuticAgentOf/hl7:medicationAdministrationRequest//(hl7:effectiveTime | hl7:comp)[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>

        <!-- toedieningsafspraak -->
        <xsl:for-each select="$current-dispense-event">
            <toedieningsafspraak>
                <!-- gebruiksperiode-start -->
                <!-- in 6.12 kun je alleen een conclusie trekken over gebruiksperiode-start, als álle MARs een IVL_TS/low/@value hebben, dus hier checken we of er géén mar is zonder IVL_TS/low -->
                <!-- extra possibility to allow for empty namespace because the copy-of in $mar-sorted has a bug in Saxon 9.9.1.7: namespace is somehow not resolved properly in a copied-of variable -->
                <xsl:if test="not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[replace(xs:string(@xsi:type), '(.*:)?(.+)', '$2') = 'IVL_TS']/hl7:low/@value)])">
                    <!-- okay, alle mar's hebben een IVL_TS, pfieuw -->
                    <!-- er kunnen er meer dan 1 zijn in 6.12 - neem de laagste low als gebruiksperiode startdatum -->
                    <!-- omdat $mar gesorteerd is, is dat de eerste $IVL_TS -->
                    <xsl:call-template name="mp9-gebruiksperiode-start">
                        <xsl:with-param name="inputValue" select="$IVL_TS[1]/hl7:low/@value"/>
                    </xsl:call-template>
                </xsl:if>
                <!-- gebruiksperiode-start bij eenmalig gebruik-->
                <xsl:variable name="effectiveTimes-eenmalig" select="$mar-sorted/hl7:effectiveTime[not(@xsi:type) or resolve-QName(xs:string(@xsi:type), .) = (QName('', 'TS'), QName('urn:hl7-org:v3', 'TS'))]"/>
                <xsl:choose>
                    <xsl:when test="count($effectiveTimes-eenmalig[not(@nullFlavor)]) = 1">
                        <xsl:comment>gebruiksperiode-start bij eenmalig gebruik</xsl:comment>
                        <xsl:call-template name="mp9-gebruiksperiode-start">
                            <xsl:with-param name="inputValue" select="$effectiveTimes-eenmalig/@value"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="count($effectiveTimes-eenmalig[@nullFlavor]) = 1">
                        <xsl:comment>gebruiksperiode-start nullFlavor</xsl:comment>
                        <xsl:call-template name="mp9-gebruiksperiode-start">
                            <xsl:with-param name="nullFlavor" select="$effectiveTimes-eenmalig/@nullFlavor"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="count($effectiveTimes-eenmalig) = 0"><!-- do nothing --></xsl:when>
                    <xsl:otherwise>
                        <xsl:comment>Found more then one instruction for eenmalig gebruik. Not supported to convert this into structured information for gebruiksperiode-start</xsl:comment>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- gebruiksperiode-eind -->
                <!-- in 6.12 kun je een conclusie trekken over gebruiksperiode-eind, als álle MARs een IVL_TS/high/@value hebben óf allemaal een start en een width-->
                <!--  zonder startdatum 'zweven' de periodes en kun je geen uitspraak doen over totale gebruiksduur-->
                <!--  zonder width is de gebruiksperiode tot nader order en wordt er geen gebruiksperiode-eind opgenomen-->
                <xsl:choose>
                    <!-- alle MARs IVL_TS/high/@value-->
                    <xsl:when test="not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[replace(xs:string(@xsi:type), '(.*:)?(.+)', '$2') = 'IVL_TS']/hl7:high/@value)])">
                        <!-- er kunnen er meer dan 1 zijn in 6.12 - neem de hoogste high als gebruiksperiode einddatum -->
                        <xsl:variable name="eind-datums" as="element()*">
                            <xsl:for-each select="$IVL_TS/hl7:high[@value]">
                                <xsl:sort data-type="number" select="nf:appendDate2DateTime(./@value)"/>
                                <xsl:sequence select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:call-template name="mp9-gebruiksperiode-eind">
                            <xsl:with-param name="inputValue" select="$eind-datums[last()]/@value"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- alle MAR's een low én een width bij meer dan 1 MAR -->
                    <xsl:when test="$current-dispense-event[count(.//hl7:medicationAdministrationRequest) gt 1] and not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[replace(xs:string(@xsi:type), '(.*:)?(.+)', '$2') = 'IVL_TS']/(hl7:low/@value and hl7:width[@unit = 'd']/@value))])">
                        <!-- alle mar's hebben een low en een width. einddatums uitrekenen -->
                        <xsl:variable name="einddatums" as="element()*">
                            <xsl:for-each select="$IVL_TS">
                                <xsl:variable name="hl7-start-datum" select="hl7:low/@value"/>
                                <!-- width is altijd in dagen in 6.12 -->
                                <xsl:variable name="hl7-width-in-days" select="hl7:width/@value"/>
                                <!-- TODO: als van $hl7-start-datum geen dateTime kan worden gemaakt, valt dit hier om: -->
                                <xsl:variable name="xml-start-datum" as="xs:dateTime" select="xs:dateTime(nf:formatHL72XMLDate(nf:appendDate2DateTime($hl7-start-datum), 'SECOND'))"/>
                                <xsl:variable name="xml-eind-datum" select="xs:dateTime($xml-start-datum + xs:dayTimeDuration(concat('P', $hl7-width-in-days, 'D')))"/>
                                <xml-eind-datum value="{$xml-eind-datum}"/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="einddatums-sorted" as="xs:dateTime*">
                            <xsl:for-each select="$einddatums/@value">
                                <xsl:sort data-type="text" select="."/>
                                <xsl:copy-of select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:call-template name="mp9-gebruiksperiode-eind">
                            <xsl:with-param name="inputValue" select="nf:format2HL7Date(xs:string($einddatums-sorted[last()]), 'seconds')"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
                <!-- identificatie -->
                <xsl:if test="$transaction = 'beschikbaarstellen_medicatiegegevens'">
                    <!-- identificatie -->
                    <xsl:comment>The toedieningsafspraak/id is converted from the medicationDispenseEvent/id. Same root, extension string preconcatenated.</xsl:comment>
                    <xsl:for-each select="hl7:id[@extension]">
                        <identificatie root="{@root}" value="{concat('TAConverted_', ./@extension)}"/>
                    </xsl:for-each>
                </xsl:if>
                <!-- er is geen afspraakdatum in een 6.12 verstrekkingenbericht -->
                <!-- benaderen met verstrekkingsdatum -->
                <xsl:comment>Afspraakdatum is benaderd met de verstrekkingsdatum (medicationDispenseEvent/effectiveTime)</xsl:comment>
                <!-- afspraakdatum -->
                <xsl:for-each select="hl7:effectiveTime[@value]">
                    <afspraakdatum>
                        <xsl:attribute name="value" select="nf:formatHL72XMLDate(./@value, nf:determine_date_precision(./@value))"/>
                    </afspraakdatum>
                </xsl:for-each>
                <!-- gebruiksperiode -->
                <!-- alleen gebruiksperiode output bij 1 MAR die een width heeft, en bij meerder MAR's berekenen we indien mogelijk de einddatum -->
                <xsl:if test="$current-dispense-event[count(.//hl7:medicationAdministrationRequest) = 1]">
                    <xsl:for-each select="$IVL_TS/hl7:width[@value]">
                        <gebruiksperiode value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                    </xsl:for-each>
                </xsl:if>
                <!-- geannuleerd indicator en stoptype wordt niet ondersteund in 6.12, geen output hiervoor-->
                <!--<geannuleerd_indicator value="UNK"/>
             <stoptype value="1" code="1" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1" displayName="Onderbreking"/>-->
                <!-- verstrekker -->
                <xsl:for-each select="hl7:responsibleParty/hl7:assignedCareProvider/hl7:representedOrganization">
                    <verstrekker>
                        <xsl:call-template name="mp9-zorgaanbieder">
                            <xsl:with-param name="hl7-current-organization" select="."/>
                        </xsl:call-template>
                    </verstrekker>
                </xsl:for-each>
                <!-- reden afspraak wordt niet ondersteund in 6.12 -->
                <!--         <reden_afspraak value="reden afspraak TA"/>-->
                <!-- geneesmiddel_bij_toedieningsafspraak  -->
                <xsl:for-each select=".//hl7:product/hl7:dispensedMedication/hl7:MedicationKind">
                    <geneesmiddel_bij_toedieningsafspraak>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000-907">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </geneesmiddel_bij_toedieningsafspraak>
                </xsl:for-each>

                <xsl:call-template name="mp9-gebruiksinstructie-from-mp612-2">
                    <xsl:with-param name="effectiveTimes-eenmalig" select="$effectiveTimes-eenmalig"/>
                    <xsl:with-param name="hl7-current-comp" select="."/>
                    <xsl:with-param name="mar-sorted" select="$mar-sorted"/>
                </xsl:call-template>
                <!-- 6.12 kent geen aanvullende informatie en toelichting in vrije tekst -->
                <!--<aanvullende_informatie value="16" code="16" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.14.2053" displayName="Melding lareb"/>
         <toelichting value="toelichting bij TA"/>-->
                <!-- MP 6.1x heeft wel een relatie naar het voorschrift (medicatieafspraak + verstrekkingsverzoek) maar geen relatie naar de bouwsteen medicatieafspraak. -->
                <!-- 1..1 R in beschikbaarstellen_medicatiegegevens dus een nullFlavor -->
                <xsl:if test="$transaction = 'beschikbaarstellen_medicatiegegevens'">
                    <relatie_naar_medicatieafspraak>
                        <identificatie value="NI" root="{$oidHL7NullFlavor}"/>
                    </relatie_naar_medicatieafspraak>
                </xsl:if>

            </toedieningsafspraak>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>MP 9 Toedieningssnelheid</xd:desc>
        <xd:param name="hl7-ratequantity">hl7 element containing rate quantity</xd:param>
    </xd:doc>
    <xsl:template name="mp9-toedieningssnelheid">
        <xsl:param name="hl7-ratequantity"/>

        <xsl:for-each select="$hl7-ratequantity">
            <toedieningssnelheid>
                <waarde>
                    <xsl:for-each select="hl7:low">
                        <min value="{@value}"/>
                    </xsl:for-each>
                    <xsl:for-each select="hl7:center">
                        <vaste_waarde value="{@value}"/>
                    </xsl:for-each>
                    <xsl:for-each select="hl7:high">
                        <max value="{@value}"/>
                    </xsl:for-each>
                </waarde>
                <xsl:variable name="ucum-eenheid" select="substring-before((./*/@unit)[1], '/')"/>
                <eenheid>
                    <xsl:call-template name="UCUM2GstdBasiseenheid">
                        <xsl:with-param name="UCUM" select="$ucum-eenheid"/>
                    </xsl:call-template>
                </eenheid>
                <xsl:variable name="ucum-tijdseenheid" select="substring-after((./*/@unit)[1], '/')"/>
                <tijdseenheid unit="{nf:convertTime_UCUM2ADA_unit($ucum-tijdseenheid)}"/>
            </toedieningssnelheid>
        </xsl:for-each>

    </xsl:template>
    <xd:doc>
        <xd:desc>mp9-vaste-frequentie-from-mp-612</xd:desc>
        <xd:param name="current-hl7-pivl">hl7 input frequentie</xd:param>
    </xd:doc>
    <xsl:template name="mp9-vaste-frequentie-from-mp-612">
        <xsl:param name="current-hl7-pivl"/>
        <xsl:comment>mp9-vaste-frequentie-from-mp-612</xsl:comment>
        <xsl:if test="not($current-hl7-pivl)">
            <xsl:comment>geen frequentie in input</xsl:comment>
        </xsl:if>
        <xsl:for-each select="$current-hl7-pivl">
            <xsl:for-each select="hl7:period">
                <xsl:variable name="vaste_frequentie_one_decimal" select="nf:one_decimal(./@value)"/>
                <xsl:variable name="vaste_frequentie_decimal" select="$vaste_frequentie_one_decimal - floor($vaste_frequentie_one_decimal)"/>
                <!-- only output the structured frequentie if the one decimal rounded to 0 -->
                <xsl:choose>
                    <xsl:when test="$vaste_frequentie_decimal = 0">
                        <frequentie>
                            <aantal>
                                <vaste_waarde value="{round($vaste_frequentie_one_decimal)}"/>
                            </aantal>
                            <tijdseenheid value="{nf:tijdseenheid-aantal(./@value)}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                        </frequentie>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="message">The period cannot be properly converted to a frequency integer. Period = <xsl:value-of select="./@value"/>
                            <xsl:value-of select="./@unit"/> resulting in frequency/aantal rounded to one decimal of: <xsl:value-of select="$vaste_frequentie_one_decimal"/>
                        </xsl:variable>
                        <xsl:comment><xsl:value-of select="$message"/></xsl:comment>
                        <xsl:call-template name="util:logMessage">
                            <xsl:with-param name="msg" select="$message"/>
                            <xsl:with-param name="level" select="$logERROR"/>
                            <xsl:with-param name="terminate" select="false()"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="current-hl7-verstrekking"/>
        <xd:param name="transaction">Which transaction is the context of this translation. Currently known: beschikbaarstellen_medicatiegegevens or beschikbaarstellen_verstrekkingenvertaling </xd:param>
    </xd:doc>
    <xsl:template name="mp9-verstrekking-from-mp612">
        <xsl:param name="current-hl7-verstrekking" select="."/>
        <xsl:param name="transaction" select="$transaction-name"/>
        <xsl:for-each select="$current-hl7-verstrekking">
            <verstrekking>
                <!-- identificatie -->
                <xsl:for-each select="hl7:id[@extension]">
                    <identificatie root="{@root}" value="{@extension}"/>
                </xsl:for-each>
                <!-- 6.12 heeft geen echte verstrekkingsdatum -->
                <!-- we need a nullFlavor since this element is required -->
                <datum nullFlavor="NI"/>
                <!-- 6.12 heeft de aanschrijfdatum -->
                <xsl:for-each select="hl7:effectiveTime[@value]">
                    <aanschrijfdatum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./@value), nf:determine_date_precision(./@value))}"/>
                </xsl:for-each>
                <!-- verstrekker -->
                <xsl:for-each select="hl7:responsibleParty/hl7:assignedCareProvider/hl7:representedOrganization">
                    <verstrekker>
                        <xsl:call-template name="mp9-zorgaanbieder">
                            <xsl:with-param name="hl7-current-organization" select="."/>
                        </xsl:call-template>
                    </verstrekker>
                </xsl:for-each>
                <!-- verstrekte_hoeveelheid -->
                <xsl:for-each select="hl7:quantity/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                    <verstrekte_hoeveelheid>
                        <aantal value="{@value}"/>
                        <eenheid>
                            <xsl:call-template name="mp9-code-attribs">
                                <xsl:with-param name="current-hl7-code" select="."/>
                            </xsl:call-template>
                        </eenheid>
                    </verstrekte_hoeveelheid>
                </xsl:for-each>
                <!-- verstrekt_geneesmiddel -->
                <xsl:for-each select=".//hl7:product/hl7:dispensedMedication/hl7:MedicationKind">
                    <verstrekt_geneesmiddel>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000-907">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </verstrekt_geneesmiddel>
                </xsl:for-each>
                <!-- verbruiksduur -->
                <xsl:for-each select="hl7:expectedUseTime/hl7:width">
                    <verbruiksduur value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                </xsl:for-each>
                <!-- afleverlocatie -->
                <xsl:for-each select="hl7:destination/hl7:serviceDeliveryLocation">
                    <xsl:comment>afleverlocatie</xsl:comment>
                    <afleverlocatie value="{normalize-space(.)}"/>
                </xsl:for-each>
                <!-- distributievorm, aanvullende_informatie, toelichting, relatie_naar_verstrekkingsverzoek 
               not in mp 6.12 verstrekking, no output -->
            </verstrekking>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="hl7-phase-low"/>
    </xd:doc>
    <xsl:template name="mp9-weekdag">
        <xsl:param name="hl7-phase-low"/>
        <xsl:variable name="hl7-weekdag" select="substring($hl7-phase-low/@value, 1, 8)"/>
        <xsl:variable name="weekdag-xml-date" select="nf:formatHL72XMLDate($hl7-weekdag, 'DAY')"/>
        <weekdag>
            <xsl:call-template name="mp9-weekdag-attribs">
                <xsl:with-param name="day-of-week" select="nf:day-of-week($weekdag-xml-date)"/>
            </xsl:call-template>
        </weekdag>
    </xsl:template>
    <xd:doc>
        <xd:desc>Creates mp9 datamodel attributes for a particular weekday based on 0 (sunday) to 6 (saturday)</xd:desc>
        <xd:param name="day-of-week">integer 0 - 6</xd:param>
    </xd:doc>
    <xsl:template name="mp9-weekdag-attribs">
        <xsl:param name="day-of-week" as="xs:integer?"/>

        <xsl:for-each select="$weekdayMap[@dayOfWeek = $day-of-week]">
            <xsl:attribute name="code">
                <xsl:value-of select="@code"/>
            </xsl:attribute>
            <xsl:attribute name="displayName">
                <xsl:value-of select="@displayName"/>
            </xsl:attribute>
            <xsl:attribute name="codeSystem">
                <xsl:value-of select="@codeSystem"/>
            </xsl:attribute>
            <xsl:attribute name="codeSystemName">
                <xsl:value-of select="@codeSystemName"/>
            </xsl:attribute>
        </xsl:for-each>

    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="max-dose"/>
        <xd:param name="zonodig-code"/>
    </xd:doc>
    <xsl:template name="mp9-zonodig">
        <xsl:param name="max-dose" as="element()?"/>
        <xsl:param name="zonodig-code" as="element()*"/>
        <xsl:if test="$zonodig-code | $max-dose">
            <zo_nodig>
                <!-- criterium -->
                <!-- in 6.12 kan de zonodig-code meer dan 1 keer voorkomen, in MP-9 mag criterium maar één keer -->
                <xsl:if test="count($zonodig-code) gt 0">
                    <criterium>
                        <code>
                            <xsl:choose>
                                <xsl:when test="count($zonodig-code) eq 1">
                                    <xsl:call-template name="mp9-code-attribs">
                                        <xsl:with-param name="current-hl7-code" select="$zonodig-code"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!-- meer dan één preconditie, we moeten concateneren met een nullFlavor OTH -->
                                    <xsl:attribute name="code">OTH</xsl:attribute>
                                    <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                                    <xsl:attribute name="displayName">overig</xsl:attribute>
                                    <xsl:variable name="concat_originalText">
                                        <xsl:for-each select="$zonodig-code">
                                            <xsl:choose>
                                                <xsl:when test="./@nullFlavor">
                                                    <xsl:variable name="currentNullFlavor" select="./@nullFlavor"/>
                                                    <xsl:variable name="nullFlavorString" select="$hl7NullFlavorMap[@hl7NullFlavor = $currentNullFlavor]/@displayName"/>
                                                    <xsl:value-of select="'nullFlavor: '"/>
                                                    <xsl:choose>
                                                        <xsl:when test="string-length($nullFlavorString) gt 0">
                                                            <xsl:value-of select="$nullFlavorString"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>unsupported nullFlavor: <xsl:value-of select="$currentNullFlavor"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="concat('Code: ', ./@code, ', displayName: ', ./@displayName, '. ')"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:for-each select="hl7:originalText">
                                                <xsl:value-of select="concat(', originalText: ', ., '. ')"/>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:attribute name="originalText" select="normalize-space($concat_originalText)"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </code>
                        <!-- no use case for omschrijving, omschrijving is in code/@originalText -->
                        <!--  <omschrijving value="zo nodig criterium omschrijving in vrije tekst"/>-->
                    </criterium>
                </xsl:if>
                <!-- maximale_dosering  -->
                <xsl:for-each select="$max-dose[.//@value]">
                    <xsl:comment>maximale dosering</xsl:comment>
                    <maximale_dosering>
                        <xsl:for-each select="(./hl7:numerator/hl7:translation[@codeSystem = $oidGStandaardBST902THES2])">
                            <aantal value="{@value}"/>
                            <eenheid>
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </eenheid>
                        </xsl:for-each>
                        <xsl:for-each select="(./hl7:denominator)">
                            <tijdseenheid value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                        </xsl:for-each>
                    </maximale_dosering>
                </xsl:for-each>
            </zo_nodig>
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc>9.0.6 MP zorgaanbieder</xd:desc>
        <xd:param name="hl7-current-organization"/>
    </xd:doc>
    <xsl:template name="mp9-zorgaanbieder">
        <xsl:param name="hl7-current-organization"/>
        <xsl:for-each select="$hl7-current-organization">
            <zorgaanbieder>
                <xsl:for-each select="hl7:id">
                    <zorgaanbieder_identificatie_nummer value="{@extension}" root="{@root}"/>
                </xsl:for-each>
                <!-- organisatienaam has 1..1 R in MP 9 ADA transactions, but is not always present in HL7 input messages.  -->
                <!-- fill with nullFlavor if necessary -->
                <organisatie_naam>
                    <xsl:choose>
                        <xsl:when test="hl7:name">
                            <xsl:attribute name="value" select="hl7:name/text()"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                </organisatie_naam>
                <xsl:call-template name="handleADtoAddressInformation">
                    <xsl:with-param name="in" select="hl7:addr"/>
                    <xsl:with-param name="language" select="$language"/>
                </xsl:call-template>
            </zorgaanbieder>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>9.1.0 MP zorgaanbieder</xd:desc>
        <xd:param name="in">input hl7 organization</xd:param>
        <xd:param name="nestedZorgaanbieder">Parameter to control whether the ada xsd contains a nested zorgaanbieder. Defaults to false.</xd:param>
    </xd:doc>
    <xsl:template name="mp910-zorgaanbieder">
        <xsl:param name="in"/>
        <xsl:param name="nestedZorgaanbieder" as="xs:boolean?" select="false()"/>

        <xsl:for-each select="$in">
            <xsl:variable name="elemName">zorgaanbieder</xsl:variable>
            <xsl:element name="{$elemName}">
                <!-- is er een geneste extra zorgaanbieder groep in ada? -->
                <xsl:choose>
                    <xsl:when test="$nestedZorgaanbieder">
                        <!-- maak een geneste zorgaanbieder groep -->
                        <xsl:element name="{$elemName}">
                            <xsl:call-template name="_zorgaanbieder-contents"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- geen geneste groep -->
                        <xsl:call-template name="_zorgaanbieder-contents"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>

        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>9.0.7 MP zorgaanbieder</xd:desc>
        <xd:param name="in">input hl7 organization</xd:param>
        <xd:param name="nestedZorgaanbieder">Parameter to control whether the ada xsd contains a nested zorgaanbieder. Defaults to false.</xd:param>
    </xd:doc>
    <xsl:template name="mp907-verstrekker">
        <xsl:param name="in"/>
        <xsl:param name="nestedZorgaanbieder" as="xs:boolean?" select="false()"/>

        <xsl:for-each select="$in">
            <xsl:variable name="elemName">zorgaanbieder</xsl:variable>
            <xsl:element name="{$elemName}">
                <!-- is er een geneste extra zorgaanbieder groep in ada? -->
                <xsl:choose>
                    <xsl:when test="$nestedZorgaanbieder">
                        <!-- maak een geneste zorgaanbieder groep -->
                        <xsl:element name="{$elemName}">
                            <xsl:call-template name="_verstrekkerContents907"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- geen geneste groep -->
                        <xsl:call-template name="_verstrekkerContents907"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>9.0.7 MP zorgaanbieder</xd:desc>
        <xd:param name="hl7-current-organization">input hl7 organization</xd:param>
    </xd:doc>
    <xsl:template name="mp907-zorgaanbieder">
        <xsl:param name="hl7-current-organization"/>

        <xsl:for-each select="$hl7-current-organization">
            <zorgaanbieder>
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="elemName">zorgaanbieder_identificatienummer</xsl:with-param>
                </xsl:call-template>
                <!-- organisatienaam has 1..1 R in MP 9 ADA transactions, but is not always present in HL7 input messages.  -->
                <!-- fill with nullFlavor if necessary -->
                <xsl:call-template name="handleST">
                    <xsl:with-param name="in" select="hl7:name"/>
                    <xsl:with-param name="elemName">organisatie_naam</xsl:with-param>
                    <xsl:with-param name="nullIfMissing">NI</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="handleADtoAddressInformation">
                    <xsl:with-param name="in" select="hl7:addr"/>
                    <xsl:with-param name="language">nl-NL</xsl:with-param>
                </xsl:call-template>
            </zorgaanbieder>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medication Kind 6.12 to ADA 9 </xd:desc>
        <xd:param name="product-hl7">Input product ada xml element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000">
        <xsl:param name="product-hl7" select="."/>
        <product>
            <!-- Let op! Er is (nog?) geen ondersteuning voor optionele translations... -->
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="hl7:id"/>
                <xsl:with-param name="elemName">product_code</xsl:with-param>
            </xsl:call-template>
            <xsl:for-each select=".[hl7:code[@nullFlavor]] | .[not(hl7:code)]">
                <product_specificatie>
                    <!-- product_naam -->
                    <xsl:for-each select="hl7:code/hl7:originalText">
                        <product_naam value="{./text()}"/>
                    </xsl:for-each>
                    <!-- omschrijving -->
                    <xsl:for-each select="hl7:desc">
                        <omschrijving value="{./text()}"/>
                    </xsl:for-each>
                    <!-- farmaceutische vorm -->
                    <xsl:for-each select="hl7:formCode">
                        <farmaceutische_vorm>
                            <xsl:call-template name="mp9-code-attribs">
                                <xsl:with-param name="current-hl7-code" select="."/>
                            </xsl:call-template>
                        </farmaceutische_vorm>
                    </xsl:for-each>
                    <!-- ingredient -->
                    <xsl:for-each select="(./hl7:activeIngredient | ./hl7:otherIngredient)">
                        <ingredient>
                            <!-- sterkte -->
                            <xsl:for-each select="hl7:quantity">
                                <sterkte>
                                    <!-- hoeveelheid_ingredient -->
                                    <xsl:for-each select="hl7:numerator[.//@value] | ./hl7:numerator[@nullFlavor]">
                                        <hoeveelheid_ingredient>
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                            </xsl:call-template>
                                        </hoeveelheid_ingredient>
                                    </xsl:for-each>
                                    <!-- hoeveelheid_product  -->
                                    <xsl:for-each select="hl7:denominator[.//@value]">
                                        <hoeveelheid_product>
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                            </xsl:call-template>
                                        </hoeveelheid_product>
                                    </xsl:for-each>
                                </sterkte>
                            </xsl:for-each>
                            <!-- ingredient_code -->
                            <xsl:for-each select="./(hl7:activeIngredientMaterialKind | ./hl7:ingredientMaterialKind)/hl7:code">
                                <ingredient_code>
                                    <xsl:call-template name="mp9-code-attribs">
                                        <xsl:with-param name="current-hl7-code" select="."/>
                                    </xsl:call-template>
                                </ingredient_code>
                            </xsl:for-each>
                        </ingredient>
                    </xsl:for-each>
                </product_specificatie>
            </xsl:for-each>
        </product>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medication Kind 6.12 to ADA 9.0.7 onwards, 9.0.7 adds support for more than one product code</xd:desc>
        <xd:param name="product-hl7">Input product ada xml element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000-907">
        <xsl:param name="product-hl7" select="."/>
        <product>
            <xsl:for-each select="./(hl7:code[@code or @nullFlavor] | hl7:code/hl7:translation[@code or @nullFlavor])">
                <product_code>
                    <xsl:call-template name="mp9-code-attribs">
                        <xsl:with-param name="current-hl7-code" select="."/>
                    </xsl:call-template>
                </product_code>
            </xsl:for-each>
            <xsl:for-each select=".[hl7:code[@nullFlavor]] | .[not(hl7:code)]">
                <product_specificatie>
                    <!-- product_naam -->
                    <xsl:for-each select="hl7:code/hl7:originalText">
                        <product_naam value="{./text()}"/>
                    </xsl:for-each>
                    <!-- omschrijving -->
                    <xsl:for-each select="hl7:desc">
                        <omschrijving value="{./text()}"/>
                    </xsl:for-each>
                    <!-- farmaceutische vorm -->
                    <xsl:for-each select="hl7:formCode">
                        <farmaceutische_vorm>
                            <xsl:call-template name="mp9-code-attribs">
                                <xsl:with-param name="current-hl7-code" select="."/>
                            </xsl:call-template>
                        </farmaceutische_vorm>
                    </xsl:for-each>
                    <!-- ingredient -->
                    <xsl:for-each select="(./hl7:activeIngredient | ./hl7:otherIngredient)">
                        <ingredient>
                            <!-- sterkte -->
                            <xsl:for-each select="hl7:quantity">
                                <sterkte>
                                    <!-- hoeveelheid_ingredient -->
                                    <xsl:for-each select="hl7:numerator[.//@value] | ./hl7:numerator[@nullFlavor]">
                                        <hoeveelheid_ingredient>
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                            </xsl:call-template>
                                        </hoeveelheid_ingredient>
                                    </xsl:for-each>
                                    <!-- hoeveelheid_product  -->
                                    <xsl:for-each select="hl7:denominator[.//@value]">
                                        <hoeveelheid_product>
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                            </xsl:call-template>
                                        </hoeveelheid_product>
                                    </xsl:for-each>
                                </sterkte>
                            </xsl:for-each>
                            <!-- ingredient_code -->
                            <xsl:for-each select="./(hl7:activeIngredientMaterialKind | ./hl7:ingredientMaterialKind)/hl7:code">
                                <ingredient_code>
                                    <xsl:call-template name="mp9-code-attribs">
                                        <xsl:with-param name="current-hl7-code" select="."/>
                                    </xsl:call-template>
                                </ingredient_code>
                            </xsl:for-each>
                        </ingredient>
                    </xsl:for-each>
                </product_specificatie>
            </xsl:for-each>
        </product>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medication Dispense Event 6.12 </xd:desc>
        <xd:param name="current-dispense-event"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-mbh"/>
        <xd:param name="transaction">Which transaction is the context of this translation. Currently known: beschikbaarstellen_medicatiegegevens or beschikbaarstellen_verstrekkingenvertaling </xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.110_20130521000000">
        <xsl:param name="current-dispense-event" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-mbh"/>
        <xsl:param name="transaction" select="$transaction-name"/>
        <medicamenteuze_behandeling>
            <!-- mbh id is not known in 6.12. We make something up for beschikbaarstellen_medicatiegegevens since it is required there -->
            <xsl:if test="$transaction = 'beschikbaarstellen_medicatiegegevens'">
                <xsl:for-each select="$current-dispense-event/hl7:id[@extension]">
                    <xsl:comment>MBH id generated from 6.12 dispense identifier</xsl:comment>
                    <identificatie value="{concat('MedBehConverted_', ./@extension)}" root="{@root}"/>
                </xsl:for-each>
            </xsl:if>
            <xsl:call-template name="mp9-toedieningsafspraak-from-mp612">
                <xsl:with-param name="current-dispense-event" select="$current-dispense-event"/>
                <xsl:with-param name="transaction" select="$transaction"/>
            </xsl:call-template>
            <xsl:call-template name="mp9-verstrekking-from-mp612">
                <xsl:with-param name="current-hl7-verstrekking" select="."/>
                <xsl:with-param name="transaction" select="$transaction"/>
            </xsl:call-template>
        </medicamenteuze_behandeling>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medication Dispense Event 6.12 </xd:desc>
        <xd:param name="current-dispense-event"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-mbh"/>
        <xd:param name="transaction">Which transaction is the context of this translation. Currently known: beschikbaarstellen_medicatiegegevens or beschikbaarstellen_verstrekkingenvertaling </xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.110_20130521000000_2_907">
        <xsl:param name="current-dispense-event" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-mbh"/>
        <xsl:param name="transaction" select="$transaction-name"/>
        <medicamenteuze_behandeling>
            <!-- mbh id is not known in 6.12. But we still need it to relate TA and MVE, we fill it with dispense id -->
            <xsl:for-each select="$current-dispense-event/hl7:id[@extension]">
                <xsl:comment>MBH id copied from 6.12 dispense identifier</xsl:comment>
                <identificatie value="{@extension}" root="{@root}"/>
            </xsl:for-each>
            <xsl:call-template name="mp9-toedieningsafspraak-from-mp612-907">
                <xsl:with-param name="current-dispense-event" select="$current-dispense-event"/>
                <xsl:with-param name="transaction" select="$transaction"/>
            </xsl:call-template>
            <xsl:call-template name="mp9-verstrekking-from-mp612">
                <xsl:with-param name="current-hl7-verstrekking" select="."/>
                <xsl:with-param name="transaction" select="$transaction"/>
            </xsl:call-template>
        </medicamenteuze_behandeling>
    </xsl:template>


    <xd:doc>
        <xd:desc> PatientNL in verstrekking 6.12 </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.816_20130521000000">
        <xsl:variable name="current-patient" select="."/>
        <patient>
            <!-- gestructureerde naam in subelementen -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:name[*]">
                <xsl:call-template name="mp9-naamgegevens">
                    <xsl:with-param name="current-hl7-name" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <!-- ongestructureerde_naam -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:name[not(*)]">
                <naamgegevens>
                    <ongestructureerde_naam value="{.}"/>
                </naamgegevens>
            </xsl:for-each>
            <!-- patient_identificatienummer -->
            <xsl:for-each select="$current-patient/hl7:id">
                <patient_identificatienummer>
                    <xsl:attribute name="root" select="./@root"/>
                    <xsl:attribute name="value" select="./@extension"/>
                </patient_identificatienummer>
            </xsl:for-each>
            <!-- geboortedatum -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:birthTime[@value]">
                <geboortedatum>
                    <xsl:variable name="precision" select="nf:determine_date_precision(./@value)"/>
                    <xsl:attribute name="value" select="nf:formatHL72XMLDate(./@value, $precision)"/>
                </geboortedatum>
            </xsl:for-each>
            <!-- geslacht -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:administrativeGenderCode">
                <xsl:call-template name="mp9-geslacht">
                    <xsl:with-param name="current-administrativeGenderCode" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <!-- meerlingindicator -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:multipleBirthInd[@value]">
                <meerling_indicator>
                    <xsl:attribute name="value" select="./@value"/>
                </meerling_indicator>
            </xsl:for-each>
        </patient>
    </xsl:template>

    <xd:doc>
        <xd:desc> PatientNL in verstrekking 6.12 </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.816_20130521000000_2_907">
        <xsl:variable name="current-patient" select="."/>
        <patient>
            <!-- gestructureerde naam in subelementen -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:name[*]">
                <xsl:call-template name="mp9-naamgegevens">
                    <xsl:with-param name="current-hl7-name" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <!-- ongestructureerde_naam -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:name[not(*)]">
                <naamgegevens>
                    <ongestructureerde_naam value="{.}"/>
                </naamgegevens>
            </xsl:for-each>
            <!-- patient_identificatienummer -->
            <xsl:for-each select="$current-patient/hl7:id">
                <identificatienummer>
                    <xsl:attribute name="root" select="./@root"/>
                    <xsl:attribute name="value" select="./@extension"/>
                </identificatienummer>
            </xsl:for-each>
            <!-- geboortedatum -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:birthTime[@value]">
                <geboortedatum>
                    <xsl:variable name="precision" select="nf:determine_date_precision(./@value)"/>
                    <xsl:attribute name="value" select="nf:formatHL72XMLDate(./@value, $precision)"/>
                </geboortedatum>
            </xsl:for-each>
            <!-- geslacht -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:administrativeGenderCode">
                <xsl:call-template name="mp9-geslacht">
                    <xsl:with-param name="current-administrativeGenderCode" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <!-- meerlingindicator -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:multipleBirthInd[@value]">
                <meerling_indicator>
                    <xsl:attribute name="value" select="./@value"/>
                </meerling_indicator>
            </xsl:for-each>
        </patient>
    </xsl:template>


    <xd:doc>
        <xd:desc> Frequency </xd:desc>
        <xd:param name="PIVL_TS"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9020_20150305134139_toedieningsschema">
        <xsl:param name="PIVL_TS"/>
        <!-- we are converting to toedieningsschema, cyclisch schema should be ignored here: phase/width -->
        <!-- we will deal with 'vaste toedieningstijd' later, let's also include those here: phase/center -->
        <xsl:for-each select="$PIVL_TS[not(hl7:phase/hl7:width)][not(hl7:phase/hl7:center)]">
            <xsl:for-each select="hl7:period">
                <xsl:variable name="vaste_frequentie_one_decimal">
                    <xsl:choose>
                        <xsl:when test="./@value &lt; 1">
                            <xsl:value-of select="format-number(1 div ./@value, '#.0')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="xs:float(1.0)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="tijdseenheid">
                    <xsl:choose>
                        <xsl:when test="./@value &lt; 1">
                            <xsl:value-of select="xs:integer(1)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="./@value"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="vaste_frequentie_decimal" select="$vaste_frequentie_one_decimal - floor($vaste_frequentie_one_decimal)"/>
                <!-- only output the structured frequentie if the one decimal rounded to 0 -->
                <xsl:choose>
                    <xsl:when test="$vaste_frequentie_decimal = 0">
                        <frequentie>
                            <aantal>
                                <vaste_waarde value="{round($vaste_frequentie_one_decimal)}"/>
                            </aantal>
                            <tijdseenheid value="{$tijdseenheid}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                        </frequentie>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="util:logMessage">
                            <xsl:with-param name="level" select="$logERROR"/>
                            <xsl:with-param name="terminate" select="false()"/>
                            <xsl:with-param name="msg">The period cannot be properly converted to a frequency integer. Period = <xsl:value-of select="./@value"/>
                                <xsl:value-of select="./@unit"/> resulting in frequency/aantal rounded to one decimal of: <xsl:value-of select="$vaste_frequentie_one_decimal"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <!-- interval is not supported in MP 6.12 - no output -->
        </xsl:for-each>
        <xsl:for-each select="$PIVL_TS[hl7:phase/hl7:center]">
            <!-- only output frequentie if the hl7:period is more than one day ánd an integer -->
            <!-- once a day is implicit in toedieningstijd: take at noon daily, only need to add frequence when it is take at noon every other day... -->
            <!-- a time with an interval of more then once a day does not make sense -->
            <!-- not does a specific with an interval of a partial day (i.e. take at noon every 1,5 day does not make sense) -->
            <xsl:choose>
                <xsl:when test="hl7:period[@value = '1'][@unit = 'd']"><!-- Do nothing, no need to output frequency of once a day --></xsl:when>
                <xsl:when test="hl7:period[not(@unit = 'd')]">
                    <xsl:variable name="message">Found a schedule with a specific time and an interval unequal to 'd' (<xsl:value-of select="string-join(hl7:period[not(@unit = 'd')]/@unit, ' ')"/>). This is not allowed.</xsl:variable>
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="msg" select="$message"/>
                        <xsl:with-param name="level" select="$logERROR"/>
                        <xsl:with-param name="terminate" select="false()"/>
                    </xsl:call-template>
                    <xsl:comment><xsl:value-of select="$message"/></xsl:comment>
                </xsl:when>
                <xsl:when test="hl7:period[@value castable as xs:integer and @value &gt; 1]">
                    <!-- let's output the frequency -->
                    <frequentie>
                        <aantal>
                            <vaste_waarde value="1"/>
                        </aantal>
                        <tijdseenheid value="{hl7:period/@value}" unit="{nf:convertTime_UCUM2ADA_unit(hl7:period/@unit)}"/>
                    </frequentie>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="level" select="$logERROR"/>
                        <xsl:with-param name="terminate" select="false()"/>
                        <xsl:with-param name="msg">Unexpected error with contents of period in toedieningsschema for toedieningstijd</xsl:with-param>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
            <!-- toedientijd -->
            <xsl:choose>
                <xsl:when test="hl7:period[@value castable as xs:integer and @value &gt;= 1][@unit = 'd']">
                    <!-- output the toedieningstijd -->
                    <xsl:variable name="elemName">toedientijd</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="hl7nl:phase/hl7:center"/>
                        <xsl:with-param name="elemName" select="$elemName"/>

                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:comment><!-- Do nothing --></xsl:comment>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <!-- weekdag is not supported in MP 6.12 - no input, so no output -->
        <!-- dagdeel is not supported in MP 6.12 - no input, so no output -->
    </xsl:template>

    <xd:doc>
        <xd:desc> MP 9.0.6 CDA Author Participation, also still used in some parts of dataset in 9.0.7</xd:desc>
        <xd:param name="author-hl7">The HL7 author</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
        <xsl:param name="author-hl7" select="."/>

        <xsl:for-each select="$author-hl7/hl7:assignedAuthor">
            <zorgverlener>
                <xsl:for-each select="hl7:id">
                    <zorgverlener_identificatie_nummer value="{@extension}" root="{@root}"/>
                </xsl:for-each>
                <xsl:for-each select="hl7:assignedPerson/hl7:name">
                    <zorgverlener_naam>
                        <xsl:call-template name="handleENtoNameInformation">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="language">nl-NL</xsl:with-param>
                            <xsl:with-param name="unstructurednameElement">ongestructureerde_naam</xsl:with-param>
                        </xsl:call-template>
                    </zorgverlener_naam>
                </xsl:for-each>
                <!-- specialisme -->
                <xsl:for-each select="hl7:code">
                    <specialisme>
                        <xsl:call-template name="mp9-code-attribs">
                            <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                    </specialisme>
                </xsl:for-each>
                <xsl:for-each select="hl7:representedOrganization">
                    <zorgaanbieder>
                        <xsl:call-template name="mp9-zorgaanbieder">
                            <xsl:with-param name="hl7-current-organization" select="."/>
                        </xsl:call-template>
                    </zorgaanbieder>
                </xsl:for-each>
            </zorgverlener>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP 9.1.0 CDA Author Participation </xd:desc>
        <xd:param name="in">input hl7 author</xd:param>
        <xd:param name="nestedZorgaanbieder">Parameter to control whether the ada xsd contains a nested zorgaanbieder. Defaults to false.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210">
        <xsl:param name="in" select="."/>
        <xsl:param name="nestedZorgaanbieder" as="xs:boolean?" select="false()"/>

        <xsl:for-each select="$in/hl7:assignedAuthor">
            <xsl:variable name="elemName">zorgverlener</xsl:variable>
            <zorgverlener>
                <xsl:for-each select="hl7:id">
                    <xsl:variable name="elemName">zorgverlener_identificatienummer</xsl:variable>
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="hl7:assignedPerson/hl7:name">
                    <xsl:variable name="elemName">naamgegevens</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:variable name="elemName">naamgegevens</xsl:variable>
                        <!-- naamgegevens -->
                        <xsl:call-template name="handleENtoNameInformation">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="language" select="$language"/>
                            <!-- naamgebruik is not part of the MP transactions for voorschrijver -->
                            <xsl:with-param name="outputNaamgebruik" select="false()"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
                <!-- specialisme -->
                <xsl:for-each select="hl7:code">
                    <xsl:variable name="elemName">specialisme</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="hl7:representedOrganization">
                    <xsl:call-template name="mp910-zorgaanbieder">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="nestedZorgaanbieder" select="$nestedZorgaanbieder"/>
                    </xsl:call-template>
                </xsl:for-each>
            </zorgverlener>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP 9.0.7 CDA Author Participation </xd:desc>
        <xd:param name="author-hl7"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-auteur"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337_2">
        <xsl:param name="author-hl7" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-auteur"/>

        <xsl:for-each select="$author-hl7/hl7:assignedAuthor">
            <zorgverlener>
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="elemName">zorgverlener_identificatienummer</xsl:with-param>
                </xsl:call-template>

                <xsl:if test="./hl7:assignedPerson/hl7:name">
                    <naamgegevens>
                        <xsl:call-template name="handleENtoNameInformation">
                            <xsl:with-param name="in" select="hl7:assignedPerson/hl7:name"/>
                            <xsl:with-param name="language">nl-NL</xsl:with-param>
                            <xsl:with-param name="unstructurednameElement">ongestructureerde_naam</xsl:with-param>
                        </xsl:call-template>
                    </naamgegevens>
                </xsl:if>
                <!-- specialisme -->
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:code"/>
                    <xsl:with-param name="elemName">specialisme</xsl:with-param>
                </xsl:call-template>
                <xsl:for-each select="hl7:representedOrganization">
                    <xsl:call-template name="mp907-zorgaanbieder">
                        <xsl:with-param name="hl7-current-organization" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
            </zorgverlener>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc> MP 9 MP CDA Medication Information </xd:desc>
        <xd:param name="product-hl7">The hl7 xml element which contains the medication product. Defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
        <xsl:param name="product-hl7" select="."/>
        <!-- product -->
        <xsl:variable name="ada-elemName">product</xsl:variable>
        <xsl:element name="{$ada-elemName}">
            <!-- product_code -->
            <xsl:variable name="ada-elemName">product_code</xsl:variable>
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="hl7:code | hl7:code/hl7:translation"/>
                <xsl:with-param name="elemName" select="$ada-elemName"/>
            </xsl:call-template>
            <!-- product_specificatie -->
            <xsl:if test="not(hl7:code) or hl7:code/following-sibling::*">
                <xsl:variable name="ada-elemName">product_specificatie</xsl:variable>
                <xsl:element name="{$ada-elemName}">
                    <!-- product_naam -->
                    <xsl:variable name="ada-elemName">product_naam</xsl:variable>
                    <xsl:call-template name="handleST">
                        <xsl:with-param name="in" select="hl7:name"/>
                        <xsl:with-param name="elemName" select="$ada-elemName"/>
                    </xsl:call-template>
                    <!-- omschrijving -->
                    <xsl:variable name="ada-elemName">omschrijving</xsl:variable>
                    <xsl:call-template name="handleST">
                        <xsl:with-param name="in" select="pharm:desc"/>
                        <xsl:with-param name="elemName" select="$ada-elemName"/>
                    </xsl:call-template>
                    <!-- farmaceutische vorm -->
                    <xsl:variable name="ada-elemName">farmaceutische_vorm</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="pharm:formCode"/>
                        <xsl:with-param name="elemName" select="$ada-elemName"/>
                    </xsl:call-template>
                    <!-- ingredient -->
                    <xsl:for-each select="./pharm:ingredient">
                        <xsl:variable name="ada-elemName">ingredient</xsl:variable>
                        <xsl:element name="{$ada-elemName}">
                            <!-- sterkte -->
                            <xsl:for-each select="./pharm:quantity">
                                <xsl:variable name="ada-elemName">sterkte</xsl:variable>
                                <xsl:element name="{$ada-elemName}">
                                    <!-- hoeveelheid_ingredient -->
                                    <xsl:for-each select="hl7:numerator[.//@value | @nullFlavor]">
                                        <xsl:variable name="ada-elemName">hoeveelheid_ingredient</xsl:variable>
                                        <xsl:element name="{$ada-elemName}">
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                            </xsl:call-template>
                                        </xsl:element>
                                    </xsl:for-each>
                                    <!-- hoeveelheid_product  -->
                                    <xsl:for-each select="hl7:denominator[.//@value]">
                                        <hoeveelheid_product>
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                            </xsl:call-template>
                                        </hoeveelheid_product>
                                    </xsl:for-each>
                                </xsl:element>
                            </xsl:for-each>
                            <!-- ingredient_code -->
                            <xsl:for-each select="pharm:ingredient/pharm:code">
                                <xsl:call-template name="handleCV">
                                    <xsl:with-param name="in" select=". | ./hl7:translation"/>
                                    <xsl:with-param name="elemName" select="'ingredient_code'"/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:if>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.0.6 </xd:desc>
        <xd:param name="ma_hl7_905"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9148_20160725130413">
        <xsl:param name="ma_hl7_905" select="."/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9201_20180419121646">
            <xsl:with-param name="ma_hl7_90" select="$ma_hl7_905"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template 9155 only phase low</xd:desc>
        <xd:param name="current_PIVL">The HL7 PIVL element which should be processed.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123_only_phase_low">
        <xsl:param name="current_PIVL" select="."/>
        <xsl:for-each select="$current_PIVL/hl7nl:phase/hl7nl:low">
            <!-- toedientijd indien van toepassing -->
            <xsl:if test="string-length(./@value) > 8">
                <!-- output the toedieningstijd -->
                <xsl:variable name="elemName">toedientijd</xsl:variable>
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="elemName" select="$elemName"/>
                    <xsl:with-param name="vagueDate" select="true()"/>
                </xsl:call-template>
            </xsl:if>
            <!-- is_flexibel -->
            <is_flexibel>
                <xsl:copy-of select="nf:getIsFlexible(../..)"/>
            </is_flexibel>
            <xsl:call-template name="mp9-weekdag">
                <xsl:with-param name="hl7-phase-low" select="."/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc> Make ada frequentie from HL7 PIVL TS </xd:desc>
        <xd:param name="in">The hl7 PIVL_TS xml element which contains the contents to be converted. Defaults to context. </xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <!-- frequentie -->
            <frequentie>
                <xsl:for-each select="hl7nl:frequency/hl7nl:numerator">
                    <aantal>
                        <xsl:for-each select=".//hl7nl:low[@value]">
                            <min value="{@value}"/>
                        </xsl:for-each>
                        <xsl:if test=".[@value]">
                            <vaste_waarde value="{@value}"/>
                        </xsl:if>
                        <xsl:for-each select=".//hl7nl:high[@value]">
                            <max value="{@value}"/>
                        </xsl:for-each>
                    </aantal>
                </xsl:for-each>
                <xsl:for-each select="hl7nl:frequency/hl7nl:denominator">
                    <tijdseenheid value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                </xsl:for-each>
            </frequentie>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP 9.0.8 CDA Author Participation </xd:desc>
        <xd:param name="in">input hl7 author</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <xsl:variable name="elemName">zorgverlener</xsl:variable>
            <xsl:element name="{$elemName}">

                <xsl:for-each select="hl7:id">
                    <xsl:variable name="elemName">zorgverlener_identificatienummer</xsl:variable>
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="hl7:assignedPerson/hl7:name">
                    <xsl:variable name="elemName">naamgegevens</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:variable name="elemName">naamgegevens</xsl:variable>

                        <!-- naamgegevens -->
                        <xsl:call-template name="handleENtoNameInformation">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="language" select="$language"/>
                            <!-- naamgebruik is not part of the MP transactions for voorschrijver -->
                            <xsl:with-param name="outputNaamgebruik" select="false()"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
                <!-- specialisme -->
                <xsl:for-each select="hl7:code">
                    <xsl:variable name="elemName">specialisme</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- adresgegevens -->
                <!-- address information -->
                <xsl:for-each select="hl7:addr">
                    <xsl:variable name="elemName">adresgegevens</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="handleADtoAddressInformation">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="language" select="$language"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
                <xsl:for-each select="hl7:representedOrganization">
                    <xsl:variable name="elemName">zorgaanbieder</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="mp910-zorgaanbieder">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.0.6 Inhoud</xd:desc>
        <xd:param name="ma_hl7_90"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9201_20180419121646">
        <xsl:param name="ma_hl7_90" select="."/>
        <xsl:for-each select="$ma_hl7_90">
            <medicatieafspraak>
                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>
                <xsl:for-each select="$IVL_TS/hl7:low[@value]">
                    <xsl:call-template name="mp9-gebruiksperiode-start">
                        <xsl:with-param name="inputValue" select="./@value"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$IVL_TS/hl7:high[@value]">
                    <xsl:call-template name="mp9-gebruiksperiode-eind">
                        <xsl:with-param name="inputValue" select="./@value"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="hl7:id">
                    <identificatie value="{@extension}" root="{@root}"/>
                </xsl:for-each>
                <xsl:for-each select="hl7:author/hl7:time">
                    <afspraakdatum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./@value), nf:determine_date_precision(./@value))}"/>
                </xsl:for-each>
                <xsl:for-each select="$IVL_TS/hl7:width">
                    <gebruiksperiode value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}"/>
                </xsl:for-each>
                <xsl:for-each select="hl7:statusCode">
                    <geannuleerd_indicator value="{@code='nullified'}"/>
                </xsl:for-each>
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-stoptype]/hl7:value">
                    <stoptype>
                        <xsl:call-template name="mp9-code-attribs">
                            <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                    </stoptype>
                </xsl:for-each>
                <!-- relatie_naar_afspraak_of_gebruik -->
                <!-- relatie_naar ma -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9086']/hl7:id">
                    <!-- medicatieafspraak -->
                    <relatie_naar_afspraak_of_gebruik>
                        <identificatie root="{@root}" value="{@extension}"/>
                    </relatie_naar_afspraak_of_gebruik>
                </xsl:for-each>
                <!-- relatie_naar ta -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9101']/hl7:id">
                    <!-- toedieningsafspraak -->
                    <relatie_naar_afspraak_of_gebruik>
                        <identificatie_23288 root="{@root}" value="{@extension}"/>
                    </relatie_naar_afspraak_of_gebruik>
                </xsl:for-each>
                <!-- relatie_naar gb -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9176']/hl7:id">
                    <!-- medicatiegebruik -->
                    <relatie_naar_afspraak_of_gebruik>
                        <identificatie_23289 root="{@root}" value="{@extension}"/>
                    </relatie_naar_afspraak_of_gebruik>
                </xsl:for-each>
                <!-- voorschrijver -->
                <voorschrijver>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                        <xsl:with-param name="author-hl7" select="hl7:author"/>
                    </xsl:call-template>
                </voorschrijver>
                <!-- reden afspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9068']/hl7:value">
                    <reden_afspraak>
                        <xsl:call-template name="mp9-code-attribs">
                            <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                    </reden_afspraak>
                </xsl:for-each>
                <!-- reden van voorschrijven -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-redenVanVoorschrijven]/hl7:value">
                    <reden_van_voorschrijven>
                        <probleem>
                            <probleem_naam>
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </probleem_naam>
                        </probleem>
                    </reden_van_voorschrijven>
                </xsl:for-each>
                <!-- afgesproken_geneesmiddel -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <afgesproken_geneesmiddel>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </afgesproken_geneesmiddel>
                </xsl:for-each>
                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp9-gebruiksinstructie-from-mp9">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
                <!-- lichaamslengte  -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9122']/hl7:value">
                    <lichaamslengte>
                        <lengte_waarde value="{@value}" unit="{nf:convertUnit_UCUM2ADA(./@unit)}"/>
                    </lichaamslengte>
                </xsl:for-each>
                <!-- lichaamsgewicht  -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9123']/hl7:value">
                    <lichaamsgewicht>
                        <gewicht_waarde value="{@value}" unit="{nf:convertUnit_UCUM2ADA(./@unit)}"/>
                    </lichaamsgewicht>
                </xsl:for-each>
                <!-- aanvullende_informatie -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9177']/hl7:value">
                    <aanvullende_informatie>
                        <xsl:call-template name="mp9-code-attribs">
                            <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                    </aanvullende_informatie>
                </xsl:for-each>
                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9069']/hl7:text">
                    <toelichting value="{text()}"/>
                </xsl:for-each>
            </medicatieafspraak>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.1.0 Inhoud</xd:desc>
        <xd:param name="in">input hl7 Medicatieafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9276_20191121115616" match="hl7:substanceAdministration" mode="HandleMAContents910">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <xsl:variable name="elemName">medicatieafspraak</xsl:variable>
            <xsl:element name="{$elemName}">

                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>

                <!-- gebruiksperiode_start -->
                <xsl:for-each select="$IVL_TS/hl7:low[@value]">
                    <xsl:variable name="elemName">gebruiksperiode_start</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>

                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiksperiode_eind -->
                <xsl:for-each select="$IVL_TS/hl7:high[@value]">
                    <xsl:variable name="elemName">gebruiksperiode_eind</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>

                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <xsl:variable name="elemName">identificatie</xsl:variable>
                    <xsl:call-template name="handleII">

                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- afspraak_datum_tijd -->
                <xsl:for-each select="hl7:author/hl7:time[@value | @nullFlavor]">
                    <xsl:variable name="elemName">afspraak_datum_tijd</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiksperiode -->
                <xsl:for-each select="$IVL_TS/hl7:width">
                    <xsl:call-template name="mp9-duration">
                        <xsl:with-param name="elemName">gebruiksperiode</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- stoptype -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-stoptype]/hl7:value[@code | @nullFlavor]">
                    <xsl:variable name="elemName">stoptype</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- relatie_naar_afspraak_of_gebruik -->
                <!-- relatie_naar ma -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9086']/hl7:id[@extension | @root | @nullFlavor]">
                    <xsl:variable name="elemName">relatie_naar_afspraak_of_gebruik</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:variable name="elemName">identificatie</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName" select="$elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- relatie_naar ta -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9101']/hl7:id[@extension | @root | @nullFlavor]">
                    <xsl:variable name="elemName">relatie_naar_afspraak_of_gebruik</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:variable name="elemName">identificatie_23288</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName" select="$elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- relatie_naar gb -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9176']/hl7:id[@extension | @root | @nullFlavor]">
                    <xsl:variable name="elemName">relatie_naar_afspraak_of_gebruik</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:variable name="elemName">identificatie_23289</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName" select="$elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- voorschrijver -->
                <xsl:for-each select="hl7:author">
                    <xsl:variable name="elemName">voorschrijver</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- reden_wijzigen_of_staken -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[@code = '2'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value">
                    <xsl:variable name="elemName">reden_wijzigen_of_staken</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- reden van voorschrijven -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-redenVanVoorschrijven]/hl7:value">
                    <reden_van_voorschrijven>
                        <probleem>
                            <probleem_naam>
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </probleem_naam>
                        </probleem>
                    </reden_van_voorschrijven>
                </xsl:for-each>

                <!-- afgesproken_geneesmiddel -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <xsl:variable name="elemName">afgesproken_geneesmiddel</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp9-gebruiksinstructie-from-mp910">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>

                <!-- aanvullende_informatie -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9177']/hl7:value">
                    <aanvullende_informatie>
                        <xsl:call-template name="mp9-code-attribs">
                            <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                    </aanvullende_informatie>
                </xsl:for-each>

                <!-- kopie_indicator -->
                <xsl:variable name="elemName">kopie_indicator</xsl:variable>
                <xsl:call-template name="handleBL">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$elemName"/>

                </xsl:call-template>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <xsl:variable name="elemName">toelichting</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value" select="text()"/>

                    </xsl:element>
                </xsl:for-each>

            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Voorstel Medicatieafspraak MP 9.1.0 Inhoud</xd:desc>
        <xd:param name="in">input hl7 Voorstel Medicatieafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9153_20160726162345" match="hl7:substanceAdministration" mode="HandleProposedMAContents910">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <xsl:variable name="elemName">medicatieafspraak</xsl:variable>
            <xsl:element name="{$elemName}">
                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>

                <!-- gebruiksperiode_start -->
                <xsl:for-each select="$IVL_TS/hl7:low[@value]">
                    <xsl:variable name="elemName">gebruiksperiode_start</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>

                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiksperiode_eind -->
                <xsl:for-each select="$IVL_TS/hl7:high[@value]">
                    <xsl:variable name="elemName">gebruiksperiode_eind</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>

                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiksperiode -->
                <xsl:for-each select="$IVL_TS/hl7:width">
                    <xsl:call-template name="mp9-duration">
                        <xsl:with-param name="elemName">gebruiksperiode</xsl:with-param>


                    </xsl:call-template>
                </xsl:for-each>

                <!-- stoptype -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-stoptype or hl7:code[@code = '274512008'][@codeSystem = $oidSNOMEDCT]]/hl7:value[@code | @nullFlavor]">
                    <xsl:variable name="elemName">stoptype</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>

                    </xsl:call-template>
                </xsl:for-each>

                <!-- relatie_naar_afspraak_of_gebruik -->
                <!-- relatie_naar ma -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9086']/hl7:id[@extension | @root | @nullFlavor]">
                    <xsl:variable name="elemName">relatie_naar_afspraak_of_gebruik</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <xsl:variable name="elemName">identificatie</xsl:variable>
                        <xsl:call-template name="handleII">

                            <xsl:with-param name="elemName" select="$elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- relatie_naar ta -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9101']/hl7:id[@extension | @root | @nullFlavor]">
                    <xsl:variable name="elemName">relatie_naar_afspraak_of_gebruik</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <xsl:variable name="elemName">identificatie_23288</xsl:variable>
                        <xsl:call-template name="handleII">

                            <xsl:with-param name="elemName" select="$elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- relatie_naar gb -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9176']/hl7:id[@extension | @root | @nullFlavor]">
                    <xsl:variable name="elemName">relatie_naar_afspraak_of_gebruik</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <xsl:variable name="elemName">identificatie_23289</xsl:variable>
                        <xsl:call-template name="handleII">

                            <xsl:with-param name="elemName" select="$elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- reden_wijzigen_of_staken -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[(@code = '2' and @codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2') or (@code = '112241000146101' and @codeSystem = $oidSNOMEDCT)]]/hl7:value">
                    <xsl:variable name="elemName">reden_wijzigen_of_staken</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>

                    </xsl:call-template>
                </xsl:for-each>

                <!-- reden van voorschrijven -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-redenVanVoorschrijven]/hl7:value">
                    <reden_van_voorschrijven>
                        <probleem>
                            <probleem_naam>
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </probleem_naam>
                        </probleem>
                    </reden_van_voorschrijven>
                </xsl:for-each>

                <!-- afgesproken_geneesmiddel -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <xsl:variable name="elemName">afgesproken_geneesmiddel</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp9-gebruiksinstructie-from-mp910">
                    <xsl:with-param name="in" select="."/>


                </xsl:call-template>

                <!-- aanvullende_informatie -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9177']/hl7:value">
                    <aanvullende_informatie>
                        <xsl:call-template name="mp9-code-attribs">
                            <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                    </aanvullende_informatie>
                </xsl:for-each>

                <!-- kopie_indicator -->
                <xsl:variable name="elemName">kopie_indicator</xsl:variable>
                <xsl:call-template name="handleBL">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$elemName"/>

                </xsl:call-template>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <xsl:variable name="elemName">toelichting</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value" select="text()"/>

                    </xsl:element>
                </xsl:for-each>

            </xsl:element>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc> Medicatiegebruik MP 9.1.0 Inhoud</xd:desc>
        <xd:param name="in">input hl7 Medicatiegebruik</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9279_20191121141551" match="hl7:substanceAdministration" mode="HandleMGBContents910">
        <xsl:param name="in" select="."/>
        <!-- medicatie_gebruik -->
        <xsl:for-each select="$in">
            <xsl:variable name="elemName">medicatie_gebruik</xsl:variable>
            <xsl:element name="{$elemName}">

                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>

                <!-- gebruiksperiode_start -->
                <xsl:for-each select="$IVL_TS/hl7:low[@value]">
                    <xsl:variable name="elemName">gebruiksperiode_start</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>

                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiksperiode_eind -->
                <xsl:for-each select="$IVL_TS/hl7:high[@value]">
                    <xsl:variable name="elemName">gebruiksperiode_eind</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>

                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <xsl:variable name="elemName">identificatie</xsl:variable>
                    <xsl:call-template name="handleII">

                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- registratie_datum_tijd -->
                <xsl:for-each select="hl7:author/hl7:time[@value | @nullFlavor]">
                    <xsl:variable name="elemName">registratie_datum_tijd</xsl:variable>
                    <xsl:call-template name="handleTS">

                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruik_indicator -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '15'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value">
                    <xsl:variable name="elemName">gebruik_indicator</xsl:variable>
                    <xsl:call-template name="handleBL">

                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- volgens_afspraak_indicator -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '8'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2'] or hl7:code[@code = '112221000146107'][@codeSystem = $oidSNOMEDCT]]/hl7:value">
                    <xsl:variable name="elemName">volgens_afspraak_indicator</xsl:variable>
                    <xsl:call-template name="handleBL">

                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- stoptype -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-stoptype or hl7:code[@code = '274512008'][@codeSystem = $oidSNOMEDCT]]/hl7:value[@code | @nullFlavor]">
                    <xsl:variable name="elemName">stoptype</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>

                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiksperiode -->
                <xsl:for-each select="$IVL_TS/hl7:width">
                    <xsl:call-template name="mp9-duration">
                        <xsl:with-param name="elemName">gebruiksperiode</xsl:with-param>


                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiks_product -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <xsl:variable name="elemName">gebruiks_product</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp9-gebruiksinstructie-from-mp910">
                    <xsl:with-param name="in" select="."/>


                </xsl:call-template>

                <!-- gerelateerde_afspraak -->
                <!-- relatie_naar ma -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9086']/hl7:id[@extension | @root | @nullFlavor]">
                    <xsl:variable name="elemName">gerelateerde_afspraak</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <xsl:variable name="elemName">identificatie_medicatieafspraak</xsl:variable>
                        <xsl:call-template name="handleII">

                            <xsl:with-param name="elemName" select="$elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- relatie_naar ta -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9101']/hl7:id[@extension | @root | @nullFlavor]">
                    <xsl:variable name="elemName">gerelateerde_afspraak</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <xsl:variable name="elemName">identificatie_toedieningsafspraak</xsl:variable>
                        <xsl:call-template name="handleII">

                            <xsl:with-param name="elemName" select="$elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- gerelateerde_verstrekking -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[@code = '373784005'][@codeSystem = $oidSNOMEDCT]]/hl7:id[@extension | @root | @nullFlavor]">
                    <xsl:variable name="elemName">gerelateerde_verstrekking</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <xsl:variable name="elemName">identificatie</xsl:variable>
                        <xsl:call-template name="handleII">

                            <xsl:with-param name="elemName" select="$elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- voorschrijver -->
                <xsl:for-each select="hl7:entryRelationship/hl7:substanceAdministration[hl7:code[@code = $maCode][@codeSystem = $oidSNOMEDCT]]/hl7:author">
                    <xsl:variable name="elemName">voorschrijver</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210">
                            <xsl:with-param name="in" select="."/>


                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- informant -->
                <xsl:for-each select="hl7:informant">
                    <xsl:variable name="elemName">informant</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <!-- persoon -->
                        <xsl:for-each select="hl7:relatedEntity">
                            <xsl:variable name="elemName">persoon</xsl:variable>
                            <xsl:element name="{$elemName}">

                                <!-- adresgegevens -->
                                <!-- address information -->
                                <xsl:call-template name="handleADtoAddressInformation">
                                    <xsl:with-param name="in" select="hl7:addr"/>
                                    <xsl:with-param name="language" select="$language"/>


                                </xsl:call-template>
                                <!-- naamgegevens -->
                                <xsl:for-each select="hl7:relatedPerson/hl7:name">
                                    <!-- naamgegevens -->
                                    <xsl:call-template name="handleENtoNameInformation">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="language" select="$language"/>
                                        <!-- naamgebruik is not part of the MP transactions for voorschrijver -->
                                        <xsl:with-param name="outputNaamgebruik" select="false()"/>


                                    </xsl:call-template>

                                </xsl:for-each>
                                <!-- rol_of_functie -->
                                <xsl:for-each select="hl7:code">
                                    <xsl:variable name="elemName">rol_of_functie</xsl:variable>
                                    <xsl:call-template name="handleCV">
                                        <xsl:with-param name="elemName" select="$elemName"/>

                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:element>
                        </xsl:for-each>
                        <!-- informant_is_patient -->
                        <xsl:for-each select="hl7:assignedEntity[hl7:code/@code = 'ONESELF']">
                            <xsl:variable name="elemName">informant_is_patient</xsl:variable>
                            <xsl:element name="{$elemName}">
                                <xsl:attribute name="value">true</xsl:attribute>

                            </xsl:element>
                        </xsl:for-each>
                        <!-- informant_is_zorgverlener -->
                        <xsl:for-each select="hl7:assignedEntity[hl7:assignedPerson]">
                            <xsl:variable name="elemName">informant_is_zorgverlener</xsl:variable>
                            <xsl:element name="{$elemName}">

                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000">
                                    <xsl:with-param name="in" select="."/>


                                </xsl:call-template>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>

                <!-- auteur -->
                <xsl:for-each select="hl7:author">
                    <xsl:variable name="elemName">auteur</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <!-- auteur_is_zorgaanbieder -->
                        <xsl:for-each select="hl7:assignedAuthor[not(hl7:assignedPerson)][not(hl7:code/@code = 'ONESELF')]/hl7:representedOrganization">
                            <xsl:variable name="elemName">auteur_is_zorgaanbieder</xsl:variable>
                            <xsl:element name="{$elemName}">
                                <xsl:call-template name="mp910-zorgaanbieder">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="nestedZorgaanbieder" select="false()"/>
                                </xsl:call-template>
                            </xsl:element>

                        </xsl:for-each>
                        <!-- auteur_is_patient -->
                        <xsl:for-each select="hl7:assignedAuthor[hl7:code/@code = 'ONESELF']">
                            <xsl:variable name="elemName">auteur_is_patient</xsl:variable>
                            <xsl:element name="{$elemName}">
                                <xsl:attribute name="value">true</xsl:attribute>

                            </xsl:element>
                        </xsl:for-each>
                        <!-- auteur_is_zorgverlener -->
                        <xsl:for-each select=".[hl7:assignedAuthor[hl7:assignedPerson]]">
                            <xsl:variable name="elemName">auteur_is_zorgverlener</xsl:variable>
                            <xsl:element name="{$elemName}">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="nestedZorgaanbieder" select="true()"/>
                                </xsl:call-template>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>

                <!-- reden_gebruik -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '6'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:text">
                    <xsl:variable name="elemName">reden_gebruik</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <xsl:attribute name="value" select="./text()"/>
                    </xsl:element>
                </xsl:for-each>

                <!-- reden_wijzigen_of_stoppen_gebruik -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '7'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value">
                    <xsl:variable name="elemName">reden_wijzigen_of_stoppen_gebruik</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>

                    </xsl:call-template>
                </xsl:for-each>

                <!-- kopie_indicator -->
                <xsl:variable name="elemName">kopie_indicator</xsl:variable>
                <xsl:call-template name="handleBL">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$elemName"/>

                </xsl:call-template>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <xsl:variable name="elemName">toelichting</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value" select="text()"/>

                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Toedieningsafspraak MP 9.1.0 Inhoud</xd:desc>
        <xd:param name="in">HL7 supply for toedieningsafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9300_20191125140358" match="hl7:supply" mode="HandleTAContents910">
        <xsl:param name="in" select="."/>

        <!-- toedieningsafspraak -->
        <xsl:for-each select="$in">
            <xsl:variable name="elemName">toedieningsafspraak</xsl:variable>
            <xsl:element name="{$elemName}">

                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>

                <!-- gebruiksperiode_start -->
                <xsl:for-each select="$IVL_TS/hl7:low[@value | @nullFlavor]">
                    <xsl:variable name="elemName">gebruiksperiode_start</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>

                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiksperiode_eind -->
                <xsl:for-each select="$IVL_TS/hl7:high[@value | @nullFlavor]">
                    <xsl:variable name="elemName">gebruiksperiode_eind</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>

                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <xsl:variable name="elemName">identificatie</xsl:variable>
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="in" select="."/>

                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- afspraak_datum_tijd -->
                <xsl:for-each select="hl7:author/hl7:time">
                    <xsl:variable name="elemName">afspraak_datum_tijd</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>

                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiksperiode -->
                <xsl:for-each select="$IVL_TS/hl7:width">
                    <xsl:call-template name="mp9-duration">
                        <xsl:with-param name="elemName">gebruiksperiode</xsl:with-param>


                    </xsl:call-template>
                </xsl:for-each>

                <!-- geannuleerd_indicator -->
                <xsl:for-each select="hl7:statusCode[@code = 'nullified']">
                    <xsl:variable name="elemName">geannuleerd_indicator</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value">true</xsl:attribute>

                    </xsl:element>
                </xsl:for-each>

                <!-- stoptype  -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-stoptype]/hl7:value">
                    <xsl:variable name="elemName">stoptype</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName" select="$elemName"/>

                    </xsl:call-template>
                </xsl:for-each>

                <!-- verstrekker -->
                <xsl:for-each select="hl7:author/hl7:assignedAuthor/hl7:representedOrganization">
                    <xsl:variable name="elemName">verstrekker</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <xsl:call-template name="mp910-zorgaanbieder">
                            <xsl:with-param name="in" select="."/>


                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- reden afspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9083' or hl7:code[@code = '112231000146109'][@codeSystem = $oidSNOMEDCT]]/hl7:text">
                    <xsl:variable name="elemName">reden_afspraak</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value" select="./text()"/>

                    </xsl:element>
                </xsl:for-each>

                <!-- geneesmiddel_bij_toedieningsafspraak -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <xsl:variable name="elemName">geneesmiddel_bij_toedieningsafspraak</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp9-gebruiksinstructie-from-mp910">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>

                <!-- aanvullende_informatie -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9175']/hl7:value">
                    <xsl:variable name="elemName">aanvullende_informatie</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>

                    </xsl:call-template>
                </xsl:for-each>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <xsl:variable name="elemName">toelichting</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value" select="text()"/>

                    </xsl:element>
                </xsl:for-each>

                <!-- kopie_indicator -->
                <xsl:variable name="ada-elemName">kopie_indicator</xsl:variable>
                <xsl:call-template name="handleBL">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                </xsl:call-template>

                <!-- relatie_naar_medicatieafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9086']/hl7:id">
                    <xsl:variable name="elemName">relatie_naar_medicatieafspraak</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

            </xsl:element>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.0.7 Inhoud </xd:desc>
        <xd:param name="ma_hl7_90">HL7 medicatieafspraak, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9233_20181204130547">
        <xsl:param name="ma_hl7_90" select="."/>
        <xsl:variable name="elemName">medicatieafspraak</xsl:variable>
        <xsl:for-each select="$ma_hl7_90">
            <xsl:element name="{$elemName}">
                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>
                <!-- gebruiksperiode_start -->
                <xsl:variable name="ada-elemName">gebruiksperiode_start</xsl:variable>
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="$IVL_TS/hl7:low"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                    <xsl:with-param name="vagueDate" select="true()"/>
                </xsl:call-template>
                <!-- gebruiksperiode_start -->
                <xsl:variable name="ada-elemName">gebruiksperiode_eind</xsl:variable>
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="$IVL_TS/hl7:high"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                    <xsl:with-param name="vagueDate" select="true()"/>
                </xsl:call-template>
                <!-- identificatie -->
                <xsl:variable name="ada-elemName">identificatie</xsl:variable>
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>

                </xsl:call-template>
                <!-- afspraakdatum -->
                <xsl:variable name="ada-elemName">afspraakdatum</xsl:variable>
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="hl7:author/hl7:time"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>

                    <xsl:with-param name="vagueDate" select="true()"/>
                </xsl:call-template>
                <!-- gebruiksperiode -->
                <!-- do not use the handlePQ template since the mp ada time unit does not comply to the assumptions in that template -->
                <xsl:variable name="ada-elemName">gebruiksperiode</xsl:variable>
                <xsl:for-each select="$IVL_TS/hl7:width[@value]">
                    <xsl:element name="{$ada-elemName}">
                        <xsl:attribute name="value" select="./@value"/>
                        <xsl:attribute name="unit" select="nf:convertTime_UCUM2ADA_unit(./@unit)"/>
                    </xsl:element>
                </xsl:for-each>
                <!-- geannuleerd_indicator -->
                <xsl:for-each select="hl7:statusCode">
                    <geannuleerd_indicator value="{@code='nullified'}"/>
                </xsl:for-each>
                <!-- stoptype -->
                <xsl:variable name="ada-elemName">stoptype</xsl:variable>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-stoptype]/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                </xsl:call-template>
                <xsl:variable name="ada-elemName">relatie_naar_afspraak_of_gebruik</xsl:variable>
                <xsl:if test="./hl7:entryRelationship/*[hl7:templateId/@root = $template-id-rel-afspr-gebr]/hl7:id">
                    <xsl:element name="{$ada-elemName}">
                        <!-- relatie naar ma -->
                        <xsl:variable name="ada-elemName">identificatie</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = $template-id-rel-ma]/hl7:id"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                        </xsl:call-template>
                        <xsl:variable name="ada-elemName">identificatie_23288</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = $template-id-rel-ta]/hl7:id"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                        </xsl:call-template>
                        <xsl:variable name="ada-elemName">identificatie_23289</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = $template-id-rel-gb]/hl7:id"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:if>
                <!-- relaties ketenzorg -->
                <xsl:variable name="rel-encounter" select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:encounter"/>
                <xsl:variable name="rel-concern" select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:act[hl7:code[@code = 'CONC'][@codeSystem = '2.16.840.1.113883.5.6']]"/>
                <xsl:if test="$rel-encounter or $rel-concern">
                    <xsl:variable name="ada-elemName">relaties_ketenzorg</xsl:variable>
                    <xsl:element name="{$ada-elemName}">
                        <xsl:variable name="ada-elemName">identificatie_contactmoment</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="$rel-encounter/hl7:id"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                        </xsl:call-template>
                        <xsl:variable name="ada-elemName">identificatie_episode</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="$rel-concern/hl7:id"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:if>
                <!-- voorschrijver -->
                <voorschrijver>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337_2">
                        <xsl:with-param name="author-hl7" select="hl7:author"/>

                    </xsl:call-template>
                </voorschrijver>

                <!-- reden wijzigen of staken -->
                <xsl:variable name="ada-elemName">reden_wijzigen_of_staken</xsl:variable>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-redenWijzigenOfStaken]/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                </xsl:call-template>

                <!-- reden van voorschrijven -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-redenVanVoorschrijven]/hl7:value">
                    <xsl:variable name="ada-elemName">reden_van_voorschrijven</xsl:variable>
                    <xsl:element name="{$ada-elemName}">
                        <xsl:variable name="ada-elemName">probleem</xsl:variable>
                        <xsl:element name="{$ada-elemName}">
                            <!-- probleem_naam -->
                            <xsl:variable name="ada-elemName">probleem_naam</xsl:variable>
                            <xsl:call-template name="handleCV">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="elemName" select="$ada-elemName"/>
                            </xsl:call-template>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>

                <!-- afgesproken_geneesmiddel -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <xsl:variable name="ada-elemName">afgesproken_geneesmiddel</xsl:variable>
                    <xsl:element name="{$ada-elemName}">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp9-gebruiksinstructie-from-mp9">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
                <!-- lichaamslengte  -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.7.10.30'][hl7:value]">
                    <xsl:variable name="ada-elemName">lichaamslengte</xsl:variable>
                    <xsl:element name="{$ada-elemName}">
                        <!-- lengte_waarde -->
                        <xsl:variable name="ada-elemName">lengte_waarde</xsl:variable>
                        <xsl:call-template name="handlePQ">
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="in" select="hl7:value"/>
                        </xsl:call-template>
                        <!-- lengte_datum_tijd -->
                        <xsl:variable name="ada-elemName">lengte_datum_tijd</xsl:variable>
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="in" select="hl7:effectiveTime"/>
                            <xsl:with-param name="vagueDate" select="true()"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
                <!-- lichaamsgewicht  -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.7.10.28'][hl7:value]">
                    <xsl:variable name="ada-elemName">lichaamsgewicht</xsl:variable>
                    <xsl:element name="{$ada-elemName}">
                        <xsl:variable name="ada-elemName">gewicht_waarde</xsl:variable>
                        <xsl:call-template name="handlePQ">
                            <xsl:with-param name="in" select="hl7:value"/>

                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                        </xsl:call-template>
                        <!-- gewicht_datum_tijd -->
                        <xsl:variable name="ada-elemName">gewicht_datum_tijd</xsl:variable>
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="in" select="hl7:effectiveTime"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="vagueDate" select="true()"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
                <!-- aanvullende_informatie -->
                <xsl:variable name="ada-elemName">aanvullende_informatie</xsl:variable>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9177']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>

                </xsl:call-template>
                <!-- kopie_indicator -->
                <xsl:variable name="ada-elemName">kopie_indicator</xsl:variable>
                <xsl:call-template name="handleBL">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>

                </xsl:call-template>
                <!-- toelichting -->
                <xsl:variable name="ada-elemName">toelichting</xsl:variable>
                <xsl:call-template name="handleST">
                    <xsl:with-param name="in" select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                </xsl:call-template>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.0.6 </xd:desc>
        <xd:param name="ma_hl7_90"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-mbh"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9216_20180423130413">
        <xsl:param name="ma_hl7_90" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-mbh"/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9201_20180419121646">
            <xsl:with-param name="ma_hl7_90" select="$ma_hl7_90"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatiegebruik MP 9.0.7</xd:desc>
        <xd:param name="in">HL7 medication use</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9246_20181205101627" match="hl7:substanceAdministration" mode="HandleMGB910">
        <xsl:param name="in" select="."/>
        <!-- medicatie_gebruik -->
        <xsl:for-each select="$in">
            <xsl:variable name="elemName">medicatie_gebruik</xsl:variable>
            <xsl:element name="{$elemName}">

                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>

                <!-- gebruiksperiode_start -->
                <xsl:for-each select="$IVL_TS/hl7:low[@value]">
                    <xsl:variable name="elemName">gebruiksperiode_start</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>

                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiksperiode_eind -->
                <xsl:for-each select="$IVL_TS/hl7:high[@value]">
                    <xsl:variable name="elemName">gebruiksperiode_eind</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>

                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <xsl:variable name="elemName">identificatie</xsl:variable>
                    <xsl:call-template name="handleII">

                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- registratie_datum -->
                <xsl:for-each select="hl7:author/hl7:time[@value | @nullFlavor]">
                    <xsl:variable name="elemName">registratiedatum</xsl:variable>
                    <xsl:call-template name="handleTS">

                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruik_indicator -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '15'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value">
                    <xsl:variable name="elemName">gebruik_indicator</xsl:variable>
                    <xsl:call-template name="handleBL">

                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- volgens_afspraak_indicator -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '8'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2'] or hl7:code[@code = '112221000146107'][@codeSystem = $oidSNOMEDCT]]/hl7:value">
                    <xsl:variable name="elemName">volgens_afspraak_indicator</xsl:variable>
                    <xsl:call-template name="handleBL">

                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- stoptype -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-stoptype or hl7:code[@code = '274512008'][@codeSystem = $oidSNOMEDCT]]/hl7:value[@code | @nullFlavor]">
                    <xsl:variable name="elemName">stoptype</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>

                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiksperiode -->
                <xsl:for-each select="$IVL_TS/hl7:width">
                    <xsl:call-template name="mp9-duration">
                        <xsl:with-param name="elemName">gebruiksperiode</xsl:with-param>


                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiks_product -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <xsl:variable name="elemName">gebruiks_product</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>


                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp9-gebruiksinstructie-from-mp9">
                    <xsl:with-param name="in" select="."/>


                </xsl:call-template>

                <!-- gerelateerde_afspraak -->
                <!-- relatie_naar ma -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9086']/hl7:id[@extension | @root | @nullFlavor]">
                    <xsl:variable name="elemName">gerelateerde_afspraak</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <xsl:variable name="elemName">identificatie_medicatieafspraak</xsl:variable>
                        <xsl:call-template name="handleII">

                            <xsl:with-param name="elemName" select="$elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- relatie_naar ta -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9101']/hl7:id[@extension | @root | @nullFlavor]">
                    <xsl:variable name="elemName">gerelateerde_afspraak</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <xsl:variable name="elemName">identificatie_toedieningsafspraak</xsl:variable>
                        <xsl:call-template name="handleII">

                            <xsl:with-param name="elemName" select="$elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- gerelateerde_verstrekking -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[@code = '373784005'][@codeSystem = $oidSNOMEDCT]]/hl7:id[@extension | @root | @nullFlavor]">
                    <xsl:variable name="elemName">gerelateerde_verstrekking</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <xsl:variable name="elemName">identificatie</xsl:variable>
                        <xsl:call-template name="handleII">

                            <xsl:with-param name="elemName" select="$elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- voorschrijver -->
                <xsl:for-each select="hl7:entryRelationship/hl7:substanceAdministration[hl7:code[@code = $maCode][@codeSystem = $oidSNOMEDCT]]/hl7:author">
                    <xsl:variable name="elemName">voorschrijver</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210">
                            <xsl:with-param name="in" select="."/>


                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- informant -->
                <xsl:for-each select="hl7:informant">
                    <xsl:variable name="elemName">informant</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <!-- persoon -->
                        <xsl:for-each select="hl7:relatedEntity">
                            <xsl:variable name="elemName">persoon</xsl:variable>
                            <xsl:element name="{$elemName}">

                                <!-- adresgegevens -->
                                <!-- address information -->
                                <xsl:call-template name="handleADtoAddressInformation">
                                    <xsl:with-param name="in" select="hl7:addr"/>
                                    <xsl:with-param name="language" select="$language"/>


                                </xsl:call-template>
                                <!-- naamgegevens -->
                                <xsl:for-each select="hl7:relatedPerson/hl7:name">
                                    <!-- naamgegevens -->
                                    <xsl:call-template name="handleENtoNameInformation">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="language" select="$language"/>
                                        <!-- naamgebruik is not part of the MP transactions for voorschrijver -->
                                        <xsl:with-param name="outputNaamgebruik" select="false()"/>


                                    </xsl:call-template>

                                </xsl:for-each>
                                <!-- rol_of_functie -->
                                <xsl:for-each select="hl7:code">
                                    <xsl:variable name="elemName">rol_of_functie</xsl:variable>
                                    <xsl:call-template name="handleCV">
                                        <xsl:with-param name="elemName" select="$elemName"/>

                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:element>
                        </xsl:for-each>
                        <!-- informant_is_patient -->
                        <xsl:for-each select="hl7:assignedEntity[hl7:code/@code = 'ONESELF']">
                            <xsl:variable name="elemName">informant_is_patient</xsl:variable>
                            <xsl:element name="{$elemName}">
                                <xsl:attribute name="value">true</xsl:attribute>

                            </xsl:element>
                        </xsl:for-each>
                        <!-- informant_is_zorgverlener -->
                        <xsl:for-each select="hl7:assignedEntity[hl7:assignedPerson]">
                            <xsl:variable name="elemName">informant_is_zorgverlener</xsl:variable>
                            <xsl:element name="{$elemName}">

                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000">
                                    <xsl:with-param name="in" select="."/>


                                </xsl:call-template>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>

                <!-- auteur -->
                <xsl:for-each select="hl7:author">
                    <xsl:variable name="elemName">auteur</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <!-- auteur_is_zorgaanbieder -->
                        <xsl:for-each select="hl7:assignedAuthor[not(hl7:assignedPerson)][not(hl7:code/@code = 'ONESELF')]/hl7:representedOrganization">
                            <xsl:variable name="elemName">auteur_is_zorgaanbieder</xsl:variable>
                            <xsl:element name="{$elemName}">

                                <!-- zorgaanbieder with zorgaanbieder_identificatie_nummer -->
                                <xsl:call-template name="mp907-verstrekker">
                                    <xsl:with-param name="in" select="."/>


                                </xsl:call-template>
                            </xsl:element>

                        </xsl:for-each>
                        <!-- auteur_is_patient -->
                        <xsl:for-each select="hl7:assignedAuthor[hl7:code/@code = 'ONESELF']">
                            <xsl:variable name="elemName">auteur_is_patient</xsl:variable>
                            <xsl:element name="{$elemName}">
                                <xsl:attribute name="value">true</xsl:attribute>

                            </xsl:element>
                        </xsl:for-each>
                        <!-- auteur_is_zorgverlener -->
                        <xsl:for-each select=".[hl7:assignedAuthor[hl7:assignedPerson]]">
                            <xsl:variable name="elemName">auteur_is_zorgverlener</xsl:variable>
                            <xsl:element name="{$elemName}">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                                    <xsl:with-param name="author-hl7" select="."/>
                                </xsl:call-template>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>

                <!-- reden_gebruik -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '6'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:text">
                    <xsl:variable name="elemName">reden_gebruik</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value" select="./text()"/>
                    </xsl:element>
                </xsl:for-each>

                <!-- reden_wijzigen_of_stoppen_gebruik -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '7'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value">
                    <xsl:variable name="elemName">reden_wijzigen_of_stoppen_gebruik</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- kopie_indicator -->
                <xsl:variable name="elemName">kopie_indicator</xsl:variable>
                <xsl:call-template name="handleBL">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$elemName"/>
                </xsl:call-template>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <xsl:variable name="elemName">toelichting</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value" select="text()"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>

    </xsl:template>

    <xd:doc>
        <xd:desc>Verstrekkingsverzoek MP 9.0.7</xd:desc>
        <xd:param name="in">input hl7 verstrekking</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9255_20181206145856" match="hl7:supply" mode="HandleMVE910">
        <xsl:param name="in" as="element()*" select="."/>

        <xsl:for-each select="$in">
            <xsl:variable name="elemName">verstrekking</xsl:variable>
            <xsl:element name="{$elemName}">
                <!-- identificatie -->
                <xsl:for-each select="hl7:id[@extension | @root | @nullFlavor]">
                    <xsl:variable name="elemName">identificatie</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:for-each select="@extension">
                            <xsl:attribute name="value" select="."/>
                        </xsl:for-each>
                        <xsl:for-each select="@root">
                            <xsl:attribute name="root" select="."/>
                        </xsl:for-each>
                        <xsl:for-each select="@nullFlavor">
                            <xsl:attribute name="nullFlavor" select="."/>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>

                <!-- datum -->
                <xsl:for-each select="hl7:effectiveTime[@value | @nullFlavor]">
                    <xsl:variable name="elemName">datum</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- aanschrijfdatum -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[@code = '4'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value[@value | @nullFlavor]">
                    <xsl:variable name="elemName">aanschrijfdatum</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- verstrekker -->
                <xsl:for-each select="hl7:performer/hl7:assignedEntity/hl7:representedOrganization">
                    <xsl:variable name="elemName">verstrekker</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="mp907-verstrekker">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- verstrekte_hoeveelheid -->
                <xsl:for-each select="hl7:quantity[.//(@value | @code | @unit | @nullFlavor)]">
                    <xsl:variable name="elemName">verstrekte_hoeveelheid</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <aantal>
                            <xsl:for-each select="hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                <xsl:attribute name="value" select="@value"/>
                            </xsl:for-each>
                        </aantal>
                        <xsl:for-each select="(hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                            <eenheid>
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </eenheid>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>

                <!-- verstrekt_geneesmiddel -->
                <xsl:for-each select="hl7:product/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <xsl:variable name="elemName">verstrekt_geneesmiddel</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- verbruiksduur -->
                <xsl:for-each select="hl7:expectedUseTime[.//(@value | @unit | @nullFlavor | @code)]/hl7:width[@value | @unit]">
                    <xsl:variable name="elemName">verbruiksduur</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:for-each select="@value">
                            <xsl:attribute name="value" select="."/>
                        </xsl:for-each>
                        <xsl:for-each select="@unit">
                            <xsl:attribute name="unit" select="nf:convertTime_UCUM2ADA_unit(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@nullFlavor">
                            <xsl:attribute name="nullFlavor" select="nf:convertTime_UCUM2ADA_unit(.)"/>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>

                <!-- afleverlocatie -->
                <xsl:for-each select="hl7:participant[@typeCode = 'DST']/hl7:participantRole[@classCode = 'SDLOC']/hl7:addr">
                    <xsl:variable name="elemName">afleverlocatie</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value">
                            <xsl:copy-of select="string-join(./text() | ./*, ' ')"/>
                        </xsl:attribute>

                    </xsl:element>
                </xsl:for-each>

                <!-- distributievorm -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9097']/hl7:code">
                    <xsl:variable name="elemName">distributievorm</xsl:variable>
                    <xsl:call-template name="handleCV">

                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- aanvullende_informatie -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[@code = '13'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value">
                    <xsl:variable name="elemName">aanvullende_informatie</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>

                    </xsl:call-template>
                </xsl:for-each>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <toelichting value="{text()}"/>
                </xsl:for-each>

                <!-- relatie_naar_verstrekkingsverzoek -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[(@code = '3' and @codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.3') or (@code = '52711000146108' and @codeSystem = $oidSNOMEDCT)]]/hl7:id[@root | @extension | @nullFlavor]">
                    <xsl:variable name="elemName">relatie_naar_verstrekkingsverzoek</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:variable name="elemName">identificatie</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName" select="$elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>



    <xd:doc>
        <xd:desc>Verstrekkingsverzoek MP 9.0.7</xd:desc>
        <xd:param name="in">input hl7 verstrekkingsverzoek</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9257_20181204143321" match="hl7:supply" mode="HandleVV910">
        <xsl:param name="in" as="element(hl7:supply)*" select="."/>

        <xsl:for-each select="$in">
            <verstrekkingsverzoek>

                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <identificatie value="{@extension}" root="{@root}"/>
                </xsl:for-each>

                <!-- datum -->
                <xsl:for-each select="hl7:author/hl7:time">
                    <datum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(@value), nf:determine_date_precision(@value))}"/>
                </xsl:for-each>

                <!-- auteur -->
                <xsl:for-each select="hl7:author[.//(@value | @code | @nullFlavor)]">
                    <auteur>
                        <xsl:variable name="author-hl7" select="."/>
                        <xsl:for-each select="$author-hl7/hl7:assignedAuthor">
                            <zorgverlener>
                                <xsl:for-each select="hl7:id">
                                    <zorgverlener_identificatie_nummer value="{@extension}" root="{@root}"/>
                                </xsl:for-each>
                                <xsl:for-each select="hl7:assignedPerson/hl7:name">
                                    <xsl:variable name="elemName">naamgegevens</xsl:variable>
                                    <xsl:element name="{$elemName}">
                                        <xsl:variable name="elemName">naamgegevens</xsl:variable>
                                        <!-- naamgegevens -->
                                        <xsl:call-template name="handleENtoNameInformation">
                                            <xsl:with-param name="in" select="."/>
                                            <xsl:with-param name="language" select="$language"/>
                                            <!-- naamgebruik is not part of the MP transactions for voorschrijver -->
                                            <xsl:with-param name="outputNaamgebruik" select="false()"/>
                                        </xsl:call-template>
                                    </xsl:element>
                                </xsl:for-each>

                                <!-- specialisme -->
                                <xsl:for-each select="hl7:code">
                                    <specialisme>
                                        <xsl:call-template name="mp9-code-attribs">
                                            <xsl:with-param name="current-hl7-code" select="."/>
                                        </xsl:call-template>
                                    </specialisme>
                                </xsl:for-each>

                                <xsl:for-each select="hl7:representedOrganization">
                                    <xsl:call-template name="mp9-zorgaanbieder">
                                        <xsl:with-param name="hl7-current-organization" select="."/>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </zorgverlener>
                        </xsl:for-each>
                    </auteur>
                </xsl:for-each>

                <!-- te_verstrekken_hoeveelheid -->
                <xsl:for-each select="hl7:quantity[.//(@value | @code | @unit | @nullFlavor)]">
                    <te_verstrekken_hoeveelheid>
                        <aantal>
                            <xsl:for-each select="hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                <xsl:attribute name="value" select="@value"/>
                            </xsl:for-each>
                        </aantal>
                        <xsl:for-each select="(hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                            <eenheid>
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </eenheid>
                        </xsl:for-each>
                    </te_verstrekken_hoeveelheid>
                </xsl:for-each>

                <!-- aantal_herhalingen -->
                <xsl:for-each select="hl7:repeatNumber[@value castable as xs:integer]">
                    <aantal_herhalingen value="{xs:integer(@value) - 1}"/>
                </xsl:for-each>

                <!-- te_verstrekken_geneesmiddel -->
                <xsl:for-each select="hl7:product/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <te_verstrekken_geneesmiddel>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </te_verstrekken_geneesmiddel>
                </xsl:for-each>

                <!-- verbruiksperiode -->
                <xsl:for-each select="hl7:expectedUseTime[.//(@value | @unit | @nullFlavor | @code)]">
                    <verbruiksperiode>
                        <xsl:for-each select="hl7:low[@value]">
                            <ingangsdatum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(@value), nf:determine_date_precision(@value))}"/>
                        </xsl:for-each>
                        <xsl:for-each select="hl7:width[@value | @unit]">
                            <duur value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(@unit)}"/>
                        </xsl:for-each>
                        <xsl:for-each select="hl7:high[@value]">
                            <einddatum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(@value), nf:determine_date_precision(@value))}"/>
                        </xsl:for-each>
                    </verbruiksperiode>
                </xsl:for-each>

                <!-- beoogd_verstrekker -->
                <xsl:for-each select="hl7:performer/hl7:assignedEntity/hl7:representedOrganization">
                    <beoogd_verstrekker>
                        <xsl:call-template name="mp910-zorgaanbieder">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </beoogd_verstrekker>
                </xsl:for-each>

                <!-- afleverlocatie -->
                <xsl:for-each select="hl7:participant[@typeCode = 'DST']/hl7:participantRole[@classCode = 'SDLOC']/hl7:addr">
                    <afleverlocatie>
                        <xsl:attribute name="value">
                            <xsl:copy-of select="normalize-space(.)"/>
                        </xsl:attribute>
                    </afleverlocatie>
                </xsl:for-each>

                <!-- aanvullende_wensen -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[@classCode = 'ACT'][@moodCode = 'RQO']/hl7:code">
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName">aanvullende_wensen</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <toelichting value="{text()}"/>
                </xsl:for-each>

                <!-- relatie_naar_medicatieafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $maCode]/hl7:id[@root | @extension]">
                    <relatie_naar_medicatieafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_naar_medicatieafspraak>
                </xsl:for-each>

            </verstrekkingsverzoek>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Toedieningsafspraak MP 9.0.7 Inhoud</xd:desc>
        <xd:param name="in">HL7 supply for toedieningsafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9259_20181206160523" match="hl7:supply" mode="HandleTAContents907">
        <xsl:param name="in" select="."/>

        <!-- toedieningsafspraak -->
        <xsl:for-each select="$in">
            <xsl:variable name="elemName">toedieningsafspraak</xsl:variable>
            <xsl:element name="{$elemName}">
                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>

                <!-- gebruiksperiode_start -->
                <xsl:for-each select="$IVL_TS/hl7:low[@value | @nullFlavor]">
                    <xsl:variable name="elemName">gebruiksperiode_start</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiksperiode_eind -->
                <xsl:for-each select="$IVL_TS/hl7:high[@value | @nullFlavor]">
                    <xsl:variable name="elemName">gebruiksperiode_eind</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <xsl:variable name="elemName">identificatie</xsl:variable>
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- afspraak_datum_tijd -->
                <xsl:for-each select="hl7:author/hl7:time">
                    <xsl:variable name="elemName">afspraakdatum</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="vagueDate" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiksperiode -->
                <xsl:for-each select="$IVL_TS/hl7:width">
                    <xsl:call-template name="mp9-duration">
                        <xsl:with-param name="elemName">gebruiksperiode</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- geannuleerd_indicator -->
                <xsl:for-each select="hl7:statusCode[@code = 'nullified']">
                    <xsl:variable name="elemName">geannuleerd_indicator</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value">true</xsl:attribute>
                    </xsl:element>
                </xsl:for-each>

                <!-- stoptype  -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-stoptype]/hl7:value">
                    <xsl:variable name="elemName">stoptype</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- verstrekker -->
                <xsl:for-each select="hl7:author/hl7:assignedAuthor/hl7:representedOrganization">
                    <xsl:variable name="elemName">verstrekker</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <zorgaanbieder>
                            <xsl:call-template name="handleII">
                                <xsl:with-param name="in" select="hl7:id"/>
                                <xsl:with-param name="elemName">zorgaanbieder_identificatie_nummer</xsl:with-param>
                            </xsl:call-template>
                            <!-- organisatienaam has 1..1 R in MP 9 ADA transactions, but is not always present in HL7 input messages.  -->
                            <!-- fill with nullFlavor if necessary -->
                            <xsl:call-template name="handleST">
                                <xsl:with-param name="in" select="hl7:name"/>
                                <xsl:with-param name="elemName">organisatie_naam</xsl:with-param>
                                <xsl:with-param name="nullIfMissing">NI</xsl:with-param>
                            </xsl:call-template>
                            <xsl:call-template name="handleADtoAddressInformation">
                                <xsl:with-param name="in" select="hl7:addr"/>
                                <xsl:with-param name="language">nl-NL</xsl:with-param>
                            </xsl:call-template>
                        </zorgaanbieder>

                    </xsl:element>
                </xsl:for-each>

                <!-- reden afspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9083' or hl7:code[@code = '112231000146109'][@codeSystem = $oidSNOMEDCT]]/hl7:text">
                    <xsl:variable name="elemName">reden_afspraak</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value" select="./text()"/>
                    </xsl:element>
                </xsl:for-each>

                <!-- geneesmiddel_bij_toedieningsafspraak -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <xsl:variable name="elemName">geneesmiddel_bij_toedieningsafspraak</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp9-gebruiksinstructie-from-mp9">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>

                <!-- aanvullende_informatie -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9175']/hl7:value">
                    <xsl:variable name="elemName">aanvullende_informatie</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <xsl:variable name="elemName">toelichting</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value" select="text()"/>
                    </xsl:element>
                </xsl:for-each>

                <!-- kopie_indicator -->
                <xsl:variable name="ada-elemName">kopie_indicator</xsl:variable>
                <xsl:call-template name="handleBL">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                </xsl:call-template>

                <!-- relatie_naar_medicatieafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9086']/hl7:id">
                    <xsl:variable name="elemName">relatie_naar_medicatieafspraak</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.1.0</xd:desc>
        <xd:param name="in">HL7 medication agreement</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9275_20191121115247">
        <xsl:param name="in" select="."/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9276_20191121115616">
            <xsl:with-param name="in" select="$in"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatiegebruik MP 9.1.0</xd:desc>
        <xd:param name="in">HL7 medication use</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9281_20191121142645" match="hl7:substanceAdministration" mode="HandleMGB910">
        <xsl:param name="in" select="."/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9279_20191121141551">
            <xsl:with-param name="in" select="$in"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Voorstel verstrekkingsverzoek MP 9.1.0</xd:desc>
        <xd:param name="in">input hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9131_20160714201445" match="hl7:supply" mode="HandleProposedVV910">
        <xsl:param name="in" as="element(hl7:supply)*" select="."/>

        <xsl:for-each select="$in">
            <xsl:variable name="elemName">verstrekkingsverzoek</xsl:variable>
            <xsl:element name="{$elemName}">

                <!-- te_verstrekken_hoeveelheid -->
                <xsl:for-each select="hl7:quantity[.//(@value | @code | @unit | @nullFlavor)]">
                    <te_verstrekken_hoeveelheid>
                        <aantal>
                            <xsl:for-each select="hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                <xsl:attribute name="value" select="@value"/>
                            </xsl:for-each>
                        </aantal>
                        <xsl:for-each select="(hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                            <eenheid>
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </eenheid>
                        </xsl:for-each>
                    </te_verstrekken_hoeveelheid>
                </xsl:for-each>

                <!-- aantal_herhalingen -->
                <xsl:for-each select="hl7:repeatNumber[@value castable as xs:integer]">
                    <aantal_herhalingen value="{xs:integer(@value) - 1}"/>
                </xsl:for-each>

                <!-- te_verstrekken_geneesmiddel -->
                <xsl:for-each select="hl7:product/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <te_verstrekken_geneesmiddel>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </te_verstrekken_geneesmiddel>
                </xsl:for-each>

                <!-- verbruiksperiode -->
                <xsl:for-each select="hl7:expectedUseTime[.//(@value | @unit | @nullFlavor | @code)]">
                    <verbruiksperiode>
                        <xsl:for-each select="hl7:low[@value]">
                            <ingangsdatum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(@value), nf:determine_date_precision(@value))}"/>
                        </xsl:for-each>
                        <xsl:for-each select="hl7:width[@value | @unit]">
                            <duur value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(@unit)}"/>
                        </xsl:for-each>
                        <xsl:for-each select="hl7:high[@value]">
                            <einddatum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(@value), nf:determine_date_precision(@value))}"/>
                        </xsl:for-each>
                    </verbruiksperiode>
                </xsl:for-each>

                <!-- beoogd_verstrekker -->
                <xsl:for-each select="hl7:performer/hl7:assignedEntity/hl7:representedOrganization">
                    <beoogd_verstrekker>
                        <xsl:call-template name="mp910-zorgaanbieder">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </beoogd_verstrekker>
                </xsl:for-each>

                <!-- afleverlocatie -->
                <xsl:for-each select="hl7:participant[@typeCode = 'DST']/hl7:participantRole[@classCode = 'SDLOC']/hl7:addr">
                    <afleverlocatie>
                        <xsl:attribute name="value">
                            <xsl:copy-of select="normalize-space(.)"/>
                        </xsl:attribute>
                    </afleverlocatie>
                </xsl:for-each>

                <!-- aanvullende_wensen -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[@classCode = 'ACT'][@moodCode = 'RQO']/hl7:code">
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName">aanvullende_wensen</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <xsl:variable name="elemName">toelichting</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value" select="./text()"/>
                    </xsl:element>
                </xsl:for-each>

                <!-- relatie_naar_medicatieafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $maCode]/hl7:id[@root | @extension]">
                    <relatie_naar_medicatieafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_naar_medicatieafspraak>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Verstrekkingsverzoek MP 9.1.0</xd:desc>
        <xd:param name="in">input hl7 verstrekkingsverzoek</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9301_20191125141436" match="hl7:supply" mode="HandleVV910">
        <xsl:param name="in" as="element(hl7:supply)*" select="."/>

        <xsl:for-each select="$in">
            <verstrekkingsverzoek>

                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <identificatie value="{@extension}" root="{@root}"/>
                </xsl:for-each>

                <!-- datum -->
                <xsl:for-each select="hl7:author/hl7:time">
                    <datum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(@value), nf:determine_date_precision(@value))}"/>
                </xsl:for-each>

                <!-- auteur -->
                <xsl:for-each select="hl7:author[.//(@value | @code | @nullFlavor)]">
                    <auteur>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </auteur>
                </xsl:for-each>

                <!-- te_verstrekken_hoeveelheid -->
                <xsl:for-each select="hl7:quantity[.//(@value | @code | @unit | @nullFlavor)]">
                    <te_verstrekken_hoeveelheid>
                        <aantal>
                            <xsl:for-each select="hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                <xsl:attribute name="value" select="@value"/>
                            </xsl:for-each>
                        </aantal>
                        <xsl:for-each select="(hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                            <eenheid>
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </eenheid>
                        </xsl:for-each>
                    </te_verstrekken_hoeveelheid>
                </xsl:for-each>

                <!-- aantal_herhalingen -->
                <xsl:for-each select="hl7:repeatNumber[@value castable as xs:integer]">
                    <aantal_herhalingen value="{xs:integer(@value) - 1}"/>
                </xsl:for-each>

                <!-- te_verstrekken_geneesmiddel -->
                <xsl:for-each select="hl7:product/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <te_verstrekken_geneesmiddel>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </te_verstrekken_geneesmiddel>
                </xsl:for-each>

                <!-- verbruiksperiode -->
                <xsl:for-each select="hl7:expectedUseTime[.//(@value | @unit | @nullFlavor | @code)]">
                    <verbruiksperiode>
                        <xsl:for-each select="hl7:low[@value]">
                            <ingangsdatum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(@value), nf:determine_date_precision(@value))}"/>
                        </xsl:for-each>
                        <xsl:for-each select="hl7:width[@value | @unit]">
                            <duur value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(@unit)}"/>
                        </xsl:for-each>
                        <xsl:for-each select="hl7:high[@value]">
                            <einddatum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(@value), nf:determine_date_precision(@value))}"/>
                        </xsl:for-each>
                    </verbruiksperiode>
                </xsl:for-each>

                <!-- beoogd_verstrekker -->
                <xsl:for-each select="hl7:performer/hl7:assignedEntity/hl7:representedOrganization">
                    <beoogd_verstrekker>
                        <xsl:call-template name="mp910-zorgaanbieder">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </beoogd_verstrekker>
                </xsl:for-each>

                <!-- afleverlocatie -->
                <xsl:for-each select="hl7:participant[@typeCode = 'DST']/hl7:participantRole[@classCode = 'SDLOC']/hl7:addr">
                    <afleverlocatie>
                        <xsl:attribute name="value">
                            <xsl:copy-of select="normalize-space(.)"/>
                        </xsl:attribute>
                    </afleverlocatie>
                </xsl:for-each>

                <!-- aanvullende_wensen -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[@classCode = 'ACT'][@moodCode = 'RQO']/hl7:code">
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName">aanvullende_wensen</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <toelichting value="{text()}"/>
                </xsl:for-each>

                <!-- relatie_naar_medicatieafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $maCode]/hl7:id[@root | @extension]">
                    <relatie_naar_medicatieafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_naar_medicatieafspraak>
                </xsl:for-each>

            </verstrekkingsverzoek>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc> Medicatiegebruik MP 9 2.0</xd:desc>
        <xd:param name="in">HL7 medication use</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9322_20201015131242" match="hl7:substanceAdministration" mode="HandleMGB92">
        <xsl:param name="in" select="."/>
        <!-- medicatie_gebruik -->
        <xsl:for-each select="$in">
            <medicatiegebruik>

                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="elemName">identificatie</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- registratie_datum -->
                <xsl:for-each select="hl7:author/hl7:time[@value | @nullFlavor]">
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="elemName">medicatiegebruik_datum_tijd</xsl:with-param>
                        <xsl:with-param name="datatype">datetime</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruik_indicator -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '15'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value">
                    <xsl:call-template name="handleBL">
                        <xsl:with-param name="elemName">gebruik_indicator</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- volgens_afspraak_indicator -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '8'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2'] or hl7:code[@code = '112221000146107'][@codeSystem = $oidSNOMEDCT]]/hl7:value">
                    <xsl:call-template name="handleBL">
                        <xsl:with-param name="elemName">volgens_afspraak_indicator</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- stoptype -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-stoptype or hl7:code[@code = '274512008'][@codeSystem = $oidSNOMEDCT]]/hl7:value[@code | @nullFlavor]">
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName">medicatie_gebruik_stop_type</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiksperiode -->
                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>
                <xsl:call-template name="mp92-gebruiksperiode">
                    <xsl:with-param name="IVL_TS" select="($IVL_TS[hl7:low | hl7:width | hl7:high])[1]"/>
                </xsl:call-template>

                <!-- gebruiks_product -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <gebruiksproduct>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </gebruiksproduct>
                </xsl:for-each>

                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp92-gebruiksinstructie-from-mp9">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>

                <!-- relatie_medicatieafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $maCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_medicatieafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_medicatieafspraak>
                </xsl:for-each>

                <!-- relatie_toedieningsafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $taCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_toedieningsafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_toedieningsafspraak>
                </xsl:for-each>

                <!-- gerelateerde_verstrekking -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $mveCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_medicatieverstrekking>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_medicatieverstrekking>
                </xsl:for-each>

                <!-- huisartsen relaties -->
                <xsl:call-template name="_huisartsenRelaties"/>

                <!-- voorschrijver -->
                <xsl:for-each select="hl7:entryRelationship/hl7:substanceAdministration[hl7:code[@code = $maCode][@codeSystem = $oidSNOMEDCT]]/hl7:author">
                    <voorschrijver>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701">
                            <xsl:with-param name="author-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </voorschrijver>
                </xsl:for-each>

                <!-- informant -->
                <xsl:for-each select="hl7:informant">
                    <xsl:variable name="elemName">informant</xsl:variable>
                    <xsl:element name="{$elemName}">

                        <!-- persoon -->
                        <xsl:for-each select="hl7:relatedEntity">
                            <persoon>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.30_20210701">
                                    <xsl:with-param name="in-hl7" select="."/>
                                    <xsl:with-param name="generateId" select="true()"/>
                                </xsl:call-template>
                            </persoon>
                        </xsl:for-each>
                        <!-- informant_is_patient -->
                        <xsl:for-each select="hl7:assignedEntity[hl7:code/@code = 'ONESELF']">
                            <xsl:variable name="elemName">informant_is_patient</xsl:variable>
                            <xsl:element name="{$elemName}">
                                <xsl:attribute name="value">true</xsl:attribute>

                            </xsl:element>
                        </xsl:for-each>
                        <!-- informant_is_zorgverlener -->
                        <xsl:for-each select="hl7:assignedEntity[hl7:assignedPerson]">
                            <xsl:variable name="elemName">informant_is_zorgverlener</xsl:variable>
                            <xsl:element name="{$elemName}">

                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>

                <!-- auteur -->
                <xsl:for-each select="hl7:author">
                    <auteur>

                        <!-- auteur_is_zorgaanbieder -->
                        <xsl:for-each select="hl7:assignedAuthor[not(hl7:assignedPerson)][not(hl7:code/@code = 'ONESELF')]/hl7:representedOrganization">
                            <auteur_is_zorgaanbieder>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701">
                                    <xsl:with-param name="hl7-current-organization" select="."/>
                                    <xsl:with-param name="generateId" select="true()"/>
                                </xsl:call-template>
                            </auteur_is_zorgaanbieder>
                        </xsl:for-each>

                        <!-- auteur_is_patient -->
                        <xsl:for-each select="hl7:assignedAuthor[hl7:code/@code = 'ONESELF']">
                            <auteur_is_patient>
                                <xsl:attribute name="value">true</xsl:attribute>
                            </auteur_is_patient>
                        </xsl:for-each>

                        <!-- auteur_is_zorgverlener -->
                        <xsl:for-each select=".[hl7:assignedAuthor[hl7:assignedPerson]]">
                            <auteur_is_zorgverlener>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701">
                                    <xsl:with-param name="author-hl7" select="."/>
                                    <xsl:with-param name="generateId" select="true()"/>
                                </xsl:call-template>
                            </auteur_is_zorgverlener>
                        </xsl:for-each>
                    </auteur>
                </xsl:for-each>

                <!-- reden_gebruik -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '6'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:text">
                    <reden_gebruik>
                        <xsl:attribute name="value" select="./text()"/>
                    </reden_gebruik>
                </xsl:for-each>

                <!-- reden_wijzigen_of_stoppen_gebruik -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[(@code = '7' and @codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2') or (@code = '153861000146102' and @codeSystem = $oidSNOMEDCT)]]/hl7:value">
                    <xsl:variable name="elemName">reden_wijzigen_of_stoppen_gebruik</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- kopie_indicator -->
                <xsl:variable name="elemName">kopie_indicator</xsl:variable>
                <xsl:call-template name="handleBL">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$elemName"/>
                </xsl:call-template>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <xsl:variable name="elemName">toelichting</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value" select="text()"/>
                    </xsl:element>
                </xsl:for-each>
            </medicatiegebruik>
        </xsl:for-each>

    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.2 Inhoud </xd:desc>
        <xd:param name="ma_hl7">HL7 medicatieafspraak, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9323_20201015131556">
        <xsl:param name="ma_hl7" select="."/>
        <xsl:for-each select="$ma_hl7">
            <xsl:element name="medicatieafspraak">

                <!-- identificatie -->
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="elemName">identificatie</xsl:with-param>
                </xsl:call-template>

                <!-- medicatieafspraak_datum_tijd -->
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="hl7:author/hl7:time"/>
                    <xsl:with-param name="elemName">medicatieafspraak_datum_tijd</xsl:with-param>
                    <xsl:with-param name="vagueDate" select="true()"/>
                    <xsl:with-param name="datatype">datetime</xsl:with-param>
                </xsl:call-template>

                <!-- gebruiksperiode -->
                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>
                <xsl:call-template name="mp92-gebruiksperiode">
                    <xsl:with-param name="IVL_TS" select="($IVL_TS[hl7:low | hl7:width | hl7:high])[1]"/>
                </xsl:call-template>

                <!-- geannuleerd_indicator -->
                <xsl:for-each select="hl7:statusCode">
                    <geannuleerd_indicator value="{@code='nullified'}"/>
                </xsl:for-each>

                <!-- stoptype -->
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-stoptype]/hl7:value"/>
                    <xsl:with-param name="elemName">medicatieafspraak_stop_type</xsl:with-param>
                </xsl:call-template>

                <!-- relatie_medicatieafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $maCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_medicatieafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_medicatieafspraak>
                </xsl:for-each>

                <!-- relatie_toedieningsafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $taCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_toedieningsafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_toedieningsafspraak>
                </xsl:for-each>

                <!-- relatie_medicatiegebruik -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $mgbCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_medicatiegebruik>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_medicatiegebruik>
                </xsl:for-each>

                <!-- huisartsen relaties -->
                <xsl:call-template name="_huisartsenRelaties"/>

                <!-- voorschrijver -->
                <voorschrijver>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701">
                        <xsl:with-param name="author-hl7" select="hl7:author"/>
                        <xsl:with-param name="generateId" select="true()"/>
                    </xsl:call-template>
                </voorschrijver>

                <!-- reden wijzigen of staken -->
                <xsl:variable name="ada-elemName">reden_wijzigen_of_staken</xsl:variable>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-redenWijzigenOfStaken]/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                </xsl:call-template>

                <!-- reden van voorschrijven -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-redenVanVoorschrijven]/hl7:value">
                    <xsl:variable name="ada-elemName">reden_van_voorschrijven</xsl:variable>
                    <xsl:element name="{$ada-elemName}">
                        <xsl:variable name="ada-elemName">probleem</xsl:variable>
                        <xsl:element name="{$ada-elemName}">
                            <!-- probleem_naam -->
                            <xsl:variable name="ada-elemName">probleem_naam</xsl:variable>
                            <xsl:call-template name="handleCV">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="elemName" select="$ada-elemName"/>
                            </xsl:call-template>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>

                <!-- afgesproken_geneesmiddel -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <afgesproken_geneesmiddel>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </afgesproken_geneesmiddel>
                </xsl:for-each>

                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp92-gebruiksinstructie-from-mp9">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>

                <!-- TODO, move these to bouwstenen -->
                <!-- lichaamslengte  -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.7.10.30'][hl7:value]">
                    <xsl:variable name="ada-elemName">lichaamslengte</xsl:variable>
                    <xsl:element name="{$ada-elemName}">
                        <!-- lengte_waarde -->
                        <xsl:variable name="ada-elemName">lengte_waarde</xsl:variable>
                        <xsl:call-template name="handlePQ">
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="in" select="hl7:value"/>
                        </xsl:call-template>
                        <!-- lengte_datum_tijd -->
                        <xsl:variable name="ada-elemName">lengte_datum_tijd</xsl:variable>
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="in" select="hl7:effectiveTime"/>
                            <xsl:with-param name="vagueDate" select="true()"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
                <!-- lichaamsgewicht  -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.7.10.28'][hl7:value]">
                    <xsl:variable name="ada-elemName">lichaamsgewicht</xsl:variable>
                    <xsl:element name="{$ada-elemName}">
                        <xsl:variable name="ada-elemName">gewicht_waarde</xsl:variable>
                        <xsl:call-template name="handlePQ">
                            <xsl:with-param name="in" select="hl7:value"/>

                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                        </xsl:call-template>
                        <!-- gewicht_datum_tijd -->
                        <xsl:variable name="ada-elemName">gewicht_datum_tijd</xsl:variable>
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="in" select="hl7:effectiveTime"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="vagueDate" select="true()"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- aanvullende_informatie -->
                <xsl:variable name="ada-elemName">aanvullende_informatie</xsl:variable>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9177']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>

                </xsl:call-template>

                <!-- kopie_indicator -->
                <xsl:call-template name="handleBL">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']/hl7:value"/>
                    <xsl:with-param name="elemName">kopie_indicator</xsl:with-param>
                </xsl:call-template>

                <!-- toelichting -->
                <xsl:call-template name="handleST">
                    <xsl:with-param name="in" select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text"/>
                    <xsl:with-param name="elemName">toelichting</xsl:with-param>
                </xsl:call-template>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>




    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.2</xd:desc>
        <xd:param name="ma_hl7">HL7 medicatieafspraak, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9324_20201015132016">
        <xsl:param name="ma_hl7" select="."/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9323_20201015131556">
            <xsl:with-param name="ma_hl7" select="$ma_hl7"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc> Toedieningsafspraak MP 9 2.0 Inhoud</xd:desc>
        <xd:param name="in">HL7 substanceAdministration for toedieningsafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9332_20201015134926" match="hl7:substanceAdministration" mode="HandleTAContents92">
        <xsl:param name="in" select="."/>

        <!-- toedieningsafspraak -->
        <xsl:for-each select="$in">
            <toedieningsafspraak>
                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>

                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName">identificatie</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- afspraak_datum_tijd -->
                <xsl:for-each select="hl7:author/hl7:time">
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName">toedieningsafspraak_datum_tijd</xsl:with-param>
                        <xsl:with-param name="vagueDate" select="true()"/>
                        <xsl:with-param name="datatype">datetime</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- gebruiksperiode -->
                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>
                <xsl:call-template name="mp92-gebruiksperiode">
                    <xsl:with-param name="IVL_TS" select="($IVL_TS[hl7:low | hl7:width | hl7:high])[1]"/>
                </xsl:call-template>

                <!-- geannuleerd_indicator -->
                <xsl:for-each select="hl7:statusCode[@code = 'nullified']">
                    <geannuleerd_indicator value="true"/>
                </xsl:for-each>

                <!-- stoptype  -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-stoptype]/hl7:value">
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName">toedieningsafspraak_stop_type</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- verstrekker -->
                <xsl:for-each select="hl7:author/hl7:assignedAuthor/hl7:representedOrganization">
                    <verstrekker>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701">
                            <xsl:with-param name="generateId" select="true()"/>
                            <xsl:with-param name="hl7-current-organization" select="."/>
                        </xsl:call-template>
                    </verstrekker>
                </xsl:for-each>

                <!-- reden afspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9083' or hl7:code[@code = '112231000146109'][@codeSystem = $oidSNOMEDCT]]/hl7:text">
                    <reden_afspraak value="{text()}"/>
                </xsl:for-each>

                <!-- geneesmiddel_bij_toedieningsafspraak -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <geneesmiddel_bij_toedieningsafspraak>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </geneesmiddel_bij_toedieningsafspraak>
                </xsl:for-each>

                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp92-gebruiksinstructie-from-mp9">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>

                <!-- aanvullende_informatie -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9175']/hl7:value">
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName">toedieningsafspraak_aanvullende_informatie</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <xsl:variable name="elemName">toelichting</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value" select="text()"/>
                    </xsl:element>
                </xsl:for-each>

                <!-- kopie_indicator -->
                <xsl:variable name="ada-elemName">kopie_indicator</xsl:variable>
                <xsl:call-template name="handleBL">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                </xsl:call-template>

                <!-- relatie_medicatieafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $maCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_medicatieafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_medicatieafspraak>
                </xsl:for-each>

            </toedieningsafspraak>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Verstrekkingsverzoek MP 9 2.0</xd:desc>
        <xd:param name="in">input hl7 verstrekkingsverzoek</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9356_20210402132627" match="hl7:supply" mode="HandleVV92">
        <xsl:param name="in" as="element(hl7:supply)*" select="."/>

        <xsl:for-each select="$in">
            <verstrekkingsverzoek>

                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <identificatie value="{@extension}" root="{@root}"/>
                </xsl:for-each>

                <!-- datum -->
                <xsl:for-each select="hl7:author/hl7:time">
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName">verstrekkingsverzoek_datum</xsl:with-param>
                        <xsl:with-param name="vagueDate" select="true()"/>
                        <xsl:with-param name="datatype">datetime</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- auteur -->
                <xsl:for-each select="hl7:author[.//(@value | @code | @nullFlavor)]">
                    <auteur>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701">
                            <xsl:with-param name="author-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </auteur>
                </xsl:for-each>

                <!-- te_verstrekken_geneesmiddel -->
                <xsl:for-each select="hl7:product/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <te_verstrekken_geneesmiddel>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </te_verstrekken_geneesmiddel>
                </xsl:for-each>

                <!-- te_verstrekken_hoeveelheid -->
                <xsl:for-each select="hl7:quantity[.//(@value | @code | @unit | @nullFlavor)]">
                    <te_verstrekken_hoeveelheid>
                        <aantal value="{(hl7:translation[@codeSystem = $oidGStandaardBST902THES2]/@value)[1]}"/>
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="(hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]"/>
                            <xsl:with-param name="elemName">eenheid</xsl:with-param>
                        </xsl:call-template>
                    </te_verstrekken_hoeveelheid>
                </xsl:for-each>

                <!-- aantal_herhalingen -->
                <xsl:for-each select="hl7:repeatNumber[@value castable as xs:integer]">
                    <aantal_herhalingen value="{xs:integer(@value) - 1}"/>
                </xsl:for-each>

                <!-- verbruiksperiode -->
                <xsl:call-template name="mp92-gebruiksperiode">
                    <xsl:with-param name="IVL_TS" select="hl7:expectedUseTime[.//(@value | @unit | @nullFlavor | @code)]"/>
                    <xsl:with-param name="elemName">verbruiksperiode</xsl:with-param>
                </xsl:call-template>

                <!-- geannuleerd_indicator -->
                <xsl:if test="hl7:statusCode[@code = 'nullified']">
                    <geannuleerd_indicator value="true"/>
                </xsl:if>

                <!-- beoogd_verstrekker -->
                <xsl:for-each select="hl7:performer/hl7:assignedEntity/hl7:representedOrganization">
                    <beoogd_verstrekker>
                        <!-- <xsl:call-template name="mp910-zorgaanbieder">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>-->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701">
                            <xsl:with-param name="hl7-current-organization" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </beoogd_verstrekker>
                </xsl:for-each>

                <!-- afleverlocatie -->
                <xsl:for-each select="hl7:participant[@typeCode = 'DST']/hl7:participantRole[@classCode = 'SDLOC']/hl7:addr">
                    <afleverlocatie>
                        <xsl:attribute name="value">
                            <xsl:copy-of select="normalize-space(.)"/>
                        </xsl:attribute>
                    </afleverlocatie>
                </xsl:for-each>

                <!-- aanvullende_wensen -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[@classCode = 'ACT'][@moodCode = 'RQO']/hl7:code">
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName">aanvullende_wensen</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- financiele indicatiecode -->
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '153931000146103'][@codeSystem = $oidSNOMEDCT]]/hl7:value[@code | @nullFlavor]"/>
                    <xsl:with-param name="elemName">financiele_indicatiecode</xsl:with-param>
                </xsl:call-template>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <toelichting value="{text()}"/>
                </xsl:for-each>

                <!-- relatie_medicatieafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = ('33633005', '16076005')]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_medicatieafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_medicatieafspraak>
                </xsl:for-each>

                <!-- huisartsen relaties -->
                <xsl:call-template name="_huisartsenRelaties"/>

            </verstrekkingsverzoek>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc> MP 9 MP CDA Medication Information </xd:desc>
        <xd:param name="product-hl7">The hl7 xml element which contains the medication product. Defaults to context.</xd:param>
        <xd:param name="generateId">whether or not to output an ada id on the root element, optional, default to false()</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
        <xsl:param name="product-hl7" select="."/>
        <xsl:param name="generateId" as="xs:boolean?" select="false()"/>
        <!-- product -->
        <farmaceutisch_product>
            <xsl:if test="$generateId">
                <xsl:attribute name="id">
                    <xsl:value-of select="generate-id()"/>
                </xsl:attribute>
            </xsl:if>
            <!-- product_code -->
            <xsl:variable name="ada-elemName">product_code</xsl:variable>
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="hl7:code | hl7:code/hl7:translation"/>
                <xsl:with-param name="elemName" select="$ada-elemName"/>
            </xsl:call-template>
            <!-- product_specificatie -->
            <xsl:if test="not(hl7:code) or hl7:code/following-sibling::*">
                <xsl:variable name="ada-elemName">product_specificatie</xsl:variable>
                <xsl:element name="{$ada-elemName}">
                    <!-- product_naam -->
                    <xsl:variable name="ada-elemName">product_naam</xsl:variable>
                    <xsl:call-template name="handleST">
                        <xsl:with-param name="in" select="hl7:name"/>
                        <xsl:with-param name="elemName" select="$ada-elemName"/>
                    </xsl:call-template>
                    <!-- omschrijving -->
                    <xsl:variable name="ada-elemName">omschrijving</xsl:variable>
                    <xsl:call-template name="handleST">
                        <xsl:with-param name="in" select="pharm:desc"/>
                        <xsl:with-param name="elemName" select="$ada-elemName"/>
                    </xsl:call-template>
                    <!-- farmaceutische vorm -->
                    <xsl:variable name="ada-elemName">farmaceutische_vorm</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="pharm:formCode"/>
                        <xsl:with-param name="elemName" select="$ada-elemName"/>
                    </xsl:call-template>
                    <!-- ingredient -->
                    <xsl:for-each select="./pharm:ingredient">
                        <xsl:variable name="ada-elemName">ingredient</xsl:variable>
                        <xsl:element name="{$ada-elemName}">
                            <!-- ingredient_code -->
                            <xsl:for-each select="pharm:ingredient/pharm:code">
                                <xsl:call-template name="handleCV">
                                    <xsl:with-param name="in" select=". | ./hl7:translation"/>
                                    <xsl:with-param name="elemName" select="'ingredient_code'"/>
                                </xsl:call-template>
                            </xsl:for-each>
                            <!-- sterkte -->
                            <xsl:for-each select="./pharm:quantity">
                                <xsl:variable name="ada-elemName">sterkte</xsl:variable>
                                <xsl:element name="{$ada-elemName}">
                                    <!-- hoeveelheid_ingredient -->
                                    <xsl:for-each select="hl7:numerator[.//@value | @nullFlavor]">
                                        <ingredient_hoeveelheid>
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                            </xsl:call-template>
                                        </ingredient_hoeveelheid>
                                    </xsl:for-each>
                                    <!-- hoeveelheid_product  -->
                                    <xsl:for-each select="hl7:denominator[.//@value]">
                                        <product_hoeveelheid>
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                            </xsl:call-template>
                                        </product_hoeveelheid>
                                    </xsl:for-each>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:element>

                    </xsl:for-each>
                </xsl:element>
            </xsl:if>
        </farmaceutisch_product>
    </xsl:template>

    <xd:doc>
        <xd:desc>Verstrekkingsverzoek MP 9 2.0</xd:desc>
        <xd:param name="in">input hl7 verstrekking</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9364_20210602161935" match="hl7:supply" mode="HandleMVE92">
        <xsl:param name="in" as="element()*" select="."/>

        <xsl:for-each select="$in">
            <medicatieverstrekking>
                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName">identificatie</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- datum -->
                <xsl:for-each select="hl7:effectiveTime[@value | @nullFlavor]">
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="elemName">medicatieverstrekkings_datum_tijd</xsl:with-param>
                        <xsl:with-param name="datatype">datetime</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- aanschrijfdatum -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[@code = '4'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value[@value | @nullFlavor]">
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="elemName">aanschrijf_datum</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- verstrekker -->
                <xsl:for-each select="hl7:performer/hl7:assignedEntity/hl7:representedOrganization">
                    <verstrekker>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701">
                            <xsl:with-param name="generateId" select="true()"/>
                            <xsl:with-param name="hl7-current-organization" select="."/>
                        </xsl:call-template>
                    </verstrekker>
                </xsl:for-each>

                <!-- verstrekte_hoeveelheid -->
                <xsl:for-each select="hl7:quantity[.//(@value | @code | @unit | @nullFlavor)]">
                    <verstrekte_hoeveelheid>
                        <aantal value="{(hl7:translation[@codeSystem = $oidGStandaardBST902THES2]/@value)[1]}"/>
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="(hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]"/>
                            <xsl:with-param name="elemName">eenheid</xsl:with-param>
                        </xsl:call-template>
                    </verstrekte_hoeveelheid>
                </xsl:for-each>

                <!-- verstrekt_geneesmiddel -->
                <xsl:for-each select="hl7:product/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <verstrekt_geneesmiddel>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </verstrekt_geneesmiddel>
                </xsl:for-each>

                <!-- verbruiksduur -->
                <xsl:for-each select="hl7:expectedUseTime[.//(@value | @unit | @nullFlavor | @code)]/hl7:width[@value | @unit]">
                    <xsl:variable name="elemName">verbruiksduur</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:for-each select="@value">
                            <xsl:attribute name="value" select="."/>
                        </xsl:for-each>
                        <xsl:for-each select="@unit">
                            <xsl:attribute name="unit" select="nf:convertTime_UCUM2ADA_unit(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@nullFlavor">
                            <xsl:attribute name="nullFlavor" select="nf:convertTime_UCUM2ADA_unit(.)"/>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>

                <!-- afleverlocatie -->
                <xsl:for-each select="hl7:participant[@typeCode = 'DST']/hl7:participantRole[@classCode = 'SDLOC']/hl7:addr">
                    <xsl:variable name="elemName">afleverlocatie</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value">
                            <xsl:copy-of select="string-join(./text() | ./*, ' ')"/>
                        </xsl:attribute>

                    </xsl:element>
                </xsl:for-each>

                <!-- distributievorm -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9097']/hl7:code">
                    <xsl:variable name="elemName">distributievorm</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- aanvullende_informatie -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[@code = '13'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value">
                    <xsl:variable name="elemName">aanvullende_informatie</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName">medicatieverstrekking_aanvullende_informatie</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <toelichting value="{text()}"/>
                </xsl:for-each>

                <!-- relatie_verstrekkingsverzoek -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[(@code = '3' and @codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.3') or (@code = '52711000146108' and @codeSystem = $oidSNOMEDCT)]]/hl7:id[@root | @extension | @nullFlavor]">
                    <relatie_verstrekkingsverzoek>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_verstrekkingsverzoek>
                </xsl:for-each>
            </medicatieverstrekking>

        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatietoediening MP 9 2.0</xd:desc>
        <xd:param name="in">HL7 medication administration</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9373_20210616162231" match="hl7:substanceAdministration" mode="HandleMTD92">
        <xsl:param name="in" select="."/>
        <!-- medicatietoediening -->
        <xsl:for-each select="$in">
            <medicatietoediening>

                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="elemName">identificatie</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- toedienings_product -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <toedienings_product>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </toedienings_product>
                </xsl:for-each>

                <!-- toedienings_datum_tijd -->
                <xsl:for-each select="hl7:effectiveTime[@value | @nullFlavor]">
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="elemName">toedienings_datum_tijd</xsl:with-param>
                        <xsl:with-param name="datatype">datetime</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- afgesproken_datum_tijd -->
                <xsl:for-each select="hl7:entryRelationship/hl7:substanceAdministration[@moodCode = 'RQO']/hl7:effectiveTime[@value | @nullFlavor]">
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="elemName">afgesproken_datum_tijd</xsl:with-param>
                        <xsl:with-param name="datatype">datetime</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- geannuleerd_indicator -->
                <xsl:for-each select="hl7:statusCode">
                    <geannuleerd_indicator value="{@code='nullified'}"/>
                </xsl:for-each>

                <!-- toegediende_hoeveelheid -->
                <xsl:for-each select="hl7:doseQuantity/hl7:center[@value | @nullFlavor]">
                    <toegediende_hoeveelheid>
                        <aantal value="{(hl7:translation[@codeSystem = $oidGStandaardBST902THES2]/@value)[1]}"/>
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="(hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]"/>
                            <xsl:with-param name="elemName">eenheid</xsl:with-param>
                        </xsl:call-template>
                    </toegediende_hoeveelheid>
                </xsl:for-each>

                <!-- afgesproken_hoeveelheid -->
                <xsl:for-each select="hl7:entryRelationship/hl7:substanceAdministration[@moodCode = 'RQO']/hl7:doseQuantity/hl7:center[@value | @nullFlavor]">
                    <afgesproken_hoeveelheid>
                        <aantal value="{(hl7:translation[@codeSystem = $oidGStandaardBST902THES2]/@value)[1]}"/>
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="(hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]"/>
                            <xsl:with-param name="elemName">eenheid</xsl:with-param>
                        </xsl:call-template>
                    </afgesproken_hoeveelheid>
                </xsl:for-each>

                <!-- volgens_afspraak_indicator -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '8'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2'] or hl7:code[@code = '112221000146107'][@codeSystem = $oidSNOMEDCT]]/hl7:value">
                    <xsl:call-template name="handleBL">
                        <xsl:with-param name="elemName">volgens_afspraak_indicator</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- toedieningsweg -->
                <xsl:for-each select="hl7:routeCode">
                    <xsl:variable name="elemName">toedieningsweg</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- toedieningssnelheid -->
                <xsl:call-template name="_toedieningssnelheid92">
                    <xsl:with-param name="inHl7" select="hl7:rateQuantity"/>
                </xsl:call-template>

                <!-- prik_plak_locatie -->
                <xsl:for-each select="hl7:approachSiteCode/hl7:originalText">
                    <prik_plak_locatie value="{text()}"/>
                </xsl:for-each>

                <!-- relatie_medicatieafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $maCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_medicatieafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_medicatieafspraak>
                </xsl:for-each>

                <!-- relatie_toedieningsafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $taCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_toedieningsafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_toedieningsafspraak>
                </xsl:for-each>

                <!-- relatie_wisselend_doseerschema -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $wdsCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_wisselend_doseerschema>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_wisselend_doseerschema>
                </xsl:for-each>

                <!-- huisartsen relaties -->
                <xsl:call-template name="_huisartsenRelaties"/>

                <!-- toediener -->
                <xsl:for-each select="hl7:author">
                    <toediener>

                        <!-- toediener_is_zorgverlener -->
                        <xsl:for-each select=".[not(hl7:assignedAuthor/hl7:code[@codeSystem = '2.16.840.1.113883.2.4.3.11.22.472' or @codeSystem = '2.16.840.1.113883.2.4.3.11.60.40.4.23.1'])][not(hl7:assignedAuthor[hl7:code/@code = 'ONESELF'])]">
                            <zorgverlener>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701">
                                    <xsl:with-param name="author-hl7" select="."/>
                                    <xsl:with-param name="generateId" select="true()"/>
                                </xsl:call-template>
                            </zorgverlener>
                        </xsl:for-each>
                        <!-- toediener_is_patient -->
                        <xsl:for-each select="hl7:assignedAuthor[hl7:code/@code = 'ONESELF']">

                            <patient>
                                <toediener_is_patient value="true"/>
                            </patient>
                        </xsl:for-each>
                       
                        <!-- toediener mantelzorger -->
                        <xsl:for-each select="hl7:assignedAuthor[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.3.11.22.472' or @codeSystem = '2.16.840.1.113883.2.4.3.11.60.40.4.23.1']][not(hl7:code/@code = 'ONESELF')]">
                            <mantelzorger>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.35_20210701">
                                    <xsl:with-param name="in-hl7" select="."/>
                                </xsl:call-template>                               
                            </mantelzorger>
                        </xsl:for-each>
                    </toediener>
                </xsl:for-each>

                <!-- medicatie_toediening_reden_van_afwijken -->
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '153631000146105'][@codeSystem = $oidSNOMEDCT]]/hl7:value"/>
                    <xsl:with-param name="elemName">medicatie_toediening_reden_van_afwijken</xsl:with-param>
                </xsl:call-template>

                <!-- medicatie_toediening_status, nullified zit in geannuleerd_indicator -->
                <xsl:for-each select="hl7:statusCode[@code ne 'nullified']">
                    <medicatie_toediening_status code="@code" codeSystem="{$hl7ActStatusMap[@hl7Code=@code]/@codeSystem}" displayName="{$hl7ActStatusMap[@hl7Code=@code]/@displayName}"/>
                </xsl:for-each>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <xsl:variable name="elemName">toelichting</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value" select="text()"/>
                    </xsl:element>
                </xsl:for-each>
            </medicatietoediening>
        </xsl:for-each>

    </xsl:template>

    <xd:doc>
        <xd:desc> Wisselend doseerschema MP 9.2 Inhoud </xd:desc>
        <xd:param name="in_hl7">HL7 wds, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9380_20210617175854" match="hl7:substanceAdministration" mode="HandleWDS92">
        <xsl:param name="in_hl7" select="."/>
        <xsl:for-each select="$in_hl7">
            <xsl:element name="wisselend_doseerschema">

                <!-- identificatie -->
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="elemName">identificatie</xsl:with-param>
                </xsl:call-template>

                <!-- wds_datum_tijd -->
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="hl7:author/hl7:time"/>
                    <xsl:with-param name="elemName">wisselend_doseerschema_datum_tijd</xsl:with-param>
                    <xsl:with-param name="vagueDate" select="true()"/>
                    <xsl:with-param name="datatype">datetime</xsl:with-param>
                </xsl:call-template>

                <!-- gebruiksperiode -->
                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>
                <xsl:call-template name="mp92-gebruiksperiode">
                    <xsl:with-param name="IVL_TS" select="($IVL_TS[hl7:low | hl7:width | hl7:high])[1]"/>
                </xsl:call-template>

                <!-- geannuleerd_indicator -->
                <xsl:for-each select="hl7:statusCode">
                    <geannuleerd_indicator value="{@code='nullified'}"/>
                </xsl:for-each>

                <!-- stoptype -->
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-stoptype]/hl7:value"/>
                    <xsl:with-param name="elemName">wisselend_doseerschema_stop_type</xsl:with-param>
                </xsl:call-template>

                <!-- reden wijzigen of staken -->
                <xsl:variable name="ada-elemName">reden_wijzigen_of_staken</xsl:variable>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-redenWijzigenOfStaken]/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                </xsl:call-template>

                <!-- relatie_medicatieafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $maCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_medicatieafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_medicatieafspraak>
                </xsl:for-each>

                <!-- relatie_wisselend_doseerschema -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $wdsCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_wisselend_doseerschema>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_wisselend_doseerschema>
                </xsl:for-each>

                <!-- huisartsen relaties -->
                <xsl:call-template name="_huisartsenRelaties"/>

                <!-- auteur -->
                <auteur>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701">
                        <xsl:with-param name="author-hl7" select="hl7:author"/>
                        <xsl:with-param name="generateId" select="true()"/>
                    </xsl:call-template>
                </auteur>

                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp92-gebruiksinstructie-from-mp9">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>

                <!-- kopie_indicator -->
                <xsl:call-template name="handleBL">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']/hl7:value"/>
                    <xsl:with-param name="elemName">kopie_indicator</xsl:with-param>
                </xsl:call-template>

                <!-- toelichting -->
                <xsl:call-template name="handleST">
                    <xsl:with-param name="in" select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text"/>
                    <xsl:with-param name="elemName">toelichting</xsl:with-param>
                </xsl:call-template>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>




    <xd:doc>
        <xd:desc>Toedieningsafspraak MP 9.1.0</xd:desc>
        <xd:param name="in">input hl7 Toedieningsafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9299_20191125140232" match="hl7:supply" mode="HandleTA910">
        <xsl:param name="in" select="."/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9300_20191125140358">
            <xsl:with-param name="in" select="$in"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Verstrekkingsverzoek MP 9.1.0</xd:desc>
        <xd:param name="in">input hl7 verstrekking</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9294_20191121175237" match="hl7:supply" mode="HandleMVE910">
        <xsl:param name="in" as="element()*" select="."/>

        <xsl:for-each select="$in">
            <xsl:variable name="elemName">verstrekking</xsl:variable>
            <xsl:element name="{$elemName}">

                <!-- identificatie -->
                <xsl:for-each select="hl7:id[@extension | @root | @nullFlavor]">
                    <xsl:variable name="elemName">identificatie</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:for-each select="@extension">
                            <xsl:attribute name="value" select="."/>
                        </xsl:for-each>
                        <xsl:for-each select="@root">
                            <xsl:attribute name="root" select="."/>
                        </xsl:for-each>
                        <xsl:for-each select="@nullFlavor">
                            <xsl:attribute name="nullFlavor" select="."/>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>

                <!-- datum -->
                <xsl:for-each select="hl7:effectiveTime[@value | @nullFlavor]">
                    <xsl:variable name="elemName">datum</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- aanschrijfdatum -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[@code = '4'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value[@value | @nullFlavor]">
                    <xsl:variable name="elemName">aanschrijfdatum</xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- verstrekker -->
                <xsl:for-each select="hl7:performer/hl7:assignedEntity/hl7:representedOrganization">
                    <xsl:variable name="elemName">verstrekker</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="mp910-zorgaanbieder">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- verstrekte_hoeveelheid -->
                <xsl:for-each select="hl7:quantity[.//(@value | @code | @unit | @nullFlavor)]">
                    <xsl:variable name="elemName">verstrekte_hoeveelheid</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <aantal>
                            <xsl:for-each select="hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                <xsl:attribute name="value" select="@value"/>
                            </xsl:for-each>
                        </aantal>
                        <xsl:for-each select="(hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                            <eenheid>
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </eenheid>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>

                <!-- verstrekt_geneesmiddel -->
                <xsl:for-each select="hl7:product/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <xsl:variable name="elemName">verstrekt_geneesmiddel</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

                <!-- verbruiksduur -->
                <xsl:for-each select="hl7:expectedUseTime[.//(@value | @unit | @nullFlavor | @code)]/hl7:width[@value | @unit]">
                    <xsl:variable name="elemName">verbruiksduur</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:for-each select="@value">
                            <xsl:attribute name="value" select="."/>
                        </xsl:for-each>
                        <xsl:for-each select="@unit">
                            <xsl:attribute name="unit" select="nf:convertTime_UCUM2ADA_unit(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@nullFlavor">
                            <xsl:attribute name="nullFlavor" select="nf:convertTime_UCUM2ADA_unit(.)"/>
                        </xsl:for-each>

                    </xsl:element>
                </xsl:for-each>

                <!-- afleverlocatie -->
                <xsl:for-each select="hl7:participant[@typeCode = 'DST']/hl7:participantRole[@classCode = 'SDLOC']/hl7:addr">
                    <xsl:variable name="elemName">afleverlocatie</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value">
                            <xsl:copy-of select="string-join(./text() | ./*, ' ')"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:for-each>

                <!-- distributievorm -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9097']/hl7:code">
                    <xsl:variable name="elemName">distributievorm</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- aanvullende_informatie -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[@code = '13'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value">
                    <xsl:variable name="elemName">aanvullende_informatie</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>

                    </xsl:call-template>
                </xsl:for-each>

                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <toelichting value="{text()}"/>
                </xsl:for-each>

                <!-- relatie_naar_verstrekkingsverzoek -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[(@code = '3' and @codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.3') or (@code = '52711000146108' and @codeSystem = $oidSNOMEDCT)]]/hl7:id[@root | @extension | @nullFlavor]">
                    <xsl:variable name="elemName">relatie_naar_verstrekkingsverzoek</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:variable name="elemName">identificatie</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName" select="$elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>

            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.0.7</xd:desc>
        <xd:param name="ma_hl7_90">HL7 medicatieafspraak, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9235_20181204143321">
        <xsl:param name="ma_hl7_90" select="."/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9233_20181204130547">
            <xsl:with-param name="ma_hl7_90" select="$ma_hl7_90"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc> Verstrekkingsverzoek MP 9.0.6 </xd:desc>
        <xd:param name="vv_hl7_90">HL7v3 Verstrekkingsverzoek</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9231_20180423130413">
        <xsl:param name="vv_hl7_90" select="."/>
        <!-- verstrekkingsverzoek  -->
        <xsl:for-each select="$vv_hl7_90">
            <verstrekkingsverzoek>
                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <identificatie value="{@extension}" root="{@root}"/>
                </xsl:for-each>
                <!-- datum -->
                <xsl:for-each select="hl7:author/hl7:time">
                    <datum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./@value), nf:determine_date_precision(./@value))}"/>
                </xsl:for-each>
                <!-- auteur -->
                <auteur>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                        <xsl:with-param name="author-hl7" select="hl7:author"/>
                    </xsl:call-template>
                </auteur>
                <!-- te_verstrekken_hoeveelheid -->
                <xsl:for-each select="hl7:quantity">
                    <te_verstrekken_hoeveelheid>
                        <xsl:for-each select="hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                            <aantal value="{@value}"/>
                            <eenheid>
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </eenheid>
                        </xsl:for-each>
                    </te_verstrekken_hoeveelheid>
                </xsl:for-each>
                <!-- aantal_herhalingen -->
                <xsl:for-each select="hl7:repeatNumber">
                    <aantal_herhalingen value="{number(./@value)-1}"/>
                </xsl:for-each>
                <!-- te_verstrekken_geneesmiddel  -->
                <xsl:for-each select="hl7:product/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <te_verstrekken_geneesmiddel>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                        </xsl:call-template>
                    </te_verstrekken_geneesmiddel>
                </xsl:for-each>
                <!-- verbruiksperiode -->
                <xsl:for-each select="hl7:expectedUseTime/hl7:width">
                    <verbruiksperiode>
                        <duur value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(@unit)}"/>
                    </verbruiksperiode>
                </xsl:for-each>
                <xsl:for-each select="hl7:performer/hl7:assignedEntity/hl7:representedOrganization">
                    <beoogd_verstrekker>
                        <xsl:call-template name="mp9-zorgaanbieder">
                            <xsl:with-param name="hl7-current-organization" select="."/>
                        </xsl:call-template>
                    </beoogd_verstrekker>
                </xsl:for-each>
                <xsl:for-each select="hl7:participant[@typeCode = 'DST']/hl7:participantRole[@classCode = 'SDLOC']/hl7:addr">
                    <xsl:variable name="concatted_text">
                        <xsl:for-each select="./*">
                            <xsl:value-of select="concat(./text(), ' ')"/>
                        </xsl:for-each>
                    </xsl:variable>
                    <afleverlocatie value="{normalize-space($concatted_text)}"/>
                </xsl:for-each>
                <!-- aanvullende_wensen -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9093']/hl7:code">
                    <aanvullende_wensen>
                        <xsl:call-template name="mp9-code-attribs">
                            <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                    </aanvullende_wensen>
                </xsl:for-each>
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9069']/hl7:text">
                    <toelichting value="{text()}"/>
                </xsl:for-each>
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9086']/hl7:id">
                    <relatie_naar_medicatieafspraak>
                        <identificatie value="{@extension}" root="{@root}"/>
                    </relatie_naar_medicatieafspraak>
                </xsl:for-each>
            </verstrekkingsverzoek>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> PatientNL in voorschrift 9.0.6 </xd:desc>
        <xd:param name="current-patient"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3_20170602000000">
        <xsl:param name="current-patient" select="."/>
        <patient>
            <xsl:for-each select="$current-patient/hl7:patient/hl7:name">
                <xsl:call-template name="mp9-naamgegevens">
                    <xsl:with-param name="current-hl7-name" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="$current-patient/hl7:id">
                <patient_identificatienummer>
                    <xsl:attribute name="root" select="./@root"/>
                    <xsl:attribute name="value" select="./@extension"/>
                </patient_identificatienummer>
            </xsl:for-each>
            <xsl:for-each select="$current-patient/hl7:patient/hl7:birthTime[@value]">
                <geboortedatum>
                    <xsl:variable name="precision" select="nf:determine_date_precision(./@value)"/>
                    <xsl:attribute name="value" select="nf:formatHL72XMLDate(./@value, $precision)"/>
                </geboortedatum>
            </xsl:for-each>
            <xsl:for-each select="$current-patient/hl7:patient/hl7:administrativeGenderCode">
                <xsl:call-template name="mp9-geslacht">
                    <xsl:with-param name="current-administrativeGenderCode" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="$current-patient/hl7:patient/sdtc:multipleBirthInd[@value]">
                <meerling_indicator>
                    <xsl:attribute name="value" select="./@value"/>
                </meerling_indicator>
            </xsl:for-each>
        </patient>
    </xsl:template>

    <xd:doc>
        <xd:desc> PatientNL in MP 9.0.7 </xd:desc>
        <xd:param name="current-patient"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3_20170602000000_2">
        <xsl:param name="current-patient" select="."/>
        <patient>
            <xsl:for-each select="$current-patient/hl7:patient/hl7:name">
                <xsl:call-template name="mp9-naamgegevens">
                    <xsl:with-param name="current-hl7-name" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:call-template name="handleII">
                <xsl:with-param name="elemName">identificatienummer</xsl:with-param>
                <xsl:with-param name="in" select="$current-patient/hl7:id"/>
            </xsl:call-template>
            <xsl:call-template name="handleTS">
                <xsl:with-param name="elemName">geboortedatum</xsl:with-param>
                <xsl:with-param name="in" select="$current-patient/hl7:patient/hl7:birthTime[@value]"/>
                <xsl:with-param name="vagueDate" select="true()"/>
            </xsl:call-template>
            <xsl:for-each select="$current-patient/hl7:patient/hl7:administrativeGenderCode">
                <xsl:call-template name="mp9-geslacht">
                    <xsl:with-param name="current-administrativeGenderCode" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="$current-patient/hl7:patient/sdtc:multipleBirthInd[@value]">
                <meerling_indicator>
                    <xsl:attribute name="value" select="@value"/>
                </meerling_indicator>
            </xsl:for-each>
        </patient>
    </xsl:template>

    <xd:doc>
        <xd:desc> helper stuff </xd:desc>
        <xd:param name="operator"/>
    </xd:doc>
    <xsl:template name="chooseOperatorAttrib">
        <xsl:param name="operator"/>
        <xsl:choose>
            <xsl:when test="$operator = 'A' or $operator = 'I'">
                <xsl:attribute name="operator" select="$operator"/>
            </xsl:when>
            <xsl:otherwise><!-- geen attribuut opnemen --></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="dateTime"/>
        <xd:param name="precision"/>
    </xd:doc>
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

    <xd:doc>
        <xd:desc>Get the contents of @value for ada element is_flexibel based on $in</xd:desc>
        <xd:param name="in">Zero or more PIVL_TS element from which to derive the is_flexibel</xd:param>
    </xd:doc>
    <xsl:function name="nf:getIsFlexible" as="attribute()?">
        <xsl:param name="in" as="element()*"/>

        <xsl:choose>
            <xsl:when test="$in[xs:string(@isFlexible) = 'false']">
                <!-- there is at least one non-flexible time, so is_flexibel must be false, just to be on the safe side -->
                <xsl:attribute name="value">false</xsl:attribute>
            </xsl:when>
            <xsl:when test="$in[xs:string(@isFlexible) = 'true'] and not($in[xs:string(@isFlexible) != 'true'])">
                <!-- none of the @isFlexible are not true and at least one is true -->
                <xsl:attribute name="value">true</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <!-- we don't know -->
                <xsl:attribute name="nullFlavor">UNK</xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="UCUMvalue"/>
        <xd:param name="UCUMunit"/>
    </xd:doc>
    <xsl:template name="make_UCUM2Gstandard_translation">
        <!-- Produceert een regel met de <translation> van a UCUM unit naar de G-standaard -->
        <xsl:param name="UCUMvalue"/>
        <xsl:param name="UCUMunit"/>
        <xsl:choose>
            <xsl:when test="$UCUMunit eq 'ug'">
                <translation value="{$UCUMvalue}" code="252" codeSystem="{$oidGStandaardBST902THES2}" displayName="Microgram"/>
            </xsl:when>
            <xsl:when test="$UCUMunit eq 'mg'">
                <translation value="{$UCUMvalue}" code="229" codeSystem="{$oidGStandaardBST902THES2}" displayName="Milligram"/>
            </xsl:when>
            <xsl:when test="$UCUMunit eq 'g'">
                <translation value="{$UCUMvalue}" code="215" codeSystem="{$oidGStandaardBST902THES2}" displayName="Gram"/>
            </xsl:when>
            <xsl:when test="$UCUMunit eq 'ul'">
                <translation value="{$UCUMvalue}" code="254" codeSystem="{$oidGStandaardBST902THES2}" displayName="Microliter"/>
            </xsl:when>
            <xsl:when test="$UCUMunit eq 'ml'">
                <translation value="{$UCUMvalue}" code="233" codeSystem="{$oidGStandaardBST902THES2}" displayName="Milliliter"/>
            </xsl:when>
            <xsl:when test="$UCUMunit eq 'l'">
                <translation value="{$UCUMvalue}" code="222" codeSystem="{$oidGStandaardBST902THES2}" displayName="Liter"/>
            </xsl:when>
            <xsl:when test="$UCUMunit eq '[drp]'">
                <translation value="{$UCUMvalue}" code="303" codeSystem="{$oidGStandaardBST902THES2}" displayName="Druppel"/>
            </xsl:when>
            <!--
            Tablespoons en teaspoons zijn geschrapt uit de lijst units omdat ze niet nauwkeurig zijn. 
         <xsl:when test="$UCUMunit eq '[tsp_us]'">
            <translation value="{$UCUMvalue * 5}" code="233" codeSystem="{$oidGStandaardBST902THES2}" displayName="Milliliter"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq '[tbs_us]'">
            <translation value="{$UCUMvalue * 15}" code="233" codeSystem="{$oidGStandaardBST902THES2}" displayName="Milliliter"/> 
         </xsl:when>
         -->
            <xsl:when test="$UCUMunit eq '[iU]'">
                <translation value="{$UCUMvalue}" code="217" codeSystem="{$oidGStandaardBST902THES2}" displayName="Internat.eenh."/>
            </xsl:when>
            <xsl:when test="($UCUMunit eq '1')">
                <translation value="{$UCUMvalue}" code="245" codeSystem="{$oidGStandaardBST902THES2}" displayName="stuk"/>
            </xsl:when>
            <xsl:when test="(lower-case($UCUMunit) eq 'eenheid')">
                <translation value="{$UCUMvalue}" code="211" codeSystem="{$oidGStandaardBST902THES2}" displayName="Eenheid"/>
            </xsl:when>
            <xsl:when test="(lower-case($UCUMunit) eq 'dosis')">
                <translation value="{$UCUMvalue}" code="208" codeSystem="{$oidGStandaardBST902THES2}" displayName="dosis"/>
            </xsl:when>
            <xsl:otherwise>
                <translation value="{$UCUMvalue}" code="0" codeSystem="{$oidGStandaardBST902THES2}" displayName="niet ondersteunde UCUM eenheid: {$UCUMunit}"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Bouwstenen are directly after the last medicamenteuze_behandeling</xd:desc>
    </xd:doc>
    <xsl:template match="medicamenteuze_behandeling[not(following-sibling::medicamenteuze_behandeling)]" mode="handleBouwstenen">

        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="handleBouwstenen"/>
        </xsl:copy>
        <bouwstenen>
            <xsl:apply-templates select="../medicamenteuze_behandeling//contactpersoon" mode="addBouwstenen"/>
            <xsl:apply-templates select="../medicamenteuze_behandeling//farmaceutisch_product" mode="addBouwstenen"/>
            <!-- zorgverlener has a bouwstenen reference to zorgaanbieder, some special handling here -->
            <xsl:for-each select="../medicamenteuze_behandeling//zorgverlener[not(zorgverlener)]">
                <xsl:copy>
                    <xsl:apply-templates select="@*" mode="addBouwstenen"/>
                    <xsl:apply-templates select="*[not(self::zorgaanbieder | self::zorgverlener_rol)]" mode="addBouwstenen"/>
                    <xsl:for-each select="zorgaanbieder">
                        <xsl:copy>
                            <!-- double nested in the dataset, unfortunately -->
                            <zorgaanbieder>
                                <xsl:attribute name="datatype">reference</xsl:attribute>
                                <xsl:attribute name="value" select="@id"/>
                            </zorgaanbieder>
                        </xsl:copy>
                    </xsl:for-each>
                    <xsl:apply-templates select="zorgverlener_rol" mode="addBouwstenen"/>
                </xsl:copy>
            </xsl:for-each>
            <xsl:for-each select="../medicamenteuze_behandeling//zorgaanbieder">
                <xsl:copy>
                    <xsl:apply-templates select="node() | @*" mode="addBouwstenen"/>
                </xsl:copy>
            </xsl:for-each>
            <!-- copy existing bouwstenen as well, should only be lichaamsgewicht / lichaamslengte -->
            <xsl:apply-templates select="../bouwstenen/*" mode="addBouwstenen"/>
        </bouwstenen>

    </xsl:template>

    <xd:doc>
        <xd:desc>Do not output bouwstenen (again) in handleBouwstenen, bouwstenen are completely handled in the template that handles medicamenteuze_behandeling</xd:desc>
    </xd:doc>
    <xsl:template match="bouwstenen" mode="handleBouwstenen"/>

    <xd:doc>
        <xd:desc>Make a reference to the bouwstenen</xd:desc>
    </xd:doc>
    <xsl:template match="toediener/mantelzorger/contactpersoon | (voorschrijver | auteur | auteur_is_zorgverlener | toediener/zorgverlener)/zorgverlener | farmaceutisch_product | (beoogd_verstrekker | verstrekker | auteur_is_zorgaanbieder)/zorgaanbieder" mode="handleBouwstenen">
        <xsl:copy>
            <xsl:attribute name="datatype">reference</xsl:attribute>
            <xsl:attribute name="value" select="@id"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Make a reference to the bouwstenen</xd:desc>
    </xd:doc>
    <xsl:template match="zorgverlener/zorgaanbieder" mode="addBouwstenen">
        <xsl:copy>
            <xsl:attribute name="datatype">reference</xsl:attribute>
            <xsl:attribute name="value" select="@id"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Do not output zorgverlener/naamgegevens/naamgebruik to the bouwstenen, it is not in the dataset (but we do get it from out standard templates for naamgegevens)</xd:desc>
    </xd:doc>
    <xsl:template match="zorgverlener/naamgegevens/naamgebruik" mode="addBouwstenen"/>


    <xd:doc>
        <xd:desc>Default copy template for adding the bouwstenen stuff in the 9.2 dataset</xd:desc>
    </xd:doc>
    <xsl:template match="node() | @*" mode="deduplicateBouwstenenStep1">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="deduplicateBouwstenenStep1"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Default copy template for adding the bouwstenen stuff in the 9.2 dataset</xd:desc>
    </xd:doc>
    <xsl:template match="node() | @*" mode="deduplicateBouwstenenStep2">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="deduplicateBouwstenenStep2"/>
        </xsl:copy>
    </xsl:template>


    <xd:doc>
        <xd:desc>Default copy template for adding the bouwstenen stuff in the 9.2 dataset</xd:desc>
    </xd:doc>
    <xsl:template match="node() | @*" mode="handleBouwstenen">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="handleBouwstenen"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Default copy template for adding the bouwstenen stuff in the 9.2 dataset</xd:desc>
    </xd:doc>
    <xsl:template match="node() | @*" mode="addBouwstenen">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="addBouwstenen"/>
        </xsl:copy>
    </xsl:template>


    <xd:doc>
        <xd:desc/>
        <xd:param name="in">The input string, with the number needed.</xd:param>
    </xd:doc>
    <xsl:function name="nf:one_decimal" as="xs:float?">
        <xsl:param name="in" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="in-float" select="xs:float($in)"/>
            <xsl:choose>
                <xsl:when test="$in-float lt 1">
                    <xsl:value-of select="xs:float(format-number(1 div $in-float, '#.0'))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="xs:float(1.0)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in">The input string, with the number needed.</xd:param>
    </xd:doc>
    <xsl:function name="nf:tijdseenheid-aantal" as="xs:float?">
        <xsl:param name="in" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="in-float" select="xs:float($in)"/>
            <xsl:choose>
                <xsl:when test="$in-float lt 1">
                    <xsl:value-of select="xs:integer(1)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$in-float"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="GstdBasiseenheid_code"/>
    </xd:doc>
    <xsl:function name="nf:convertGstdBasiseenheid2UCUM" as="xs:string">
        <xsl:param name="GstdBasiseenheid_code" as="xs:string"/>

        <xsl:choose>
            <xsl:when test="$GstdBasiseenheid_code castable as xs:integer">
                <xsl:choose>
                    <xsl:when test="$GstdBasiseenheid_code = '205'">cm</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '208'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '211'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '215'">g</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '217'">[iU]</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '219'">kg</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '222'">l</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '229'">mg</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '233'">ml</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '234'">mm</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '245'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '252'">ug</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '254'">ul</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '303'">[drp]</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '345'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '490'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '500'">1</xsl:when>
                    <xsl:otherwise>Not supported G-standaard basiseenheid: <xsl:value-of select="$GstdBasiseenheid_code"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise><!-- geen integer meegekregen --> G-standaard code is not an integer. Not supported G-standaard basiseenheid: "<xsl:value-of select="$GstdBasiseenheid_code"/>". </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$GstdBasiseenheid_code castable as xs:integer"/>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="UCUMunit"/>
    </xd:doc>
    <xsl:function name="nf:convertUnit_UCUM2ADA" as="xs:string">
        <xsl:param name="UCUMunit" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="lower-case($UCUMunit) eq 'g'">g</xsl:when>
            <xsl:when test="lower-case($UCUMunit) eq 'kg'">kg</xsl:when>
            <xsl:when test="lower-case($UCUMunit) eq 'cm'">cm</xsl:when>
            <xsl:when test="lower-case($UCUMunit) eq 'm'">m</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$UCUMunit"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="UCUM-time"/>
    </xd:doc>
    <xsl:function name="nf:convertTime_UCUM2ADA_unit" as="xs:string?">
        <xsl:param name="UCUM-time" as="xs:string?"/>
        <xsl:if test="$UCUM-time">
            <xsl:choose>
                <xsl:when test="$UCUM-time = 's'">seconde</xsl:when>
                <xsl:when test="$UCUM-time = 'min'">minuut</xsl:when>
                <xsl:when test="$UCUM-time = 'h'">uur</xsl:when>
                <xsl:when test="$UCUM-time = 'd'">dag</xsl:when>
                <xsl:when test="$UCUM-time = 'wk'">week</xsl:when>
                <xsl:when test="$UCUM-time = 'mo'">maand</xsl:when>
                <xsl:when test="$UCUM-time = 'a'">jaar</xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat('onbekende tijdseenheid: ', $UCUM-time)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="date"/>
    </xd:doc>
    <xsl:function name="nf:day-of-week" as="xs:integer?">
        <!-- courtesy to http://www.xsltfunctions.com/xsl/functx_day-of-week.html -->
        <xsl:param name="date" as="xs:anyAtomicType?"/>
        <xsl:sequence select="
                if (empty($date))
                then
                    ()
                else
                    xs:integer((xs:date($date) - xs:date('1901-01-06'))
                    div xs:dayTimeDuration('P1D')) mod 7
                "/>
    </xsl:function>


</xsl:stylesheet>
