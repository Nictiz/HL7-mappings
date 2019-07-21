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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:include href="../hl7/hl7_2_ada_hl7_include.xsl"/>

    <xsl:variable name="transaction-name">beschikbaarstellen_medicatiegegevens</xsl:variable>

    <xd:doc>
        <xd:desc>Creates ada attributes taking a hl7 code element as input</xd:desc>
        <xd:param name="current-hl7-code">The hl7 code element for which to create the attributes</xd:param>
    </xd:doc>
    <xsl:template name="mp9-code-attribs">
        <xsl:param name="current-hl7-code" as="element()?" select="."/>

        <xsl:for-each select="$current-hl7-code">
            <xsl:choose>
                <xsl:when test=".[@code]">
                    <xsl:attribute name="code" select="./@code"/>
                    <xsl:attribute name="codeSystem" select="./@codeSystem"/>
                    <xsl:if test="./@displayName">
                        <xsl:attribute name="displayName" select="./@displayName"/>
                    </xsl:if>
                    <xsl:if test="./@codeSystemName">
                        <xsl:attribute name="codeSystemName" select="./@codeSystemName"/>
                    </xsl:if>
                </xsl:when>
                <xsl:when test=".[@nullFlavor]">
                    <xsl:attribute name="code" select="./@nullFlavor"/>
                    <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                    <xsl:attribute name="displayName" select="
                            if (./@nullFlavor = 'OTH') then
                                'overig'
                            else
                                if (./@nullFlavor = 'UNK') then
                                    'onbekend'
                                else
                                    if (./@nullFlavor = 'NI') then
                                        'geen informatie'
                                    else
                                        'unsupported_nullFlavor'"/>
                    <xsl:for-each select="./hl7:originalText">
                        <xsl:attribute name="originalText" select="."/>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="PIVL_TS-HD"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-toedieningsschema"/>
    </xd:doc>
    <xsl:template name="mp9-dagdeel">
        <xsl:param name="PIVL_TS-HD"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-toedieningsschema"/>
        <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'dagdeel']/@type"/>
        <!-- Nacht -->
        <xsl:for-each select="$PIVL_TS-HD[hl7nl:phase/hl7nl:low/@value = '1970010100']">
            <dagdeel code="2546009" displayName="'s nachts" codeSystem="{$oidSNOMEDCT}" codeSystemName="SNOMED CT" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
        </xsl:for-each>
        <!-- Ochtend -->
        <xsl:for-each select="$PIVL_TS-HD[hl7nl:phase/hl7nl:low/@value = '1970010106']">
            <dagdeel code="73775008" displayName="'s ochtends" codeSystem="{$oidSNOMEDCT}" codeSystemName="SNOMED CT" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
        </xsl:for-each>
        <!-- Middag -->
        <xsl:for-each select="$PIVL_TS-HD[hl7nl:phase/hl7nl:low/@value = '1970010112']">
            <dagdeel code="255213009" displayName="'s middags" codeSystem="{$oidSNOMEDCT}" codeSystemName="SNOMED CT" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
        </xsl:for-each>
        <!-- Avond -->
        <xsl:for-each select="$PIVL_TS-HD[hl7nl:phase/hl7nl:low/@value = '1970010118']">
            <dagdeel code="3157002" displayName="'s avonds" codeSystem="{$oidSNOMEDCT}" codeSystemName="SNOMED CT" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="current-hl7-mar"/>
        <xd:param name="hl7-pivl"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-gebruiksinstructie"/>
    </xd:doc>
    <xsl:template name="mp9-doseerinstructie-from-mp612-cyclisch">
        <xsl:param name="current-hl7-mar"/>
        <xsl:param name="hl7-pivl"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-gebruiksinstructie"/>
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
                    <xsl:variable name="xsd-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'herhaalperiode_cyclisch_schema']/@type"/>
                    <herhaalperiode_cyclisch_schema value="{./@value}" unit="{./@unit}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                </xsl:for-each>
                <!-- doseerinstructie -->
                <xsl:for-each select="$hl7-pivl[hl7:phase[hl7:width]]">
                    <xsl:variable name="xsd-doseerinstructie-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'doseerinstructie']/@type"/>
                    <xsl:variable name="xsd-doseerinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-doseerinstructie-complexType]"/>
                    <doseerinstructie conceptId="{$xsd-doseerinstructie/xs:attribute[@name='conceptId']/@fixed}">
                        <!-- volgnummer niet opnemen, is altijd 1 voor deze conversie -->
                        <!-- doseerduur cyclisch schema -->
                        <xsl:for-each select="./hl7:phase/hl7:width">
                            <xsl:variable name="xsd-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'doseerduur']/@type"/>
                            <doseerduur value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                        </xsl:for-each>
                        <!-- dosering, in 6.12 kan er maar één zijn per mar dus per doseerinstructie -->
                        <!-- in MP 9 mag dosering weer herhalen binnen een doseerinstructie, maar dit kan niet met 6.12 -->
                        <xsl:variable name="xsd-dosering-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'dosering']/@type"/>
                        <xsl:variable name="xsd-dosering" select="$xsd-ada//xs:complexType[@name = $xsd-dosering-complexType]"/>
                        <dosering conceptId="{$xsd-dosering/xs:attribute[@name='conceptId']/@fixed}">
                            <!-- keerdosis -->
                            <xsl:call-template name="mp9-keerdosis">
                                <xsl:with-param name="hl7-doseQuantity" select="$current-hl7-mar/doseQuantity"/>
                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
                            </xsl:call-template>
                            <!-- toedieningsschema -->
                            <xsl:variable name="xsd-toedieningsschema-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningsschema']/@type"/>
                            <xsl:variable name="xsd-toedieningsschema" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningsschema-complexType]"/>
                            <toedieningsschema conceptId="{$xsd-toedieningsschema/xs:attribute[@name='conceptId']/@fixed}">
                                <xsl:call-template name="mp9-vaste-frequentie-from-mp-612">
                                    <xsl:with-param name="current-hl7-pivl" select="$hl7-pivl[not(hl7:phase)]"/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                </xsl:call-template>
                            </toedieningsschema>
                            <!-- zo nodig -->
                            <xsl:if test="./ancestor::hl7:medicationAdministrationRequest/hl7:precondition/hl7:observationEventCriterion/hl7:code | ./ancestor::hl7:medicationAdministrationRequest/hl7:maxDoseQuantity">
                                <xsl:call-template name="mp9-zonodig">
                                    <xsl:with-param name="max-dose" select="./ancestor::hl7:medicationAdministrationRequest/hl7:maxDoseQuantity"/>
                                    <xsl:with-param name="zonodig-code" select="./ancestor::hl7:medicationAdministrationRequest/hl7:precondition/hl7:observationEventCriterion/hl7:code"/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
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
                        <xsl:comment>Found more than one 'herhaalperiode_cyclisch_schema' in input. Cannot convert this and the corresponding doseerinstructie(s) into structured output. Please refer to textual description.</xsl:comment>
                    </xsl:when>
                    <xsl:when test="not($aantal-delen-cyclisch = count($hl7-pivl))">
                        <xsl:comment>Found a combination of cyclic and non-cyclic dosing schedules.  Cannot convert this and the corresponding doseerinstructie(s) into structured output.Please refer to textual description.</xsl:comment>
                    </xsl:when>
                    <xsl:otherwise><xsl:value-of select="."/>Unexpected error. Cannot convert doseerinstructie(s) into structured output.</xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="current-hl7-mar"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-gebruiksinstructie"/>
    </xd:doc>
    <xsl:template name="mp9-doseerinstructie-from-mp612-eenmalig">
        <xsl:param name="current-hl7-mar"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-gebruiksinstructie"/>
        <xsl:comment>mp9-doseerinstructie-from-mp612-eenmalig</xsl:comment>
        <xsl:for-each select="$current-hl7-mar">
            <xsl:variable name="xsd-doseerinstructie-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'doseerinstructie']/@type"/>
            <xsl:variable name="xsd-doseerinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-doseerinstructie-complexType]"/>
            <doseerinstructie conceptId="{$xsd-doseerinstructie/xs:attribute[@name='conceptId']/@fixed}">
                <!-- volgnummer niet opnemen, is altijd 1 voor deze conversie -->
                <!-- dosering, in 6.12 kan er maar één zijn per mar dus per doseerinstructie -->
                <!-- in MP 9 mag dosering weer herhalen binnen een doseerinstructie, maar dit kan niet met 6.12 -->
                <xsl:variable name="xsd-dosering-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'dosering']/@type"/>
                <xsl:variable name="xsd-dosering" select="$xsd-ada//xs:complexType[@name = $xsd-dosering-complexType]"/>
                <dosering conceptId="{$xsd-dosering/xs:attribute[@name='conceptId']/@fixed}">
                    <!-- keerdosis -->
                    <xsl:call-template name="mp9-keerdosis">
                        <xsl:with-param name="hl7-doseQuantity" select="./hl7:doseQuantity"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
                    </xsl:call-template>
                    <xsl:variable name="xsd-toedieningsschema-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningsschema']/@type"/>
                    <xsl:variable name="xsd-toedieningsschema" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningsschema-complexType]"/>
                    <toedieningsschema conceptId="{$xsd-toedieningsschema/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
                        <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
                        <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                            <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                            <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                            <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                                <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                                <vaste_waarde value="1" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                            </aantal>
                        </frequentie>
                    </toedieningsschema>
                </dosering>
            </doseerinstructie>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="current-hl7-mar"/>
        <xd:param name="hl7-pivl"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-gebruiksinstructie"/>
    </xd:doc>
    <xsl:template name="mp9-doseerinstructie-from-mp612-tijden">
        <xsl:param name="current-hl7-mar"/>
        <xsl:param name="hl7-pivl"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-gebruiksinstructie"/>
        <xsl:comment>mp9-doseerinstructie-from-mp612-tijden</xsl:comment>
        <xsl:for-each select="$current-hl7-mar">
            <xsl:variable name="xsd-doseerinstructie-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'doseerinstructie']/@type"/>
            <xsl:variable name="xsd-doseerinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-doseerinstructie-complexType]"/>
            <doseerinstructie conceptId="{$xsd-doseerinstructie/xs:attribute[@name='conceptId']/@fixed}">
                <!-- volgnummer niet opnemen, is altijd 1 voor deze conversie -->
                <!-- dosering, in 6.12 kan er maar één zijn per mar dus per doseerinstructie -->
                <!-- in MP 9 mag dosering weer herhalen binnen een doseerinstructie, maar dit kan niet met 6.12 -->
                <xsl:variable name="xsd-dosering-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'dosering']/@type"/>
                <xsl:variable name="xsd-dosering" select="$xsd-ada//xs:complexType[@name = $xsd-dosering-complexType]"/>
                <dosering conceptId="{$xsd-dosering/xs:attribute[@name='conceptId']/@fixed}">
                    <!-- keerdosis -->
                    <xsl:call-template name="mp9-keerdosis">
                        <xsl:with-param name="hl7-doseQuantity" select="./hl7:doseQuantity"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
                    </xsl:call-template>
                    <xsl:variable name="xsd-toedieningsschema-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningsschema']/@type"/>
                    <xsl:variable name="xsd-toedieningsschema" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningsschema-complexType]"/>
                    <toedieningsschema conceptId="{$xsd-toedieningsschema/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
                        <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
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
                                <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                                    <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                                    <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                                    <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                                        <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                                        <vaste_waarde value="1" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                    </aantal>
                                    <xsl:variable name="xsd-complexType" select="$xsd-frequentie//xs:element[@name = 'tijdseenheid']/@type"/>
                                    <tijdseenheid value="{$hl7-pivl[1]/hl7:period/@value}" unit="{nf:convertTime_UCUM2ADA_unit($hl7-pivl[1]/hl7:period/@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                </frequentie>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:comment>Unexpected error with contents of period in toedieningsschema for toedieningstijd</xsl:comment>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:for-each select="$hl7-pivl[hl7:phase/hl7:center]">
                            <!-- toedientijd -->
                            <xsl:choose>
                                <xsl:when test="./hl7:period[@value castable as xs:integer and @value &gt;= 1][@unit = 'd']">
                                    <!-- output the toedieningstijd -->
                                    <xsl:variable name="xsd-toedientijd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'toedientijd']/@type"/>
                                    <xsl:variable name="xsd-toedientijd" select="$xsd-ada//xs:complexType[@name = $xsd-toedientijd-complexType]"/>
                                    <toedientijd value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./hl7:phase/hl7:center/@value), nf:determine_date_precision(./hl7:phase/hl7:center/@value))}" conceptId="{$xsd-toedientijd/xs:attribute[@name='conceptId']/@fixed}"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:comment><!-- Do nothing --></xsl:comment>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </toedieningsschema>
                    <xsl:if test="./hl7:precondition/hl7:observationEventCriterion/hl7:code | ./ancestor::hl7:medicationAdministrationRequest/hl7:maxDoseQuantity">
                        <xsl:call-template name="mp9-zonodig">
                            <xsl:with-param name="max-dose" select="./ancestor::hl7:medicationAdministrationRequest/hl7:maxDoseQuantity"/>
                            <xsl:with-param name="zonodig-code" select="./hl7:precondition/hl7:observationEventCriterion/hl7:code"/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
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
        <xd:param name="xsd-ada">The xsd of the ada schema to retrieve the conceptId's</xd:param>
        <xd:param name="xsd-gebruiksinstructie">The xsd element of gebruiksinstructie to retrieve the conceptId's</xd:param>
    </xd:doc>
    <xsl:template name="mp9-doseerinstructie-from-mp612-var-freq">
        <xsl:param name="hl7-mar" as="element(hl7:medicationAdministrationRequest)*"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-gebruiksinstructie"/>
        <xsl:comment>mp9-doseerinstructie-from-mp612-var-freq</xsl:comment>
        <xsl:choose>
            <xsl:when test="count($hl7-mar) = 2">
                <xsl:variable name="xsd-doseerinstructie-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'doseerinstructie']/@type"/>
                <xsl:variable name="xsd-doseerinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-doseerinstructie-complexType]"/>
                <doseerinstructie conceptId="{$xsd-doseerinstructie/xs:attribute[@name='conceptId']/@fixed}">
                    <!-- volgnummer niet opnemen, is altijd 1 voor deze conversie -->
                    <!-- dosering, in 6.12 kan er maar één zijn per mar dus per doseerinstructie -->
                    <!-- in MP 9 mag dosering weer herhalen binnen een doseerinstructie, maar dit kan niet met 6.12 -->
                    <xsl:variable name="xsd-dosering-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'dosering']/@type"/>
                    <xsl:variable name="xsd-dosering" select="$xsd-ada//xs:complexType[@name = $xsd-dosering-complexType]"/>
                    <dosering conceptId="{$xsd-dosering/xs:attribute[@name='conceptId']/@fixed}">
                        <!-- keerdosis, must be the same in first and second hl7-mar, so simply take the first mar -->
                        <xsl:call-template name="mp9-keerdosis">
                            <xsl:with-param name="hl7-doseQuantity" select="$hl7-mar[1]/hl7:doseQuantity"/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
                        </xsl:call-template>
                        <xsl:variable name="xsd-toedieningsschema-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningsschema']/@type"/>
                        <xsl:variable name="xsd-toedieningsschema" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningsschema-complexType]"/>
                        <toedieningsschema conceptId="{$xsd-toedieningsschema/xs:attribute[@name='conceptId']/@fixed}">
                            <xsl:variable name="min_frequentie_one_decimal" select="nf:one_decimal($hl7-mar[not(hl7:precondition)]//hl7:period/@value)"/>
                            <xsl:variable name="min_frequentie_decimal" select="$min_frequentie_one_decimal - floor($min_frequentie_one_decimal)"/>
                            <xsl:variable name="max_frequentie_one_decimal" select="nf:one_decimal($hl7-mar[hl7:precondition]//hl7:period/@value)"/>
                            <xsl:variable name="max_frequentie_decimal" select="$max_frequentie_one_decimal - floor($max_frequentie_one_decimal)"/>
                            <!-- only output the structured frequentie if the one decimal rounded to 0 -->
                            <xsl:choose>
                                <xsl:when test="$min_frequentie_decimal = 0 and $max_frequentie_decimal = 0">
                                    <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
                                    <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
                                    <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                                        <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                                        <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                                        <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                                            <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'min']/@type"/>
                                            <min value="{round($min_frequentie_one_decimal)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                            <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'max']/@type"/>
                                            <max value="{round($min_frequentie_one_decimal + $max_frequentie_one_decimal)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                        </aantal>
                                        <xsl:variable name="xsd-complexType" select="$xsd-frequentie//xs:element[@name = 'tijdseenheid']/@type"/>
                                        <tijdseenheid value="{nf:tijdseenheid-aantal($hl7-mar[1]//hl7:period/@value)}" unit="{nf:convertTime_UCUM2ADA_unit($hl7-mar[1]//hl7:period/@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                    </frequentie>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:comment>At least one of the periods from the input hl7 cannot be properly converted to a frequency integer. 
                                            Fixed period = <xsl:value-of select="$hl7-mar[not(hl7:precondition)]//hl7:period/@value"/> <xsl:value-of select="$hl7-mar[not(hl7:precondition)]//hl7:period/@unit"/> resulting in frequency/aantal/min rounded to one decimal of: <xsl:value-of select="$min_frequentie_one_decimal"/>
                                           As Needed (zo nodig) period = <xsl:value-of select="$hl7-mar[hl7:precondition]//hl7:period/@value"/> <xsl:value-of select="$hl7-mar[hl7:precondition]//hl7:period/@unit"/> resulting in frequency/aantal/max rounded to one decimal of: <xsl:value-of select="$max_frequentie_one_decimal"/>
                                    </xsl:comment>
                                </xsl:otherwise>
                            </xsl:choose>
                        </toedieningsschema>
                        <!-- eventueel een maximale dosering -->
                        <xsl:choose>
                            <xsl:when test="count($hl7-mar/hl7:maxDoseQuantity) = 1">
                                <xsl:call-template name="mp9-zonodig">
                                    <xsl:with-param name="max-dose" select="$hl7-mar/hl7:maxDoseQuantity"/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="deep-equal($hl7-mar[1]/hl7:maxDoseQuantity, $hl7-mar[2]/hl7:maxDoseQuantity)">
                                <xsl:call-template name="mp9-zonodig">
                                    <xsl:with-param name="max-dose" select="$hl7-mar[1]/hl7:maxDoseQuantity"/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:comment>Found conflicting maxDoseQuantity, both "<xsl:value-of select="string-join($hl7-mar[hl7:precondition]/hl7:maxDoseQuantity//@*, ' ')"/>" and "<xsl:value-of select="string-join($hl7-mar[not(hl7:precondition)]/hl7:maxDoseQuantity//@*, ' ')"/>". Cannot output the maxDose in structured format, refer to text.</xsl:comment>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- toedieningssnelheid en toedieningsduur niet ondersteund in 6.12-->
                    </dosering>
                </doseerinstructie>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>Unexpected amount of medicationAdministrationRequests, expected 2 but received: <xsl:value-of select="count($hl7-mar)"/></xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
        <!-- <xsl:for-each select="$hl7-mar">
            <xsl:variable name="hl7-pivl" select=".//*[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]"/>
            <xsl:call-template name="mp9-doseerinstructie-from-mp612-freq">
                <xsl:with-param name="current-hl7-mar" select="."/>
                <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
                <xsl:with-param name="xsd-gebruiksinstructie" select="$xsd-gebruiksinstructie"/>
                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
            </xsl:call-template>
        </xsl:for-each>-->
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="current-hl7-mar"/>
        <xd:param name="hl7-pivl"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-gebruiksinstructie"/>
    </xd:doc>
    <xsl:template name="mp9-doseerinstructie-from-mp612-freq">
        <xsl:param name="current-hl7-mar"/>
        <xsl:param name="hl7-pivl"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-gebruiksinstructie"/>
        <xsl:comment>mp9-doseerinstructie-from-mp612-freq</xsl:comment>
        <xsl:for-each select="$current-hl7-mar">
            <xsl:variable name="xsd-doseerinstructie-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'doseerinstructie']/@type"/>
            <xsl:variable name="xsd-doseerinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-doseerinstructie-complexType]"/>
            <doseerinstructie conceptId="{$xsd-doseerinstructie/xs:attribute[@name='conceptId']/@fixed}">
                <!-- volgnummer niet opnemen, is altijd 1 voor deze conversie -->
                <!-- dosering, in 6.12 kan er maar één zijn per mar dus per doseerinstructie -->
                <!-- in MP 9 mag dosering weer herhalen binnen een doseerinstructie, maar dit kan niet met 6.12 -->
                <xsl:variable name="xsd-dosering-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'dosering']/@type"/>
                <xsl:variable name="xsd-dosering" select="$xsd-ada//xs:complexType[@name = $xsd-dosering-complexType]"/>
                <dosering conceptId="{$xsd-dosering/xs:attribute[@name='conceptId']/@fixed}">
                    <!-- keerdosis -->
                    <xsl:call-template name="mp9-keerdosis">
                        <xsl:with-param name="hl7-doseQuantity" select="./hl7:doseQuantity"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
                    </xsl:call-template>
                    <xsl:variable name="xsd-toedieningsschema-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningsschema']/@type"/>
                    <xsl:variable name="xsd-toedieningsschema" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningsschema-complexType]"/>
                    <toedieningsschema conceptId="{$xsd-toedieningsschema/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:call-template name="mp9-vaste-frequentie-from-mp-612">
                            <xsl:with-param name="current-hl7-pivl" select="$hl7-pivl"/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                        </xsl:call-template>
                    </toedieningsschema>
                    <!-- eventueel een zo nodig criterium -->
                    <xsl:if test="./hl7:precondition/hl7:observationEventCriterion/hl7:code | ./hl7:maxDoseQuantity">
                        <xsl:call-template name="mp9-zonodig">
                            <xsl:with-param name="max-dose" select="./hl7:maxDoseQuantity"/>
                            <xsl:with-param name="zonodig-code" select="./hl7:precondition/hl7:observationEventCriterion/hl7:code"/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
                        </xsl:call-template>
                    </xsl:if>
                    <!-- toedieningssnelheid en toedieningsduur niet ondersteund in 6.12-->
                </dosering>
            </doseerinstructie>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="effectiveTimes-eenmalig"/>
        <xd:param name="hl7-current-comp"/>
        <xd:param name="mar-sorted"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-comp"/>
    </xd:doc>
    <xsl:template name="mp9-gebruiksinstructie-from-mp612-2">
        <xsl:param name="effectiveTimes-eenmalig"/>
        <xsl:param name="hl7-current-comp" select="." as="element()?"/>
        <xsl:param name="mar-sorted"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-comp"/>
        <!-- gebruiksinstructie -->
        <xsl:variable name="xsd-gebruiksinstructie-complexType" select="$xsd-comp//xs:element[@name = 'gebruiksinstructie']/@type"/>
        <xsl:variable name="xsd-gebruiksinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-gebruiksinstructie-complexType]"/>
        <xsl:comment>mp9-gebruiksinstructie-from-mp612-2</xsl:comment>
        <gebruiksinstructie conceptId="{$xsd-gebruiksinstructie/xs:attribute[@name='conceptId']/@fixed}">
            <!-- omschrijving -->
            <xsl:variable name="omschrijving">
                <!-- alleen unieke teksten: filter identieke teksten weg -->
                <xsl:for-each select="distinct-values($mar-sorted/hl7:text/text())">
                    <xsl:if test="position() > 1">; </xsl:if>
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:variable name="xsd-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'omschrijving']/@type"/>
            <omschrijving value="{$omschrijving}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            <!-- toedieningsweg -->
            <xsl:variable name="xsd-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'toedieningsweg']/@type"/>
            <toedieningsweg conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
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
            <xsl:variable name="xsd-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'aanvullende_instructie']/@type"/>
            <xsl:for-each-group select="$mar-sorted/hl7:support2/hl7:medicationAdministrationInstruction/hl7:code[@code]" group-by="@code">
                <xsl:for-each-group select="current-group()" group-by="@codeSystem">
                    <xsl:for-each select="current-group()[1]">
                        <aanvullende_instructie conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
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
                        <aanvullende_instructie conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
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
            <xsl:variable name="hl7-pivl" select="$mar-sorted//*[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]"/>
            <xsl:variable name="hl7-ivl" select="$mar-sorted//*[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]"/>
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
                <xsl:when test="count($effectiveTimes-eenmalig) = 1 and count($mar-sorted) = 1">
                    <xsl:call-template name="mp9-doseerinstructie-from-mp612-eenmalig">
                        <xsl:with-param name="current-hl7-mar" select="$mar-sorted"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-gebruiksinstructie" select="$xsd-gebruiksinstructie"/>
                    </xsl:call-template>
                </xsl:when>
                <!-- frequentie, in 1 mar in 1 PIVL_TS (zonder phase) -->
                <xsl:when test="count($mar-sorted) = 1 and not($hl7-pivl[hl7:phase]) and (count($hl7-pivl[not(hl7:phase)]) = 1 or not($hl7-pivl))">
                    <xsl:call-template name="mp9-doseerinstructie-from-mp612-freq">
                        <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
                        <xsl:with-param name="current-hl7-mar" select="$mar-sorted"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-gebruiksinstructie" select="$xsd-gebruiksinstructie"/>
                    </xsl:call-template>
                </xsl:when>
                <!-- variabele frequentie in effectiveTime of comp, 2 mars, 1 vast, 1 zo nodig, parallel -->
                <xsl:when test="count($mar-sorted) = 2 and count($mar-sorted[hl7:precondition/hl7:observationEventCriterion/hl7:code[@code = $NHGZoNodigNumeriek and @codeSystem = $oidNHGTabel25BCodesNumeriek]]) = 1 and $parallel">
                    <xsl:choose>
                        <xsl:when test="deep-equal($mar-sorted[1]/hl7:doseQuantity, $mar-sorted[2]/hl7:doseQuantity)">
                            <!-- x à y maal per tijdseenheid een bepaalde keerdosis, bijv. 1 à 2 maal per dag 1 stuk -->
                            <xsl:comment>variabele frequentie in effectiveTime of comp, 2 mars, 1 vast, 1 zo nodig, parallel, zelfde keerdosis</xsl:comment>
                            <!-- let's make a frequentie with a min/max -->
                            <xsl:call-template name="mp9-doseerinstructie-from-mp612-var-freq">
                                <xsl:with-param name="hl7-mar" select="$mar-sorted"/>
                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                <xsl:with-param name="xsd-gebruiksinstructie" select="$xsd-gebruiksinstructie"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:comment>variabele frequentie in effectiveTime of comp, 2 mars, 1 vast, 1 zo nodig, parallel, verschillende keerdosis</xsl:comment>
                            <xsl:for-each select="$mar-sorted">
                                <xsl:variable name="hl7-pivl" select=".//*[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]"/>
                                <xsl:call-template name="mp9-doseerinstructie-from-mp612-freq">
                                    <xsl:with-param name="current-hl7-mar" select="."/>
                                    <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
                                    <xsl:with-param name="xsd-gebruiksinstructie" select="$xsd-gebruiksinstructie"/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- variabele frequentie in effectiveTime of comp, 2 mars, 1 vast, minimaal een precondition (indien 1 is die anders dan de 1137, want anders eerder gematcht), parallel -->
                <xsl:when test="count($mar-sorted) = 2 and (count($mar-sorted[hl7:precondition]) gt 0 or $mar-sorted[hl7:precondition/hl7:observationEventCriterion/hl7:code[not(@code = $NHGZoNodigNumeriek and @codeSystem = $oidNHGTabel25BCodesNumeriek)]]) and $parallel">
                    <xsl:comment>variabele frequentie in effectiveTime of comp, 2 mars, 1 vast, meer dan één zo nodig, parallel, verschillende keerdosis</xsl:comment>
                    <xsl:for-each select="$mar-sorted">
                        <xsl:variable name="hl7-pivl" select=".//*[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]"/>
                        <xsl:call-template name="mp9-doseerinstructie-from-mp612-freq">
                            <xsl:with-param name="current-hl7-mar" select="."/>
                            <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
                            <xsl:with-param name="xsd-gebruiksinstructie" select="$xsd-gebruiksinstructie"/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </xsl:when>
                <!-- cyclisch schema (pil) in 1 mar -->
                <xsl:when test="$hl7-pivl[hl7:phase/hl7:width][hl7:period] and count($mar-sorted) = 1">
                    <xsl:call-template name="mp9-doseerinstructie-from-mp612-cyclisch">
                        <xsl:with-param name="current-hl7-mar" select="$mar-sorted"/>
                        <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-gebruiksinstructie" select="$xsd-gebruiksinstructie"/>
                    </xsl:call-template>
                </xsl:when>
                <!-- toedientijden - 1 mar, meerdere comps of 1 comp of 1 effectiveTime met tijd, frequentie moet overal hetzelfde zijn en in dagen -->
                <xsl:when test="count($mar-sorted) = 1 and $hl7-pivl[hl7:phase/hl7:center] and count(distinct-values($hl7-pivl/hl7:period/@value)) = 1 and not($hl7-pivl[hl7:period/@unit != 'd'])">
                    <xsl:call-template name="mp9-doseerinstructie-from-mp612-tijden">
                        <xsl:with-param name="current-hl7-mar" select="$mar-sorted"/>
                        <xsl:with-param name="hl7-pivl" select="$hl7-pivl"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-gebruiksinstructie" select="$xsd-gebruiksinstructie"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <!-- de rest (nog) niet gestructureerd opleveren -->
                    <xsl:comment>Non-supported (complex) dosing scheduled encountered in 6.12. No structured output, please refer to textual description.</xsl:comment>
                    <!-- maar wel de maximale dosering, indien aanwezig in 1 MAR-->
                    <xsl:if test="count($mar-sorted) = 1 and $mar-sorted/hl7:maxDoseQuantity[.//@value]">
                        <xsl:variable name="xsd-doseerinstructie-complexType" select="$xsd-gebruiksinstructie//xs:element[@name = 'doseerinstructie']/@type"/>
                        <xsl:variable name="xsd-doseerinstructie" select="$xsd-ada//xs:complexType[@name = $xsd-doseerinstructie-complexType]"/>
                        <doseerinstructie conceptId="{$xsd-doseerinstructie/xs:attribute[@name='conceptId']/@fixed}">
                            <xsl:variable name="xsd-dosering-complexType" select="$xsd-doseerinstructie//xs:element[@name = 'dosering']/@type"/>
                            <xsl:variable name="xsd-dosering" select="$xsd-ada//xs:complexType[@name = $xsd-dosering-complexType]"/>
                            <dosering conceptId="{$xsd-dosering/xs:attribute[@name='conceptId']/@fixed}">
                                <xsl:call-template name="mp9-zonodig">
                                    <!-- don't pass the zo_nodig code, only the max-dose here -->
                                    <xsl:with-param name="max-dose" select="$mar-sorted/hl7:maxDoseQuantity"/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-dosering" select="$xsd-dosering"/>
                                </xsl:call-template>
                            </dosering>
                        </doseerinstructie>
                    </xsl:if>

                </xsl:otherwise>
            </xsl:choose>
        </gebruiksinstructie>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="hl7-comp"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-comp"/>
    </xd:doc>
    <xsl:template name="mp9-gebruiksinstructie-from-mp9">
        <xsl:param name="hl7-comp" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-comp"/>
        <xsl:variable name="xsd-gebruiksinstructie" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-comp, 'gebruiksinstructie'))"/>
        <xsl:for-each select="$hl7-comp">
            <!-- still can refactor with new generic functions -->
            <gebruiksinstructie>
                <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-gebruiksinstructie)"/>

                <!-- omschrijving -->
                <xsl:for-each select="./hl7:text">
                    <omschrijving value="{./text()}">
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-gebruiksinstructie, 'omschrijving')))"/>
                    </omschrijving>
                </xsl:for-each>
                <!-- toedieningsweg -->
                <xsl:for-each select="./hl7:routeCode">
                    <toedieningsweg>
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-gebruiksinstructie, 'toedieningsweg')))"/>
                        <xsl:call-template name="mp9-code-attribs">
                            <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                    </toedieningsweg>
                </xsl:for-each>
                <!-- aanvullende_instructie -->
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9085']/hl7:code">
                    <aanvullende_instructie>
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-gebruiksinstructie, 'aanvullende_instructie')))"/>
                        <xsl:call-template name="mp9-code-attribs">
                            <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                    </aanvullende_instructie>
                </xsl:for-each>
                <xsl:variable name="hl7-doseerinstructie" select="./hl7:entryRelationship[hl7:substanceAdministration/hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9149']"/>
                <!-- herhaalperiode_cyclisch_schema -->
                <!-- er mag er maar eentje zijn -->
                <xsl:for-each select="$hl7-doseerinstructie/hl7:substanceAdministration/hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/hl7:comp[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and not(@alignment)][hl7nl:phase[hl7nl:width]]/hl7nl:period">
                    <herhaalperiode_cyclisch_schema value="{./@value}" unit="{./@unit}">
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-gebruiksinstructie, 'herhaalperiode_cyclisch_schema')))"/>
                    </herhaalperiode_cyclisch_schema>
                </xsl:for-each>
                <!-- doseerinstructie -->
                <xsl:for-each select="$hl7-doseerinstructie">
                    <xsl:variable name="xsd-doseerinstructie" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-gebruiksinstructie, 'doseerinstructie'))"/>
                    <doseerinstructie>
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-doseerinstructie)"/>
                        <!-- volgnummer -->
                        <xsl:for-each select="./hl7:sequenceNumber">
                            <volgnummer value="{./@value}">
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-doseerinstructie, 'volgnummer')))"/>
                            </volgnummer>
                        </xsl:for-each>
                        <!-- doseerduur -->
                        <xsl:choose>
                            <!-- doseerduur in Cyclisch doseerschema. -->
                            <xsl:when test="./hl7:substanceAdministration/hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][hl7:comp[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and not(@alignment)][hl7nl:period][hl7nl:phase[hl7nl:width]]]/hl7:comp/hl7nl:phase/hl7nl:width">
                                <xsl:for-each select="./hl7:substanceAdministration/hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][hl7:comp[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and not(@alignment)][hl7nl:period][hl7nl:phase[hl7nl:width]]]/hl7:comp/hl7nl:phase/hl7nl:width">
                                    <doseerduur value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}">
                                        <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-doseerinstructie, 'doseerduur')))"/>
                                    </doseerduur>
                                </xsl:for-each>
                            </xsl:when>
                            <!-- overige gevallen -->
                            <xsl:otherwise>
                                <xsl:for-each select="./hl7:substanceAdministration/hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/hl7:width">
                                    <doseerduur value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}">
                                        <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-doseerinstructie, 'doseerduur')))"/>
                                    </doseerduur>
                                </xsl:for-each>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- dosering -->
                        <xsl:for-each select="./hl7:substanceAdministration">
                            <xsl:variable name="xsd-dosering" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-doseerinstructie, 'dosering'))"/>
                            <dosering>
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-dosering)"/>
                                <!-- keerdosis -->
                                <xsl:for-each select="./hl7:doseQuantity">
                                    <xsl:variable name="xsd-keerdosis" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-dosering, 'keerdosis'))"/>
                                    <keerdosis>
                                        <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-keerdosis)"/>
                                        <xsl:variable name="xsd-aantal" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-keerdosis, 'aantal'))"/>
                                        <aantal>
                                            <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-aantal)"/>
                                            <xsl:for-each select="./hl7:low/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <min value="{./@value}">
                                                    <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-aantal, 'min')))"/>
                                                </min>
                                            </xsl:for-each>
                                            <xsl:for-each select="./hl7:center/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <vaste_waarde value="{./@value}">
                                                    <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-aantal, 'vaste_waarde')))"/>
                                                </vaste_waarde>
                                            </xsl:for-each>
                                            <xsl:for-each select="./hl7:high/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <max value="{./@value}">
                                                    <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-aantal, 'max')))"/>
                                                </max>
                                            </xsl:for-each>
                                        </aantal>
                                        <xsl:for-each select="(./*/hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                                            <eenheid>
                                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-keerdosis, 'eenheid')))"/>
                                                <xsl:call-template name="mp9-code-attribs">
                                                    <xsl:with-param name="current-hl7-code" select="."/>
                                                </xsl:call-template>
                                            </eenheid>
                                        </xsl:for-each>
                                    </keerdosis>
                                </xsl:for-each>
                                <!-- toedieningsschema -->
                                <!-- er moet een PIVL_TS zijn om een toedieningsschema te maken -->
                                <xsl:if test=".//*[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')]">
                                    <xsl:variable name="xsd-toedieningsschema" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-dosering, 'toedieningsschema'))"/>
                                    <toedieningsschema>
                                        <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-toedieningsschema)"/>
                                        <!-- eenvoudig doseerschema met alleen één frequentie -->
                                        <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')][@isFlexible = 'true'][not(@alignment)][hl7nl:frequency][not(hl7nl:phase)]">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339">
                                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                                <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                        <!-- X tot Y maal per T -->
                                        <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')][not(@alignment)][hl7nl:frequency/hl7nl:numerator/hl7nl:uncertainRange]">
                                            <xsl:variable name="xsd-frequentie" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-toedieningsschema, 'frequentie'))"/>
                                            <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                                                <xsl:variable name="xsd-aantal" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-frequentie, 'aantal'))"/>
                                                <aantal conceptId="{nf:getADAComplexTypeConceptId($xsd-aantal)}">
                                                    <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                                                    <xsl:call-template name="handleINT">
                                                        <xsl:with-param name="in" select="hl7nl:frequency/hl7nl:numerator/hl7nl:uncertainRange/hl7nl:low"/>
                                                        <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-aantal, 'min')))"/>
                                                        <xsl:with-param name="elemName">min</xsl:with-param>
                                                    </xsl:call-template>
                                                    <xsl:call-template name="handleINT">
                                                        <xsl:with-param name="in" select="hl7nl:frequency/hl7nl:numerator/hl7nl:uncertainRange/hl7nl:high"/>
                                                        <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-aantal, 'max')))"/>
                                                        <xsl:with-param name="elemName">max</xsl:with-param>
                                                    </xsl:call-template>
                                                </aantal>
                                                <xsl:for-each select="hl7nl:frequency/hl7nl:denominator">
                                                    <xsl:call-template name="handlePQ">
                                                        <xsl:with-param name="in" as="element()">
                                                            <xsl:element name="{name(.)}" namespace="urn:hl7-nl:v3">
                                                                <xsl:copy-of select="@*"/>
                                                                <xsl:if test="@unit[not(. = '1')]">
                                                                    <xsl:attribute name="unit" select="nf:convertTime_UCUM2ADA_unit(./@unit)"/>
                                                                </xsl:if>
                                                                <xsl:copy-of select="node()"/>
                                                            </xsl:element>
                                                        </xsl:with-param>
                                                        <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-frequentie, 'tijdseenheid')))"/>
                                                        <xsl:with-param name="elemName">tijdseenheid</xsl:with-param>
                                                    </xsl:call-template>
                                                </xsl:for-each>
                                            </frequentie>
                                        </xsl:for-each>
                                        <!-- Eenvoudig doseerschema met alleen één interval.-->
                                        <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')][(@isFlexible = 'false' or not(@isFlexible))][not(@alignment)][hl7nl:frequency[hl7nl:numerator/@value]]">
                                            <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'interval']/@type"/>
                                            <xsl:variable name="interval-value" select="format-number(number(./hl7nl:frequency/hl7nl:denominator/@value) div number(./hl7nl:frequency/hl7nl:numerator/@value), '0.####')"/>
                                            <interval value="{$interval-value}" unit="{nf:convertTime_UCUM2ADA_unit(./hl7nl:frequency/hl7nl:denominator/@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                        </xsl:for-each>
                                        <!-- Eenvoudig doseerschema met één vast tijdstip. -->
                                        <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')][not(@alignment)][hl7nl:phase[not(hl7nl:width)]]">
                                            <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'toedientijd']/@type"/>
                                            <toedientijd value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./hl7nl:phase/hl7nl:low/@value), nf:determine_date_precision(./hl7nl:phase/hl7nl:low/@value))}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                        </xsl:for-each>
                                        <!-- Doseerschema met toedieningsduur. -->
                                        <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')][not(@alignment)][not(hl7nl:period)][hl7nl:phase[hl7nl:width]]">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339">
                                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                                <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                            </xsl:call-template>
                                            <xsl:for-each select="hl7nl:phase/hl7nl:low">
                                                <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'toedientijd']/@type"/>
                                                <toedientijd value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./@value), nf:determine_date_precision(./@value))}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <!--Doseerschema met meer dan één vast tijdstip.-->
                                        <xsl:for-each select="./hl7:effectiveTime[hl7:comp[not(@alignment)][hl7nl:period][hl7nl:phase[not(hl7nl:width)]]][not(hl7:comp/@alignment)][not(hl7:comp[not(hl7nl:period)])][not(hl7:comp[not(hl7nl:phase[not(hl7nl:width)])])]/hl7:comp">
                                            <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'toedientijd']/@type"/>
                                            <toedientijd value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./hl7nl:phase/hl7nl:low/@value), nf:determine_date_precision(./hl7nl:phase/hl7nl:low/@value))}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                        </xsl:for-each>
                                        <!-- Cyclisch doseerschema. -->
                                        <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][hl7:comp[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3') and not(@alignment)][hl7nl:period][hl7nl:phase[hl7nl:width]]]/hl7:comp[hl7nl:frequency]">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339">
                                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                                <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                        <!-- Eenmalig gebruik of aantal keren gebruik zonder tijd. -->
                                        <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')][not(@alignment)][hl7nl:count]/hl7nl:count">
                                            <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
                                            <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
                                            <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                                                <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                                                <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                                                <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                                                    <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                                                    <vaste_waarde value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                                </aantal>
                                            </frequentie>
                                        </xsl:for-each>
                                        <!-- Doseerschema één keer per week op één weekdag. -->
                                        <xsl:for-each select="./hl7:effectiveTime[@alignment = 'DW']">
                                            <xsl:for-each select="./hl7nl:period">
                                                <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
                                                <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
                                                <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                                                    <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                                                    <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                                                    <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                                                        <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                                                        <!-- altijd 1, 1 keer per week of 1 keer per 2 weken et cetera -->
                                                        <vaste_waarde value="1" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                                    </aantal>
                                                    <xsl:variable name="xsd-complexType" select="$xsd-frequentie//xs:element[@name = 'tijdseenheid']/@type"/>
                                                    <tijdseenheid value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                                </frequentie>
                                            </xsl:for-each>
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123_only_phase_low">
                                                <xsl:with-param name="current_PIVL" select="."/>
                                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                                <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                        <!-- Complexer doseerschema met weekdag(en). -->
                                        <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][hl7:comp/@alignment = 'DW']">
                                            <xsl:comment>Complexer doseerschema met weekdag(en).</xsl:comment>
                                            <!-- de frequentie van inname op de weekdag, bijvoorbeeld: 3x per dag iedere woensdag. 3x per dag is dan de frequentie hier -->
                                            <xsl:for-each select="./hl7:comp[@isFlexible = 'true' and hl7nl:frequency]">
                                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339">
                                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                                    <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                                </xsl:call-template>
                                            </xsl:for-each>
                                            <!-- Als niet alle weekdagen in deze dosering dezelfde toedientijden en period (frequentie van 1 maal per week of 1 maal per 2 weken) 
                                                hebben (wat in HL7 kán), dan voldoet deze doseerinstructie 
                                                niet aan het MP-9 datamodel, want daarvoor moet een separate - parallelle - dosering worden aangemaakt -->
                                            <!-- deze variablel days-with-times verzamelt de relevante gegevens uit hl7 in een overzichtelijk geheel -->
                                            <xsl:variable name="days-with-times" as="element(days)*">
                                                <xsl:for-each select="./hl7:comp[@alignment = 'DW']">
                                                    <xsl:variable name="hl7-weekdag" select="substring(./hl7nl:phase/hl7nl:low/@value, 1, 8)"/>
                                                    <xsl:variable name="hl7-tijd" select="substring(./hl7nl:phase/hl7nl:low/@value, 9, 6)"/>
                                                    <xsl:variable name="hl7-period" select="./hl7nl:period"/>
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
                                                    <day value="{./@value}">
                                                        <xsl:for-each select="current-group()">
                                                            <xsl:sort select="./@time"/>
                                                            <times period-value="{./@period-value}" period-unit="{./@period-unit}">
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
                                                    <frequency value="{./@period-value}" unit="{./@period-unit}">
                                                        <xsl:for-each-group select="current-group()" group-by="./@value">
                                                            <day value="{./@value}">
                                                                <xsl:for-each select="current-group()">
                                                                    <xsl:sort select="./@time"/>
                                                                    <times period-value="{./@period-value}" period-unit="{./@period-unit}">
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
                                                            <weekdag value="{./@value}"/>
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
                                                        <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
                                                        <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
                                                        <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                                                            <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                                                            <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                                                            <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                                                                <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                                                                <vaste_waarde value="1" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                                            </aantal>
                                                            <xsl:variable name="xsd-complexType" select="$xsd-frequentie//xs:element[@name = 'tijdseenheid']/@type"/>
                                                            <tijdseenheid value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                                        </frequentie>
                                                    </xsl:for-each>
                                                    <!-- Eerst alle toedientijden -->
                                                    <xsl:for-each select="$times-days-mp9-datamodel/times/toedientijd">
                                                        <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'toedientijd']/@type"/>
                                                        <toedientijd value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(concat('19700101',./@value)), nf:determine_date_precision(concat('19700101',./@value)))}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                                    </xsl:for-each>
                                                    <!-- Daarna alle weekdagen -->
                                                    <xsl:for-each select="$times-days-mp9-datamodel/times/weekdag">
                                                        <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'weekdag']/@type"/>
                                                        <weekdag conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
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
                                                        <xsl:with-param name="in" select="$day-with-times"/>
                                                    </xsl:call-template>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                        <!-- Doseerschema met één dagdeel -->
                                        <xsl:for-each select="./hl7:effectiveTime[@alignment = 'HD']">
                                            <xsl:call-template name="mp9-dagdeel">
                                                <xsl:with-param name="PIVL_TS-HD" select="."/>
                                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                                <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                        <!-- Complexer doseerschema met meer dan één dagdeel. -->
                                        <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'SXPR_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][hl7:comp/@alignment = 'HD']/hl7:comp">
                                            <xsl:call-template name="mp9-weekdag">
                                                <!-- FIXME: should this not be hl7nl:phase/hl7nl:low instead of .? -->
                                                <xsl:with-param name="hl7-phase-low" select="hl7nl:phase/hl7nl:low"/>
                                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                                <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                    </toedieningsschema>
                                </xsl:if>
                                <xsl:for-each select="./hl7:precondition/hl7:criterion/hl7:code">
                                    <xsl:variable name="xsd-zo_nodig" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-dosering, 'zo_nodig'))"/>
                                    <zo_nodig>
                                        <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-zo_nodig)"/>

                                        <xsl:variable name="xsd-criterium" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-zo_nodig, 'criterium'))"/>
                                        <criterium>
                                            <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-criterium)"/>
                                            <xsl:variable name="xsd-complexType" select="$xsd-criterium//xs:element[@name = 'code']/@type"/>
                                            <code conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-complexType, 'code')))"/>
                                                <xsl:call-template name="mp9-code-attribs">
                                                    <xsl:with-param name="current-hl7-code" select="."/>
                                                </xsl:call-template>
                                            </code>
                                            <!-- no use case for omschrijving, omschrijving is in code/@originalText -->
                                            <!--  <omschrijving value="zo nodig criterium omschrijving in vrije tekst" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23270"/>-->
                                        </criterium>
                                    </zo_nodig>
                                </xsl:for-each>
                                <!-- toedieningssnelheid -->
                                <xsl:for-each select="./hl7:rateQuantity">
                                    <xsl:variable name="xsd-toedieningssnelheid" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-dosering, 'toedieningssnelheid'))"/>
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
                                                <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-toedieningssnelheid)"/>
                                                <xsl:variable name="xsd-waarde" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-toedieningssnelheid, 'waarde'))"/>
                                                <waarde>
                                                    <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-waarde)"/>
                                                    <xsl:for-each select="./hl7:low">
                                                        <min value="{./@value}">
                                                            <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-waarde, 'min')))"/>
                                                        </min>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="./hl7:center">
                                                        <vaste_waarde value="{./@value}">
                                                            <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-waarde, 'vaste_waarde')))"/>
                                                        </vaste_waarde>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="./hl7:high">
                                                        <max value="{./@value}">
                                                            <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-waarde, 'max')))"/>
                                                        </max>
                                                    </xsl:for-each>
                                                </waarde>
                                                <xsl:variable name="ucum-eenheid" select="substring-before($ucum-rate-eenheid, '/')"/>
                                                <eenheid>
                                                    <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-toedieningssnelheid, 'eenheid')))"/>
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
                                                <tijdseenheid value="{$ucum-tijdseenheid-value}" unit="{nf:convertTime_UCUM2ADA_unit($ucum-tijdseenheid-unit)}">
                                                    <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-toedieningssnelheid, 'tijdseenheid')))"/>
                                                </tijdseenheid>
                                            </toedieningssnelheid>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:comment>Cannot output "toedieningssnelheid" because the ratequantity/*/@unit are not all equal, found: "<xsl:value-of select="string-join($ucum-rate-eenheden, ' and ')"/>".</xsl:comment>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                                <!-- Doseerschema met toedieningsduur. -->
                                <xsl:for-each select="./hl7:effectiveTime[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PIVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-nl:v3')][not(@alignment)][not(hl7nl:period)]/hl7nl:phase/hl7nl:width">
                                    <xsl:variable name="xsd-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningsduur']/@type"/>
                                    <toedieningsduur value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23282"/>
                                </xsl:for-each>
                                <!-- Doseerschema één keer per week op één weekdag met toedieningsduur -->
                                <xsl:for-each select="./hl7:effectiveTime[@alignment = 'DW']/hl7nl:phase/hl7nl:width">
                                    <xsl:variable name="xsd-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningsduur']/@type"/>
                                    <toedieningsduur value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23282"/>

                                </xsl:for-each>
                            </dosering>
                        </xsl:for-each>
                    </doseerinstructie>
                </xsl:for-each>
            </gebruiksinstructie>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="inputValue"/>
        <xd:param name="xsd-comp"/>
        <xd:param name="xsd-ada"/>
    </xd:doc>
    <xsl:template name="mp9-gebruiksperiode-eind">
        <xsl:param name="inputValue"/>
        <xsl:param name="xsd-comp"/>
        <xsl:param name="xsd-ada"/>
        <xsl:variable name="xsd-complexType" select="$xsd-comp//xs:element[@name = 'gebruiksperiode_eind']/@type"/>
        <gebruiksperiode_eind value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime($inputValue), nf:determine_date_precision($inputValue))}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="inputValue"/>
        <xd:param name="nullFlavor"/>
        <xd:param name="xsd-comp"/>
        <xd:param name="xsd-ada"/>
    </xd:doc>
    <xsl:template name="mp9-gebruiksperiode-start">
        <xsl:param name="inputValue"/>
        <xsl:param name="nullFlavor"/>
        <xsl:param name="xsd-comp"/>
        <xsl:param name="xsd-ada"/>
        <xsl:variable name="xsd-complexType" select="$xsd-comp//xs:element[@name = 'gebruiksperiode_start']/@type"/>
        <xsl:choose>
            <xsl:when test="string-length($inputValue) gt 0">
                <gebruiksperiode_start value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime($inputValue), nf:determine_date_precision($inputValue))}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            </xsl:when>
            <xsl:when test="string-length($nullFlavor) gt 0">
                <gebruiksperiode_start nullFlavor="{$nullFlavor}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
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
            <xsl:with-param name="conceptId" select="$concept-id-ada-geslacht"/>
            <xsl:with-param name="elemName">geslacht</xsl:with-param>
            <xsl:with-param name="codeMap" as="element()*">
                <map inCode="F" inCodeSystem="{$oidHL7AdministrativeGender}" value="3" codeSystemName="AdministrativeGender" displayName="Vrouw"/>
                <map inCode="M" inCodeSystem="{$oidHL7AdministrativeGender}" value="2" codeSystemName="AdministrativeGender" displayName="Man"/>
                <map inCode="UN" inCodeSystem="{$oidHL7AdministrativeGender}" value="1" codeSystemName="AdministrativeGender" displayName="Ongedifferentieerd"/>
                <map inCode="UNK" inCodeSystem="{$oidHL7NullFlavor}" value="4" codeSystemName="NullFlavor" displayName="{$hl7NullFlavorMap[@hl7NullFlavor = 'UNK']/@displayName}"/>
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
                        <xsl:when test="./hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                            <xsl:for-each select="./hl7:translation">
                                <xsl:attribute name="code" select="./@code"/>
                                <xsl:attribute name="codeSystem" select="./@codeSystem"/>
                                <xsl:attribute name="displayName" select="./@displayName"/>
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
        <xd:desc/>
        <xd:param name="hl7-num-or-denom"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-hoeveelheid"/>
    </xd:doc>
    <xsl:template name="mp-ingredient-waarde-en-eenheid">
        <xsl:param name="hl7-num-or-denom"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-hoeveelheid"/>

        <!-- waarde -->
        <xsl:for-each select="$hl7-num-or-denom">
            <xsl:variable name="ada-elemName">waarde</xsl:variable>
            <xsl:variable name="xsd-waarde" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-hoeveelheid, $ada-elemName))"/>
            <xsl:element name="{$ada-elemName}">
                <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-waarde)"/>
                <xsl:call-template name="mp9-ingredient-waarde">
                    <xsl:with-param name="hl7-num-or-denom" select="$hl7-num-or-denom"/>
                </xsl:call-template>
            </xsl:element>
            <xsl:variable name="ada-elemName">eenheid</xsl:variable>
            <xsl:variable name="xsd-eenheid" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-hoeveelheid, $ada-elemName))"/>
            <xsl:element name="{$ada-elemName}">
                <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-eenheid)"/>
                <xsl:call-template name="mp9-ingredient-eenheid">
                    <xsl:with-param name="hl7-num-or-denom" select="$hl7-num-or-denom"/>
                </xsl:call-template>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="hl7-doseQuantity"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-dosering"/>
    </xd:doc>
    <xsl:template name="mp9-keerdosis">
        <xsl:param name="hl7-doseQuantity"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-dosering"/>
        <xsl:comment>mp9-keerdosis</xsl:comment>
        <!-- keerdosis -->
        <!-- only output if all units are the same -->
        <xsl:if test="not($hl7-doseQuantity)">
            <xsl:comment>geen keerdosis in input</xsl:comment>
        </xsl:if>
        <xsl:if test="count(distinct-values($hl7-doseQuantity//hl7:translation[@codeSystem = $oidGStandaardBST902THES2]/@code)) = 1">
            <xsl:for-each select="$hl7-doseQuantity">
                <xsl:variable name="xsd-keerdosis-complexType" select="$xsd-dosering//xs:element[@name = 'keerdosis']/@type"/>
                <xsl:variable name="xsd-keerdosis" select="$xsd-ada//xs:complexType[@name = $xsd-keerdosis-complexType]"/>
                <keerdosis conceptId="{$xsd-keerdosis/xs:attribute[@name='conceptId']/@fixed}">
                    <xsl:variable name="xsd-aantal-complexType" select="$xsd-keerdosis//xs:element[@name = 'aantal']/@type"/>
                    <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                    <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:for-each select="./hl7:low/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                            <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'min']/@type"/>
                            <min value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                        </xsl:for-each>
                        <xsl:for-each select="./hl7:center/hl7:translation[@codeSystem = $oidGStandaardBST902THES2] | ./hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                            <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                            <vaste_waarde value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                        </xsl:for-each>
                        <xsl:for-each select="./hl7:high/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                            <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'max']/@type"/>
                            <max value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                        </xsl:for-each>
                    </aantal>
                    <xsl:for-each select="(.//hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                        <xsl:variable name="xsd-complexType" select="$xsd-keerdosis//xs:element[@name = 'eenheid']/@type"/>
                        <eenheid conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
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
                <naamgebruik value="1" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19803" code="NL1" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Eigen geslachtsnaam"/>
            </xsl:when>
            <xsl:when test="hl7:family[@qualifier = 'SP'] and not(hl7:family[@qualifier = 'BR' or not(@qualifier)])">
                <naamgebruik value="2" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19803" code="NL2" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Geslachtsnaam partner"/>
            </xsl:when>
            <xsl:when test="hl7:family[@qualifier = 'SP'] and not(hl7:family[@qualifier = 'SP']/ancestor::hl7:family[@qualifier = 'BR' or not(@qualifier)])">
                <naamgebruik value="3" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19803" code="NL3" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Geslachtsnaam partner gevolgd door eigen geslachtsnaam"/>
            </xsl:when>
            <xsl:when test="hl7:family[@qualifier = 'BR' or not(@qualifier)] and not(hl7:family[@qualifier = 'BR' or not(@qualifier)]/ancestor::hl7:family[@qualifier = 'SP'])">
                <naamgebruik value="4" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19803" code="NL4" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Eigen geslachtsnaam gevolgd door geslachtsnaam partner"/>
            </xsl:when>
            <xsl:otherwise>
                <naamgebruik value="5" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19803" code="OTH" codeSystem="{$oidHL7NullFlavor}" displayName="Onbekend"/>
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
        <naamgegevens conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19799">
            <!-- ongestructureerde_naam -->
            <xsl:for-each select="$current-hl7-name[text()][not(child::*)]">
                <ongestructureerde_naam conceptId="1.2.3.4.5.12345.19799.1">
                    <xsl:attribute name="value">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </ongestructureerde_naam>
            </xsl:for-each>
            <!-- voornamen -->
            <xsl:for-each select="$current-hl7-name[hl7:given[contains(@qualifier, 'BR') or not(@qualifier)]][text()[not(. = '')]]">
                <xsl:variable name="voornamen_concatted">
                    <xsl:for-each select="./hl7:given[contains(@qualifier, 'BR') or not(@qualifier)][text()[not(. = '')]]">
                        <xsl:value-of select="concat(./text(), ' ')"/>
                    </xsl:for-each>
                </xsl:variable>
                <voornamen value="{normalize-space($voornamen_concatted)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19800"/>
            </xsl:for-each>
            <!-- initialen -->
            <xsl:for-each select="$current-hl7-name[hl7:given[contains(@qualifier, 'BR') or not(@qualifier) or @qualifier = 'IN']]">
                <!-- in HL7 mogen de initialen van officiële voornamen niet herhaald / gedupliceerd worden in het initialen veld -->
                <!-- in de zib moeten de initialen juist compleet zijn, dus de initialen hier toevoegen van de officiële voornamen -->
                <xsl:variable name="initialen_concatted">
                    <xsl:for-each select="./hl7:given[contains(@qualifier, 'BR') or not(@qualifier)]">
                        <xsl:for-each select="tokenize(., ' ')">
                            <xsl:value-of select="concat(substring(., 1, 1), '.')"/>
                        </xsl:for-each>
                    </xsl:for-each>
                    <xsl:for-each select="./hl7:given[@qualifier = 'IN']">
                        <xsl:value-of select="./text()"/>
                    </xsl:for-each>
                </xsl:variable>
                <initialen conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19801" value="{$initialen_concatted}"/>
            </xsl:for-each>
            <xsl:for-each select="$current-hl7-name[hl7:given[contains(@qualifier, 'CL')]][text()[not(. = '')]]">
                <xsl:variable name="roepnamen_concatted">
                    <xsl:for-each select="./hl7:given[contains(@qualifier, 'CL')][text()[not(. = '')]]">
                        <xsl:value-of select="concat(./text(), ' ')"/>
                    </xsl:for-each>
                </xsl:variable>
                <roepnaam value="{normalize-space($roepnamen_concatted)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19802"/>
            </xsl:for-each>
            <xsl:call-template name="mp9-naamgebruik">
                <xsl:with-param name="hl7-name" select="$current-hl7-name"/>
            </xsl:call-template>
            <xsl:for-each select="$current-hl7-name/hl7:family[@qualifier = 'BR' or not(@qualifier)][text()[not(. = '')]]">
                <geslachtsnaam conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19804">
                    <xsl:for-each select="./preceding-sibling::hl7:prefix[@qualifier = 'VV'][position() = 1][text()[not(. = '')]]">
                        <voorvoegsels conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19805">
                            <xsl:attribute name="value" select="./text()"/>
                        </voorvoegsels>
                    </xsl:for-each>
                    <achternaam value="Eigengeslachtsnaam" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19806">
                        <xsl:attribute name="value" select="./text()"/>
                    </achternaam>
                </geslachtsnaam>
            </xsl:for-each>
            <xsl:for-each select="$current-hl7-name/hl7:family[@qualifier = 'SP'][string-length(text()) gt 0]">
                <geslachtsnaam_partner conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19807">
                    <xsl:for-each select="./preceding-sibling::hl7:prefix[@qualifier = 'VV'][position() = 1][text()[not(. = '')]]">
                        <voorvoegsels_partner value="van " conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19808">
                            <xsl:attribute name="value" select="./text()"/>
                        </voorvoegsels_partner>
                    </xsl:for-each>
                    <achternaam_partner value="Partner" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19809">
                        <xsl:attribute name="value" select="./text()"/>
                    </achternaam_partner>
                </geslachtsnaam_partner>
            </xsl:for-each>
        </naamgegevens>
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
                <xsl:sort data-type="number" select="nf:appendDate2DateTime((.//hl7:effectiveTime | .//hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/hl7:low/@value)"/>
                <!-- tested this with xsl:sequence, but the later use of for-each to iterate through the variable $mar does not respect the sorted order, 
                  but takes the input order from the input xml -->
                <!-- the xslt2 perform-sort function has the same result (probably for same reason, since it uses sequence as well) -->
                <!-- so we are useing copy-of here to preserve order, even though it is known to perform worse -->
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="IVL_TS" select="$mar-sorted//(hl7:effectiveTime | hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]"/>

        <!-- toedieningsafspraak -->
        <xsl:for-each select="$current-dispense-event">
            <toedieningsafspraak conceptId="{$xsd-toedieningsafspraak/xs:attribute[@name='conceptId']/@fixed}">
                <!-- gebruiksperiode-start -->
                <!-- in 6.12 kun je alleen een conclusie trekken over gebruiksperiode-start, als álle MARs een IVL_TS/low/@value hebben -->
                <xsl:if test="not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/hl7:low/@value)])">
                    <!-- er kunnen er meer dan 1 zijn in 6.12 - neem de laagste low als gebruiksperiode startdatum -->
                    <!-- omdat $mar gesorteerd is, is dat de eerste $IVL_TS -->
                    <xsl:call-template name="mp9-gebruiksperiode-start">
                        <xsl:with-param name="inputValue" select="$IVL_TS[1]/hl7:low/@value"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                    </xsl:call-template>
                </xsl:if>
                <!-- gebruiksperiode-start bij eenmalig gebruik-->
                <xsl:variable name="effectiveTimes-eenmalig" select="$mar-sorted/hl7:effectiveTime[not(@xsi:type) or (local-name-from-QName(resolve-QName(@xsi:type, .)) = 'TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]"/>
                <xsl:choose>
                    <xsl:when test="count($effectiveTimes-eenmalig[not(@nullFlavor)]) = 1">
                        <xsl:comment>gebruiksperiode-start bij eenmalig gebruik</xsl:comment>
                        <xsl:call-template name="mp9-gebruiksperiode-start">
                            <xsl:with-param name="inputValue" select="$effectiveTimes-eenmalig/@value"/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="count($effectiveTimes-eenmalig[@nullFlavor]) = 1">
                        <xsl:comment>gebruiksperiode-start nullFlavor</xsl:comment>
                        <xsl:call-template name="mp9-gebruiksperiode-start">
                            <xsl:with-param name="nullFlavor" select="$effectiveTimes-eenmalig/@nullFlavor"/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="count($effectiveTimes-eenmalig) = 0">
                        <!-- do nothing -->
                    </xsl:when>
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
                    <xsl:when test="not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/hl7:high/@value)])">
                        <!-- er kunnen er meer dan 1 zijn in 6.12 - neem de hoogste high als gebruiksperiode einddatum -->
                        <xsl:variable name="eind-datums" as="element()*">
                            <xsl:for-each select="$IVL_TS/hl7:high[@value]">
                                <xsl:sort data-type="number" select="nf:appendDate2DateTime(./@value)"/>
                                <xsl:sequence select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:call-template name="mp9-gebruiksperiode-eind">
                            <xsl:with-param name="inputValue" select="$eind-datums[last()]/@value"/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- alle MAR's een low én een width bij meer dan 1 MAR -->
                    <xsl:when test="$current-dispense-event[count(.//hl7:medicationAdministrationRequest) gt 1] and not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/(hl7:low/@value and hl7:width[@unit = 'd']/@value))])">
                        <!-- alle mar's hebben een low en een width. einddatums uitrekenen -->
                        <xsl:variable name="einddatums" as="element()*">
                            <xsl:for-each select="$IVL_TS">
                                <xsl:variable name="hl7-start-datum" select="./hl7:low/@value"/>
                                <!-- width is altijd in dagen in 6.12 -->
                                <xsl:variable name="hl7-width-in-days" select="./hl7:width/@value"/>
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
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
                <!-- identificatie -->
                <xsl:if test="$transaction = 'beschikbaarstellen_medicatiegegevens'">
                    <!-- identificatie -->
                    <xsl:comment>The toedieningsafspraak/id is converted from the medicationDispenseEvent/id. Same root, extension string preconcatenated.</xsl:comment>
                    <xsl:for-each select="./hl7:id[@extension]">
                        <identificatie root="{./@root}" value="{concat('TAConverted_', ./@extension)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.20134"/>
                    </xsl:for-each>
                </xsl:if>
                <!-- er is geen afspraakdatum in een 6.12 verstrekkingenbericht -->
                <!-- benaderen met verstrekkingsdatum -->
                <xsl:comment>Afspraakdatum is benaderd met de verstrekkingsdatum (medicationDispenseEvent/effectiveTime)</xsl:comment>
                <!-- afspraakdatum -->
                <xsl:for-each select="./hl7:effectiveTime[@value]">
                    <afspraakdatum conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.20133">
                        <xsl:attribute name="value" select="nf:formatHL72XMLDate(./@value, nf:determine_date_precision(./@value))"/>
                    </afspraakdatum>
                </xsl:for-each>
                <!-- gebruiksperiode -->
                <!-- alleen gebruiksperiode output bij 1 MAR die een width heeft, en bij meerder MAR's berekenen we indien mogelijk de einddatum -->
                <xsl:if test="$current-dispense-event[count(.//hl7:medicationAdministrationRequest) = 1]">
                    <xsl:for-each select="$IVL_TS/hl7:width[@value]">
                        <gebruiksperiode value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22660"/>
                    </xsl:for-each>
                </xsl:if>
                <!-- geannuleerd indicator en stoptype wordt niet ondersteund in 6.12, geen output hiervoor-->
                <!--<geannuleerd_indicator conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23034" value="UNK"/>
             <stoptype value="1" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22498" code="1" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1" displayName="Onderbreking"/>-->
                <!-- verstrekker -->
                <xsl:for-each select="./hl7:responsibleParty/hl7:assignedCareProvider/hl7:representedOrganization">
                    <xsl:variable name="verstrekker-complexType" select="$xsd-toedieningsafspraak//xs:element[@name = 'verstrekker']/@type"/>
                    <xsl:variable name="xsd-verstrekker" select="$xsd-ada//xs:complexType[@name = $verstrekker-complexType]"/>
                    <verstrekker conceptId="{$xsd-verstrekker/xs:attribute[@name='conceptId']/@fixed}">
                        <!-- zorgaanbieder -->
                        <xsl:variable name="zorgaanbieder-complexType" select="$xsd-verstrekker//xs:element[@name = 'zorgaanbieder']/@type"/>
                        <xsl:variable name="xsd-zorgaanbieder" select="$xsd-ada//xs:complexType[@name = $zorgaanbieder-complexType]"/>
                        <zorgaanbieder conceptId="{$xsd-zorgaanbieder/xs:attribute[@name='conceptId']/@fixed}">
                            <xsl:call-template name="mp9-zorgaanbieder">
                                <xsl:with-param name="hl7-current-organization" select="."/>
                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                <xsl:with-param name="xsd-parent-of-zorgaanbieder" select="$xsd-zorgaanbieder"/>
                            </xsl:call-template>
                        </zorgaanbieder>
                    </verstrekker>
                </xsl:for-each>
                <!-- reden afspraak wordt niet ondersteund in 6.12 -->
                <!--         <reden_afspraak conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22499" value="reden afspraak TA"/>-->
                <!-- geneesmiddel_bij_toedieningsafspraak  -->
                <xsl:for-each select=".//hl7:product/hl7:dispensedMedication/hl7:MedicationKind">
                    <xsl:variable name="geneesmiddel_bij_toedieningsafspraak-complexType" select="$xsd-toedieningsafspraak//xs:element[@name = 'geneesmiddel_bij_toedieningsafspraak']/@type"/>
                    <xsl:variable name="xsd-geneesmiddel_bij_toedieningsafspraak" select="$xsd-ada//xs:complexType[@name = $geneesmiddel_bij_toedieningsafspraak-complexType]"/>
                    <geneesmiddel_bij_toedieningsafspraak conceptId="{$xsd-geneesmiddel_bij_toedieningsafspraak/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-geneesmiddel" select="$xsd-geneesmiddel_bij_toedieningsafspraak"/>
                        </xsl:call-template>
                    </geneesmiddel_bij_toedieningsafspraak>
                </xsl:for-each>

                <xsl:call-template name="mp9-gebruiksinstructie-from-mp612-2">
                    <xsl:with-param name="effectiveTimes-eenmalig" select="$effectiveTimes-eenmalig"/>
                    <xsl:with-param name="hl7-current-comp" select="."/>
                    <xsl:with-param name="mar-sorted" select="$mar-sorted"/>
                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                    <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                </xsl:call-template>
                <!-- 6.12 kent geen aanvullende informatie en toelichting in vrije tekst -->
                <!--<aanvullende_informatie value="16" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23284" code="16" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.14.2053" displayName="Melding lareb"/>
         <toelichting conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22275" value="toelichting bij TA"/>-->
                <!-- MP 6.1x heeft wel een relatie naar het voorschrift (medicatieafspraak + verstrekkingsverzoek) maar geen relatie naar de bouwsteen medicatieafspraak. -->
                <!-- 1..1 R in beschikbaarstellen_medicatiegegevens dus een nullFlavor -->
                <xsl:if test="$transaction = 'beschikbaarstellen_medicatiegegevens'">
                    <relatie_naar_medicatieafspraak conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22394">
                        <identificatie conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22395" value="NI" root="{$oidHL7NullFlavor}"/>
                    </relatie_naar_medicatieafspraak>
                </xsl:if>

            </toedieningsafspraak>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="current-dispense-event"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-mbh"/>
        <xd:param name="transaction">Which transaction is the context of this translation. Currently known: beschikbaarstellen_medicatiegegevens or beschikbaarstellen_verstrekkingenvertaling </xd:param>
    </xd:doc>
    <xsl:template name="mp9-toedieningsafspraak-from-mp612-907">
        <xsl:param name="current-dispense-event" select="." as="element()?"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-mbh"/>
        <xsl:param name="transaction" select="$transaction-name"/>
        <xsl:variable name="xsd-toedieningsafspraak-complexType" select="$xsd-mbh//xs:element[@name = 'toedieningsafspraak']/@type"/>
        <xsl:variable name="xsd-toedieningsafspraak" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningsafspraak-complexType]"/>
        <!-- let's sort the available hl7:medicationAdministrationRequest's in chronological order -->
        <!-- mar = medicationAdministrationRequest  -->
        <xsl:variable name="mar-sorted" as="element(hl7:medicationAdministrationRequest)*">
            <xsl:for-each select="$current-dispense-event/hl7:product/hl7:dispensedMedication/hl7:therapeuticAgentOf/hl7:medicationAdministrationRequest">
                <xsl:sort data-type="number" select="nf:appendDate2DateTime((.//hl7:effectiveTime | .//hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/hl7:low/@value)"/>
                <!-- tested this with xsl:sequence, but the later use of for-each to iterate through the variable $mar does not respect the sorted order, 
                  but takes the input order from the input xml -->
                <!-- the xslt2 perform-sort function has the same result (probably for same reason, since it uses sequence as well) -->
                <!-- so we are useing copy-of here to preserve order, even though it is known to perform worse -->
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="IVL_TS" select="$mar-sorted//(hl7:effectiveTime | hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]"/>

        <!-- toedieningsafspraak -->
        <xsl:for-each select="$current-dispense-event">
            <toedieningsafspraak conceptId="{$xsd-toedieningsafspraak/xs:attribute[@name='conceptId']/@fixed}">
                <!-- gebruiksperiode-start -->
                <!-- in 6.12 kun je alleen een conclusie trekken over gebruiksperiode-start, als álle MARs een IVL_TS/low/@value hebben -->
                <xsl:if test="not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/hl7:low/@value)])">
                    <!-- er kunnen er meer dan 1 zijn in 6.12 - neem de laagste low als gebruiksperiode startdatum -->
                    <!-- omdat $mar gesorteerd is, is dat de eerste $IVL_TS -->
                    <xsl:call-template name="mp9-gebruiksperiode-start">
                        <xsl:with-param name="inputValue" select="$IVL_TS[1]/hl7:low/@value"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                    </xsl:call-template>
                </xsl:if>
                <!-- gebruiksperiode-start bij eenmalig gebruik-->
                <xsl:variable name="effectiveTimes-eenmalig" select="$mar-sorted/hl7:effectiveTime[not(@xsi:type) or (local-name-from-QName(resolve-QName(@xsi:type, .)) = 'TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')][not(@nullFlavor)]"/>
                <xsl:choose>
                    <xsl:when test="count($effectiveTimes-eenmalig[not(@nullFlavor)]) = 1">
                        <xsl:comment>gebruiksperiode-start bij eenmalig gebruik</xsl:comment>
                        <xsl:call-template name="mp9-gebruiksperiode-start">
                            <xsl:with-param name="inputValue" select="$effectiveTimes-eenmalig/@value"/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="count($effectiveTimes-eenmalig[@nullFlavor]) = 1">
                        <xsl:comment>gebruiksperiode-start nullFlavor</xsl:comment>
                        <xsl:call-template name="mp9-gebruiksperiode-start">
                            <xsl:with-param name="nullFlavor" select="$effectiveTimes-eenmalig/@nullFlavor"/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="count($effectiveTimes-eenmalig) = 0">
                        <!-- do nothing -->
                    </xsl:when>
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
                    <xsl:when test="not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/hl7:high/@value)])">
                        <!-- er kunnen er meer dan 1 zijn in 6.12 - neem de hoogste high als gebruiksperiode einddatum -->
                        <xsl:variable name="eind-datums" as="element()*">
                            <xsl:for-each select="$IVL_TS/hl7:high[@value]">
                                <xsl:sort data-type="number" select="nf:appendDate2DateTime(./@value)"/>
                                <xsl:sequence select="."/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:call-template name="mp9-gebruiksperiode-eind">
                            <xsl:with-param name="inputValue" select="$eind-datums[last()]/@value"/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- alle MAR's een low én een width bij meer dan 1 MAR -->
                    <xsl:when test="$current-dispense-event[count(.//hl7:medicationAdministrationRequest) gt 1] and not($mar-sorted[not((.//hl7:effectiveTime | .//hl7:comp)[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3')]/(hl7:low/@value and hl7:width[@unit = 'd']/@value))])">
                        <!-- alle mar's hebben een low en een width. einddatums uitrekenen -->
                        <xsl:variable name="einddatums" as="element()*">
                            <xsl:for-each select="$IVL_TS">
                                <xsl:variable name="hl7-start-datum" select="./hl7:low/@value"/>
                                <!-- width is altijd in dagen in 6.12 -->
                                <xsl:variable name="hl7-width-in-days" select="./hl7:width/@value"/>
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
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
                <!-- identificatie -->
                <xsl:if test="$transaction = 'beschikbaarstellen_medicatiegegevens'">
                    <!-- identificatie -->
                    <xsl:comment>The toedieningsafspraak/id is converted from the medicationDispenseEvent/id. Same root, extension string preconcatenated.</xsl:comment>
                    <xsl:for-each select="./hl7:id[@extension]">
                        <identificatie root="{./@root}" value="{concat('TAConverted_', ./@extension)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.20134"/>
                    </xsl:for-each>
                </xsl:if>
                <!-- er is geen afspraakdatum in een 6.12 verstrekkingenbericht -->
                <!-- benaderen met verstrekkingsdatum -->
                <xsl:comment>Afspraakdatum is benaderd met de verstrekkingsdatum (medicationDispenseEvent/effectiveTime)</xsl:comment>
                <!-- afspraakdatum -->
                <xsl:for-each select="./hl7:effectiveTime[@value]">
                    <afspraakdatum conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.20133">
                        <xsl:attribute name="value" select="nf:formatHL72XMLDate(./@value, nf:determine_date_precision(./@value))"/>
                    </afspraakdatum>
                </xsl:for-each>
                <!-- gebruiksperiode -->
                <!-- alleen gebruiksperiode output bij 1 MAR die een width heeft, en bij meerder MAR's berekenen we indien mogelijk de einddatum -->
                <xsl:if test="$current-dispense-event[count(.//hl7:medicationAdministrationRequest) = 1]">
                    <xsl:for-each select="$IVL_TS/hl7:width[@value]">
                        <gebruiksperiode value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22660"/>
                    </xsl:for-each>
                </xsl:if>
                <!-- geannuleerd indicator en stoptype wordt niet ondersteund in 6.12, geen output hiervoor-->
                <!--<geannuleerd_indicator conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23034" value="UNK"/>
             <stoptype value="1" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22498" code="1" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1" displayName="Onderbreking"/>-->
                <!-- verstrekker -->
                <xsl:for-each select="./hl7:responsibleParty/hl7:assignedCareProvider/hl7:representedOrganization">
                    <xsl:variable name="verstrekker-complexType" select="$xsd-toedieningsafspraak//xs:element[@name = 'verstrekker']/@type"/>
                    <xsl:variable name="xsd-verstrekker" select="$xsd-ada//xs:complexType[@name = $verstrekker-complexType]"/>
                    <verstrekker conceptId="{$xsd-verstrekker/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:call-template name="mp9-zorgaanbieder">
                            <xsl:with-param name="hl7-current-organization" select="."/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-parent-of-zorgaanbieder" select="$xsd-verstrekker"/>
                        </xsl:call-template>
                    </verstrekker>
                </xsl:for-each>
                <!-- reden afspraak wordt niet ondersteund in 6.12 -->
                <!--         <reden_afspraak conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22499" value="reden afspraak TA"/>-->
                <!-- geneesmiddel_bij_toedieningsafspraak  -->
                <xsl:for-each select=".//hl7:product/hl7:dispensedMedication/hl7:MedicationKind">
                    <xsl:variable name="geneesmiddel_bij_toedieningsafspraak-complexType" select="$xsd-toedieningsafspraak//xs:element[@name = 'geneesmiddel_bij_toedieningsafspraak']/@type"/>
                    <xsl:variable name="xsd-geneesmiddel_bij_toedieningsafspraak" select="$xsd-ada//xs:complexType[@name = $geneesmiddel_bij_toedieningsafspraak-complexType]"/>
                    <geneesmiddel_bij_toedieningsafspraak conceptId="{$xsd-geneesmiddel_bij_toedieningsafspraak/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000-907">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-geneesmiddel" select="$xsd-geneesmiddel_bij_toedieningsafspraak"/>
                        </xsl:call-template>
                    </geneesmiddel_bij_toedieningsafspraak>
                </xsl:for-each>

                <xsl:call-template name="mp9-gebruiksinstructie-from-mp612-2">
                    <xsl:with-param name="effectiveTimes-eenmalig" select="$effectiveTimes-eenmalig"/>
                    <xsl:with-param name="hl7-current-comp" select="."/>
                    <xsl:with-param name="mar-sorted" select="$mar-sorted"/>
                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                    <xsl:with-param name="xsd-comp" select="$xsd-toedieningsafspraak"/>
                </xsl:call-template>
                <!-- 6.12 kent geen aanvullende informatie en toelichting in vrije tekst -->
                <!--<aanvullende_informatie value="16" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23284" code="16" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.14.2053" displayName="Melding lareb"/>
         <toelichting conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22275" value="toelichting bij TA"/>-->
                <!-- MP 6.1x heeft wel een relatie naar het voorschrift (medicatieafspraak + verstrekkingsverzoek) maar geen relatie naar de bouwsteen medicatieafspraak. -->
                <!-- 1..1 R in beschikbaarstellen_medicatiegegevens dus een nullFlavor -->
                <xsl:if test="$transaction = 'beschikbaarstellen_medicatiegegevens'">
                    <relatie_naar_medicatieafspraak conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22394">
                        <identificatie conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22395" value="NI" root="{$oidHL7NullFlavor}"/>
                    </relatie_naar_medicatieafspraak>
                </xsl:if>

            </toedieningsafspraak>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="hl7-ratequantity"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-dosering"/>
    </xd:doc>
    <xsl:template name="mp9-toedieningssnelheid">
        <xsl:param name="hl7-ratequantity"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-dosering"/>

        <xsl:for-each select="$hl7-ratequantity">
            <xsl:variable name="xsd-toedieningssnelheid-complexType" select="$xsd-dosering//xs:element[@name = 'toedieningssnelheid']/@type"/>
            <xsl:variable name="xsd-toedieningssnelheid" select="$xsd-ada//xs:complexType[@name = $xsd-toedieningssnelheid-complexType]"/>
            <toedieningssnelheid conceptId="{$xsd-toedieningssnelheid/xs:attribute[@name='conceptId']/@fixed}">
                <xsl:variable name="xsd-waarde-complexType" select="$xsd-toedieningssnelheid//xs:element[@name = 'waarde']/@type"/>
                <xsl:variable name="xsd-waarde" select="$xsd-ada//xs:complexType[@name = $xsd-waarde-complexType]"/>
                <waarde conceptId="{$xsd-waarde/xs:attribute[@name='conceptId']/@fixed}">
                    <xsl:for-each select="./hl7:low">
                        <xsl:variable name="xsd-complexType" select="$xsd-waarde//xs:element[@name = 'min']/@type"/>
                        <min value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                    </xsl:for-each>
                    <xsl:for-each select="./hl7:center">
                        <xsl:variable name="xsd-complexType" select="$xsd-waarde//xs:element[@name = 'vaste_waarde']/@type"/>
                        <vaste_waarde value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                    </xsl:for-each>
                    <xsl:for-each select="./hl7:high">
                        <xsl:variable name="xsd-complexType" select="$xsd-waarde//xs:element[@name = 'max']/@type"/>
                        <max value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                    </xsl:for-each>
                </waarde>
                <xsl:variable name="ucum-eenheid" select="substring-before((./*/@unit)[1], '/')"/>
                <xsl:variable name="xsd-complexType" select="$xsd-toedieningssnelheid//xs:element[@name = 'eenheid']/@type"/>
                <eenheid conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                    <xsl:call-template name="UCUM2GstdBasiseenheid">
                        <xsl:with-param name="UCUM" select="$ucum-eenheid"/>
                    </xsl:call-template>
                </eenheid>
                <xsl:variable name="ucum-tijdseenheid" select="substring-after((./*/@unit)[1], '/')"/>
                <xsl:variable name="xsd-complexType" select="$xsd-toedieningssnelheid//xs:element[@name = 'tijdseenheid']/@type"/>
                <tijdseenheid unit="{nf:convertTime_UCUM2ADA_unit($ucum-tijdseenheid)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            </toedieningssnelheid>
        </xsl:for-each>

    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="current-hl7-pivl"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-toedieningsschema"/>
    </xd:doc>
    <xsl:template name="mp9-vaste-frequentie-from-mp-612">
        <xsl:param name="current-hl7-pivl"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-toedieningsschema"/>
        <xsl:comment>mp9-vaste-frequentie-from-mp-612</xsl:comment>
        <xsl:if test="not($current-hl7-pivl)">
            <xsl:comment>geen frequentie in input</xsl:comment>
        </xsl:if>
        <xsl:for-each select="$current-hl7-pivl">
            <xsl:for-each select="./hl7:period">
                <xsl:variable name="vaste_frequentie_one_decimal" select="nf:one_decimal(./@value)"/>
                <xsl:variable name="vaste_frequentie_decimal" select="$vaste_frequentie_one_decimal - floor($vaste_frequentie_one_decimal)"/>
                <!-- only output the structured frequentie if the one decimal rounded to 0 -->
                <xsl:choose>
                    <xsl:when test="$vaste_frequentie_decimal = 0">
                        <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
                        <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
                        <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                            <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                            <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                            <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                                <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                                <vaste_waarde value="{round($vaste_frequentie_one_decimal)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                            </aantal>
                            <xsl:variable name="xsd-complexType" select="$xsd-frequentie//xs:element[@name = 'tijdseenheid']/@type"/>
                            <tijdseenheid value="{nf:tijdseenheid-aantal(./@value)}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                        </frequentie>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:comment>The period cannot be properly converted to a frequency integer. Period = <xsl:value-of select="./@value"/> <xsl:value-of select="./@unit"/> resulting in frequency/aantal rounded to one decimal of: <xsl:value-of select="$vaste_frequentie_one_decimal"/></xsl:comment>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="current-hl7-verstrekking"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-mbh"/>
        <xd:param name="transaction">Which transaction is the context of this translation. Currently known: beschikbaarstellen_medicatiegegevens or beschikbaarstellen_verstrekkingenvertaling </xd:param>
    </xd:doc>
    <xsl:template name="mp9-verstrekking-from-mp612">
        <xsl:param name="current-hl7-verstrekking" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-mbh"/>
        <xsl:param name="transaction" select="$transaction-name"/>
        <xsl:for-each select="$current-hl7-verstrekking">
            <xsl:variable name="xsd-verstrekking-complexType" select="$xsd-mbh//xs:element[@name = 'verstrekking']/@type"/>
            <xsl:variable name="xsd-verstrekking" select="$xsd-ada//xs:complexType[@name = $xsd-verstrekking-complexType]"/>
            <verstrekking conceptId="{$xsd-verstrekking/xs:attribute[@name='conceptId']/@fixed}">
                <!-- identificatie -->
                <xsl:for-each select="./hl7:id[@extension]">
                    <xsl:variable name="xsd-complexType" select="$xsd-verstrekking//xs:element[@name = 'identificatie']/@type"/>
                    <identificatie root="{./@root}" value="{./@extension}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                </xsl:for-each>
                <!-- 6.12 heeft geen echte verstrekkingsdatum -->
                <!-- we need a nullFlavor since this element is required -->
                <xsl:variable name="xsd-complexType" select="$xsd-verstrekking//xs:element[@name = 'datum']/@type"/>
                <datum nullFlavor="NI" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                <!-- 6.12 heeft de aanschrijfdatum -->
                <xsl:for-each select="./hl7:effectiveTime[@value]">
                    <xsl:variable name="xsd-complexType" select="$xsd-verstrekking//xs:element[@name = 'aanschrijfdatum']/@type"/>
                    <aanschrijfdatum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./@value), nf:determine_date_precision(./@value))}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                </xsl:for-each>
                <!-- verstrekker -->
                <xsl:for-each select="./hl7:responsibleParty/hl7:assignedCareProvider/hl7:representedOrganization">
                    <xsl:variable name="verstrekker-complexType" select="$xsd-verstrekking//xs:element[@name = 'verstrekker']/@type"/>
                    <xsl:variable name="xsd-verstrekker" select="$xsd-ada//xs:complexType[@name = $verstrekker-complexType]"/>
                    <verstrekker conceptId="{$xsd-verstrekker/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:call-template name="mp9-zorgaanbieder">
                            <xsl:with-param name="hl7-current-organization" select="."/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-parent-of-zorgaanbieder" select="$xsd-verstrekker"/>
                        </xsl:call-template>
                    </verstrekker>
                </xsl:for-each>
                <!-- verstrekte_hoeveelheid -->
                <xsl:for-each select="./hl7:quantity/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                    <xsl:variable name="xsd-verstrekte_hoeveelheid-complexType" select="$xsd-verstrekking//xs:element[@name = 'verstrekte_hoeveelheid']/@type"/>
                    <xsl:variable name="xsd-verstrekte_hoeveelheid" select="$xsd-ada//xs:complexType[@name = $xsd-verstrekte_hoeveelheid-complexType]"/>
                    <verstrekte_hoeveelheid conceptId="{$xsd-verstrekte_hoeveelheid/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:variable name="xsd-complexType" select="$xsd-verstrekte_hoeveelheid//xs:element[@name = 'aantal']/@type"/>
                        <aantal value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                        <xsl:variable name="xsd-complexType" select="$xsd-verstrekte_hoeveelheid//xs:element[@name = 'eenheid']/@type"/>
                        <eenheid conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                            <xsl:call-template name="mp9-code-attribs">
                                <xsl:with-param name="current-hl7-code" select="."/>
                            </xsl:call-template>
                        </eenheid>
                    </verstrekte_hoeveelheid>
                </xsl:for-each>
                <!-- verstrekt_geneesmiddel -->
                <xsl:variable name="xsd-verstrekt_geneesmiddel-complexType" select="$xsd-verstrekking//xs:element[@name = 'verstrekt_geneesmiddel']/@type"/>
                <xsl:variable name="xsd-verstrekt_geneesmiddel" select="$xsd-ada//xs:complexType[@name = $xsd-verstrekt_geneesmiddel-complexType]"/>
                <xsl:for-each select=".//hl7:product/hl7:dispensedMedication/hl7:MedicationKind">
                    <verstrekt_geneesmiddel conceptId="{$xsd-verstrekt_geneesmiddel/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000-907">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-geneesmiddel" select="$xsd-verstrekt_geneesmiddel"/>
                        </xsl:call-template>
                    </verstrekt_geneesmiddel>
                </xsl:for-each>
                <!-- verbruiksduur -->
                <xsl:for-each select="./hl7:expectedUseTime/hl7:width">
                    <xsl:variable name="xsd-complexType" select="$xsd-verstrekking//xs:element[@name = 'verbruiksduur']/@type"/>
                    <verbruiksduur value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                </xsl:for-each>
                <!-- afleverlocatie -->
                <xsl:for-each select="./hl7:destination/hl7:serviceDeliveryLocation">
                    <xsl:comment>afleverlocatie</xsl:comment>
                    <xsl:variable name="xsd-complexType" select="$xsd-verstrekking//xs:element[@name = 'afleverlocatie']/@type"/>
                    <afleverlocatie value="{normalize-space(.)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                </xsl:for-each>
                <!-- distributievorm, aanvullende_informatie, toelichting, relatie_naar_verstrekkingsverzoek 
               not in mp 6.12 verstrekking, no output -->
            </verstrekking>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="hl7-phase-low"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-toedieningsschema"/>
    </xd:doc>
    <xsl:template name="mp9-weekdag">
        <xsl:param name="hl7-phase-low"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-toedieningsschema"/>
        <xsl:variable name="hl7-weekdag" select="substring($hl7-phase-low/@value, 1, 8)"/>
        <xsl:variable name="weekdag-xml-date" select="nf:formatHL72XMLDate($hl7-weekdag, 'DAY')"/>
        <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'weekdag']/@type"/>
        <weekdag conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
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
        <xsl:choose>
            <xsl:when test="$day-of-week = 1">
                <xsl:attribute name="code">307145004</xsl:attribute>
                <xsl:attribute name="displayName">maandag</xsl:attribute>
                <xsl:attribute name="codeSystem" select="$oidSNOMEDCT"/>
                <xsl:attribute name="codeSystemName">SNOMED CT</xsl:attribute>
            </xsl:when>
            <xsl:when test="$day-of-week = 2">
                <xsl:attribute name="code">307147007</xsl:attribute>
                <xsl:attribute name="displayName">dinsdag</xsl:attribute>
                <xsl:attribute name="codeSystem" select="$oidSNOMEDCT"/>
                <xsl:attribute name="codeSystemName">SNOMED CT</xsl:attribute>
            </xsl:when>
            <xsl:when test="$day-of-week = 3">
                <xsl:attribute name="code">307148002</xsl:attribute>
                <xsl:attribute name="displayName">woensdag</xsl:attribute>
                <xsl:attribute name="codeSystem" select="$oidSNOMEDCT"/>
                <xsl:attribute name="codeSystemName">SNOMED CT</xsl:attribute>
            </xsl:when>
            <xsl:when test="$day-of-week = 4">
                <xsl:attribute name="code">307149005</xsl:attribute>
                <xsl:attribute name="displayName">donderdag</xsl:attribute>
                <xsl:attribute name="codeSystem" select="$oidSNOMEDCT"/>
                <xsl:attribute name="codeSystemName">SNOMED CT</xsl:attribute>
            </xsl:when>
            <xsl:when test="$day-of-week = 5">
                <xsl:attribute name="code">307150005</xsl:attribute>
                <xsl:attribute name="displayName">vrijdag</xsl:attribute>
                <xsl:attribute name="codeSystem" select="$oidSNOMEDCT"/>
                <xsl:attribute name="codeSystemName">SNOMED CT</xsl:attribute>
            </xsl:when>
            <xsl:when test="$day-of-week = 6">
                <xsl:attribute name="code">307151009</xsl:attribute>
                <xsl:attribute name="displayName">zaterdag</xsl:attribute>
                <xsl:attribute name="codeSystem" select="$oidSNOMEDCT"/>
                <xsl:attribute name="codeSystemName">SNOMED CT</xsl:attribute>
            </xsl:when>
            <xsl:when test="$day-of-week = 0">
                <xsl:attribute name="code">307146003</xsl:attribute>
                <xsl:attribute name="displayName">zondag</xsl:attribute>
                <xsl:attribute name="codeSystem" select="$oidSNOMEDCT"/>
                <xsl:attribute name="codeSystemName">SNOMED CT</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="currentNullFlavor">OTH</xsl:variable>
                <xsl:attribute name="nullFlavor" select="$currentNullFlavor"/>
                <xsl:attribute name="displayName" select="$hl7NullFlavorMap[@hl7NullFlavor = $currentNullFlavor]/@displayName"/>
                <xsl:attribute name="originalText" select="concat('Unable to convert input', $day-of-week, 'to weekday.')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="max-dose"/>
        <xd:param name="zonodig-code"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-dosering"/>
    </xd:doc>
    <xsl:template name="mp9-zonodig">
        <xsl:param name="max-dose" as="element()?"/>
        <xsl:param name="zonodig-code" as="element()*"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-dosering"/>
        <xsl:if test="$zonodig-code | $max-dose">
            <xsl:variable name="xsd-zo_nodig-complexType" select="$xsd-dosering//xs:element[@name = 'zo_nodig']/@type"/>
            <xsl:variable name="xsd-zo_nodig" select="$xsd-ada//xs:complexType[@name = $xsd-zo_nodig-complexType]"/>
            <zo_nodig conceptId="{$xsd-zo_nodig/xs:attribute[@name='conceptId']/@fixed}">
                <!-- criterium -->
                <!-- in 6.12 kan de zonodig-code meer dan 1 keer voorkomen, in MP-9 mag criterium maar één keer -->
                <xsl:if test="count($zonodig-code) gt 0">
                    <xsl:variable name="xsd-criterium-complexType" select="$xsd-zo_nodig//xs:element[@name = 'criterium']/@type"/>
                    <xsl:variable name="xsd-criterium" select="$xsd-ada//xs:complexType[@name = $xsd-criterium-complexType]"/>
                    <criterium conceptId="{$xsd-criterium/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:variable name="xsd-complexType" select="$xsd-criterium//xs:element[@name = 'code']/@type"/>
                        <code conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
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
                                                        <xsl:otherwise>unsupported nullFlavor: <xsl:value-of select="$currentNullFlavor"/></xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="concat('Code: ', ./@code, ', displayName: ', ./@displayName, '. ')"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:for-each select="./hl7:originalText">
                                                <xsl:value-of select="concat(', originalText: ', ., '. ')"/>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:attribute name="originalText" select="normalize-space($concat_originalText)"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </code>
                        <!-- no use case for omschrijving, omschrijving is in code/@originalText -->
                        <!--  <omschrijving value="zo nodig criterium omschrijving in vrije tekst" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23270"/>-->
                    </criterium>
                </xsl:if>
                <!-- maximale_dosering  -->
                <xsl:for-each select="$max-dose[.//@value]">
                    <xsl:comment>maximale dosering</xsl:comment>
                    <xsl:variable name="xsd-maximale_dosering-complexType" select="$xsd-zo_nodig//xs:element[@name = 'maximale_dosering']/@type"/>
                    <xsl:variable name="xsd-maximale_dosering" select="$xsd-ada//xs:complexType[@name = $xsd-maximale_dosering-complexType]"/>
                    <maximale_dosering conceptId="{$xsd-maximale_dosering/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:for-each select="(./hl7:numerator/hl7:translation[@codeSystem = $oidGStandaardBST902THES2])">
                            <xsl:variable name="xsd-complexType" select="$xsd-maximale_dosering//xs:element[@name = 'aantal']/@type"/>
                            <aantal value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                            <xsl:variable name="xsd-complexType" select="$xsd-maximale_dosering//xs:element[@name = 'eenheid']/@type"/>
                            <eenheid conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </eenheid>
                        </xsl:for-each>
                        <xsl:for-each select="(./hl7:denominator)">
                            <xsl:variable name="xsd-complexType" select="$xsd-maximale_dosering//xs:element[@name = 'tijdseenheid']/@type"/>
                            <tijdseenheid value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                        </xsl:for-each>
                    </maximale_dosering>
                </xsl:for-each>
            </zo_nodig>
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc>9.0.6 MP zorgaanbieder</xd:desc>
        <xd:param name="hl7-current-organization"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-parent-of-zorgaanbieder"/>
    </xd:doc>
    <xsl:template name="mp9-zorgaanbieder">
        <xsl:param name="hl7-current-organization"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-parent-of-zorgaanbieder"/>
        <xsl:variable name="zorgaanbieder2-complexType" select="$xsd-parent-of-zorgaanbieder//xs:element[@name = 'zorgaanbieder']/@type"/>
        <xsl:variable name="xsd-zorgaanbieder2" select="$xsd-ada//xs:complexType[@name = $zorgaanbieder2-complexType]"/>
        <xsl:for-each select="$hl7-current-organization">
            <zorgaanbieder conceptId="{$xsd-zorgaanbieder2/xs:attribute[@name='conceptId']/@fixed}">
                <xsl:for-each select="./hl7:id">
                    <xsl:variable name="xsd-complexType" select="$xsd-zorgaanbieder2//xs:element[@name = 'zorgaanbieder_identificatie_nummer']/@type"/>
                    <zorgaanbieder_identificatie_nummer value="{./@extension}" root="{./@root}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                </xsl:for-each>
                <!-- organisatienaam has 1..1 R in MP 9 ADA transactions, but is not always present in HL7 input messages.  -->
                <!-- fill with nullFlavor if necessary -->
                <xsl:variable name="xsd-complexType" select="$xsd-zorgaanbieder2//xs:element[@name = 'organisatie_naam']/@type"/>
                <organisatie_naam conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                    <xsl:choose>
                        <xsl:when test="./hl7:name">
                            <xsl:attribute name="value" select="./hl7:name/text()"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                </organisatie_naam>
            </zorgaanbieder>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>9.0.7 MP zorgaanbieder</xd:desc>
        <xd:param name="hl7-current-organization"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-parent-of-zorgaanbieder"/>
    </xd:doc>
    <xsl:template name="mp907-zorgaanbieder">
        <xsl:param name="hl7-current-organization"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-parent-of-zorgaanbieder"/>
        <xsl:variable name="zorgaanbieder2-complexType" select="$xsd-parent-of-zorgaanbieder//xs:element[@name = 'zorgaanbieder']/@type"/>
        <xsl:variable name="xsd-zorgaanbieder2" select="$xsd-ada//xs:complexType[@name = $zorgaanbieder2-complexType]"/>
        <xsl:for-each select="$hl7-current-organization">
            <zorgaanbieder>
                <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-zorgaanbieder2)"/>

                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="./hl7:id"/>
                    <xsl:with-param name="elemName">zorgaanbieder_identificatienummer</xsl:with-param>
                    <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-zorgaanbieder2, 'zorgaanbieder_identificatienummer')))"/>
                </xsl:call-template>
                <!-- organisatienaam has 1..1 R in MP 9 ADA transactions, but is not always present in HL7 input messages.  -->
                <!-- fill with nullFlavor if necessary -->
                <xsl:call-template name="handleST">
                    <xsl:with-param name="in" select="./hl7:name"/>
                    <xsl:with-param name="elemName">organisatie_naam</xsl:with-param>
                    <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-zorgaanbieder2, 'organisatie_naam')))"/>
                    <xsl:with-param name="nullIfMissing">NI</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="handleADtoAddressInformation">
                    <xsl:with-param name="in" select="./hl7:addr"/>
                    <xsl:with-param name="language">nl-NL</xsl:with-param>
                    <xsl:with-param name="schema" select="$xsd-ada"/>
                    <xsl:with-param name="schemaFragment" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-zorgaanbieder2, 'adresgegevens'))"/>
                </xsl:call-template>
            </zorgaanbieder>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medication Kind 6.12 to ADA 9 </xd:desc>
        <xd:param name="product-hl7">Input product ada xml element</xd:param>
        <xd:param name="xsd-ada">The ada xsd</xd:param>
        <xd:param name="xsd-geneesmiddel">The ada xsd element definition for product (geneesmiddel)</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000">
        <xsl:param name="product-hl7" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-geneesmiddel"/>
        <xsl:variable name="xsd-product-complexType" select="$xsd-geneesmiddel//xs:element[@name = 'product']/@type"/>
        <xsl:variable name="xsd-product" select="$xsd-ada//xs:complexType[@name = $xsd-product-complexType]"/>
        <product conceptId="{$xsd-product/xs:attribute[@name='conceptId']/@fixed}">
            <xsl:variable name="xsd-complexType" select="$xsd-product//xs:element[@name = 'product_code']/@type"/>
            <!-- Let op! Er is (nog?) geen ondersteuning voor optionele translations... -->
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="./hl7:id"/>
                <xsl:with-param name="elemName">product_code</xsl:with-param>
                <xsl:with-param name="conceptId" select="$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name = 'conceptId']/@fixed"/>
            </xsl:call-template>
            <xsl:for-each select=".[hl7:code[@nullFlavor]] | .[not(hl7:code)]">
                <xsl:variable name="xsd-product_specificatie-complexType" select="$xsd-product//xs:element[@name = 'product_specificatie']/@type"/>
                <xsl:variable name="xsd-product_specificatie" select="$xsd-ada//xs:complexType[@name = $xsd-product_specificatie-complexType]"/>
                <product_specificatie conceptId="{$xsd-product_specificatie/xs:attribute[@name='conceptId']/@fixed}">
                    <!-- product_naam -->
                    <xsl:for-each select="./hl7:code/hl7:originalText">
                        <product_naam value="{./text()}" conceptId="{nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-product_specificatie, 'product_naam')))}"/>
                    </xsl:for-each>
                    <!-- omschrijving -->
                    <xsl:for-each select="./hl7:desc">
                        <omschrijving value="{./text()}" conceptId="{nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-product_specificatie, 'product_naam')))}"/>
                    </xsl:for-each>
                    <!-- farmaceutische vorm -->
                    <xsl:for-each select="./hl7:formCode">
                        <farmaceutische_vorm conceptId="{nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-product_specificatie, 'farmaceutische_vorm')))}">
                            <xsl:call-template name="mp9-code-attribs">
                                <xsl:with-param name="current-hl7-code" select="."/>
                            </xsl:call-template>
                        </farmaceutische_vorm>
                    </xsl:for-each>
                    <!-- ingredient -->
                    <xsl:for-each select="(./hl7:activeIngredient | ./hl7:otherIngredient)">
                        <xsl:variable name="xsd-ingredient-complexType" select="$xsd-product_specificatie//xs:element[@name = 'ingredient']/@type"/>
                        <xsl:variable name="xsd-ingredient" select="$xsd-ada//xs:complexType[@name = $xsd-ingredient-complexType]"/>
                        <ingredient conceptId="{$xsd-ingredient/xs:attribute[@name='conceptId']/@fixed}">
                            <!-- sterkte -->
                            <xsl:for-each select="./hl7:quantity">
                                <xsl:variable name="xsd-sterkte-complexType" select="$xsd-ingredient//xs:element[@name = 'sterkte']/@type"/>
                                <xsl:variable name="xsd-sterkte" select="$xsd-ada//xs:complexType[@name = $xsd-sterkte-complexType]"/>
                                <sterkte conceptId="{$xsd-sterkte/xs:attribute[@name='conceptId']/@fixed}">
                                    <!-- hoeveelheid_ingredient -->
                                    <xsl:for-each select="./hl7:numerator[.//@value] | ./hl7:numerator[@nullFlavor]">
                                        <xsl:variable name="xsd-hoeveelheid_ingredient-complexType" select="$xsd-sterkte//xs:element[@name = 'hoeveelheid_ingredient']/@type"/>
                                        <xsl:variable name="xsd-hoeveelheid_ingredient" select="$xsd-ada//xs:complexType[@name = $xsd-hoeveelheid_ingredient-complexType]"/>
                                        <hoeveelheid_ingredient conceptId="{$xsd-hoeveelheid_ingredient/xs:attribute[@name='conceptId']/@fixed}">
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                                <xsl:with-param name="xsd-hoeveelheid" select="$xsd-hoeveelheid_ingredient"/>
                                            </xsl:call-template>
                                        </hoeveelheid_ingredient>
                                    </xsl:for-each>
                                    <!-- hoeveelheid_product  -->
                                    <xsl:for-each select="./hl7:denominator[.//@value]">
                                        <xsl:variable name="xsd-hoeveelheid_product-complexType" select="$xsd-sterkte//xs:element[@name = 'hoeveelheid_product']/@type"/>
                                        <xsl:variable name="xsd-hoeveelheid_product" select="$xsd-ada//xs:complexType[@name = $xsd-hoeveelheid_product-complexType]"/>
                                        <hoeveelheid_product conceptId="{$xsd-hoeveelheid_product/xs:attribute[@name='conceptId']/@fixed}">
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                                <xsl:with-param name="xsd-hoeveelheid" select="$xsd-hoeveelheid_product"/>
                                            </xsl:call-template>
                                        </hoeveelheid_product>
                                    </xsl:for-each>
                                </sterkte>
                            </xsl:for-each>
                            <!-- ingredient_code -->
                            <xsl:for-each select="./(hl7:activeIngredientMaterialKind | ./hl7:ingredientMaterialKind)/hl7:code">
                                <xsl:variable name="xsd-complexType" select="$xsd-ingredient//xs:element[@name = 'ingredient_code']/@type"/>
                                <ingredient_code conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
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
        <xd:param name="xsd-ada">The ada xsd</xd:param>
        <xd:param name="xsd-geneesmiddel">The ada xsd element definition for product (geneesmiddel)</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000-907">
        <xsl:param name="product-hl7" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-geneesmiddel"/>
        <xsl:variable name="xsd-product-complexType" select="$xsd-geneesmiddel//xs:element[@name = 'product']/@type"/>
        <xsl:variable name="xsd-product" select="$xsd-ada//xs:complexType[@name = $xsd-product-complexType]"/>
        <product conceptId="{$xsd-product/xs:attribute[@name='conceptId']/@fixed}">
            <xsl:for-each select="./(hl7:code[@code or @nullFlavor] | hl7:code/hl7:translation[@code or @nullFlavor])">
                <xsl:variable name="xsd-complexType" select="$xsd-product//xs:element[@name = 'product_code']/@type"/>
                <product_code conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                    <xsl:call-template name="mp9-code-attribs">
                        <xsl:with-param name="current-hl7-code" select="."/>
                    </xsl:call-template>
                </product_code>
            </xsl:for-each>
            <xsl:for-each select=".[hl7:code[@nullFlavor]] | .[not(hl7:code)]">
                <xsl:variable name="xsd-product_specificatie-complexType" select="$xsd-product//xs:element[@name = 'product_specificatie']/@type"/>
                <xsl:variable name="xsd-product_specificatie" select="$xsd-ada//xs:complexType[@name = $xsd-product_specificatie-complexType]"/>
                <product_specificatie conceptId="{$xsd-product_specificatie/xs:attribute[@name='conceptId']/@fixed}">
                    <!-- product_naam -->
                    <xsl:for-each select="./hl7:code/hl7:originalText">
                        <xsl:variable name="xsd-complexType" select="$xsd-product_specificatie//xs:element[@name = 'product_naam']/@type"/>
                        <product_naam value="{./text()}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                    </xsl:for-each>
                    <!-- omschrijving -->
                    <xsl:for-each select="./hl7:desc">
                        <xsl:variable name="xsd-complexType" select="$xsd-product_specificatie//xs:element[@name = 'omschrijving']/@type"/>
                        <omschrijving value="{./text()}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                    </xsl:for-each>
                    <!-- farmaceutische vorm -->
                    <xsl:for-each select="./hl7:formCode">
                        <xsl:variable name="xsd-complexType" select="$xsd-product_specificatie//xs:element[@name = 'farmaceutische_vorm']/@type"/>
                        <farmaceutische_vorm conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                            <xsl:call-template name="mp9-code-attribs">
                                <xsl:with-param name="current-hl7-code" select="."/>
                            </xsl:call-template>
                        </farmaceutische_vorm>
                    </xsl:for-each>
                    <!-- ingredient -->
                    <xsl:for-each select="(./hl7:activeIngredient | ./hl7:otherIngredient)">
                        <xsl:variable name="xsd-ingredient-complexType" select="$xsd-product_specificatie//xs:element[@name = 'ingredient']/@type"/>
                        <xsl:variable name="xsd-ingredient" select="$xsd-ada//xs:complexType[@name = $xsd-ingredient-complexType]"/>
                        <ingredient conceptId="{$xsd-ingredient/xs:attribute[@name='conceptId']/@fixed}">
                            <!-- sterkte -->
                            <xsl:for-each select="./hl7:quantity">
                                <xsl:variable name="xsd-sterkte-complexType" select="$xsd-ingredient//xs:element[@name = 'sterkte']/@type"/>
                                <xsl:variable name="xsd-sterkte" select="$xsd-ada//xs:complexType[@name = $xsd-sterkte-complexType]"/>
                                <sterkte conceptId="{$xsd-sterkte/xs:attribute[@name='conceptId']/@fixed}">
                                    <!-- hoeveelheid_ingredient -->
                                    <xsl:for-each select="./hl7:numerator[.//@value] | ./hl7:numerator[@nullFlavor]">
                                        <xsl:variable name="xsd-hoeveelheid_ingredient-complexType" select="$xsd-sterkte//xs:element[@name = 'hoeveelheid_ingredient']/@type"/>
                                        <xsl:variable name="xsd-hoeveelheid_ingredient" select="$xsd-ada//xs:complexType[@name = $xsd-hoeveelheid_ingredient-complexType]"/>
                                        <hoeveelheid_ingredient conceptId="{$xsd-hoeveelheid_ingredient/xs:attribute[@name='conceptId']/@fixed}">
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                                <xsl:with-param name="xsd-hoeveelheid" select="$xsd-hoeveelheid_ingredient"/>
                                            </xsl:call-template>
                                        </hoeveelheid_ingredient>
                                    </xsl:for-each>
                                    <!-- hoeveelheid_product  -->
                                    <xsl:for-each select="./hl7:denominator[.//@value]">
                                        <xsl:variable name="xsd-hoeveelheid_product-complexType" select="$xsd-sterkte//xs:element[@name = 'hoeveelheid_product']/@type"/>
                                        <xsl:variable name="xsd-hoeveelheid_product" select="$xsd-ada//xs:complexType[@name = $xsd-hoeveelheid_product-complexType]"/>
                                        <hoeveelheid_product conceptId="{$xsd-hoeveelheid_product/xs:attribute[@name='conceptId']/@fixed}">
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                                <xsl:with-param name="xsd-hoeveelheid" select="$xsd-hoeveelheid_product"/>
                                            </xsl:call-template>
                                        </hoeveelheid_product>
                                    </xsl:for-each>
                                </sterkte>
                            </xsl:for-each>
                            <!-- ingredient_code -->
                            <xsl:for-each select="./(hl7:activeIngredientMaterialKind | ./hl7:ingredientMaterialKind)/hl7:code">
                                <xsl:variable name="xsd-complexType" select="$xsd-ingredient//xs:element[@name = 'ingredient_code']/@type"/>
                                <ingredient_code conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
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
        <medicamenteuze_behandeling conceptId="{$xsd-mbh/xs:attribute[@name='conceptId']/@fixed}">
            <!-- mbh id is not known in 6.12. We make something up for beschikbaarstellen_medicatiegegevens since it is required there -->
            <xsl:if test="$transaction = 'beschikbaarstellen_medicatiegegevens'">
                <xsl:for-each select="$current-dispense-event/hl7:id[@extension]">
                    <xsl:variable name="identificatie-complexType" select="$xsd-mbh//xs:element[@name = 'identificatie']/@type"/>
                    <xsl:comment>MBH id generated from 6.12 dispense identifier</xsl:comment>
                    <identificatie value="{concat('MedBehConverted_', ./@extension)}" root="{./@root}" conceptId="{$xsd-ada//xs:complexType[@name=$identificatie-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                </xsl:for-each>
            </xsl:if>
            <xsl:call-template name="mp9-toedieningsafspraak-from-mp612">
                <xsl:with-param name="current-dispense-event" select="$current-dispense-event"/>
                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                <xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
                <xsl:with-param name="transaction" select="$transaction"/>
            </xsl:call-template>
            <xsl:call-template name="mp9-verstrekking-from-mp612">
                <xsl:with-param name="current-hl7-verstrekking" select="."/>
                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                <xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
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
        <medicamenteuze_behandeling conceptId="{$xsd-mbh/xs:attribute[@name='conceptId']/@fixed}">
            <!-- mbh id is not known in 6.12. But we still need it to relate TA and MVE, we fill it with dispense id -->
            <xsl:for-each select="$current-dispense-event/hl7:id[@extension]">
                <xsl:variable name="identificatie-complexType" select="$xsd-mbh//xs:element[@name = 'identificatie']/@type"/>
                <xsl:comment>MBH id copied from 6.12 dispense identifier</xsl:comment>
                <identificatie value="{./@extension}" root="{./@root}" conceptId="{$xsd-ada//xs:complexType[@name=$identificatie-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            </xsl:for-each>
            <xsl:call-template name="mp9-toedieningsafspraak-from-mp612-907">
                <xsl:with-param name="current-dispense-event" select="$current-dispense-event"/>
                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                <xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
                <xsl:with-param name="transaction" select="$transaction"/>
            </xsl:call-template>
            <xsl:call-template name="mp9-verstrekking-from-mp612">
                <xsl:with-param name="current-hl7-verstrekking" select="."/>
                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                <xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
                <xsl:with-param name="transaction" select="$transaction"/>
            </xsl:call-template>
        </medicamenteuze_behandeling>
    </xsl:template>


    <xd:doc>
        <xd:desc> PatientNL in verstrekking 6.12 </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.816_20130521000000">
        <xsl:variable name="current-patient" select="."/>
        <patient conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19798">
            <!-- gestructureerde naam in subelementen -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:name[*]">
                <xsl:call-template name="mp9-naamgegevens">
                    <xsl:with-param name="current-hl7-name" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <!-- ongestructureerde_naam -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:name[not(*)]">
                <naamgegevens conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19799">
                    <ongestructureerde_naam value="{.}" conceptId="1.2.3.4.5.12345.19799.1"/>
                </naamgegevens>
            </xsl:for-each>
            <!-- patient_identificatienummer -->
            <xsl:for-each select="$current-patient/hl7:id">
                <patient_identificatienummer conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19829">
                    <xsl:attribute name="root" select="./@root"/>
                    <xsl:attribute name="value" select="./@extension"/>
                </patient_identificatienummer>
            </xsl:for-each>
            <!-- geboortedatum -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:birthTime[@value]">
                <geboortedatum conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19830">
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
                <meerling_indicator conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19832">
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
        <patient conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19798">
            <!-- gestructureerde naam in subelementen -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:name[*]">
                <xsl:call-template name="mp9-naamgegevens">
                    <xsl:with-param name="current-hl7-name" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <!-- ongestructureerde_naam -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:name[not(*)]">
                <naamgegevens conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19799">
                    <ongestructureerde_naam value="{.}" conceptId="1.2.3.4.5.12345.19799.1"/>
                </naamgegevens>
            </xsl:for-each>
            <!-- patient_identificatienummer -->
            <xsl:for-each select="$current-patient/hl7:id">
                <identificatienummer conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19829">
                    <xsl:attribute name="root" select="./@root"/>
                    <xsl:attribute name="value" select="./@extension"/>
                </identificatienummer>
            </xsl:for-each>
            <!-- geboortedatum -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:birthTime[@value]">
                <geboortedatum conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19830">
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
                <meerling_indicator conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19832">
                    <xsl:attribute name="value" select="./@value"/>
                </meerling_indicator>
            </xsl:for-each>
        </patient>
    </xsl:template>


    <xd:doc>
        <xd:desc> Frequency </xd:desc>
        <xd:param name="PIVL_TS"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-toedieningsschema"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9020_20150305134139_toedieningsschema">
        <xsl:param name="PIVL_TS"/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-toedieningsschema"/>
        <!-- we are converting to toedieningsschema, cyclisch schema should be ignored here: phase/width -->
        <!-- we will deal with 'vaste toedieningstijd' later, let's also include those here: phase/center -->
        <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
        <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
        <xsl:for-each select="$PIVL_TS[not(hl7:phase/hl7:width)][not(hl7:phase/hl7:center)]">
            <xsl:for-each select="./hl7:period">
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
                        <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
                        <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
                        <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                            <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                            <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                            <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                                <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                                <vaste_waarde value="{round($vaste_frequentie_one_decimal)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                            </aantal>
                            <xsl:variable name="xsd-complexType" select="$xsd-frequentie//xs:element[@name = 'tijdseenheid']/@type"/>
                            <tijdseenheid value="{$tijdseenheid}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                        </frequentie>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:comment>The period cannot be properly converted to a frequency integer. Period = <xsl:value-of select="./@value"/> <xsl:value-of select="./@unit"/> resulting in frequency/aantal rounded to one decimal of: <xsl:value-of select="$vaste_frequentie_one_decimal"/></xsl:comment>
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
                <xsl:when test="./hl7:period[@value = '1'][@unit = 'd']"><!-- Do nothing, no need to output frequency of once a day --></xsl:when>
                <xsl:when test="./hl7:period[not(@unit = 'd')]">
                    <xsl:comment>Found a schedule with a specific time and an interval unequal to 'd'. This is not allowed.</xsl:comment>
                </xsl:when>
                <xsl:when test="./hl7:period[@value castable as xs:integer and @value &gt; 1]">
                    <!-- let's output the frequency -->
                    <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                        <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                        <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                            <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                            <vaste_waarde value="1" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                        </aantal>
                        <xsl:variable name="xsd-complexType" select="$xsd-frequentie//xs:element[@name = 'tijdseenheid']/@type"/>
                        <tijdseenheid value="{./hl7:period/@value}" unit="{nf:convertTime_UCUM2ADA_unit(./hl7:period/@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                    </frequentie>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:comment>Unexpected error with contents of period in toedieningsschema for toedieningstijd</xsl:comment>
                </xsl:otherwise>
            </xsl:choose>
            <!-- toedientijd -->
            <xsl:choose>
                <xsl:when test="./hl7:period[@value castable as xs:integer and @value &gt;= 1][@unit = 'd']">
                    <!-- output the toedieningstijd -->
                    <xsl:variable name="xsd-toedientijd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'toedientijd']/@type"/>
                    <xsl:variable name="xsd-toedientijd" select="$xsd-ada//xs:complexType[@name = $xsd-toedientijd-complexType]"/>
                    <toedientijd value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./hl7:phase/hl7:center/@value), nf:determine_date_precision(./hl7:phase/hl7:center/@value))}" conceptId="{$xsd-toedientijd/xs:attribute[@name='conceptId']/@fixed}"/>
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
        <xd:desc> MP 9.0.6 CDA Author Participation </xd:desc>
        <xd:param name="author-hl7"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-auteur"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
        <xsl:param name="author-hl7" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-auteur"/>

        <xsl:for-each select="$author-hl7/hl7:assignedAuthor">
            <xsl:variable name="zorgverlener-complexType" select="$xsd-auteur//xs:element[@name = 'zorgverlener']/@type"/>
            <xsl:variable name="xsd-zorgverlener" select="$xsd-ada//xs:complexType[@name = $zorgverlener-complexType]"/>
            <zorgverlener conceptId="{$xsd-zorgverlener/xs:attribute[@name='conceptId']/@fixed}">
                <xsl:for-each select="./hl7:id">
                    <xsl:variable name="xsd-complexType" select="$xsd-zorgverlener//xs:element[@name = 'zorgverlener_identificatie_nummer']/@type"/>
                    <zorgverlener_identificatie_nummer value="{./@extension}" root="{./@root}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                </xsl:for-each>
                <xsl:for-each select="./hl7:assignedPerson/hl7:name">
                    <xsl:variable name="zorgverlener_naam-complexType" select="$xsd-zorgverlener//xs:element[@name = 'zorgverlener_naam']/@type"/>
                    <xsl:variable name="xsd-zorgverlener_naam" select="$xsd-ada//xs:complexType[@name = $zorgverlener_naam-complexType]"/>
                    <zorgverlener_naam conceptId="{$xsd-zorgverlener_naam/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:variable name="naamgegevens-complexType" select="$xsd-zorgverlener_naam//xs:element[@name = 'naamgegevens']/@type"/>
                        <xsl:variable name="xsd-naamgegevens" select="$xsd-ada//xs:complexType[@name = $naamgegevens-complexType]"/>
                        <naamgegevens conceptId="{$xsd-naamgegevens/xs:attribute[@name='conceptId']/@fixed}">
                            <!-- ongestructureerde_naam -->
                            <xsl:for-each select=".[text()][not(child::*)]">
                                <xsl:variable name="xsd-complexType" select="$xsd-naamgegevens//xs:element[@name = 'ongestructureerde_naam']/@type"/>
                                <ongestructureerde_naam conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="."/>
                                    </xsl:attribute>
                                </ongestructureerde_naam>
                                <!-- achternaam is 1..1R, die vullen we dan maar even met een nullFlavor vanwege ada xsd foutmeldingen -->
                                <xsl:variable name="geslachtsnaam-complexType" select="$xsd-naamgegevens//xs:element[@name = 'geslachtsnaam']/@type"/>
                                <xsl:variable name="xsd-geslachtsnaam" select="$xsd-ada//xs:complexType[@name = $geslachtsnaam-complexType]"/>
                                <geslachtsnaam conceptId="{$xsd-geslachtsnaam/xs:attribute[@name='conceptId']/@fixed}">
                                    <xsl:variable name="xsd-complexType" select="$xsd-geslachtsnaam//xs:element[@name = 'achternaam']/@type"/>
                                    <achternaam nullFlavor="NI" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                </geslachtsnaam>
                            </xsl:for-each>
                            <xsl:for-each select="./hl7:given[contains(@qualifier, 'BR') or not(@qualifier)]">
                                <xsl:variable name="xsd-complexType" select="$xsd-naamgegevens//xs:element[@name = 'voornamen']/@type"/>
                                <voornamen value="{./text()}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                            </xsl:for-each>
                            <xsl:for-each select="./hl7:given[@qualifier = 'IN']">
                                <!-- in HL7 mogen de initialen van officiële voornamen niet herhaald / gedupliceerd worden in het initialen veld -->
                                <!-- in de zib moeten de initialen juist compleet zijn, dus de initialen hier toevoegen van de officiële voornamen -->
                                <xsl:variable name="initialen_concatted">
                                    <xsl:for-each select="./hl7:given[contains(@qualifier, 'BR') or not(@qualifier)]">
                                        <xsl:for-each select="tokenize(., ' ')">
                                            <xsl:value-of select="concat(substring(., 1, 1), '.')"/>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                    <xsl:for-each select="./hl7:given[@qualifier = 'IN']">
                                        <xsl:value-of select="./text()"/>
                                    </xsl:for-each>
                                </xsl:variable>
                                <xsl:variable name="xsd-complexType" select="$xsd-naamgegevens//xs:element[@name = 'initialen']/@type"/>
                                <initialen value="{$initialen_concatted}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                            </xsl:for-each>
                            <xsl:for-each select="./hl7:family">
                                <xsl:variable name="geslachtsnaam-complexType" select="$xsd-naamgegevens//xs:element[@name = 'geslachtsnaam']/@type"/>
                                <xsl:variable name="xsd-geslachtsnaam" select="$xsd-ada//xs:complexType[@name = $geslachtsnaam-complexType]"/>
                                <geslachtsnaam conceptId="{$xsd-geslachtsnaam/xs:attribute[@name='conceptId']/@fixed}">
                                    <xsl:for-each select="./preceding-sibling::hl7:prefix[@qualifier = 'VV'][position() = 1]">
                                        <xsl:variable name="xsd-complexType" select="$xsd-geslachtsnaam//xs:element[@name = 'voorvoegsels']/@type"/>
                                        <voorvoegsels value="{./text()}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                    </xsl:for-each>
                                    <xsl:variable name="xsd-complexType" select="$xsd-geslachtsnaam//xs:element[@name = 'achternaam']/@type"/>
                                    <achternaam value="{./text()}" conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                                </geslachtsnaam>
                            </xsl:for-each>
                        </naamgegevens>
                    </zorgverlener_naam>
                </xsl:for-each>
                <!-- specialisme -->
                <xsl:for-each select="./hl7:code">
                    <xsl:variable name="xsd-complexType" select="$xsd-zorgverlener//xs:element[@name = 'specialisme']/@type"/>
                    <specialisme conceptId="{$xsd-ada//xs:complexType[@name=$xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:call-template name="mp9-code-attribs">
                            <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                    </specialisme>
                </xsl:for-each>
                <xsl:for-each select="./hl7:representedOrganization">
                    <xsl:variable name="zorgaanbieder-complexType" select="$xsd-zorgverlener//xs:element[@name = 'zorgaanbieder']/@type"/>
                    <xsl:variable name="xsd-zorgaanbieder" select="$xsd-ada//xs:complexType[@name = $zorgaanbieder-complexType]"/>
                    <zorgaanbieder conceptId="{$xsd-zorgaanbieder/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:call-template name="mp9-zorgaanbieder">
                            <xsl:with-param name="hl7-current-organization" select="."/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-parent-of-zorgaanbieder" select="$xsd-zorgaanbieder"/>
                        </xsl:call-template>
                    </zorgaanbieder>
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
            <xsl:variable name="xsd-zorgverlener" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-auteur, 'zorgverlener'))"/>
            <zorgverlener>
                <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-zorgverlener)"/>

                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="./hl7:id"/>
                    <xsl:with-param name="elemName">zorgverlener_identificatienummer</xsl:with-param>
                    <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-zorgverlener, 'zorgverlener_identificatienummer')))"/>
                </xsl:call-template>

                <xsl:variable name="xsd-zorgverlenernaamgegevens" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-zorgverlener, 'naamgegevens'))"/>
                <xsl:if test="./hl7:assignedPerson/hl7:name">
                    <naamgegevens>
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-zorgverlenernaamgegevens)"/>

                        <xsl:call-template name="handleENtoNameInformation">
                            <xsl:with-param name="in" select="./hl7:assignedPerson/hl7:name"/>
                            <xsl:with-param name="language">nl-NL</xsl:with-param>
                            <xsl:with-param name="unstructurednameElement">ongestructureerde_naam</xsl:with-param>
                            <xsl:with-param name="schema" select="$xsd-ada"/>
                            <xsl:with-param name="schemaFragment" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-zorgverlenernaamgegevens, 'naamgegevens'))"/>
                        </xsl:call-template>
                    </naamgegevens>
                </xsl:if>
                <!-- specialisme -->
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="./hl7:code"/>
                    <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-zorgverlener, 'specialisme')))"/>
                    <xsl:with-param name="elemName">specialisme</xsl:with-param>
                </xsl:call-template>
                <xsl:for-each select="./hl7:representedOrganization">
                    <xsl:call-template name="mp907-zorgaanbieder">
                        <xsl:with-param name="hl7-current-organization" select="."/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-parent-of-zorgaanbieder" select="$xsd-zorgverlener"/>
                    </xsl:call-template>
                </xsl:for-each>
            </zorgverlener>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc> MP 9.0 MP CDA Medication Information </xd:desc>
        <xd:param name="product-hl7">The hl7 xml element which contains the medication product</xd:param>
        <xd:param name="xsd-ada">ada xsd, used to retrieve concept id's</xd:param>
        <xd:param name="xsd-geneesmiddel">ada xsd fragment for the parent of ada product</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
        <xsl:param name="product-hl7" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-geneesmiddel"/>
        <!-- product -->
        <xsl:variable name="ada-elemName">product</xsl:variable>
        <xsl:variable name="xsd-fragment" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-geneesmiddel, $ada-elemName))"/>
        <xsl:element name="{$ada-elemName}">
            <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-fragment)"/>

            <!-- product_code -->
            <xsl:variable name="ada-elemName">product_code</xsl:variable>
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="hl7:code | hl7:code/hl7:translation"/>
                <xsl:with-param name="elemName" select="$ada-elemName"/>
                <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-fragment, $ada-elemName)))"/>
            </xsl:call-template>
            <!-- product_specificatie -->
            <xsl:for-each select=".[hl7:code[@nullFlavor]] | .[not(hl7:code)]">
                <xsl:variable name="ada-elemName">product_specificatie</xsl:variable>
                <xsl:variable name="xsd-product_specificatie" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-fragment, $ada-elemName))"/>
                <xsl:element name="{$ada-elemName}">
                    <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-product_specificatie)"/>

                    <!-- product_naam -->
                    <xsl:variable name="ada-elemName">product_naam</xsl:variable>
                    <xsl:call-template name="handleST">
                        <xsl:with-param name="in" select="hl7:name"/>
                        <xsl:with-param name="elemName" select="$ada-elemName"/>
                        <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-product_specificatie, $ada-elemName)))"/>
                    </xsl:call-template>
                    <!-- omschrijving -->
                    <xsl:variable name="ada-elemName">omschrijving</xsl:variable>
                    <xsl:call-template name="handleST">
                        <xsl:with-param name="in" select="pharm:desc"/>
                        <xsl:with-param name="elemName" select="$ada-elemName"/>
                        <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-product_specificatie, $ada-elemName)))"/>
                    </xsl:call-template>
                    <!-- farmaceutische vorm -->
                    <xsl:variable name="ada-elemName">farmaceutische_vorm</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="pharm:formCode"/>
                        <xsl:with-param name="elemName" select="$ada-elemName"/>
                        <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-product_specificatie, $ada-elemName)))"/>
                    </xsl:call-template>
                    <!-- ingredient -->
                    <xsl:for-each select="./pharm:ingredient">
                        <xsl:variable name="ada-elemName">ingredient</xsl:variable>
                        <xsl:variable name="xsd-ingredient" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-product_specificatie, $ada-elemName))"/>
                        <xsl:element name="{$ada-elemName}">
                            <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-ingredient)"/>

                            <!-- sterkte -->
                            <xsl:for-each select="./pharm:quantity">
                                <xsl:variable name="ada-elemName">sterkte</xsl:variable>
                                <xsl:variable name="xsd-sterkte" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ingredient, $ada-elemName))"/>
                                <xsl:element name="{$ada-elemName}">
                                    <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-sterkte)"/>
                                    <!-- hoeveelheid_ingredient -->
                                    <xsl:for-each select="./hl7:numerator[.//@value | @nullFlavor]">
                                        <xsl:variable name="ada-elemName">hoeveelheid_ingredient</xsl:variable>
                                        <xsl:variable name="xsd-hoeveelheid-ingredient" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-sterkte, $ada-elemName))"/>
                                        <xsl:element name="{$ada-elemName}">
                                            <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-hoeveelheid-ingredient)"/>
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                                <xsl:with-param name="xsd-hoeveelheid" select="$xsd-hoeveelheid-ingredient"/>
                                            </xsl:call-template>
                                        </xsl:element>
                                    </xsl:for-each>
                                    <!-- hoeveelheid_product  -->
                                    <xsl:for-each select="./hl7:denominator[.//@value]">
                                        <xsl:variable name="xsd-hoeveelheid_product-complexType" select="$xsd-sterkte//xs:element[@name = 'hoeveelheid_product']/@type"/>
                                        <xsl:variable name="xsd-hoeveelheid_product" select="$xsd-ada//xs:complexType[@name = $xsd-hoeveelheid_product-complexType]"/>
                                        <hoeveelheid_product conceptId="{$xsd-hoeveelheid_product/xs:attribute[@name='conceptId']/@fixed}">
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                                <xsl:with-param name="xsd-hoeveelheid" select="$xsd-hoeveelheid_product"/>
                                            </xsl:call-template>
                                        </hoeveelheid_product>
                                    </xsl:for-each>
                                </xsl:element>
                            </xsl:for-each>
                            <!-- ingredient_code -->
                            <xsl:for-each select="./pharm:ingredient/pharm:code">
                                <xsl:variable name="xsd-complexType" select="$xsd-ingredient//xs:element[@name = 'ingredient_code']/@type"/>
                                <ingredient_code conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}">
                                    <xsl:call-template name="mp9-code-attribs">
                                        <xsl:with-param name="current-hl7-code" select="."/>
                                    </xsl:call-template>
                                </ingredient_code>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>


    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.0.6 </xd:desc>
        <xd:param name="ma_hl7_905"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-mbh"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9148_20160725130413">
        <xsl:param name="ma_hl7_905" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-mbh"/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9201_20180419121646">
            <xsl:with-param name="ma_hl7_90" select="$ma_hl7_905"/>
            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
            <xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="current_PIVL"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-toedieningsschema"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123_only_phase_low">
        <xsl:param name="current_PIVL" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-toedieningsschema"/>
        <xsl:for-each select="$current_PIVL/hl7nl:phase/hl7nl:low">
            <!-- toedientijd indien van toepassing -->
            <xsl:if test="string-length(./@value) > 8">
                <xsl:variable name="xsd-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'toedientijd']/@type"/>
                <toedientijd value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./@value), nf:determine_date_precision(./@value))}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            </xsl:if>
            <xsl:call-template name="mp9-weekdag">
                <xsl:with-param name="hl7-phase-low" select="."/>
                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                <xsl:with-param name="xsd-toedieningsschema" select="$xsd-toedieningsschema"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc> HL7NL Frequency </xd:desc>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-toedieningsschema"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339">
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-toedieningsschema"/>

        <xsl:variable name="xsd-frequentie-complexType" select="$xsd-toedieningsschema//xs:element[@name = 'frequentie']/@type"/>
        <xsl:variable name="xsd-frequentie" select="$xsd-ada//xs:complexType[@name = $xsd-frequentie-complexType]"/>
        <frequentie conceptId="{$xsd-frequentie/xs:attribute[@name='conceptId']/@fixed}">
            <xsl:for-each select="./hl7nl:frequency/hl7nl:numerator">
                <xsl:variable name="xsd-aantal-complexType" select="$xsd-frequentie//xs:element[@name = 'aantal']/@type"/>
                <xsl:variable name="xsd-aantal" select="$xsd-ada//xs:complexType[@name = $xsd-aantal-complexType]"/>
                <aantal conceptId="{$xsd-aantal/xs:attribute[@name='conceptId']/@fixed}">
                    <xsl:for-each select=".//hl7nl:low[@value]">
                        <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'min']/@type"/>
                        <min value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                    </xsl:for-each>
                    <xsl:if test=".[@value]">
                        <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'vaste_waarde']/@type"/>
                        <vaste_waarde value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                    </xsl:if>
                    <xsl:for-each select=".//hl7nl:high[@value]">
                        <xsl:variable name="xsd-complexType" select="$xsd-aantal//xs:element[@name = 'max']/@type"/>
                        <max value="{./@value}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                    </xsl:for-each>
                </aantal>
            </xsl:for-each>
            <xsl:for-each select="./hl7nl:frequency/hl7nl:denominator">
                <xsl:variable name="xsd-complexType" select="$xsd-frequentie//xs:element[@name = 'tijdseenheid']/@type"/>
                <tijdseenheid value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="{$xsd-ada//xs:complexType[@name = $xsd-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
            </xsl:for-each>
        </frequentie>

    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.0.6 Inhoud</xd:desc>
        <xd:param name="ma_hl7_90"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-mbh"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9201_20180419121646">
        <xsl:param name="ma_hl7_90" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-mbh"/>
        <xsl:variable name="ma-complexType" select="$xsd-mbh//xs:element[@name = 'medicatieafspraak']/@type"/>
        <xsl:variable name="xsd-ma" select="$xsd-ada//xs:complexType[@name = $ma-complexType]"/>
        <xsl:for-each select="$ma_hl7_90">
            <medicatieafspraak conceptId="{$xsd-ma/xs:attribute[@name='conceptId']/@fixed}">
                <xsl:variable name="IVL_TS" select="./hl7:effectiveTime[@xsi:type = 'IVL_TS']"/>
                <xsl:for-each select="$IVL_TS/hl7:low[@value]">
                    <xsl:call-template name="mp9-gebruiksperiode-start">
                        <xsl:with-param name="inputValue" select="./@value"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-comp" select="$xsd-ma"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$IVL_TS/hl7:high[@value]">
                    <xsl:call-template name="mp9-gebruiksperiode-eind">
                        <xsl:with-param name="inputValue" select="./@value"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-comp" select="$xsd-ma"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="./hl7:id">
                    <identificatie value="{./@extension}" root="{./@root}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19758"/>
                </xsl:for-each>
                <xsl:for-each select="./hl7:author/hl7:time">
                    <afspraakdatum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./@value), nf:determine_date_precision(./@value))}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19757"/>
                </xsl:for-each>
                <xsl:for-each select="$IVL_TS/hl7:width">
                    <gebruiksperiode value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19936"/>
                </xsl:for-each>
                <xsl:for-each select="./hl7:statusCode">
                    <geannuleerd_indicator value="{./@code='nullified'}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23033"/>
                </xsl:for-each>
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9067']/hl7:value">
                    <stoptype conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19954">
                        <xsl:call-template name="mp9-code-attribs">
                            <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                    </stoptype>
                </xsl:for-each>
                <!-- relatie_naar_afspraak_of_gebruik -->
                <!-- relatie_naar ma -->
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9086']/hl7:id">
                    <!-- medicatieafspraak -->
                    <relatie_naar_afspraak_of_gebruik conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23238">
                        <identificatie root="{./@root}" value="{./@extension}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23239"/>
                    </relatie_naar_afspraak_of_gebruik>
                </xsl:for-each>
                <!-- relatie_naar ta -->
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9101']/hl7:id">
                    <!-- toedieningsafspraak -->
                    <relatie_naar_afspraak_of_gebruik conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23238">
                        <identificatie_23288 root="{./@root}" value="{./@extension}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23288"/>
                    </relatie_naar_afspraak_of_gebruik>
                </xsl:for-each>
                <!-- relatie_naar gb -->
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9176']/hl7:id">
                    <!-- medicatiegebruik -->
                    <relatie_naar_afspraak_of_gebruik conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23238">
                        <identificatie_23289 root="{./@root}" value="{./@extension}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23289"/>
                    </relatie_naar_afspraak_of_gebruik>
                </xsl:for-each>
                <!-- voorschrijver -->
                <xsl:variable name="voorschrijver-complexType" select="$xsd-ma//xs:element[@name = 'voorschrijver']/@type"/>
                <xsl:variable name="xsd-voorschrijver" select="$xsd-ada//xs:complexType[@name = $voorschrijver-complexType]"/>
                <voorschrijver conceptId="{$xsd-voorschrijver/xs:attribute[@name='conceptId']/@fixed}">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                        <xsl:with-param name="author-hl7" select="./hl7:author"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-auteur" select="$xsd-voorschrijver"/>
                    </xsl:call-template>
                </voorschrijver>
                <!-- reden afspraak -->
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9068']/hl7:value">
                    <reden_afspraak conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22094">
                        <xsl:call-template name="mp9-code-attribs">
                            <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                    </reden_afspraak>
                </xsl:for-each>
                <!-- reden van voorschrijven -->
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9160']/hl7:value">
                    <reden_van_voorschrijven conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23133">
                        <probleem conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23134">
                            <probleem_naam conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23136">
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </probleem_naam>
                        </probleem>
                    </reden_van_voorschrijven>
                </xsl:for-each>
                <!-- afgesproken_geneesmiddel -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <xsl:variable name="xsd-afgesproken_geneesmiddel-complexType" select="$xsd-ma//xs:element[@name = 'afgesproken_geneesmiddel']/@type"/>
                    <xsl:variable name="xsd-afgesproken_geneesmiddel" select="$xsd-ada//xs:complexType[@name = $xsd-afgesproken_geneesmiddel-complexType]"/>
                    <afgesproken_geneesmiddel conceptId="{$xsd-afgesproken_geneesmiddel/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-geneesmiddel" select="$xsd-afgesproken_geneesmiddel"/>
                        </xsl:call-template>
                    </afgesproken_geneesmiddel>
                </xsl:for-each>
                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp9-gebruiksinstructie-from-mp9">
                    <xsl:with-param name="hl7-comp" select="."/>
                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                    <xsl:with-param name="xsd-comp" select="$xsd-ma"/>
                </xsl:call-template>
                <!-- lichaamslengte  -->
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9122']/hl7:value">
                    <lichaamslengte conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23023">
                        <lengte_waarde value="{./@value}" unit="{nf:convertUnit_UCUM2ADA(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23024"> </lengte_waarde>
                    </lichaamslengte>
                </xsl:for-each>
                <!-- lichaamsgewicht  -->
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9123']/hl7:value">
                    <lichaamsgewicht conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23028">
                        <gewicht_waarde value="{./@value}" unit="{nf:convertUnit_UCUM2ADA(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23029"/>
                    </lichaamsgewicht>
                </xsl:for-each>
                <!-- aanvullende_informatie -->
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9177']/hl7:value">
                    <aanvullende_informatie conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23283">
                        <xsl:call-template name="mp9-code-attribs">
                            <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                    </aanvullende_informatie>
                </xsl:for-each>
                <!-- toelichting -->
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9069']/hl7:text">
                    <toelichting value="{./text()}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22273"/>
                </xsl:for-each>
            </medicatieafspraak>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.0.7 Inhoud </xd:desc>
        <xd:param name="ma_hl7_90"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-mbh"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9233_20181204130547">
        <xsl:param name="ma_hl7_90" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-mbh"/>
        <xsl:variable name="xsd-ma" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-mbh, 'medicatieafspraak'))"/>
        <xsl:for-each select="$ma_hl7_90">
            <medicatieafspraak>
                <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-ma)"/>

                <xsl:variable name="IVL_TS" select="./hl7:effectiveTime[@xsi:type = 'IVL_TS']"/>
                <!-- gebruiksperiode_start -->
                <xsl:variable name="ada-elemName">gebruiksperiode_start</xsl:variable>
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="$IVL_TS/hl7:low"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                    <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName)))"/>
                </xsl:call-template>
                <!-- gebruiksperiode_start -->
                <xsl:variable name="ada-elemName">gebruiksperiode_eind</xsl:variable>
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="$IVL_TS/hl7:high"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                    <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName)))"/>
                </xsl:call-template>
                <!-- identificatie -->
                <xsl:variable name="ada-elemName">identificatie</xsl:variable>
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="./hl7:id"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                    <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName)))"/>
                </xsl:call-template>
                <!-- afspraakdatum -->
                <xsl:variable name="ada-elemName">afspraakdatum</xsl:variable>
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="./hl7:author/hl7:time"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                    <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName)))"/>
                </xsl:call-template>
                <!-- gebruiksperiode -->
                <!-- do not use the handlePQ template since the mp ada time unit does not comply to the assumptions in that template -->
                <xsl:variable name="ada-elemName">gebruiksperiode</xsl:variable>
                <xsl:for-each select="$IVL_TS/hl7:width[@value]">
                    <xsl:element name="{$ada-elemName}">
                        <xsl:attribute name="value" select="./@value"/>
                        <xsl:attribute name="unit" select="nf:convertTime_UCUM2ADA_unit(./@unit)"/>
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName)))"/>
                    </xsl:element>
                </xsl:for-each>
                <!-- geannuleerd_indicator -->
                <xsl:for-each select="./hl7:statusCode">
                    <geannuleerd_indicator value="{./@code='nullified'}">
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, 'geannuleerd_indicator')))"/>
                    </geannuleerd_indicator>
                </xsl:for-each>
                <!-- stoptype -->
                <xsl:variable name="ada-elemName">stoptype</xsl:variable>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9067']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                    <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName)))"/>
                </xsl:call-template>
                <!-- relatie_naar_afspraak_of_gebruik -->
                <xsl:variable name="template-id-rel-ma">2.16.840.1.113883.2.4.3.11.60.20.77.10.9086</xsl:variable>
                <xsl:variable name="template-id-rel-ta">2.16.840.1.113883.2.4.3.11.60.20.77.10.9101</xsl:variable>
                <xsl:variable name="template-id-rel-gb">2.16.840.1.113883.2.4.3.11.60.20.77.10.9176</xsl:variable>
                <xsl:variable name="template-id-rel-afspr-gebr" select="($template-id-rel-ma, $template-id-rel-ta, $template-id-rel-gb)"/>
                <xsl:variable name="ada-elemName">relatie_naar_afspraak_of_gebruik</xsl:variable>
                <xsl:variable name="xsd-fragment" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName))"/>
                <xsl:if test="./hl7:entryRelationship/*[hl7:templateId/@root = $template-id-rel-afspr-gebr]/hl7:id">
                    <xsl:element name="{$ada-elemName}">
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-fragment)"/>
                        <!-- relatie naar ma -->
                        <xsl:variable name="ada-elemName">identificatie</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="./hl7:entryRelationship/*[hl7:templateId/@root = $template-id-rel-ma]/hl7:id"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-fragment, $ada-elemName)))"/>
                        </xsl:call-template>
                        <xsl:variable name="ada-elemName">identificatie_23288</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="./hl7:entryRelationship/*[hl7:templateId/@root = $template-id-rel-ta]/hl7:id"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-fragment, $ada-elemName)))"/>
                        </xsl:call-template>
                        <xsl:variable name="ada-elemName">identificatie_23289</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="./hl7:entryRelationship/*[hl7:templateId/@root = $template-id-rel-gb]/hl7:id"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-fragment, $ada-elemName)))"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:if>
                <!-- relaties ketenzorg -->
                <xsl:variable name="rel-encounter" select="./hl7:entryRelationship[@typeCode = 'REFR']/hl7:encounter"/>
                <xsl:variable name="rel-concern" select="./hl7:entryRelationship[@typeCode = 'REFR']/hl7:act[hl7:code[@code = 'CONC'][@codeSystem = '2.16.840.1.113883.5.6']]"/>
                <xsl:if test="$rel-encounter or $rel-concern">
                    <xsl:variable name="relaties_ketenzorg-complexType" select="nf:getADAComplexTypeName($xsd-ma, 'relaties_ketenzorg')"/>
                    <xsl:variable name="xsd-relaties_ketenzorg" select="nf:getADAComplexType($xsd-ada, $relaties_ketenzorg-complexType)"/>
                    <xsl:variable name="ada-elemName">relaties_ketenzorg</xsl:variable>
                    <xsl:variable name="xsd-fragment" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName))"/>
                    <xsl:element name="{$ada-elemName}">
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-fragment)"/>

                        <xsl:variable name="ada-elemName">identificatie_contactmoment</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="$rel-encounter/hl7:id"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-fragment, $ada-elemName)))"/>
                        </xsl:call-template>
                        <xsl:variable name="ada-elemName">identificatie_episode</xsl:variable>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="$rel-concern/hl7:id"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-fragment, $ada-elemName)))"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:if>
                <!-- voorschrijver -->
                <xsl:variable name="xsd-voorschrijver" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, 'voorschrijver'))"/>
                <voorschrijver>
                    <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-voorschrijver)"/>

                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337_2">
                        <xsl:with-param name="author-hl7" select="./hl7:author"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-auteur" select="$xsd-voorschrijver"/>
                    </xsl:call-template>
                </voorschrijver>
                <!-- reden wijzigen of staken -->
                <xsl:variable name="ada-elemName">reden_wijzigen_of_staken</xsl:variable>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9270']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                    <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName)))"/>
                </xsl:call-template>
                <!-- reden van voorschrijven -->
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9160']/hl7:value">
                    <xsl:variable name="ada-elemName">reden_van_voorschrijven</xsl:variable>
                    <xsl:variable name="xsd-fragment" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName))"/>
                    <xsl:element name="{$ada-elemName}">
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-fragment)"/>

                        <xsl:variable name="ada-elemName">probleem</xsl:variable>
                        <xsl:variable name="xsd-probleem" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-fragment, $ada-elemName))"/>
                        <xsl:element name="{$ada-elemName}">
                            <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-probleem)"/>
                            <!-- probleem_naam -->
                            <xsl:variable name="ada-elemName">probleem_naam</xsl:variable>
                            <xsl:call-template name="handleCV">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="elemName" select="$ada-elemName"/>
                                <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-probleem, $ada-elemName)))"/>
                            </xsl:call-template>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>
                <!-- afgesproken_geneesmiddel -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <xsl:variable name="ada-elemName">afgesproken_geneesmiddel</xsl:variable>
                    <xsl:variable name="xsd-fragment" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName))"/>
                    <xsl:element name="{$ada-elemName}">
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-fragment)"/>

                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-geneesmiddel" select="$xsd-fragment"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp9-gebruiksinstructie-from-mp9">
                    <xsl:with-param name="hl7-comp" select="."/>
                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                    <xsl:with-param name="xsd-comp" select="$xsd-ma"/>
                </xsl:call-template>
                <!-- lichaamslengte  -->
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.7.10.30'][hl7:value]">
                    <xsl:variable name="ada-elemName">lichaamslengte</xsl:variable>
                    <xsl:variable name="xsd-fragment" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName))"/>
                    <xsl:element name="{$ada-elemName}">
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-fragment)"/>
                        <!-- lengte_waarde -->
                        <xsl:variable name="ada-elemName">lengte_waarde</xsl:variable>
                        <xsl:call-template name="handlePQ">
                            <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-fragment, $ada-elemName)))"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="in" select="hl7:value"/>
                        </xsl:call-template>
                        <!-- lengte_datum_tijd -->
                        <xsl:variable name="ada-elemName">lengte_datum_tijd</xsl:variable>
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-fragment, $ada-elemName)))"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="in" select="hl7:effectiveTime"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
                <!-- lichaamsgewicht  -->
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.7.10.28'][hl7:value]">
                    <xsl:variable name="ada-elemName">lichaamsgewicht</xsl:variable>
                    <xsl:variable name="xsd-fragment" select="nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName))"/>
                    <xsl:element name="{$ada-elemName}">
                        <xsl:copy-of select="nf:getADAComplexTypeConceptId($xsd-fragment)"/>
                        <xsl:variable name="ada-elemName">gewicht_waarde</xsl:variable>
                        <xsl:call-template name="handlePQ">
                            <xsl:with-param name="in" select="hl7:value"/>
                            <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-fragment, $ada-elemName)))"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                        </xsl:call-template>
                        <!-- gewicht_datum_tijd -->
                        <xsl:variable name="ada-elemName">gewicht_datum_tijd</xsl:variable>
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="in" select="hl7:effectiveTime"/>
                            <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-fragment, $ada-elemName)))"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
                <!-- aanvullende_informatie -->
                <xsl:variable name="ada-elemName">aanvullende_informatie</xsl:variable>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9177']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                    <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName)))"/>
                </xsl:call-template>
                <!-- kopie_indicator -->
                <xsl:variable name="ada-elemName">kopie_indicator</xsl:variable>
                <xsl:call-template name="handleBL">
                    <xsl:with-param name="in" select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                    <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName)))"/>
                </xsl:call-template>
                <!-- toelichting -->
                <xsl:variable name="ada-elemName">toelichting</xsl:variable>
                <xsl:call-template name="handleST">
                    <xsl:with-param name="in" select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9069']/hl7:text"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                    <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($xsd-ada, nf:getADAComplexTypeName($xsd-ma, $ada-elemName)))"/>
                </xsl:call-template>
            </medicatieafspraak>
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
            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
            <xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.0.7</xd:desc>
        <xd:param name="ma_hl7_90"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-mbh"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9235_20181204143321">
        <xsl:param name="ma_hl7_90" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-mbh"/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9233_20181204130547">
            <xsl:with-param name="ma_hl7_90" select="$ma_hl7_90"/>
            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
            <xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc> Verstrekkingsverzoek MP 9.0.6 </xd:desc>
        <xd:param name="vv_hl7_90"/>
        <xd:param name="xsd-ada"/>
        <xd:param name="xsd-mbh"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9231_20180423130413">
        <xsl:param name="vv_hl7_90" select="."/>
        <xsl:param name="xsd-ada"/>
        <xsl:param name="xsd-mbh"/>
        <xsl:variable name="vv-complexType" select="$xsd-mbh//xs:element[@name = 'verstrekkingsverzoek']/@type"/>
        <xsl:variable name="xsd-vv" select="$xsd-ada//xs:complexType[@name = $vv-complexType]"/>
        <!-- verstrekkingsverzoek  -->
        <xsl:for-each select="$vv_hl7_90">
            <verstrekkingsverzoek conceptId="{$xsd-vv/xs:attribute[@name='conceptId']/@fixed}">
                <!-- identificatie -->
                <xsl:for-each select="./hl7:id">
                    <identificatie value="{./@extension}" root="{./@root}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22003"/>
                </xsl:for-each>
                <!-- datum -->
                <xsl:for-each select="./hl7:author/hl7:time">
                    <datum value="{nf:formatHL72XMLDate(nf:appendDate2DateOrTime(./@value), nf:determine_date_precision(./@value))}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.20060"/>
                </xsl:for-each>
                <!-- auteur -->
                <xsl:variable name="auteur-complexType" select="$xsd-vv//xs:element[@name = 'auteur']/@type"/>
                <xsl:variable name="xsd-auteur" select="$xsd-ada//xs:complexType[@name = $auteur-complexType]"/>
                <auteur conceptId="{$xsd-auteur/xs:attribute[@name='conceptId']/@fixed}">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                        <xsl:with-param name="author-hl7" select="./hl7:author"/>
                        <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                        <xsl:with-param name="xsd-auteur" select="$xsd-auteur"/>
                    </xsl:call-template>
                </auteur>
                <!-- te_verstrekken_hoeveelheid -->
                <xsl:for-each select="./hl7:quantity">
                    <te_verstrekken_hoeveelheid conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19964">
                        <xsl:for-each select="./hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                            <aantal value="{./@value}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22599"/>
                            <eenheid conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22600">
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </eenheid>
                        </xsl:for-each>
                    </te_verstrekken_hoeveelheid>
                </xsl:for-each>
                <!-- aantal_herhalingen -->
                <xsl:for-each select="./hl7:repeatNumber">
                    <aantal_herhalingen value="{number(./@value)-1}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22120"/>
                </xsl:for-each>
                <!-- te_verstrekken_geneesmiddel  -->
                <xsl:for-each select="./hl7:product/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <xsl:variable name="xsd-te_verstrekken_geneesmiddel-complexType" select="$xsd-vv//xs:element[@name = 'te_verstrekken_geneesmiddel']/@type"/>
                    <xsl:variable name="xsd-te_verstrekken_geneesmiddel" select="$xsd-ada//xs:complexType[@name = $xsd-te_verstrekken_geneesmiddel-complexType]"/>
                    <te_verstrekken_geneesmiddel conceptId="{$xsd-te_verstrekken_geneesmiddel/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-geneesmiddel" select="$xsd-te_verstrekken_geneesmiddel"/>
                        </xsl:call-template>
                    </te_verstrekken_geneesmiddel>
                </xsl:for-each>
                <!-- verbruiksperiode -->
                <xsl:for-each select="./hl7:expectedUseTime/hl7:width">
                    <verbruiksperiode conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.20062">
                        <duur value="{./@value}" unit="{nf:convertTime_UCUM2ADA_unit(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.20065"/>
                    </verbruiksperiode>
                </xsl:for-each>
                <xsl:for-each select="./hl7:performer/hl7:assignedEntity/hl7:representedOrganization">
                    <xsl:variable name="xsd-beoogd_verstrekker-complexType" select="$xsd-vv//xs:element[@name = 'beoogd_verstrekker']/@type"/>
                    <xsl:variable name="xsd-beoogd_verstrekker" select="$xsd-ada//xs:complexType[@name = $xsd-beoogd_verstrekker-complexType]"/>
                    <beoogd_verstrekker conceptId="{$xsd-beoogd_verstrekker/xs:attribute[@name='conceptId']/@fixed}">
                        <xsl:call-template name="mp9-zorgaanbieder">
                            <xsl:with-param name="hl7-current-organization" select="."/>
                            <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                            <xsl:with-param name="xsd-parent-of-zorgaanbieder" select="$xsd-beoogd_verstrekker"/>
                        </xsl:call-template>
                    </beoogd_verstrekker>
                </xsl:for-each>
                <xsl:for-each select="./hl7:participant[@typeCode = 'DST']/hl7:participantRole[@classCode = 'SDLOC']/hl7:addr">
                    <xsl:variable name="concatted_text">
                        <xsl:for-each select="./*">
                            <xsl:value-of select="concat(./text(), ' ')"/>
                        </xsl:for-each>
                    </xsl:variable>
                    <afleverlocatie value="{normalize-space($concatted_text)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.20068"/>
                </xsl:for-each>
                <!-- aanvullende_wensen -->
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9093']/hl7:code">
                    <aanvullende_wensen conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22759">
                        <xsl:call-template name="mp9-code-attribs">
                            <xsl:with-param name="current-hl7-code" select="."/>
                        </xsl:call-template>
                    </aanvullende_wensen>
                </xsl:for-each>
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9069']/hl7:text">
                    <toelichting value="{./text()}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22274"/>
                </xsl:for-each>
                <xsl:for-each select="./hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9086']/hl7:id">
                    <relatie_naar_medicatieafspraak conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23286">
                        <identificatie value="{./@extension}" root="{./@root}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23287"/>
                    </relatie_naar_medicatieafspraak>
                </xsl:for-each>
            </verstrekkingsverzoek>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> PatientNL in voorschrift 9.0.x </xd:desc>
        <xd:param name="current-patient"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3_20170602000000">
        <xsl:param name="current-patient" select="."/>
        <patient conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19798">
            <xsl:for-each select="$current-patient/hl7:patient/hl7:name">
                <xsl:call-template name="mp9-naamgegevens">
                    <xsl:with-param name="current-hl7-name" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="$current-patient/hl7:id">
                <patient_identificatienummer conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19829">
                    <xsl:attribute name="root" select="./@root"/>
                    <xsl:attribute name="value" select="./@extension"/>
                </patient_identificatienummer>
            </xsl:for-each>
            <xsl:for-each select="$current-patient/hl7:patient/hl7:birthTime[@value]">
                <geboortedatum conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19830">
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
                <meerling_indicator conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19832">
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
        <patient conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19798">
            <xsl:for-each select="$current-patient/hl7:patient/hl7:name">
                <xsl:call-template name="mp9-naamgegevens">
                    <xsl:with-param name="current-hl7-name" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:call-template name="handleII">
                <xsl:with-param name="conceptId">2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19829</xsl:with-param>
                <xsl:with-param name="elemName">identificatienummer</xsl:with-param>
                <xsl:with-param name="in" select="$current-patient/hl7:id"/>
            </xsl:call-template>
            <xsl:call-template name="handleTS">
                <xsl:with-param name="conceptId">2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19830</xsl:with-param>
                <xsl:with-param name="elemName">geboortedatum</xsl:with-param>
                <xsl:with-param name="in" select="$current-patient/hl7:patient/hl7:birthTime[@value]"/>
            </xsl:call-template>
            <xsl:for-each select="$current-patient/hl7:patient/hl7:administrativeGenderCode">
                <xsl:call-template name="mp9-geslacht">
                    <xsl:with-param name="current-administrativeGenderCode" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="$current-patient/hl7:patient/sdtc:multipleBirthInd[@value]">
                <meerling_indicator conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19832">
                    <xsl:attribute name="value" select="./@value"/>
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
            <xsl:otherwise>
                <!-- geen attribuut opnemen -->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
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
        <xd:desc/>
        <xd:param name="UCUM"/>
    </xd:doc>
    <xsl:template name="UCUM2GstdBasiseenheid">
        <xsl:param name="UCUM"/>

        <xsl:variable name="gstd-code">
            <xsl:choose>
                <xsl:when test="string-length($UCUM) > 0">
                    <xsl:choose>
                        <xsl:when test="$UCUM = 'cm'">205</xsl:when>
                        <xsl:when test="$UCUM = 'g'">215</xsl:when>
                        <xsl:when test="$UCUM = '[iU]'">217</xsl:when>
                        <xsl:when test="$UCUM = 'kg'">219</xsl:when>
                        <xsl:when test="$UCUM = 'l'">222</xsl:when>
                        <xsl:when test="$UCUM = 'mg'">229</xsl:when>
                        <xsl:when test="$UCUM = 'ml'">233</xsl:when>
                        <xsl:when test="$UCUM = 'mm'">234</xsl:when>
                        <xsl:when test="$UCUM = '1'">245</xsl:when>
                        <xsl:when test="$UCUM = 'ug'">252</xsl:when>
                        <xsl:when test="$UCUM = 'ul'">254</xsl:when>
                        <xsl:when test="$UCUM = '[drp]'">303</xsl:when>
                        <xsl:otherwise>Not supported UCUM eenheid, cannot convert to G-standaard basiseenheid: <xsl:value-of select="$UCUM"/></xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <!-- geen waarde meegekregen --> UCUM is an empty string. Not supported to convert to G-standaard basiseenheid. </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="gstd-displayname">
            <xsl:choose>
                <xsl:when test="string-length($UCUM) > 0">
                    <xsl:choose>
                        <xsl:when test="$UCUM = 'cm'">centimeter</xsl:when>
                        <xsl:when test="$UCUM = 'g'">gram</xsl:when>
                        <xsl:when test="$UCUM = '[iU]'">internationale eenheid</xsl:when>
                        <xsl:when test="$UCUM = 'kg'">kilogram</xsl:when>
                        <xsl:when test="$UCUM = 'l'">liter</xsl:when>
                        <xsl:when test="$UCUM = 'mg'">milligram</xsl:when>
                        <xsl:when test="$UCUM = 'ml'">milliliter</xsl:when>
                        <xsl:when test="$UCUM = 'mm'">millimeter</xsl:when>
                        <xsl:when test="$UCUM = '1'">stuk</xsl:when>
                        <xsl:when test="$UCUM = 'ug'">microgram</xsl:when>
                        <xsl:when test="$UCUM = 'ul'">microliter</xsl:when>
                        <xsl:when test="$UCUM = '[drp]'">druppel</xsl:when>
                        <xsl:otherwise>Not supported UCUM eenheid, cannot convert to G-standaard basiseenheid: <xsl:value-of select="$UCUM"/></xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <!-- geen waarde meegekregen --> UCUM is an empty string. Not supported to convert to G-standaard basiseenheid. </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:attribute name="code" select="$gstd-code"/>
        <xsl:attribute name="codeSystem" select="$oidGStandaardBST902THES2"/>
        <xsl:attribute name="displayName" select="$gstd-displayname"/>
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
                    <xsl:otherwise>Not supported G-standaard basiseenheid: <xsl:value-of select="$GstdBasiseenheid_code"/></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!-- geen integer meegekregen --> G-standaard code is not an integer. Not supported G-standaard basiseenheid: "<xsl:value-of select="$GstdBasiseenheid_code"/>". </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$GstdBasiseenheid_code castable as xs:integer"> </xsl:if>
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

</xsl:stylesheet>
