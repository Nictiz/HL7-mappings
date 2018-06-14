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
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#default"/>
    <xsl:include href="../../peri20_include.xsl"/>

    <xsl:template match="/">
        <xsl:call-template name="AcuteOverdracht21">
            <xsl:with-param name="zorgverlening" select="//overdracht_acute_fase_bericht/zorgverlening"/>
            <xsl:with-param name="zorgverlenerzorginstelling" select="//overdracht_acute_fase_bericht/zorgverlenerzorginstelling"/>
            <xsl:with-param name="vrouw" select="//overdracht_acute_fase_bericht/vrouw"/>
            <xsl:with-param name="obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap" select="//overdracht_acute_fase_bericht/obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap"/>
            <xsl:with-param name="zwangerschap" select="//overdracht_acute_fase_bericht/zwangerschap"/>
            <xsl:with-param name="bevalling" select="//overdracht_acute_fase_bericht/bevalling"/>
            <xsl:with-param name="uitkomst_per_kind" select="//overdracht_acute_fase_bericht/uitkomst_per_kind"/>
            <xsl:with-param name="medisch_onderzoek" select="//overdracht_acute_fase_bericht/medisch_onderzoek"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="AcuteOverdracht21">
        <xsl:param name="zorgverlening"/>
        <xsl:param name="zorgverlenerzorginstelling"/>
        <xsl:param name="vrouw"/>
        <xsl:param name="obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap"/>
        <xsl:param name="zwangerschap"/>
        <xsl:param name="bevalling"/>
        <xsl:param name="uitkomst_per_kind"/>
        <xsl:param name="medisch_onderzoek"/>
        <xsl:processing-instruction name="xml-model">href="file:/C:/SVN/AORTA/trunk/Zorgtoepassing/PerinataleZorg/DECOR/peri20-runtime-develop/peri20-acufov.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <xsl:processing-instruction name="xml-model">href="file:/C:/SVN/art_decor/branches/peri20-test-acuteOverdracht21/test_xslt/peri20-acuteOverdracht21-scenario-1.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>

        <REPC_IN002120NL xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 file:/C:/SVN/AORTA/trunk/xml/schemas/REPC_IN002120NL.xsd" xmlns="urn:hl7-org:v3">
            <id extension="4536546534" root="2.16.840.1.113883.2.4.6.6.31.1.1.2.1"/>
            <creationTime value="20130315101458"/>
            <versionCode code="NICTIZEd2005-Okt"/>
            <interactionId extension="REPC_IN002120NL" root="2.16.840.1.113883.1.6"/>
            <profileId root="2.16.840.1.113883.2.4.3.11.1" extension="810"/>
            <processingCode code="P"/>
            <processingModeCode code="T"/>
            <acceptAckCode code="AL"/>
            <receiver typeCode="RCV">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <!-- ID van de ontvangende softwareapplicatie -->
                    <id extension="2" root="2.16.840.1.113883.2.4.6.6"/>
                    <name>Systeem Y van gynaecoloog X</name>
                </device>
            </receiver>
            <sender typeCode="SND">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <!-- ID van de zendende softwareapplicatie -->
                    <id extension="31" root="2.16.840.1.113883.2.4.6.6"/>
                    <name>Verloskundige software applicatie B van praktijk ABC</name>
                </device>
            </sender>
            <ControlActProcess classCode="ACTN" moodCode="EVN">
                <effectiveTime value="20130315101455"/>
                <authorOrPerformer typeCode="AUT">
                    <participant>
                        <AssignedPerson>
                            <id root="2.16.528.1.1007.3.1" extension="000012349"/>
                            <code codeSystem="2.16.840.1.113883.2.4.15.111" code="03.000"/>
                            <assignedPrincipalChoiceList>
                                <assignedPerson>
                                    <name>
                                        <given>Victor</given>
                                        <family>Verloskundige</family>
                                    </name>
                                </assignedPerson>
                            </assignedPrincipalChoiceList>
                            <Organization>
                                <id root="2.16.528.1.1007.3.3" extension="00023444"/>
                                <code codeSystem="2.16.840.1.113883.2.4.15.1060" code="G3"/>
                                <name>ABC Verloskundigenpraktijk</name>
                            </Organization>
                        </AssignedPerson>
                    </participant>
                </authorOrPerformer>
                <overseer typeCode="RESP">
                    <AssignedPerson>
                        <id root="2.16.528.1.1007.3.1" extension="000012349"/>
                        <code codeSystem="2.16.840.1.113883.2.4.15.111" code="03.000"/>
                        <assignedPrincipalChoiceList>
                            <assignedPerson>
                                <name>
                                    <given>Victor</given>
                                    <family>Verloskundige</family>
                                </name>
                            </assignedPerson>
                        </assignedPrincipalChoiceList>
                        <Organization>
                            <id root="2.16.528.1.1007.3.3" extension="00023444"/>
                            <code codeSystem="2.16.840.1.113883.2.4.15.1060" code="G3"/>
                            <name>ABC Verloskundigenpraktijk</name>
                            <addr>
                                <city>Vestigingsplaats</city>
                            </addr>
                        </Organization>
                    </AssignedPerson>
                </overseer>
                <subject typeCode="SUBJ">
                    <careProvisionRequest classCode="PCPR" moodCode="RQO">
                        <templateId root="2.16.840.1.113883.2.4.6.10.90.63"/>
                        <id extension="cp2757632" root="2.16.840.1.113883.2.4.6.6.31.1.1.2.2"/>
                        <statusCode code="active"/>
                        <!-- Vrouw -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900729_20130314000000">
                            <xsl:with-param name="vrouw" select="$vrouw"/>
                            <xsl:with-param name="zwangerschap" select="$zwangerschap"/>
                        </xsl:call-template>

                        <xsl:for-each select="$zorgverlenerzorginstelling">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900668_20120317000000"/>
                        </xsl:for-each>
                        <!-- Reden acute overdracht -->
                        <reason typeCode="RSON">
                            <xsl:for-each select="$zorgverlening/overdrachtdetails/redenen_van_overdracht_aan">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900037_20120315000000"/>
                            </xsl:for-each>
                        </reason>
                        <!-- bijzonderheden algemene anamnese -->
                        <xsl:for-each select="$vrouw/lijst_ziekten_en_bijzonderheden_vrouw_in_de_algemene_anamnese">
                            <pertinentInformation2 typeCode="PERT" contextConductionInd="true">
                                <careProvisionEvent classCode="PCPR" moodCode="EVN">
                                    <pertinentInformation2 typeCode="PERT" contextConductionInd="true">
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900897_20130101000000"/>
                                    </pertinentInformation2>
                                </careProvisionEvent>
                            </pertinentInformation2>
                        </xsl:for-each>
                        <!-- bijzonderheden obstetrische anamnese -->
                        <xsl:for-each select="$vrouw/lijst_bijzonderheden_obstetrische_anamnese">
                            <pertinentInformation2 typeCode="PERT" contextConductionInd="true">
                                <careProvisionEvent classCode="PCPR" moodCode="EVN">
                                    <pertinentInformation2 typeCode="PERT" contextConductionInd="true">
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900711_20120503000000"/>
                                    </pertinentInformation2>
                                </careProvisionEvent>
                            </pertinentInformation2>
                        </xsl:for-each>
                        <!-- Hoeveelheid bloedverlies tot acute overdracht -->
                        <xsl:for-each select="$zorgverlening/overdrachtdetails/hoeveelheid_bloedverlies_tot_acute_overdracht">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900900_20130320000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- IUVD -->
                        <xsl:for-each select="$zorgverlening/overdrachtdetails/intrauteriene_vruchtdood">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900918_20130320000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- Allergieen -->
                        <xsl:for-each select="$vrouw/relevante_allergieen_acute_fase">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900149_20130320000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- Actuele medicatie -->
                        <xsl:if test="$vrouw/actueel_medicatiegebruikq or $vrouw/soort_actuele_medicatie">
                            <xsl:for-each select="$vrouw">
                                <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900654_20120503000000"/>
                                </pertinentInformation3>
                            </xsl:for-each>
                        </xsl:if>
                        <!-- neg seksuele ervaring? -->
                        <xsl:for-each select="$vrouw/negatieve_seksuele_ervaringen">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900656_20111206000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- MRSA besmetting aangetoond? -->
                        <xsl:for-each select="$vrouw/mrsa_besmetting_aangetoondq">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900657_20111206000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- Bloedtransfusie? -->
                        <xsl:for-each select="$vrouw/bloedtransfusieq">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900158_20111206000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- BMI -->
                        <xsl:for-each select="$vrouw/bmi_vrouw">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900159_20111206000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- Actuele bloeddruk -->
                        <xsl:for-each select="$vrouw/actuele_bloeddruk">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900612_20111206000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- Bloedgroep -->
                        <xsl:for-each select="$vrouw/bloedgroep_vrouw">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900663_20111206000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- Rhesus D Factor vrouw -->
                        <xsl:for-each select="$vrouw/rhesus_d_factor_vrouw">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900669_20130314000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- Irregulaire antistoffen -->
                        <xsl:for-each select="$vrouw/irregulaire_antistoffen">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900171_20111206000000"/>
                        </xsl:for-each>
                        <!-- Rhesus c Factor -->
                        <xsl:for-each select="$vrouw/rhesus_c_factor">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900683_20130314000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- HBsAg -->
                        <xsl:for-each select="$vrouw/afwijkende_infectieparameters_hbsagq">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900186_20111206000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- Voorgaande zwangerschappen, obstetrische anamnese -->
                        <xsl:for-each select="$obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900725_20131108000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- Huidige Zwangerschap ==================== -->
                        <xsl:for-each select="$zwangerschap">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <organizer classCode="CONTAINER" moodCode="EVN">
                                    <!-- huidige zwangerschap -->
                                    <code code="364320009" codeSystem="2.16.840.1.113883.6.96" displayName="Pregnancy observable (observable entity"/>
                                    <!-- Identificatie -->
                                    <xsl:for-each select="./identificatie_van_de_zwangerschap">
                                        <component typeCode="COMP" contextConductionInd="true">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900728_20111206000000"/>
                                        </component>
                                    </xsl:for-each>
                                    <!-- Wijze einde zwangerschap -->
                                    <xsl:for-each select="./wijze_einde_zwangerschap">
                                        <component typeCode="COMP" contextConductionInd="true">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900876_20130320000000"/>
                                        </component>
                                    </xsl:for-each>
                                    <!-- Graviditeit -->
                                    <xsl:for-each select="./graviditeit">
                                        <component typeCode="COMP" contextConductionInd="true">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900004_20110128000000"/>
                                        </component>
                                    </xsl:for-each>
                                    <!-- Pariteit -->
                                    <xsl:for-each select="./pariteit_voor_deze_zwangerschap">
                                        <component typeCode="COMP" contextConductionInd="true">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900090_20091001000000"/>
                                        </component>
                                    </xsl:for-each>
                                    <!-- Aantal levende kinderen -->
                                    <xsl:for-each select="./aantal_levende_kinderen">
                                        <component typeCode="COMP" contextConductionInd="true">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900907_20130320000000"/>
                                        </component>
                                    </xsl:for-each>
                                    <!-- Actuele a terme datum -->
                                    <xsl:for-each select="./a_terme_datum_groep">
                                        <component typeCode="COMP" contextConductionInd="true">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900730_20130314000000"/>
                                        </component>
                                    </xsl:for-each>
                                    <!-- Voornemens -->
                                    <!-- Bevalplan -->
                                    <xsl:for-each select="./voornemens/bevalplan">
                                        <component typeCode="COMP" contextConductionInd="true">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900917_20130320000000"/>
                                        </component>
                                    </xsl:for-each>
                                </organizer>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!--  Huidige Bevalling====================-->
                        <xsl:for-each select="$bevalling">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <organizer classCode="CONTAINER" moodCode="EVN">
                                    <code code="236973005" codeSystem="2.16.840.1.113883.6.96" displayName="Delivery procedure (procedure)"/>
                                    <!-- Wijze waarop de baring begon -->
                                    <xsl:for-each select="./wijze_waarop_de_baring_begon">
                                        <component typeCode="COMP" contextConductionInd="true">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900908_20130320000000"/>
                                        </component>
                                    </xsl:for-each>
                                    <!-- Tijdstip begin actieve ontsluiting -->
                                    <xsl:for-each select="./tijdstip_begin_actieve_ontsluiting">
                                        <component typeCode="COMP" contextConductionInd="true">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900197_20130320000000"/>
                                        </component>
                                    </xsl:for-each>
                                    <!-- Kleur vruchtwater -->
                                    <xsl:for-each select="./kleur_vruchtwater">
                                        <component typeCode="COMP" contextConductionInd="true">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900199_20091001000000"/>
                                        </component>
                                    </xsl:for-each>
                                    <!-- Medicatie nageboortetijdperk -->
                                    <xsl:for-each select="./medicatie_nageboortetijdperk">
                                        <component typeCode="COMP" contextConductionInd="true">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900716_20120422000000"/>
                                        </component>
                                    </xsl:for-each>
                                    <xsl:for-each select="./placenta/geboorte_placenta">
                                        <component typeCode="COMP" contextConductionInd="true">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900214_20091001000000"/>
                                        </component>
                                    </xsl:for-each>
                                    <xsl:for-each select="./placenta/placenta_compleet">
                                        <component typeCode="COMP" contextConductionInd="true">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900403_20111206000000"/>
                                        </component>
                                    </xsl:for-each>
                                    <!-- conditie perineum postpartum -->
                                    <xsl:for-each select="./conditie_perineum_postpartum">
                                        <component typeCode="COMP" contextConductionInd="true">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900262_20130423000000"/>
                                        </component>
                                    </xsl:for-each>
                                </organizer>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- Uitkomst per kind -->
                        <xsl:for-each select="$uitkomst_per_kind/baring">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="false">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900624_20130320000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- Foetusspecifieke (onderzoeks)gegevens, mag meerdere keren voorkomen (voor iedere echo) -->
                        <xsl:for-each select="$medisch_onderzoek/foetusspecifieke_onderzoeksgegevens">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="false">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900862_20130314000000"/>
                            </pertinentInformation3>
                        </xsl:for-each>
                        <!-- Medisch onderzoek - maternaal -->
                        <xsl:if test="$medisch_onderzoek/maternale_onderzoeksgegevens">
                            <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900919_20130729000000">
                                    <xsl:with-param name="maternale_onderzoeken" select="$medisch_onderzoek/maternale_onderzoeksgegevens"/>
                                </xsl:call-template>                                
                            </pertinentInformation3>
                        </xsl:if>
                    </careProvisionRequest>
                </subject>
            </ControlActProcess>
        </REPC_IN002120NL>
    </xsl:template>
</xsl:stylesheet>
