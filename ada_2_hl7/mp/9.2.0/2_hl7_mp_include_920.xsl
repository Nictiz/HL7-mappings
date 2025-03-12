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
    <xsl:import href="../../../../YATC-internal/ada-2-hl7/env/mp/2_hl7_mp_include.xsl"/>
    <xsl:import href="../../../../YATC-internal/ada-2-hl7/env/zib2020bbr/payload/ada2hl7_all-zibs.xsl"/>

    <!-- these imports are needed to handle the FHIR Timing datatype in HL7v3 substanceAdministration -->
    <xsl:import href="../../../../YATC-shared/xsl/util/mp-functions-hl7v3-fhir.xsl"/>
    <xsl:import href="../../../../YATC-shared/xsl/util/mp-functions-fhir.xsl"/>
    <xsl:import href="../../../../YATC-internal/ada-2-fhir/env/zibs2017/payload/ext-zib-medication-repeat-period-cyclical-schedule-2.0.xsl"/>
    <xsl:import href="../../../../YATC-internal/ada-2-fhir/env/zibs2017/payload/zib-instructions-for-use-2.0.xsl"/>
    <xsl:import href="../../../../YATC-internal/ada-2-fhir/env/zibs2017/payload/zib-instructions-for-use-3.0.xsl"/>
    <!-- AWE to make this xsl compile for now, however 9.2.0 is on the way to be deleted -->
    <xsl:import href="../../../../YATC-internal/ada-2-fhir-r4/env/mp/9.3.0/payload/mp9_latest_package.xsl"/>
    
    <xsl:param name="logLevel" select="$logINFO" as="xs:string"/>

    <xd:doc>
        <xd:desc>Voorstel Verstrekkingsverzoek</xd:desc>
        <xd:param name="in">The input ada verstrekkingsverzoek, defaults to context</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9131_20160714202241">
        <xsl:param name="in" as="element()?" select="."/>
        <!--MP CDA Voorstel Verstrekkingsverzoek-->

        <xsl:for-each select="$in">
            <supply classCode="SPLY" moodCode="PRP">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9131"/>
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

    <xd:doc>
        <xd:desc>Voorstel Medicatieafspraak</xd:desc>
        <xd:param name="in">The proposed medication agreement</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9153_20160726162345" match="medicatieafspraak | medication_agreement" mode="HandleMAProposal91">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="PRP">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9153"/>
                <!-- Geen id bij voorstel MA: dit is een vluchtig ding waar toch niet naar verwezen mag worden. -->
                <code code="33633005" displayName="voorschrijven van geneesmiddel (verrichting)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
                <!-- gebruiksinstructie/omschrijving -->
                <text mediaType="text/plain">
                    <xsl:value-of select="@value"/>
                </text>

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
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9320_20201015130416">
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
        <xd:desc> MP CDA (proposition) medication agreement ( (voorstel) Medicatieafspraak) reusable part</xd:desc>
        <xd:param name="in">The input ada medication agreement, defaults to context</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9320_20201015130416">
        <xsl:param name="in" select="." as="element()?"/>

        <xsl:for-each select="$in">
            <xsl:for-each select="(stoptype | medicatieafspraak_stop_type)[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9372_20210616133243"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="(reden_afspraak | reden_wijzigen_of_staken)[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9370_20210616112017"/>
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
        <xd:desc> Medicatiegebruik inhoud - vanaf MP 9 2.0</xd:desc>
        <xd:param name="in">ada element voor medicatiegebruik</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9321_20201015130824" match="medicatie_gebruik" mode="HandleMGBContents920">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9321"/>
            <xsl:variable name="isInGebruik" select="gebruik_indicator/@value" as="xs:boolean"/>

            <!-- identificatie -->
            <xsl:for-each select="identificatie[.//(@value | @code)]">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>

            <code code="422979000" displayName="bevinding betreffende gedrag met betrekking tot medicatieregime (bevinding)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>

            <!-- text -->
            <!-- gebruiksinstructie/omschrijving -->
            <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
                <text mediaType="text/plain">
                    <xsl:value-of select="@value"/>
                </text>
            </xsl:for-each>

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
            <xsl:for-each select="(medicatie_gebruik_stop_type | stoptype)[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9372_20210616133243"/>
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
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9385_20210628143123"/>
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
        <xd:desc>Medicatiegebruik - vanaf MP 9 2.0 </xd:desc>
        <xd:param name="in">ada element voor medicatiegebruik</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9322_20201015131242" match="medicatie_gebruik | medicatiegebruik" mode="HandleMGB920">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9322"/>
                <!-- inhoud medicatiegebruik -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9321_20201015130824">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatieafspraak inhoud - vanaf MP 9.2</xd:desc>
        <xd:param name="in">Input ada element for medicatieafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9323_20201015131556">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9323"/>
            <!-- MA Onderdelen 1 -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9371_20210615181824"/>

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

            <!-- Overige onderdelen van deze MA -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9320_20201015130416">
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
        <xd:desc>Mapping of medicatieafspraak concept in ADA ('eigen of ongedefinieerde MA') to HL7 CDA template 2.16.840.1.113883.2.4.3.11.60.20.77.10.9323</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9324_20201015132016" match="medicatieafspraak | medication_agreement">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9324"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9323_20201015131556">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Mapping of zib nl.zorg.Medicatieafspraak concept in ADA ('andermans MA') to HL7 CDA template 2.16.840.1.113883.2.4.3.11.60.20.77.10.9323</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9325_20201515132423">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9325"/>
                <!-- inhoud medicatieafspraak -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9323_20201015131556">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Toedieningsafspraak inhoud vanaf 9.1.0</xd:desc>
        <xd:param name="in">ada input element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9326_20201015132826" match="toedieningsafspraak" mode="HandleTAContents910">
        <xsl:param name="in"/>
        <xsl:for-each select="$in">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9326"/>
            <xsl:for-each select="identificatie[@value | @root]">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            <code code="422037009" displayName="Toedieningsafspraak" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <!-- gebruiksinstructie/omschrijving -->
            <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
                <text mediaType="text/plain">
                    <xsl:value-of select="@value"/>
                </text>
            </xsl:for-each>

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
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9372_20210616133243"/>
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
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9394_20220315000000"/>
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

            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>

        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Toedieningsafspraak vanaf 9.2.0 - kopie</xd:desc>
        <xd:param name="in">ada Toedieningsafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9327_20201015133041" match="toedieningsafspraak" mode="HandleTAKopie920">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9327"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9326_20201015132826">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Medicatiegebruik - vanaf MP 9 2.0 - Kopie </xd:desc>
        <xd:param name="in">ada element voor medicatiegebruik</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9331_20201015134756" match="medicatie_gebruik | medicatiegebruik" mode="HandleMGBKopie920">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9331"/>
                <!-- inhoud medicatiegebruik -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9321_20201015130824">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Toedieningsafspraak vanaf 9.2.0</xd:desc>
        <xd:param name="in">ada Toedieningsafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9332_20201015134926" match="toedieningsafspraak" mode="HandleTA920">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9332"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9326_20201015132826">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>HL7NL PIVL_TS Toedieningsduur. Creates contents of a PIVL_TS element. Assumed context is toedieningsduur</xd:desc>
        <xd:param name="in">Input node (should be one ada element toedieningsduur). Defaults to context element.</xd:param>
        <xd:param name="operator">HL7 operator, optional. Defaults to I.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9348_20210105000000" match="toedieningsduur" mode="HandleCDAToedieningsduur9348">
        <xsl:param name="in" as="element(toedieningsduur)?" select="."/>
        <xsl:param name="operator" as="xs:string?">I</xsl:param>

        <xsl:for-each select="$in">
            <xsl:attribute name="xsi:type">hl7nl:PIVL_TS</xsl:attribute>
            <xsl:attribute name="operator" select="$operator"/>
            <xsl:choose>
                <xsl:when test="../toedieningsschema/is_flexibel[@value]">
                    <xsl:attribute name="isFlexible" select="../toedieningsschema/is_flexibel/@value"/>
                </xsl:when>
                <xsl:when test="../toedieningsschema/is_flexibel[@nullFlavor]"/>
                <xsl:when test="../toedieningsschema/interval[@value | @unit]">
                    <xsl:attribute name="isFlexible">false</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="isFlexible">true</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <hl7nl:phase>
                <hl7nl:width xsi:type="hl7nl:PQ">
                    <xsl:call-template name="makeTimePQValueAttribs"/>
                </hl7nl:width>
            </hl7nl:phase>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>HL7NL PIVL_TS Weekdag. Expected context is ada weekdag element</xd:desc>
        <xd:param name="in">The ada weekdag element, defaults to context.</xd:param>
        <xd:param name="operator">The operator (for example A or I) for the PIVL</xd:param>
        <xd:param name="weekdagCode">The ada code for week day, which is in SNOMED. Defaults to $in element @code attribute</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9350_20210105175614" match="weekdag" mode="PIVLTSWeekdag9350">
        <xsl:param name="in" as="element(weekdag)?" select="."/>
        <xsl:param name="operator" as="xs:string?"/>
        <xsl:param name="weekdagCode" select="$in/@code"/>

        <xsl:for-each select="$in">

            <xsl:attribute name="xsi:type">hl7nl:PIVL_TS</xsl:attribute>
            <xsl:call-template name="chooseOperatorAttrib">
                <xsl:with-param name="operator" select="$operator"/>
            </xsl:call-template>
            <xsl:choose>
                <xsl:when test="../is_flexibel[@value]">
                    <xsl:attribute name="isFlexible" select="../is_flexibel/@value"/>
                </xsl:when>
                <xsl:when test="../is_flexibel[@nullFlavor]"/>
                <!-- default true -->
                <xsl:otherwise>
                    <xsl:attribute name="isFlexible">true</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:attribute name="alignment">DW</xsl:attribute>
            <hl7nl:phase>
                <hl7nl:low>
                    <xsl:attribute name="value" select="$weekdayMap[@code = $weekdagCode]/@hl7PIVLPhaseLow"/>
                </hl7nl:low>
            </hl7nl:phase>
            <hl7nl:period value="1" unit="wk"/>

        </xsl:for-each>

    </xsl:template>

    <xd:doc>
        <xd:desc>HL7NL PIVL_TS Dagdeel. The HL7 templates are 9351 - 9354, but we make one xslt template here, because handling is mostly the same.</xd:desc>
        <xd:param name="in">The ada input dagdeel element. Defaults to context.</xd:param>
        <xd:param name="operator">Operator for the PIVL_TS. Optional, defaults to 'A' (intersect)</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9351-9354" match="dagdeel" mode="HandleDagdeel9351-9354">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="operator" as="xs:string?"/>

        <xsl:for-each select="$in">
            <xsl:attribute name="xsi:type">hl7nl:PIVL_TS</xsl:attribute>
            <xsl:call-template name="chooseOperatorAttrib">
                <xsl:with-param name="operator" select="$operator"/>
            </xsl:call-template>
            <xsl:attribute name="isFlexible">true</xsl:attribute>
            <xsl:attribute name="alignment">HD</xsl:attribute>

            <!-- check for unknown input @code -->
            <xsl:if test="not($daypartMap[@code = current()/@code])">
                <xsl:comment>Encountered a day part code we do not recognise: '<xsl:value-of select="@code"/>'. Please check.</xsl:comment>
                <xsl:call-template name="util:logMessage">
                    <xsl:with-param name="msg">Encountered a day part code we do not recognise: '<xsl:value-of select="@code"/>'. Please check.</xsl:with-param>
                    <xsl:with-param name="level" select="$logERROR"/>
                    <xsl:with-param name="terminate" select="false()"/>
                </xsl:call-template>
            </xsl:if>

            <hl7nl:phase>
                <hl7nl:low>
                    <xsl:attribute name="value" select="$daypartMap[@code = current()/@code]/@hl7PIVLPhaseLow"/>
                </hl7nl:low>
                <hl7nl:high>
                    <xsl:attribute name="value" select="$daypartMap[@code = current()/@code]/@hl7PIVLPhaseHigh"/>
                </hl7nl:high>
            </hl7nl:phase>
            <hl7nl:period>
                <!--  once a day -->
                <xsl:attribute name="value">1</xsl:attribute>
                <xsl:attribute name="unit" select="'d'"/>
            </hl7nl:period>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create an MP CDA administration schedule based on ada toedieningsschema. Version 9.x</xd:desc>
        <xd:param name="in">The ada input element: toedieningsschema. Defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9349_202010105160422" match="toedieningsschema" mode="HandleCDAAdministrationSchedule9x">
        <xsl:param name="in" as="element()*" select="."/>
        <xsl:for-each select="$in">
            <!-- Doseerschema met alleen toedieningsduur. 
                    Dit ligt niet voor de hand, het is waarschijnlijker dat toedieningsduur gecombineerd wordt met toedientijd en/of frequentie of interval. 
                    In dat geval moet gekozen worden voor een complexer doseerschema met verschillende comp PIVL_TS elementen. -->
            <!-- Dit moet worden afgehandeld in het aanroepende template wanneer toedieningsschema afwezig is, omdat de ingang van dit template het toedieningsschema is. 
                   Wat we hier wel verwerken: wanneer alléén is_flexibel is gevuld -->
            <xsl:if test="../toedieningsduur[@value | @unit] and not(.[*[name() ne 'is_flexibel'][.//(@value | @code | @unit)]])">
                <effectiveTime>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9348_20210105000000">
                        <xsl:with-param name="in" select="../toedieningsduur"/>
                        <xsl:with-param name="operator">A</xsl:with-param>
                    </xsl:call-template>
                </effectiveTime>
            </xsl:if>

            <!-- eenvoudige doseerschema's, waarbij niet gecombineerd kan worden met toedieningsduur -->
            <xsl:if test="not(../toedieningsduur[@value | @unit])">

                <xsl:choose>

                    <!-- Alleen een cyclisch schema (bijvoorbeeld voor een pauzeperiode in een groter cyclisch schema met verschillende doseerinstructies) -->
                    <!-- Dit moet worden afgehandeld in het aanroepende template wanneer toedienschema afwezig is, omdat de ingang van dit template het toedieningsschema is. 
                             Uitzondering is wanneer is_flexibel is gevuld en dat wordt hier alsnog afgehandeld -->
                    <xsl:when test="../../doseerduur[@value | @unit][../../herhaalperiode_cyclisch_schema[@value | @unit]] and not(.[*[name() ne 'is_flexibel'][.//(@value | @code | @unit)]])">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9082_20160621002112">
                                <xsl:with-param name="in" select="../../doseerduur"/>
                            </xsl:call-template>
                        </effectiveTime>
                    </xsl:when>

                    <!-- eenvoudige doseerschema's, waarbij niet gecombineerd kan worden met cyclisch schema (en ook geen toedieningsduur gezien de when waar we in zitten) -->
                    <xsl:when test="not(../../doseerduur[@value | @unit][../../herhaalperiode_cyclisch_schema[@value | @unit]])">

                        <xsl:choose>

                            <!-- Eenvoudig doseerschema met alleen één frequentie met een tijdseenheid. -->
                            <xsl:when test="frequentie[not(following-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])]/tijdseenheid[@value | @unit]">
                                <xsl:for-each select="frequentie[tijdseenheid[@value | @unit]]">
                                    <effectiveTime>
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                                    </effectiveTime>
                                </xsl:for-each>
                            </xsl:when>

                            <!-- Eenvoudig doseerschema met alleen één interval. -->
                            <xsl:when test="interval[not(following-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])][not(preceding-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])][@value | @unit]">
                                <xsl:for-each select="interval[@value | @unit]">
                                    <effectiveTime>
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9079_20160620162955"/>
                                    </effectiveTime>
                                </xsl:for-each>
                            </xsl:when>

                            <!-- Eenvoudig doseerschema met één vast tijdstip. -->
                            <xsl:when test="toedientijd[not(following-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])][not(preceding-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])][@value]">
                                <xsl:for-each select="toedientijd[@value]">
                                    <effectiveTime>
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                            <xsl:with-param name="isFlexible" select="../is_flexibel/@value"/>
                                            <xsl:with-param name="operator">A</xsl:with-param>
                                        </xsl:call-template>
                                    </effectiveTime>
                                </xsl:for-each>
                            </xsl:when>

                            <!-- Eenmalig gebruik of aantal keren gebruik zonder tijd. -->
                            <xsl:when test="frequentie[not(following-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])][not(tijdseenheid[@value | @unit])] and not(toedientijd/@value)">
                                <xsl:for-each select="frequentie[not(tijdseenheid[@value | @unit])]">
                                    <effectiveTime>
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9121_20191202152153"/>
                                    </effectiveTime>
                                </xsl:for-each>
                            </xsl:when>

                            <!-- Doseerschema één keer per week op één weekdag. We will filter away an eventual frequency of once a week -->
                            <xsl:when test="count(weekdag[not(../(interval | toedientijd | dagdeel)[.//(@value | @code)])][@value | @code]) = 1 and (not(frequentie[.//(@value | @code | @unit)]) or frequentie[aantal/vaste_waarde[@value = '1']][tijdseenheid[@value = '1'][@unit = $ada-unit-week]])">
                                <xsl:for-each select="weekdag[@value | @code]">
                                    <effectiveTime>
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9350_20210105175614"/>
                                    </effectiveTime>
                                </xsl:for-each>
                            </xsl:when>

                            <!-- Eén dagdeel, Nacht, Ochtend, Middag of Avond. We will filter away an eventual frequency of once a day  -->
                            <xsl:when test="count(dagdeel[@code]) = 1 and not((weekdag | toedientijd | interval)[.//(@value | @code | @unit)]) and (not(frequentie[.//(@value | @code | @unit)]) or frequentie[aantal/vaste_waarde[@value = '1']][tijdseenheid[@value = '1'][@unit = $ada-unit-day]])">
                                <effectiveTime>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9351-9354">
                                        <xsl:with-param name="in" select="dagdeel"/>
                                        <xsl:with-param name="operator">A</xsl:with-param>
                                    </xsl:call-template>
                                </effectiveTime>
                            </xsl:when>

                        </xsl:choose>

                    </xsl:when>

                </xsl:choose>
            </xsl:if>

            <!-- Complexer doseerschema met een combinatie van bovenstaande eenvoudige schema's. -->
            <xsl:if test="count(./*[name() ne 'is_flexibel'][.//(@value | @code | @unit)] | ../toedieningsduur[@value | @unit] | ../../../herhaalperiode_cyclisch_schema[@value | @unit]) gt 1">
                <effectiveTime xsi:type="SXPR_TS" operator="A">
                    <!-- week day -->
                    <xsl:for-each select="weekdag[@code]">
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9350_20210105175614">
                                <xsl:with-param name="operator" select="
                                        if (position() eq 1) then
                                            'A'
                                        else
                                            'I'"/>
                            </xsl:call-template>
                        </comp>
                    </xsl:for-each>
                    <!-- part of day -->
                    <xsl:for-each select="dagdeel[@code]">
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9351-9354">
                                <xsl:with-param name="operator" select="
                                        if (position() eq 1) then
                                            'A'
                                        else
                                            'I'"/>
                            </xsl:call-template>
                        </comp>
                    </xsl:for-each>
                    <!-- toedientijd -->
                    <xsl:for-each select="toedientijd[@value]">
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                <xsl:with-param name="isFlexible" select="../is_flexibel/@value"/>
                                <xsl:with-param name="operator" select="
                                        if (position() eq 1) then
                                            'A'
                                        else
                                            'I'"/>
                            </xsl:call-template>
                        </comp>
                    </xsl:for-each>
                    <!-- frequentie, tijdseenheid to distinguish from 'aantal keer'  -->
                    <xsl:for-each select="frequentie[.//(@value | @unit)][tijdseenheid[@value | @unit]]">
                        <!-- check for unexpected combinations -->
                        <xsl:choose>
                            <xsl:when test="../interval[@value | @unit]">
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="msg">Ada input has combination of interval and frequentie. This is unexpected. Please investigate. Still outputting to the best of our abilities.</xsl:with-param>
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="terminate" select="false()"/>
                                </xsl:call-template>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <!--   in combinatie met Weekdag. Frequentie niet opnemen als deze 1 maal per week is bij een weekdag (neem iedere maandag). -->
                            <xsl:when test="../weekdag[@value | @code] and tijdseenheid[@value = '1'][@unit = $ada-unit-week] and aantal/vaste_waarde[@value = '1']">
                                <!-- do not output frequentie, it is once a week, which is implicit in weekday --> </xsl:when>
                            <!-- Dagdeel. Frequentie niet opnemen als deze 1 maal per dag is (neem 1 maal daags 's ochtends). -->
                            <xsl:when test="../dagdeel[@value | @code] and not(../weekdag[@value | @code]) and tijdseenheid[@value = '1'][@unit = $ada-unit-day] and aantal/vaste_waarde[@value = '1']">
                                <!-- do not output frequentie, it is once a day, which is implicit in part of day --> </xsl:when>
                            <!-- Toedientijd(en). Frequentie niet opnemen als deze 1 maal per dag is, bijvoorbeeld "neem om 10:00 uur" of "neem om 10:00 en om 13:00 uur". -->
                            <xsl:when test="../toedientijd[@value] and not(../weekdag[@value | @code]) and tijdseenheid[@value = '1'][@unit = $ada-unit-day] and aantal/vaste_waarde[@value = '1']">
                                <!-- do not output frequentie, it is once a day, which is implicit in time of day --> </xsl:when>
                            <!-- any other case we simply output frequentie  -->
                            <xsl:otherwise>
                                <comp>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                                </comp>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    <!-- interval -->
                    <xsl:for-each select="interval[@value | @unit]">
                        <!-- check for unexpected combinations -->
                        <xsl:choose>
                            <xsl:when test="../frequentie[.//(@value | @unit)]">
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="msg">Ada input has combination of interval and frequentie. This is unexpected. Please investigate. Still outputting to the best of our abilities.</xsl:with-param>
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="terminate" select="false()"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="../toedientijd[@value]">
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="msg">Ada input has combination of interval and toedientijd. This is unexpected. Please investigate. Still outputting to the best of our abilities.</xsl:with-param>
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="terminate" select="false()"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="../weekdag[@value | @code]">
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="msg">Ada input has combination of interval and weekdag. This is unexpected. Please investigate. Still outputting to the best of our abilities.</xsl:with-param>
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="terminate" select="false()"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="../dagdeel[@value | @code]">
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="msg">Ada input has combination of interval and dagdeel. This is unexpected. Please investigate. Still outputting to the best of our abilities.</xsl:with-param>
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="terminate" select="false()"/>
                                </xsl:call-template>
                            </xsl:when>
                        </xsl:choose>
                        <!-- output the HL7 PIVL_TS for interval -->
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9079_20160620162955"/>
                        </comp>
                    </xsl:for-each>
                    <!-- cyclisch schema -->
                    <xsl:for-each select="../../doseerduur[@value | @unit][../../herhaalperiode_cyclisch_schema[@value | @unit]]">
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9082_20160621002112"/>
                        </comp>
                    </xsl:for-each>
                    <!-- toedieningsduur -->
                    <xsl:for-each select="../toedieningsduur[@value | @unit]">
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9348_20210105000000">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="operator">I</xsl:with-param>
                            </xsl:call-template>
                        </comp>
                    </xsl:for-each>
                </effectiveTime>
            </xsl:if>

        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Verstrekkingsverzoek vanaf 9 2.0</xd:desc>
        <xd:param name="in">ada verstrekkingsverzoek to be converted, defaults to context</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9356_20210402132627" match="verstrekkingsverzoek" mode="HandleVV92">
        <xsl:param name="in" select="." as="element()*"/>

        <xsl:for-each select="$in[.//(@value | @code)]">
            <supply classCode="SPLY" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9356"/>

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
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9093_20160623183534"/>
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
        <xd:desc> Verstrekking vanaf 9.1.0</xd:desc>
        <xd:param name="in">ada verstrekking</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9364_20210602161935" match="verstrekking" mode="handleMVE910">
        <xsl:param name="in" as="element()*" select="."/>

        <xsl:for-each select="$in">
            <supply classCode="SPLY" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9364"/>

                <!-- identificatie -->
                <xsl:for-each select="identificatie[@value | @nullFlavor]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>

                <code displayName="Verstrekking" code="373784005" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>

                <!-- (uitreik-)datum   (Aanschrijfdatum zit in EntityRelation) -->
                <xsl:for-each select="(datum | medicatieverstrekkings_datum_tijd)[@value | @nullFlavor]">
                    <effectiveTime>
                        <xsl:call-template name="makeTSValueAttr"/>
                    </effectiveTime>
                </xsl:for-each>

                <!-- verstrekte_hoeveelheid -->
                <xsl:for-each select="verstrekte_hoeveelheid[.//(@value | @unit | @nullFlavor)]">
                    <quantity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
                    </quantity>
                </xsl:for-each>

                <!-- verbruiks_duur  -->
                <xsl:for-each select="(verbruiks_duur | verbruiksduur)[@value]">
                    <expectedUseTime>
                        <!-- Tijdseenheid is verplicht in dagen -->
                        <width value="{nf:calculate_Duur_In_Dagen(./@value,nf:convertTime_ADA_unit2UCUM(./@unit))}" unit="d"/>
                    </expectedUseTime>
                </xsl:for-each>

                <!-- verstrekt_geneesmiddel -->
                <xsl:for-each select="../../bouwstenen/farmaceutisch_product[@id = current()/verstrekt_geneesmiddel/farmaceutisch_product/@value]">
                    <product>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </product>
                </xsl:for-each>

                <!-- verstrekker/zorgaanbieder -->
                <xsl:for-each select="../../bouwstenen/zorgaanbieder[@id = current()/verstrekker/zorgaanbieder/@value]">
                    <performer>
                        <assignedEntity>
                            <id nullFlavor="NI"/>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701000000"/>
                        </assignedEntity>
                    </performer>
                </xsl:for-each>

                <!-- afleverlocatie -->
                <xsl:for-each select="afleverlocatie[.//(@value | @code | @nullFlavor)]">
                    <participant typeCode="DST">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
                    </participant>
                </xsl:for-each>

                <!-- aanschrijfdatum -->
                <xsl:for-each select="(aanschrijfdatum | aanschrijf_datum)[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9095_20160623195047"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- Distributievorm -->
                <xsl:for-each select="distributievorm[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9097_20160623203415"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- Aanvullende informatie bij verstrekking. -->
                <xsl:for-each select="(aanvullende_informatie | medicatieverstrekking_aanvullende_informatie)[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9178_20170523091005"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- Toelichting -->
                <xsl:for-each select="toelichting[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- relatie naar Verstrekkingsverzoek -->
                <xsl:for-each select="(relatie_naar_verstrekkingsverzoek | relatie_verstrekkingsverzoek)[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9312_20191223150301"/>
                    </entryRelationship>
                </xsl:for-each>

                <!--Relatie naar medicamenteuze behandeling -->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select=".."/>
                    </xsl:call-template>
                </entryRelationship>

            </supply>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Reden voor medicatieafspraak vanaf 9 2.0</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9370_20210616112017" match="reden_wijzigen_of_staken" mode="HandleRedenAfspraak91">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9370"/>
            <code code="160111000146106" displayName="reden voor wijzigen van voorschrift" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template for Medicatieafspraak resuable parts 1 for MP 9 2.0. SNOMED code update</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9371_20210615181824" match="medicatieafspraak">
        <!-- MP CDA Medicatieafspraak onderdelen 1 -->
        <xsl:for-each select="identificatie[.//(@value | @code)]">
            <xsl:call-template name="makeIIid"/>
        </xsl:for-each>
        <code code="33633005" displayName="voorschrijven van geneesmiddel (verrichting)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
        <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
            <text mediaType="text/plain">
                <xsl:value-of select="@value"/>
            </text>
        </xsl:for-each>

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
        <xd:desc>Mapping of medicatietoediening concept in ADA to HL7</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9373_20210616162231" match="medicatietoediening">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9373"/>
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
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9392_20210914"/>
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
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9379_20210617145250" match="toediener" mode="HandleToediener92">
        <xsl:param name="in" as="element()*" select="."/>

        <xsl:for-each select="$in">
            <!-- patient -->
            <xsl:for-each select="patient[not(toediener_is_patient/@value = 'false')][.//@value]">
                <author>
                    <!-- time is verplicht in xsd, maar medicatietoediening heeft er geen dataset concept voor -->
                    <time nullFlavor="NI"/>
                    <assignedAuthor>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.52_20170825000000">
                            <xsl:with-param name="ada_patient_identificatienummer" select="../../../../patient/identificatienummer"/>
                        </xsl:call-template>
                    </assignedAuthor>
                </author>
            </xsl:for-each>

            <!-- zorgverlener -->
            <xsl:for-each select="../../../bouwstenen/zorgverlener[@id = current()//zorgverlener[not(zorgverlener)]/@value]">
                <author>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210"/>
                </author>
            </xsl:for-each>

            <!-- mantelzorger -->
            <xsl:for-each select="../../../bouwstenen/contactpersoon[@id = current()/mantelzorger/contactpersoon/@value]">
                <author>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.35_20210701000000"/>
                </author>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Mapping of wisselend_doseerschema concept in ADA to HL7 CDA template</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9380_202106171758546" match="wisselend_doseerschema">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9380"/>
                <xsl:for-each select="identificatie[.//(@value | @code)]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                <code code="395067002" displayName="optimaliseren van dosering van medicatie (verrichting)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
                <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
                    <text mediaType="text/plain">
                        <xsl:value-of select="@value"/>
                    </text>
                </xsl:for-each>

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

                <xsl:for-each select="wisselend_doseerschema_stop_type[.//(@value | @code)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9372_20210616133243"/>
                    </entryRelationship>
                </xsl:for-each>

                <xsl:for-each select="(reden_wijzigen_of_staken)[.//(@value | @code)]">
                    <entryRelationship typeCode="RSON">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9404_20220315000000"/>
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
        <xd:desc> MP CDA Author Participation for Contactpersoon </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9383_20210618000000" match="contactpersoon" mode="handleAuthorContactpersoon92">
        <xsl:for-each select="relatie[@code | @nullFlavor]">
            <xsl:call-template name="makeCode">
                <xsl:with-param name="elemName">code</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>

        <xsl:for-each select=".//naamgegevens[not(naamgegevens)][.//(@value | @code | @nullFlavor)]">
            <assignedAuthor>
                <id nullFlavor="NI"/>
                <assignedPerson>
                    <name>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.100_20170602000000">
                            <xsl:with-param name="naamgegevens" select="."/>
                        </xsl:call-template>
                    </name>
                </assignedPerson>
            </assignedAuthor>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Reden voor wijzigen/stoppen medicatiegebruik vanaf MP9 2.0.0</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9385_20210628143123">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9385"/>
            <code code="153861000146102" displayName="reden voor wijzigen van medicatiegebruik (waarneembare entiteit)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
            <value xsi:type="CE">
                <xsl:call-template name="makeCodeAttribs"/>
            </value>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>Toediener in medicatietoediening</xd:desc>
        <xd:param name="in">the ada element for toediener, defaults to context</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9392_20210914" match="toediener" mode="HandleToediener92">
        <xsl:param name="in" as="element()*" select="."/>

        <xsl:for-each select="$in">
            <!-- patient -->
            <xsl:for-each select="patient[not(toediener_is_patient/@value = 'false')][.//@value]">
                <performer>
                    <!-- time is verplicht in xsd, maar medicatietoediening heeft er geen dataset concept voor -->
                    <time nullFlavor="NI"/>
                    <assignedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.52_20170825000000">
                            <xsl:with-param name="ada_patient_identificatienummer" select="../../../../patient/identificatienummer"/>
                        </xsl:call-template>
                    </assignedEntity>
                </performer>
            </xsl:for-each>

            <!-- zorgverlener -->
            <xsl:for-each select="../../../bouwstenen/zorgverlener[@id = current()//zorgverlener[not(zorgverlener)]/@value]">
                <performer>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.43_20210701000000"/>
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
        <xd:desc>Reden voor wijzigen of staken toedieningsafspraak vanaf 9.2def</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9394_20220315000000">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9394"/>
            <code code="160121000146101" displayName="reden voor wijzigen van toedieningsinstructies" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc> Reden voor medicatieafspraak vanaf 9 2.0</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9404_20220315000000" match="reden_wijzigen_of_staken" mode="HandleRedenWijzStakenWDS">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9404"/>
            <code code="160111000146106" displayName="reden voor wijzigen van voorschrift" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>Temp function for super duper friendly frequency calculations, probably should not do this, but simply output the frequency when the input is shaky. Saving it before deleting</xd:desc>
    </xd:doc>
    <xsl:function name="nf:frequency-calculate">
        <!-- Let's calculate the repeat time for this daypart -->
        <!--    <xsl:variable name="theTijdsEenheid" as="element(tijdseenheid)?">
            <xsl:choose>
                <xsl:when test="not(frequentie/tijdseenheid[@unit])"/>
                <xsl:when test="frequentie/tijdseenheid[@unit = $ada-unit-day] or frequentie/tijdseenheid[@value castable as xs:integer][@unit = $ada-unit-hour]">
                    <xsl:variable name="theValue">
                        <xsl:choose>
                            <!-\- okay, someone may have said once per 24 hours or twice per 48 hours or something of that sort, we don't like, but we'll deal with it -\->
                            <xsl:when test="frequentie/aantal/vaste_waarde/@value castable as xs:float and frequentie/tijdseenheid/@value castable as xs:float and frequentie/tijdseenheid[@unit = $ada-unit-hour]">
                                <xsl:variable name="calcValue" select="(xs:float(frequentie/tijdseenheid/@value) div xs:float(frequentie/aantal/vaste_waarde/@value)) div 24"/>
                                <!-\- afronden naar vier cijfers achter de komma -\->
                                <xsl:value-of select="round($calcValue * 10000) div 10000"/>
                            </xsl:when>
                            <!-\- okay we're super duper friendly here, should one say twice in four days, this will work 
                                            even though one should have said once in two days -\->
                            <xsl:when test="frequentie/aantal/vaste_waarde/@value castable as xs:float and frequentie/tijdseenheid/@value castable as xs:float">
                                <xsl:variable name="calcValue" select="xs:float(frequentie/tijdseenheid/@value) div xs:float(frequentie/aantal/vaste_waarde/@value)"/>
                                <!-\- afronden naar vier cijfers achter de komma -\->
                                <xsl:value-of select="round($calcValue * 10000) div 10000"/>
                            </xsl:when>
                            <!-\- okay, someone may have said once per 24 hours or twice per 48 hours, we don't like, but we'll deal with it -\->
                            <xsl:when test="frequentie/tijdseenheid[@value castable as xs:integer][@unit = $ada-unit-hour] and (frequentie/tijdseenheid/xs:integer(@value) div 24) castable as xs:integer and (frequentie/aantal/vaste_waarde/@value castable as xs:float)">
                                <xsl:variable name="calcValue" select="(xs:float(frequentie/tijdseenheid/@value) div xs:float(frequentie/aantal/vaste_waarde/@value)) div 24"/>
                                <!-\- afronden naar vier cijfers achter de komma -\->
                                <xsl:value-of select="round($calcValue * 10000) div 10000"/>
                            </xsl:when>
                            <xsl:when test="not(frequentie/aantal/vaste_waarde/@value castable as xs:float) and frequentie/tijdseenheid/@value castable as xs:float">
                                <xsl:value-of select="round(frequentie/tijdseenheid/@value * 10000) div 10000"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-\- should not happen -\->
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="terminate" select="false()"/>
                                    <xsl:with-param name="msg">Daypart (dagdeel). Encountered frequentie/aantal/vaste_waarde/@value = <xsl:value-of select="frequentie/aantal/vaste_waarde/@value"/>, frequentie/tijdseenheid/@value = <xsl:value-of select="frequentie/tijdseenheid/@value"/>, frequentie/tijdseenheid/@unit = <xsl:value-of select="frequentie/tijdseenheid/@unit"/>, cannot determine the value to fill in period/@value. Defaulting to 1 day.</xsl:with-param>
                                </xsl:call-template>
                                <xsl:value-of select="1"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:choose>
                        <!-\- for daypart (dagdeel) the period must be (a multiple of) whole days -\->
                        <xsl:when test="$theValue castable as xs:integer">
                            <tijdseenheid xmlns="" value="{$theValue}" unit="dag"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-\- should not happen -\->
                            <xsl:call-template name="util:logMessage">
                                <xsl:with-param name="level" select="$logERROR"/>
                                <xsl:with-param name="terminate" select="false()"/>
                                <xsl:with-param name="msg">Daypart (dagdeel). Encountered frequentie/aantal/vaste_waarde/@value = <xsl:value-of select="frequentie/aantal/vaste_waarde/@value"/>, frequentie/tijdseenheid/@value = <xsl:value-of select="frequentie/tijdseenheid/@value"/>, frequentie/tijdseenheid/@unit = <xsl:value-of select="frequentie/tijdseenheid/@unit"/>, the value to fill in period/@value is not an integer, found: <xsl:value-of select="$theValue"/> day. This is not possible in combination with day part (dagdeel).</xsl:with-param>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <!-\- should not happen -\->
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="level" select="$logERROR"/>
                        <xsl:with-param name="terminate" select="false()"/>
                        <xsl:with-param name="msg">Daypart (dagdeel). Encountered frequentie/tijdseenheid/@unit  = <xsl:value-of select="frequentie/tijdseenheid/@unit"/> which does not represent (a multiple of) day. This is not possible, ignoring this frequency.</xsl:with-param>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
    -->
        <xsl:value-of select="''"/>
    </xsl:function>

</xsl:stylesheet>
