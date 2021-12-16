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
    <xsl:import href="../hl7_2_ada_mp_include.xsl"/>
    <xsl:import href="../../../fhir_2_ada/fhir/fhir_2_ada_fhir_include.xsl"/>

    <xsl:output method="xml" indent="yes"/>
    <!-- ada output language -->
    <xsl:param name="language">nl-NL</xsl:param>
    <xsl:param name="logLevel" select="$logINFO" as="xs:string"/>

    <xsl:param name="transaction-name">beschikbaarstellen_medicatiegegevens</xsl:param>

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




</xsl:stylesheet>
