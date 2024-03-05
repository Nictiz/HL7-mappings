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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:util="urn:hl7:utilities" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../2_hl7_mp_include.xsl"/>
    <xsl:import href="../../zib2020bbr/payload/ada2hl7_all-zibs.xsl"/>

    <xsl:param name="logLevel" select="$logINFO" as="xs:string"/>
    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>

    <xd:doc>
        <xd:desc>Financiële indicatiecode</xd:desc>
        <xd:param name="in">ada element to be converted, defaults to context</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9357_2021002133425">
        <xsl:param name="in" select="." as="element()?"/>

        <xsl:for-each select="$in">
            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9357"/>
                <code displayName="Drug prescription for reimbursement (finding)" codeSystemName="SNOMED CT" code="153931000146103" codeSystem="2.16.840.1.113883.6.96"/>
                <xsl:call-template name="makeCEValue"/>
            </observation>

        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Mapping of medicatietoediening concept in ADA to HL7</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9406_20221101091730" match="medicatietoediening">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9406"/>
                <xsl:for-each select="identificatie[.//(@value | @code)]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                <code code="18629005" displayName="toediening van medicatie (verrichting)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>

                <!-- statusCode: voor foutcorrectie -->
                <xsl:if test="geannuleerd_indicator/@value = 'true'">
                    <statusCode code="nullified"/>
                </xsl:if>

                <!-- toedienings_datum_tijd -->
                <xsl:for-each select="toedienings_datum_tijd[@value | @nullFlavor]">
                    <effectiveTime>
                        <xsl:call-template name="makeTSValueAttr"/>
                    </effectiveTime>
                </xsl:for-each>

                <!-- toedieningsweg -->
                <xsl:for-each select="toedieningsweg[(@value | @code | @nullFlavor)]">
                    <routeCode>
                        <xsl:call-template name="makeCodeAttribs"/>
                    </routeCode>
                </xsl:for-each>

                <!-- prik_plak_locatie -->
                <xsl:for-each select="prik_plak_locatie[@value]">
                    <approachSiteCode nullFlavor="OTH">
                        <originalText>
                            <xsl:value-of select="@value"/>
                        </originalText>
                    </approachSiteCode>
                </xsl:for-each>

                <!-- toegediende_hoeveelheid -->
                <xsl:for-each select="toegediende_hoeveelheid[.//(@value | @code)]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9048_20160614145840"/>
                </xsl:for-each>

                <!-- toedieningssnelheid -->
                <xsl:for-each select="toedieningssnelheid[.//(@value | @code)]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9150_20160726150449"/>
                </xsl:for-each>

                <!-- toedienings_product -->
                <xsl:for-each select="../../bouwstenen/farmaceutisch_product[@id = current()/toedienings_product/farmaceutisch_product/@value]">
                    <consumable>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </consumable>
                </xsl:for-each>

                <!-- toediener -->
                <xsl:for-each select="toediener">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9407_20221101101151"/>
                </xsl:for-each>

                <!-- afgesproken_datum_tijd en/of afgesproken_hoeveelheid -->
                <xsl:if test="afgesproken_datum_tijd[@value] | afgesproken_hoeveelheid[.//(@value | @code | @unit)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9376_20210617000000">
                            <xsl:with-param name="datumTijdElement" select="afgesproken_datum_tijd[@value]"/>
                            <xsl:with-param name="keerdosisElement" select="afgesproken_hoeveelheid[.//(@value | @code | @unit)]"/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:if>

                <!-- volgens_afspraak_indicator -->
                <xsl:for-each select="volgens_afspraak_indicator[.//(@value | @code)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9317_20200120141110"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- medicatietoediening_reden_van_afwijken -->
                <xsl:for-each select="(medicatie_toediening_reden_van_afwijken | medicatietoediening_reden_van_afwijken)[.//(@value | @code)]">
                    <entryRelationship typeCode="RSON">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9375_20210616173557"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- toelichting -->
                <xsl:for-each select="toelichting[.//(@value | @code)]">
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- Relatie naar MA -->
                <xsl:for-each select="relatie_medicatieafspraak/identificatie[@value | @nullFlavor]">
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9384_20210618">
                            <xsl:with-param name="identificatieElement" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>

                <!-- Relatie naar TA -->
                <xsl:for-each select="relatie_toedieningsafspraak/identificatie[@value | @nullFlavor]">
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                            <xsl:with-param name="identificatieElement" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>

                <!-- Relatie naar WDS -->
                <xsl:for-each select="relatie_wisselend_doseerschema/identificatie[@value | @nullFlavor]">
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9381_20210617181505">
                            <xsl:with-param name="identificatieElement" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>

                <!--Relatie naar medicamenteuze behandeling-->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select=".."/>
                    </xsl:call-template>
                </entryRelationship>

                <!-- relaties huisartsenzorg -->
                <xsl:for-each select="relatie_contact/identificatienummer[@value | @nullFlavor]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.32_20171221123947"/>
                </xsl:for-each>
                <xsl:for-each select="relatie_zorgepisode/identificatienummer[@value | @nullFlavor]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.33_20171221124050"/>
                </xsl:for-each>

            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Toediener in medicatietoediening</xd:desc>
        <xd:param name="in">the ada element for toediener, defaults to context</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9407_20221101101151" match="toediener" mode="HandleToediener92">
        <xsl:param name="in" as="element()*" select="."/>

        <xsl:for-each select="$in">
            <!-- patient -->
            <xsl:for-each select="patient[not(toediener_is_patient/@value = 'false')][.//@value]">
                <performer>
                    <!-- temp workaround for MP-1351, add time with nullFlavor -->
                    <time nullFlavor="NI"/>
                    <assignedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.52_20170825000000">
                            <xsl:with-param name="ada_patient_identificatienummer" select="../../../../patient/identificatienummer"/>
                        </xsl:call-template>
                    </assignedEntity>
                </performer>
            </xsl:for-each>

            <!-- zorgaanbieder is toediener -->
            <xsl:for-each select="../../../bouwstenen/zorgaanbieder[@id = current()//zorgaanbieder[not(zorgaanbieder)]/@value]">
                <performer>
                    <assignedEntity>
                        <!-- id is required in xsd, but no use for it when only communicating zorgaanbieder -->
                        <id nullFlavor="NI"/>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701000000"/>
                    </assignedEntity>
                </performer>
            </xsl:for-each>

            <!-- mantelzorger -->
            <xsl:for-each select="../../../bouwstenen/contactpersoon[@id = current()/mantelzorger/contactpersoon/@value]">
                <performer>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.44_20210701000000"/>
                </performer>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Mapping of wisselend_doseerschema concept in ADA to HL7 CDA template</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9412_20221118130922" match="wisselend_doseerschema">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9412"/>
                <xsl:for-each select="identificatie[.//(@value | @code)]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                <code code="395067002" displayName="optimaliseren van dosering van medicatie (verrichting)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
                <xsl:choose>
                    <xsl:when test="$generateInstructionText">
                        <text mediaType="text/plain">
                            <xsl:value-of select="nf:gebruiksintructie-string(gebruiksinstructie)"/>
                        </text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="gebruiksinstructie/omschrijving[@value]">
                            <text mediaType="text/plain">
                                <xsl:value-of select="@value"/>
                            </text>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>

                <!-- Gebruiksperiode -->
                <xsl:call-template name="_handleGebruiksperiode"/>

                <xsl:for-each select="gebruiksinstructie/toedieningsweg[.//(@value | @code)]">
                    <routeCode>
                        <xsl:call-template name="makeCodeAttribs"/>
                    </routeCode>
                </xsl:for-each>

                <xsl:for-each select="../../bouwstenen/farmaceutisch_product[@id = current()/afgesproken_geneesmiddel/farmaceutisch_product/@value]">
                    <consumable>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </consumable>
                </xsl:for-each>


                <xsl:variable name="wdsDatumTijd" select="wisselend_doseerschema_datum_tijd"/>
                <xsl:for-each select="../../bouwstenen/zorgverlener[@id = current()/auteur/zorgverlener/@value]">
                    <author>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210">
                            <xsl:with-param name="authorTime" select="$wdsDatumTijd"/>
                        </xsl:call-template>
                    </author>
                </xsl:for-each>

                <!-- stoptype -->
                <xsl:for-each select="wisselend_doseerschema_stop_type[.//(@value | @code)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9414_20221118141506"/>
                    </entryRelationship>
                </xsl:for-each>

                <xsl:for-each select="(reden_wijzigen_of_staken)[.//(@value | @code)]">
                    <entryRelationship typeCode="RSON">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9439_20221124114130"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- aanvullende instructie -->
                <xsl:for-each select="gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                    <entryRelationship typeCode="SPRT">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                            <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- toelichting -->
                <xsl:for-each select="toelichting[.//(@value | @code)]">
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                    </entryRelationship>
                </xsl:for-each>

                <!--Doseerinstructie-->
                <xsl:for-each select="gebruiksinstructie/doseerinstructie[.//(@value | @code | @nullFlavor)]">
                    <xsl:call-template name="_handleDoseerinstructie"/>
                </xsl:for-each>

                <!-- Relatie naar MA -->
                <xsl:for-each select="relatie_medicatieafspraak/identificatie[@value | @nullFlavor]">
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9384_20210618">
                            <xsl:with-param name="identificatieElement" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>

                <!-- Relatie naar WDS -->
                <xsl:for-each select="relatie_wisselend_doseerschema/identificatie[@value | @nullFlavor]">
                    <!-- kunnen er 0 of 1 zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9381_20210617181505">
                            <xsl:with-param name="identificatieElement" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>

                <!-- Kopie-indicator -->
                <xsl:if test="kopie_indicator">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                            <xsl:with-param name="kopie-ind" select="kopie_indicator"/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:if>

                <!--Relatie naar medicamenteuze behandeling-->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select=".."/>
                    </xsl:call-template>
                </entryRelationship>

                <!-- relaties huisartsenzorg -->
                <xsl:for-each select="relatie_contact/identificatienummer[@value | @nullFlavor]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.32_20171221123947"/>
                </xsl:for-each>
                <xsl:for-each select="relatie_zorgepisode/identificatienummer[@value | @nullFlavor]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.33_20171221124050"/>
                </xsl:for-each>

            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Stoptype</xd:desc>
        <xd:param name="in">Optional. Input ada element, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9414_20221118141506">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9414"/>
                <code code="410684002" displayName="status van medicamenteuze behandeling" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
                <xsl:call-template name="makeCEValue"/>
            </observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Toedieningsafspraak inhoud vanaf 9.1.0</xd:desc>
        <xd:param name="in">ada input element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9415_20221121070356" match="toedieningsafspraak" mode="HandleTAContents910">
        <xsl:param name="in"/>
        <xsl:for-each select="$in">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9415"/>
            <xsl:for-each select="identificatie[@value | @root]">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            <code code="422037009" displayName="Toedieningsafspraak" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <!-- gebruiksinstructie/omschrijving -->
            <xsl:choose>
                <xsl:when test="$generateInstructionText">
                    <text mediaType="text/plain">
                        <xsl:value-of select="nf:gebruiksintructie-string(gebruiksinstructie)"/>
                    </text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
                        <text mediaType="text/plain">
                            <xsl:value-of select="@value"/>
                        </text>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>

            <!-- statusCode: voor foutcorrectie -->
            <xsl:if test="geannuleerd_indicator/@value = 'true'">
                <statusCode code="nullified"/>
            </xsl:if>

            <!-- Gebruiksperiode -->
            <xsl:call-template name="_handleGebruiksperiode"/>

            <!-- toedieningsweg -->
            <xsl:for-each select="gebruiksinstructie/toedieningsweg[@code]">
                <routeCode>
                    <xsl:call-template name="makeCodeAttribs"/>
                </routeCode>
            </xsl:for-each>

            <!-- geneesmiddel_bij_toedieningsafspraak -->
            <xsl:for-each select="../../bouwstenen/farmaceutisch_product[@id = current()/geneesmiddel_bij_toedieningsafspraak/farmaceutisch_product/@value]">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>

            <!-- Verstrekker -->
            <xsl:variable name="theAfspraakdatum" select="(afspraak_datum_tijd | afspraakdatum | toedieningsafspraak_datum_tijd)[@value | @nullFlavor]"/>
            <xsl:for-each select="../../bouwstenen/zorgaanbieder[@id = current()/verstrekker/zorgaanbieder/@value]">
                <author>
                    <xsl:call-template name="makeTSValue">
                        <xsl:with-param name="elemName">time</xsl:with-param>
                        <xsl:with-param name="inputValue" select="$theAfspraakdatum/@value"/>
                        <xsl:with-param name="inputNullFlavor" select="$theAfspraakdatum/@nullFlavor"/>
                    </xsl:call-template>
                    <assignedAuthor>
                        <id nullFlavor="NI"/>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701000000"/>
                    </assignedAuthor>
                </author>
            </xsl:for-each>

            <!-- stoptype -->
            <xsl:for-each select="(toedieningsafspraak_stop_type | stoptype)[@code]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9414_20221118141506"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- reden_afspraak, with MP-369 name change to toedieningsafspraak_reden_wijzigen_of_staken -->
            <xsl:for-each select="(reden_afspraak | toedieningsafspraak_reden_wijzigen_of_staken)[@value][not(@code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9315_20200120125612"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- reden_afspraak, with MP-370 type change from string to code -->
            <xsl:for-each select="(reden_afspraak | toedieningsafspraak_reden_wijzigen_of_staken)[@code]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9440_20221124114649"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- aanvullende_instructie -->
            <xsl:for-each select="gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- distributievorm -->
            <xsl:for-each select="distributievorm[.//(@value | @code | @nullFlavor)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9097_20160623203415"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- aanvullende informatie -->
            <xsl:for-each select="(aanvullende_informatie | toedieningsafspraak_aanvullende_informatie)[@value | @code]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9402_20220315000000"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Toelichting -->
            <xsl:for-each select="toelichting">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>

            <!--Doseerinstructie-->
            <xsl:for-each select="gebruiksinstructie/doseerinstructie[.//(@value | @code | @nullFlavor)]">
                <xsl:call-template name="_handleDoseerinstructie"/>
            </xsl:for-each>

            <!-- Kopie-indicator -->
            <xsl:if test="kopie_indicator">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="kopie-ind" select="kopie_indicator"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>

            <!-- relatie naar MA -->
            <xsl:for-each select="(relatie_naar_medicatieafspraak | relatie_medicatieafspraak)[identificatie[@value | @nullFlavor]]">
                <!-- kunnen er 0 of meer zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9384_20210618">
                        <xsl:with-param name="identificatieElement" select="identificatie"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- relatie naar TA -->
            <xsl:for-each select="(relatie_toedieningsafspraak)[identificatie[@value | @nullFlavor]]">
                <!-- kunnen er 0 of meer zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                        <xsl:with-param name="identificatieElement" select="identificatie"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>

        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Toedieningsafspraak vanaf 9.2.0</xd:desc>
        <xd:param name="in">ada Toedieningsafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9416_20221121074758" match="toedieningsafspraak" mode="HandleTA920">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9416"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9415_20221121070356">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Toedieningsafspraak vanaf 9.3.0 - kopie</xd:desc>
        <xd:param name="in">ada Toedieningsafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9417_20221121085549" match="toedieningsafspraak" mode="HandleTAKopie920">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9327"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9415_20221121070356">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template for Medicatieafspraak resuable parts 1 for MP 9 2.0. SNOMED code update</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9427_20221122115521" match="medicatieafspraak">
        <!-- MP CDA Medicatieafspraak onderdelen 1 -->
        <xsl:for-each select="identificatie[.//(@value | @code)]">
            <xsl:call-template name="makeIIid"/>
        </xsl:for-each>
        <code code="33633005" displayName="voorschrijven van geneesmiddel (verrichting)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
        <xsl:choose>
            <xsl:when test="$generateInstructionText">
                <text mediaType="text/plain">
                    <xsl:value-of select="nf:gebruiksintructie-string(gebruiksinstructie)"/>
                </text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
                    <text mediaType="text/plain">
                        <xsl:value-of select="@value"/>
                    </text>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>

        <!-- statusCode: voor foutcorrectie -->
        <!-- uitgefaseerd in 9 1.0, opnieuw toegevoegd in 9.2.0 -->
        <xsl:if test="geannuleerd_indicator/@value = 'true'">
            <statusCode code="nullified"/>
        </xsl:if>
        <!-- Gebruiksperiode -->
        <xsl:call-template name="_handleGebruiksperiode"/>

        <xsl:for-each select="gebruiksinstructie/toedieningsweg[.//(@value | @code)]">
            <routeCode>
                <xsl:call-template name="makeCodeAttribs"/>
            </routeCode>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA (proposition) medication agreement ( (voorstel) Medicatieafspraak) reusable part</xd:desc>
        <xd:param name="in">The input ada medication agreement, defaults to context</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9428_20221122124407">
        <xsl:param name="in" select="." as="element()?"/>

        <xsl:for-each select="$in">
            <xsl:for-each select="(stoptype | medicatieafspraak_stop_type)[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9414_20221118141506"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="(reden_afspraak | reden_wijzigen_of_staken)[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9438_20221124113046"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="reden_van_voorschrijven/probleem[probleem_naam[.//(@value | @code | @nullFlavor | @originalText)]]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.24_20210701000000"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <!-- aanvullende_informatie, MP-536 new template in MP9 2.0.0 -->
            <xsl:for-each select="aanvullende_informatie[@value | @code]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9401_20220315000000"/>
                </entryRelationship>
            </xsl:for-each>
            <!-- toelichting -->
            <xsl:for-each select="toelichting[.//(@value | @code)]">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>
            <!--Doseerinstructie-->
            <xsl:for-each select="gebruiksinstructie/doseerinstructie[.//(@value | @code | @nullFlavor)]">
                <xsl:call-template name="_handleDoseerinstructie"/>
            </xsl:for-each>


            <!-- Relatie naar MA -->
            <xsl:for-each select="(relatie_naar_afspraak_of_gebruik | relatie_medicatieafspraak)/identificatie[@value | @nullFlavor]">
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9384_20210618">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- Relatie naar TA -->
            <xsl:for-each select="(relatie_naar_afspraak_of_gebruik/identificatie_23288 | relatie_toedieningsafspraak/identificatie)[@value | @nullFlavor]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- Relatie naar GB -->
            <xsl:for-each select="(relatie_naar_afspraak_of_gebruik/identificatie_23289 | relatie_medicatiegebruik/identificatie)[@value | @nullFlavor]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9386_20210629170021">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatieafspraak inhoud - vanaf MP 9.2</xd:desc>
        <xd:param name="in">Input ada element for medicatieafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9429_20221122130054">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9429"/>
            <!-- MA Onderdelen 1 -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9427_20221122115521"/>

            <xsl:for-each select="../../bouwstenen/farmaceutisch_product[@id = current()/afgesproken_geneesmiddel/farmaceutisch_product/@value]">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>

            <xsl:variable name="maAfspraakDatumTijd" select="afspraak_datum_tijd | afspraakdatum | medicatieafspraak_datum_tijd" as="element()*"/>
            <xsl:variable name="maAuthor" select="../../bouwstenen/zorgverlener[@id = current()/voorschrijver/zorgverlener/@value]" as="element()*"/>
            <xsl:if test="$maAfspraakDatumTijd | $maAuthor">
                <author>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701000000">
                        <xsl:with-param name="in" select="$maAuthor[1]"/>
                        <xsl:with-param name="theTime" select="$maAfspraakDatumTijd[1]"/>
                    </xsl:call-template>
                </author>
            </xsl:if>

            <!-- volgende behandelaar -->
            <xsl:for-each select="volgende_behandelaar/zorgverlener[@value]">
                <participant>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9446_20221128115041">
                        <xsl:with-param name="in" select="//bouwstenen/zorgverlener[@id = current()/@value]"/>
                    </xsl:call-template>
                </participant>
            </xsl:for-each>

            <!-- Overige onderdelen van deze MA -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9428_20221122124407">
                <xsl:with-param name="in" select="."/>
            </xsl:call-template>

            <!-- Kopie-indicator -->
            <xsl:if test="kopie_indicator">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="kopie-ind" select="kopie_indicator"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>

            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>

            <!-- relaties huisartsenzorg -->
            <xsl:for-each select="relatie_contact/identificatienummer[@value | @nullFlavor]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.32_20171221123947"/>
            </xsl:for-each>
            <xsl:for-each select="relatie_zorgepisode/identificatienummer[@value | @nullFlavor]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.33_20171221124050"/>
            </xsl:for-each>

            <!-- gebruiksperiode/criterium -->
            <xsl:for-each select="gebruiksperiode/criterium[@value]">
                <precondition>
                    <criterion>
                        <text mediaType="plain/text">
                            <xsl:value-of select="@value"/>
                        </text>
                    </criterion>
                </precondition>
            </xsl:for-each>

        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Mapping of medicatieafspraak concept in ADA ('eigen of ongedefinieerde MA') to HL7 CDA template 2.16.840.1.113883.2.4.3.11.60.20.77.10.9430</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9430_20221122132432" match="medicatieafspraak | medication_agreement" mode="ada_2_hl7">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9430"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9429_20221122130054">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Mapping of zib nl.zorg.Medicatieafspraak concept in ADA ('andermans MA') to HL7 CDA template 2.16.840.1.113883.2.4.3.11.60.20.77.10.9429</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9431_20221122133531">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9431"/>
                <!-- inhoud medicatieafspraak -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9429_20221122130054">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Voorstel Medicatieafspraak</xd:desc>
        <xd:param name="in">The proposed medication agreement</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9434_20221122135830" match="medicatieafspraak | medication_agreement" mode="HandleMAProposal91">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="PRP">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9434"/>
                <!-- Geen id bij voorstel MA: dit is een vluchtig ding waar toch niet naar verwezen mag worden. -->
                <code code="33633005" displayName="voorschrijven van geneesmiddel (verrichting)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
                <!-- gebruiksinstructie/omschrijving -->
                <xsl:choose>
                    <xsl:when test="$generateInstructionText">
                        <text mediaType="text/plain">
                            <xsl:value-of select="nf:gebruiksintructie-string(gebruiksinstructie)"/>
                        </text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
                            <text mediaType="text/plain">
                                <xsl:value-of select="@value"/>
                            </text>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>

                <!-- Gebruiksperiode -->
                <xsl:call-template name="_handleGebruiksperiode"/>

                <xsl:for-each select="gebruiksinstructie/toedieningsweg[.//(@value | @code)]">
                    <routeCode>
                        <xsl:call-template name="makeCodeAttribs"/>
                    </routeCode>
                </xsl:for-each>

                <xsl:for-each select="afgesproken_geneesmiddel/product[not(@value)][.//(@value | @code)] | ../../bouwstenen/farmaceutisch_product[@id = current()/afgesproken_geneesmiddel/farmaceutisch_product/@value]">
                    <consumable>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9363_20210602155855">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </consumable>
                </xsl:for-each>

                <!-- Als auteur is er ofwel een zorgverlener, ofwel een zorgaanbieder -->
                <!-- voor voorstelMA it should not be a patient, but we still use template 9387 so that we only maintain this in one place -->
                <xsl:for-each select="ancestor::adaxml/data/*/(voorstelgegevens | voorstel_gegevens)/voorstel[medicamenteuze_behandeling/@value = current()/../self::medicamenteuze_behandeling/@id][./auteur[.//(@value | @code | @nullFlavor)] | (voorsteldatum | voorstel_datum)[@value]]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9387_20210701000000">
                        <xsl:with-param name="adaAuteur" select="./auteur[.//(@value | @code | @nullFlavor)]"/>
                        <xsl:with-param name="authorTime" select="(voorsteldatum | voorstel_datum)[@value]"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- Overige onderdelen van deze MA -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9428_20221122124407">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>

                <!--Relatie naar medicamenteuze behandeling-->
                <xsl:if test="../identificatie[@value | @root]">
                    <entryRelationship typeCode="COMP" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                            <xsl:with-param name="MBHroot" select=".."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:if>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Reden voor medicatieafspraak vanaf 9 2.0</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9438_20221124113046" match="reden_wijzigen_of_staken" mode="HandleRedenAfspraak91">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9438"/>
            <code code="160111000146106" displayName="reden voor wijzigen van voorschrift" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc> Reden voor wisselenddoseerschema vanaf 9 2.0</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9439_20221124114130" match="reden_wijzigen_of_staken" mode="HandleRedenWijzStakenWDS">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9439"/>
            <code code="160111000146106" displayName="reden voor wijzigen van voorschrift" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>Reden voor wijzigen of staken toedieningsafspraak vanaf 9.2def</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9440_20221124114649">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9440"/>
            <code code="160121000146101" displayName="reden voor wijzigen van toedieningsinstructies" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>Reden voor wijzigen/stoppen medicatiegebruik vanaf MP9 2.0.0</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9441_20221124125142">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9441"/>
            <code code="153861000146102" displayName="reden voor wijzigen van medicatiegebruik (waarneembare entiteit)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
            <value xsi:type="CE">
                <xsl:call-template name="makeCodeAttribs"/>
            </value>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatiegebruik inhoud - vanaf MP 9 2.0</xd:desc>
        <xd:param name="in">ada element voor medicatiegebruik</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9442_20221124134142" match="medicatie_gebruik" mode="HandleMGBContents920">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9442"/>
            <xsl:variable name="isInGebruik" select="gebruik_indicator/@value" as="xs:boolean"/>

            <!-- identificatie -->
            <xsl:for-each select="identificatie[.//(@value | @code)]">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>

            <code code="422979000" displayName="bevinding betreffende gedrag met betrekking tot medicatieregime (bevinding)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>

            <!-- text -->
            <!-- gebruiksinstructie/omschrijving -->
            <xsl:choose>
                <xsl:when test="$generateInstructionText">
                    <text mediaType="text/plain">
                        <xsl:value-of select="nf:gebruiksintructie-string(gebruiksinstructie)"/>
                    </text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
                        <text mediaType="text/plain">
                            <xsl:value-of select="@value"/>
                        </text>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>

            <!-- Gebruiksperiode -->
            <xsl:call-template name="_handleGebruiksperiode"/>

            <!-- routeCode -->
            <xsl:for-each select="gebruiksinstructie/toedieningsweg[.//(@value | @code)]">
                <xsl:call-template name="makeCDValue">
                    <xsl:with-param name="elemName">routeCode</xsl:with-param>
                    <xsl:with-param name="xsiType" select="''"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- consumable, is 1..1 in xsd, so always has to be outputted -->
            <consumable>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9363_20210602155855">
                    <xsl:with-param name="product" select="../../bouwstenen/farmaceutisch_product[@id = current()/gebruiksproduct/farmaceutisch_product/@value]"/>
                </xsl:call-template>
            </consumable>

            <!-- author and time -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9387_20210701000000">
                <xsl:with-param name="adaAuteur" select="./auteur[.//(@value | @code)]"/>
                <xsl:with-param name="authorTime" select="(registratiedatum | registratie_datum_tijd | medicatiegebruik_datum_tijd)"/>
            </xsl:call-template>

            <!-- Informant van het medicatiegebruik: zorgverlener -->
            <xsl:for-each select="../../bouwstenen/zorgverlener[@id = current()/informant/informant_is_zorgverlener/zorgverlener/@value]">
                <informant>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.34_20210701000000"/>
                </informant>
            </xsl:for-each>

            <!-- Informant van het medicatiegebruik: patiënt -->
            <xsl:if test="informant/informant_is_patient/@value = 'true'">
                <informant>
                    <assignedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.52_20170825000000"/>
                    </assignedEntity>
                </informant>
            </xsl:if>

            <!-- Informant van het medicatiegebruik: contactpartij = ander persoon -->
            <xsl:for-each select="../../bouwstenen/contactpersoon[@id = current()/informant/persoon/contactpersoon/@value]">
                <informant>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.30_20210701000000"/>
                </informant>
            </xsl:for-each>

            <!-- Gebruik indicator -->
            <xsl:for-each select="gebruik_indicator[.//(@value | @nullFlavor)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9189_20171026161543"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Volgens afspraak indicator -->
            <xsl:for-each select="volgens_afspraak_indicator[.//(@value | @nullFlavor)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9317_20200120141110"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Stoptype -->
            <xsl:for-each select="(medicatiegebruik_stop_type | medicatie_gebruik_stop_type | stoptype)[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9414_20221118141506"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Aanvullende Instructie. -->
            <xsl:for-each select="gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- Reden gebruik -->
            <xsl:for-each select="reden_gebruik[@value | @nullFlavor]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9390_20210816074229"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Reden wijzigen/stoppen gebruik -->
            <xsl:for-each select="reden_wijzigen_of_stoppen_gebruik[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9441_20221124125142"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Toelichting -->
            <xsl:for-each select="toelichting[@value | @nullFlavor]">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>

            <!--Doseerinstructie-->
            <xsl:for-each select="gebruiksinstructie/doseerinstructie[.//(@value | @code | @nullFlavor)]">
                <xsl:call-template name="_handleDoseerinstructie"/>
            </xsl:for-each>

            <!-- Relatie naar (voorschrift met) voorschrijver -->
            <xsl:for-each select="../../bouwstenen/zorgverlener[@id = current()/voorschrijver/zorgverlener/@value]">
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9388_20210709160923"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Kopie-indicator -->
            <xsl:if test="kopie_indicator[@value | @code | @nullFlavor]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="kopie-ind" select="kopie_indicator"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>

            <!-- Relatie naar afspraak (medicatieafspraak óf toedieningsafspraak) -->
            <!-- Eigenlijk zit hier template 2.16.840.1.113883.2.4.3.11.60.77.10.9120 (MP Afspraak Identificatie) omheen,
              maar omdat die geen eigen elementen bevat, maar alleen een keuze, is die niet uitgewerkt. 
              Hier doen we geen input validatie, dus wordt elk aanwezig element omgezet. -->
            <xsl:for-each select="(gerelateerde_afspraak/identificatie_medicatieafspraak | relatie_medicatieafspraak/identificatie)[.//(@value | @code)]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9384_20210618">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="(gerelateerde_afspraak/identificatie_toedieningsafspraak | relatie_toedieningsafspraak/identificatie)[.//(@value | @code)]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- Relatie naar verstrekking -->
            <xsl:for-each select="(gerelateerde_verstrekking | relatie_medicatieverstrekking)/identificatie[.//(@value | @code)]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9102_20160624133045">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- Relatie naar medicamenteuze behandeling -->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>

            <!-- relaties huisartsenzorg -->
            <xsl:for-each select="relatie_contact/identificatienummer[@value | @nullFlavor]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.32_20171221123947"/>
            </xsl:for-each>
            <xsl:for-each select="relatie_zorgepisode/identificatienummer[@value | @nullFlavor]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.33_20171221124050"/>
            </xsl:for-each>

        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Medicatiegebruik - vanaf MP 9 2.0 - Kopie </xd:desc>
        <xd:param name="in">ada element voor medicatiegebruik</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9443_20221124135001" match="medicatie_gebruik | medicatiegebruik" mode="HandleMGBKopie920">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9443"/>
                <!-- inhoud medicatiegebruik -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9442_20221124134142">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Medicatiegebruik - vanaf MP 9 2.0 </xd:desc>
        <xd:param name="in">ada element voor medicatiegebruik</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9444_20221124154710" match="medicatie_gebruik | medicatiegebruik" mode="HandleMGB920">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9444"/>
                <!-- inhoud medicatiegebruik -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9442_20221124134142">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>MA volgende behandelaar</xd:desc>
        <xd:param name="in">ada element to be handled</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9446_20221128115041">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <xsl:attribute name="typeCode">CALLBCK</xsl:attribute>
            <xsl:attribute name="contextControlCode">OP</xsl:attribute>
            <participantRole classCode="ROL">
                <xsl:choose>
                    <xsl:when test="(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer)[@value]">
                        <xsl:for-each select="(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer)[@value]">
                            <xsl:call-template name="makeIIid"/>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- een id wegschrijven met nullFlavor -->
                        <id nullFlavor="NI"/>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:for-each select="specialisme[@code]">
                    <xsl:call-template name="makeCode"/>
                </xsl:for-each>

                <xsl:for-each select="(zorgverlener_naam | .)[.//naamgegevens[not(naamgegevens)][.//(@value | @code | @nullFlavor)]]">
                    <playingEntity>
                        <name>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.100_20170602000000">
                                <xsl:with-param name="naamgegevens" select="naamgegevens"/>
                                <xsl:with-param name="unstructuredNameElement">ongestructureerde_naam</xsl:with-param>
                            </xsl:call-template>
                        </name>
                    </playingEntity>
                </xsl:for-each>

                <!-- assumption for reference use is that zorgverlener and zorgaanbieder are both in same 'bouwstenen' folder in dataset -->
                <xsl:for-each select="../zorgaanbieder[@id = current()//zorgaanbieder[not(zorgaanbieder)]/@value]">
                    <scopingEntity>
                        <xsl:for-each select="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)">
                            <!-- MP CDA Zorgaanbieder identificaties -->
                            <xsl:call-template name="makeIIid"/>
                        </xsl:for-each>

                        <xsl:for-each select="organisatie_type">
                            <code>
                                <xsl:call-template name="makeCodeAttribs"/>
                            </code>
                        </xsl:for-each>

                        <xsl:for-each select="organisatie_naam[@value | @nullFlavor]">
                            <desc>
                                <xsl:choose>
                                    <xsl:when test="string-length(@value) gt 0">
                                        <xsl:value-of select="@value"/>
                                    </xsl:when>
                                    <xsl:when test="@nullFlavor">
                                        <xsl:attribute name="nullFlavor">
                                            <xsl:value-of select="@nullFlavor"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </desc>
                        </xsl:for-each>
                    </scopingEntity>
                </xsl:for-each>

            </participantRole>
        </xsl:for-each>

    </xsl:template>

    <xd:doc>
        <xd:desc>Aanvullende wens</xd:desc>
        <xd:param name="in">Optional. Input element, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9448_20230106092258">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <act classCode="ACT" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9448"/>
                <xsl:call-template name="makeCode">
                    <xsl:with-param name="elemName">code</xsl:with-param>
                </xsl:call-template>
            </act>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Verstrekkingsverzoek vanaf 9 2.0</xd:desc>
        <xd:param name="in">ada verstrekkingsverzoek to be converted, defaults to context</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9449_20230106093041" match="verstrekkingsverzoek" mode="HandleVV92">
        <xsl:param name="in" select="." as="element()*"/>

        <xsl:for-each select="$in[.//(@value | @code)]">
            <supply classCode="SPLY" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9449"/>

                <!-- identificatie -->
                <xsl:for-each select="identificatie[@value]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                <code code="52711000146108" displayName="Verstrekkingsverzoek" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>

                <!-- statusCode: voor foutcorrectie -->
                <xsl:if test="geannuleerd_indicator/@value = 'true'">
                    <statusCode code="nullified"/>
                </xsl:if>

                <!-- aantal herhalingen -->
                <xsl:for-each select="aantal_herhalingen[@value]">
                    <repeatNumber>
                        <xsl:attribute name="value" select="xs:integer(./@value) + 1"/>
                    </repeatNumber>
                </xsl:for-each>

                <!-- Te verstrekken hoeveelheid -->
                <xsl:for-each select="te_verstrekken_hoeveelheid[.//@value]">
                    <quantity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
                    </quantity>
                </xsl:for-each>

                <!-- verbruiksperiode -->
                <xsl:for-each select="verbruiksperiode[.//(@value | @code)]">
                    <expectedUseTime>
                        <xsl:for-each select="ingangsdatum | start_datum_tijd">
                            <low>
                                <xsl:call-template name="makeTSValueAttr"/>
                            </low>
                        </xsl:for-each>
                        <xsl:for-each select="duur | tijds_duur">
                            <width>
                                <xsl:call-template name="makeTimePQValueAttribs"/>
                            </width>
                        </xsl:for-each>
                        <xsl:for-each select="einddatum | eind_datum_tijd">
                            <high>
                                <xsl:call-template name="makeTSValueAttr"/>
                            </high>
                        </xsl:for-each>
                    </expectedUseTime>
                </xsl:for-each>

                <!-- Te verstrekken geneesmiddel -->
                <xsl:for-each select="../../bouwstenen/farmaceutisch_product[@id = current()/te_verstrekken_geneesmiddel/farmaceutisch_product/@value]">
                    <product>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </product>
                </xsl:for-each>

                <!-- beoogd verstrekker -->
                <xsl:for-each select="../../bouwstenen/zorgaanbieder[@id = current()/beoogd_verstrekker/zorgaanbieder/@value]">
                    <performer>
                        <assignedEntity>
                            <id nullFlavor="NI"/>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701000000"/>
                        </assignedEntity>
                    </performer>
                </xsl:for-each>

                <!-- Auteur / zorgverlener -->
                <xsl:variable name="vvAfspraakDatumTijd" select="verstrekkingsverzoek_datum | datum | verstrekkingsverzoek_datum_tijd" as="element()*"/>
                <xsl:variable name="vvAuthor" select="../../bouwstenen/zorgverlener[@id = current()/auteur/zorgverlener/@value]" as="element()*"/>
                <xsl:if test="$vvAuthor | $vvAfspraakDatumTijd">
                    <author>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701000000">
                            <xsl:with-param name="in" select="$vvAuthor[1]"/>
                            <xsl:with-param name="theTime" select="$vvAfspraakDatumTijd[1]"/>
                        </xsl:call-template>
                    </author>
                </xsl:if>

                <!-- afleverlocatie -->
                <xsl:for-each select="afleverlocatie[.//(@value | @code)]">
                    <participant typeCode="DST">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
                    </participant>
                </xsl:for-each>

                <!-- aanvullende wensen -->
                <xsl:for-each select="aanvullende_wensen[@value | @code | @nullFlavor | @originalText]">
                    <!-- kunnen er 0 of meer zijn -->
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9448_20230106092258"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- financiële indicatiecode -->
                <xsl:for-each select="financiele_indicatiecode[@code]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9357_2021002133425"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- Toelichting -->
                <xsl:for-each select="toelichting[@value]">
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- relatie naar MA -->
                <xsl:for-each select="(relatie_naar_medicatieafspraak | relatie_medicatieafspraak)[identificatie[@value | @nullFlavor]]">
                    <!-- kunnen er 0 of meer zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9384_20210618">
                            <xsl:with-param name="identificatieElement" select="identificatie"/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>

                <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select="./.."/>
                    </xsl:call-template>
                </entryRelationship>

                <!-- relaties huisartsenzorg -->
                <xsl:for-each select="relatie_contact/identificatienummer[@value | @nullFlavor]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.32_20171221123947"/>
                </xsl:for-each>
                <xsl:for-each select="relatie_zorgepisode/identificatienummer[@value | @nullFlavor]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.33_20171221124050"/>
                </xsl:for-each>

            </supply>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Voorstel Verstrekkingsverzoek</xd:desc>
        <xd:param name="in">The input ada verstrekkingsverzoek, defaults to context</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9451_20230106095110">
        <xsl:param name="in" as="element()?" select="."/>
        <!--MP CDA Voorstel Verstrekkingsverzoek-->

        <xsl:for-each select="$in">
            <supply classCode="SPLY" moodCode="PRP">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9451"/>
                <code code="52711000146108" displayName="Verstrekkingsverzoek" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
                <!-- aantal herhalingen -->
                <xsl:for-each select="aantal_herhalingen[@value]">
                    <repeatNumber>
                        <xsl:attribute name="value" select="xs:integer(./@value) + 1"/>
                    </repeatNumber>
                </xsl:for-each>

                <!-- Te verstrekken hoeveelheid -->
                <xsl:for-each select="te_verstrekken_hoeveelheid[.//(@value | @code)]">
                    <quantity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
                    </quantity>
                </xsl:for-each>

                <!-- verbruiksperiode -->
                <xsl:for-each select="verbruiksperiode[.//(@value | @code)]">
                    <expectedUseTime>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                            <xsl:with-param name="low" select="ingangsdatum"/>
                            <xsl:with-param name="width" select="./duur"/>
                            <xsl:with-param name="high" select="./einddatum"/>
                        </xsl:call-template>
                    </expectedUseTime>
                </xsl:for-each>

                <!-- Te verstrekken geneesmiddel -->
                <xsl:for-each select="te_verstrekken_geneesmiddel/product[not(@value)][.//(@value | @code)] | ../../bouwstenen/farmaceutisch_product[@id = current()/te_verstrekken_geneesmiddel/farmaceutisch_product/@value]">
                    <product>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9363_20210602155855">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </product>
                </xsl:for-each>

                <!-- beoogd verstrekker -->
                <xsl:for-each select="beoogd_verstrekker/zorgaanbieder[not(@value)][.//(@value | @code)] | ../../bouwstenen/zorgaanbieder[@id = current()/beoogd_verstrekker/zorgaanbieder/@value]">
                    <performer>
                        <assignedEntity>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                        </assignedEntity>
                    </performer>
                </xsl:for-each>

                <!-- Als auteur is er ofwel een zorgverlener, ofwel de gebruiker die een voorstel doet -->
                <xsl:if test="ancestor::adaxml/data/*/(voorstelgegevens | voorstel_gegevens)/voorstel/(./auteur[.//(@value | @code | @nullFlavor)] | (voorsteldatum | voorstel_datum)[@value])">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9387_20210701000000">
                        <xsl:with-param name="adaAuteur" select="ancestor::adaxml/data/*/(voorstelgegevens | voorstel_gegevens)/voorstel/auteur"/>
                        <xsl:with-param name="authorTime" select="ancestor::adaxml/data/*/(voorstelgegevens | voorstel_gegevens)/voorstel/(voorsteldatum | voorstel_datum)"/>
                    </xsl:call-template>
                </xsl:if>

                <!-- afleverlocatie -->
                <xsl:for-each select="afleverlocatie[.//(@value | @code | @nullFlavor)]">
                    <participant typeCode="DST">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
                    </participant>
                </xsl:for-each>

                <!-- aanvullende wensen -->
                <xsl:for-each select="aanvullende_wensen[.//(@value | @code | @nullFlavor)]">
                    <!-- kunnen er 0 of meer zijn -->
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9093_20160623183534"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- financiële indicatiecode -->
                <xsl:for-each select="financiele_indicatiecode[@code]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9357_2021002133425"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- Toelichting op het VV -->
                <xsl:for-each select="toelichting[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                    </entryRelationship>
                </xsl:for-each>

                <!--Relatie naar medicatieafspraak -->
                <xsl:for-each select="(relatie_naar_medicatieafspraak | relatie_medicatieafspraak)[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9384_20210618">
                            <xsl:with-param name="identificatieElement" select="identificatie"/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>

                <!--Relatie naar medicamenteuze behandeling-->
                <xsl:if test="../identificatie[@value | @root]">
                    <entryRelationship typeCode="COMP" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                            <xsl:with-param name="MBHroot" select=".."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:if>

            </supply>
        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>
