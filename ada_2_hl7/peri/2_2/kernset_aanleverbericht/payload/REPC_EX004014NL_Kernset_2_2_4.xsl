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
    <xsl:include href="../../../peri20_include.xsl"/>

    <xsl:template name="Kernset22_withInputDoc">
        <xsl:param name="inputFile"/>
        <xsl:call-template name="Kernset22">
            <xsl:with-param name="zorgverlening" select="$inputFile//kernset_aanleverbericht/zorgverlening"/>
            <xsl:with-param name="zorgverlenerzorginstelling" select="$inputFile//kernset_aanleverbericht/zorgverlenerzorginstelling"/>
            <xsl:with-param name="vrouw" select="$inputFile//kernset_aanleverbericht/vrouw"/>
            <xsl:with-param name="obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap" select="$inputFile//kernset_aanleverbericht/obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap"/>
            <xsl:with-param name="zwangerschap" select="$inputFile//kernset_aanleverbericht/zwangerschap"/>
            <xsl:with-param name="bevalling" select="$inputFile//kernset_aanleverbericht/bevalling"/>
            <xsl:with-param name="uitkomst_per_kind" select="$inputFile//kernset_aanleverbericht/uitkomst_per_kind"/>
            <xsl:with-param name="medisch_onderzoek" select="$inputFile//kernset_aanleverbericht/medisch_onderzoek"/>
            <xsl:with-param name="postnatale_fase" select="$inputFile//kernset_aanleverbericht/postnatale_fase"/>
        </xsl:call-template>
    </xsl:template>    

    <xsl:template match="/">
        <xsl:call-template name="Kernset22">
            <xsl:with-param name="zorgverlening" select="//kernset_aanleverbericht/zorgverlening"/>
            <xsl:with-param name="zorgverlenerzorginstelling" select="//kernset_aanleverbericht/zorgverlenerzorginstelling"/>
            <xsl:with-param name="vrouw" select="//kernset_aanleverbericht/vrouw"/>
            <xsl:with-param name="obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap" select="//kernset_aanleverbericht/obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap"/>
            <xsl:with-param name="zwangerschap" select="//kernset_aanleverbericht/zwangerschap"/>
            <xsl:with-param name="bevalling" select="//kernset_aanleverbericht/bevalling"/>
            <xsl:with-param name="uitkomst_per_kind" select="//kernset_aanleverbericht/uitkomst_per_kind"/>
            <xsl:with-param name="medisch_onderzoek" select="//kernset_aanleverbericht/medisch_onderzoek"/>
            <xsl:with-param name="postnatale_fase" select="//kernset_aanleverbericht/postnatale_fase"/>
        </xsl:call-template>
    </xsl:template>
    
 
    <xsl:template name="Kernset22">
        <xsl:param name="zorgverlening"/>
        <xsl:param name="zorgverlenerzorginstelling"/>
        <xsl:param name="vrouw"/>
        <xsl:param name="obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap"/>
        <xsl:param name="zwangerschap"/>
        <xsl:param name="bevalling"/>
        <xsl:param name="uitkomst_per_kind"/>
        <xsl:param name="medisch_onderzoek"/>
        <xsl:param name="postnatale_fase"/>
        <subject2 typeCode="SUBJ" contextConductionInd="false">
            <CareProvisionEvent classCode="PCPR" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.73"/>
                <id root="1.2.3.4.5" extension="15951"/>
                <effectiveTime>
                    <xsl:for-each select="$zorgverlening/datum_start_zorgverantwoordelijkheid">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900115_20120902000000"/>
                    </xsl:for-each>
                    <xsl:for-each select="$zorgverlening/datum_einde_zorgverantwoordelijkheid">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900024_20120902000000"/>
                    </xsl:for-each>
                </effectiveTime>
                <!-- Vrouw -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900872_20141024000000">
                    <xsl:with-param name="vrouw" select="$vrouw"/>
                    <xsl:with-param name="zwangerschap" select="$zwangerschap"/>
                </xsl:call-template>
                <xsl:for-each select="$zorgverlenerzorginstelling/zorginstelling">
                    <verifier typeCode="LA">
                        <assignedPerson classCode="ASSIGNED">
                            <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901018_20141107145228"/>
                            </representedOrganization>
                        </assignedPerson>
                    </verifier>
                </xsl:for-each>
                <!-- Eindverantwoordelijk in periode -->
                <xsl:for-each select="$zorgverlening/eindverantwoordelijk_in_welke_perinatale_periodeq">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900118_20150113174631"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Conclusie risicostatus na intake -->
                <xsl:for-each select="$zorgverlening/conclusie_risicostatus_na_intake">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900938_20141022000000"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Zorgverzoekdetails -->
                <xsl:for-each select="$zorgverlening/zorgverzoekdetails">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900873_20141024000000"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Is er sprake van 'overdracht aan'? -->
                <xsl:if test="not($zorgverlening/overdrachtdetails)">
                    <xsl:for-each select="$zorgverlening/is_er_sprake_van_overdracht_aanq">
                        <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                            <!-- Is er sprake van 'overdracht aan'? -->
                            <act classCode="PCPR" moodCode="RQO">
                                <xsl:call-template name="makeNegationAttr"/>
                                <code code="308292007" codeSystem="2.16.840.1.113883.6.96" displayName="Transfer of care (procedure)"/>
                            </act>
                        </pertinentInformation3>
                    </xsl:for-each>
                </xsl:if>

                <!-- overdrachtdetails -->
                <xsl:for-each select="$zorgverlening/overdrachtdetails">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900620_20141024000000"/>
                    </pertinentInformation3>
                </xsl:for-each>

                <!-- Anamnese -->
                <xsl:for-each select="$vrouw/anamnese">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900963_20141027000000"/>
                    </pertinentInformation3>
                </xsl:for-each>

                <!-- Lengte -->
                <xsl:for-each select="$vrouw/lengte_gemeten">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900570_20110128000000"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!--Type vrouwelijke genitale verminking-->
                <xsl:for-each select="$vrouw">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900964_20141027000000"/>
                </xsl:for-each>
                <!-- Voorgaande zwangerschappen, obstetrische anamnese
                                    de pertinentInformation3 kan herhaald worden per voorgaande zwangerschap  -->
                <xsl:for-each select="$obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900966_20141028000000"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!--   Huidige zwangerschap    -->

                <!-- Item: 20010 - Graviditeit -->
                <xsl:for-each select="$zwangerschap/graviditeit">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900004_20110128000000"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Item: 20150 - Pariteit -->
                <xsl:for-each select="$zwangerschap/pariteit_voor_deze_zwangerschap">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900090_20091001000000"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Definitieve a terme datum huidige zwangerschap -->
                <xsl:for-each select="$zwangerschap/definitieve_a_terme_datum">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900928_20141118000000"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Voornemens -->
                <xsl:for-each select="$zwangerschap/voornemens[voorgenomen_plaats_baring_tijdens_zwangerschap_type_locatie]">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901000_20141106000000"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Prenatale controle -->
                <xsl:for-each select="$zwangerschap/prenatale_controle">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901003_20141106000000"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Diagnose(n) deze zwangerschap -->
                <xsl:for-each select="$zwangerschap/diagnose">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901004_20141106000000"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Intra-uteriene behandeling -->
                <xsl:for-each select="$zwangerschap/intrauteriene_behandeling">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901006_20141106000000"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Wijze einde zwangerschap -->
                <xsl:for-each select="$zwangerschap/wijze_einde_zwangerschap">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900876_20130320000000"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!--      Bevalling    -->
                <xsl:for-each select="$bevalling">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900988_20141103235309"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Medisch onderzoek - Maternale onderzoeksgegevens -->
                <xsl:for-each select="$medisch_onderzoek">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900985_20141103113239"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Postnatale fase -->
                <xsl:for-each select="$postnatale_fase">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900983_20141029155150"/>
                    </pertinentInformation3>
                </xsl:for-each>
            </CareProvisionEvent>
        </subject2>
    </xsl:template>
</xsl:stylesheet>
