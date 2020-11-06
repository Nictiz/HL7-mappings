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
    <xsl:import href="../../../peri20_include.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#default"/>
    
    <!-- only give dateT a value if you want conversion of relative T dates -->
    <xsl:param name="dateT" as="xs:date?" select="xs:date('2020-01-01')"/>
    
    <xsl:template name="Kernset23_withInputDoc">
        <xsl:param name="inputFile"/>
        <xsl:call-template name="Kernset23">
            <xsl:with-param name="param_zorgverlening" select="$inputFile//kernset_geboortezorg/zorgverlening"/>
            <xsl:with-param name="param_zorgverlenerzorginstelling" select="$inputFile//kernset_geboortezorg/zorgverlenerzorginstelling"/>
            <xsl:with-param name="param_vrouw" select="$inputFile//kernset_geboortezorg/vrouw"/>
            <xsl:with-param name="param_obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap" select="$inputFile//kernset_geboortezorg/obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap"/>
            <xsl:with-param name="param_zwangerschap" select="$inputFile//kernset_geboortezorg/zwangerschap"/>
            <xsl:with-param name="param_bevalling" select="$inputFile//kernset_geboortezorg/bevalling"/>
            <xsl:with-param name="param_uitkomst_per_kind" select="$inputFile//kernset_geboortezorg/uitkomst_per_kind"/>
            <xsl:with-param name="param_medisch_onderzoek" select="$inputFile//kernset_geboortezorg/medisch_onderzoek"/>
            <xsl:with-param name="param_postnatale_fase" select="$inputFile//kernset_geboortezorg/postnatale_fase"/>
        </xsl:call-template>
    </xsl:template>

    <!-- This may be used if conversion is used for only payload. 
        Commented out as there is also a rule for '/' in the wrappers xsl -->
<!--    <xsl:template match="/">
        <xsl:call-template name="Kernset23">
            <xsl:with-param name="param_zorgverlening" select="//kernset_geboortezorg/zorgverlening"/>
            <xsl:with-param name="param_zorgverlenerzorginstelling" select="//kernset_geboortezorg/zorgverlenerzorginstelling"/>
            <xsl:with-param name="param_vrouw" select="//kernset_geboortezorg/vrouw"/>
            <xsl:with-param name="param_obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap" select="//kernset_geboortezorg/obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap"/>
            <xsl:with-param name="param_zwangerschap" select="//kernset_geboortezorg/zwangerschap"/>
            <xsl:with-param name="param_bevalling" select="//kernset_geboortezorg/bevalling"/>
            <xsl:with-param name="param_uitkomst_per_kind" select="//kernset_geboortezorg/uitkomst_per_kind"/>
            <xsl:with-param name="param_medisch_onderzoek" select="//kernset_geboortezorg/medisch_onderzoek"/>
            <xsl:with-param name="param_postnatale_fase" select="//kernset_geboortezorg/postnatale_fase"/>
        </xsl:call-template>
    </xsl:template>-->

    <xsl:template name="Kernset23">
        <xsl:param name="param_zorgverlening"/>
        <xsl:param name="param_zorgverlenerzorginstelling"/>
        <xsl:param name="param_vrouw"/>
        <xsl:param name="param_obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap"/>
        <xsl:param name="param_zwangerschap"/>
        <xsl:param name="param_bevalling"/>
        <xsl:param name="param_uitkomst_per_kind"/>
        <xsl:param name="param_medisch_onderzoek"/>
        <xsl:param name="param_postnatale_fase"/>
        <subject2 typeCode="SUBJ" contextConductionInd="false">
            <CareProvisionEvent classCode="PCPR" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.6.10.90.76"/>
                <!-- this ID must be filled by a proper id from the application -->
                <!-- no corresponding dataset item though.... -->
                <id root="{$param_zwangerschap/dossiernummer/@root}" extension="{$param_zwangerschap/dossiernummer/@value}"/>
                <effectiveTime>
                    <xsl:for-each select="$param_zorgverlening/datum_start_zorgverantwoordelijkheid">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900115_20120902000000"/>
                    </xsl:for-each>
                    <xsl:for-each select="$param_zorgverlening/datum_einde_zorgverantwoordelijkheid">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900024_20120902000000"/>
                    </xsl:for-each>
                </effectiveTime>
                <!-- Vrouw -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900872_20161216103854">
                    <xsl:with-param name="vrouw" select="$param_vrouw"/>
                    <xsl:with-param name="zwangerschap" select="$param_zwangerschap"/>
                </xsl:call-template>
                <xsl:for-each select="$param_zorgverlenerzorginstelling/zorginstelling">
                    <verifier typeCode="LA">
                        <assignedPerson classCode="ASSIGNED">
                            <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901018_20141107145228"/>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900610_20091001000000"/>
                            </representedOrganization>
                        </assignedPerson>
                    </verifier>
                </xsl:for-each>
                <!-- Eindverantwoordelijk in periode -->
                <xsl:for-each select="$param_zorgverlening/eindverantwoordelijk_in_welke_perinatale_periodeq[@value]">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900118_20161206113252"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Conclusie risicostatus na intake -->
                <xsl:for-each select="$param_zorgverlening/conclusie_risicostatus_na_intake">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <!-- Template :: Conclusie risicostatus na intake -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900938_20161206113444"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- verwijsdetails -->
                <xsl:for-each select="$param_zorgverlening/verwijsdetails">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901098_20180221154619"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Anamnese -->
                <xsl:for-each select="$param_vrouw/anamnese">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900963_20161205180216"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Lengte -->
                <xsl:for-each select="$param_vrouw/lengte_gemeten">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900570_20161205183214"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!--Type vrouwelijke genitale verminking-->
                <xsl:for-each select="$param_vrouw[vrouwelijke_genitale_verminkingq]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900964_20161205183736"/>
                </xsl:for-each>
                <!-- Voorgaande zwangerschappen, obstetrische anamnese
                     de pertinentInformation3 kan herhaald worden per voorgaande zwangerschap  -->
                <xsl:for-each select="$param_obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901095_20180221112313"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!--   Huidige zwangerschap    -->
                <!-- Item: 20010 - Graviditeit -->
                <xsl:for-each select="$param_zwangerschap/graviditeit">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900004_20161206105610"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Item: 20150 - Pariteit -->
                <xsl:for-each select="$param_zwangerschap/pariteit_voor_deze_zwangerschap">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900090_20161206105825"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Definitieve a terme datum huidige zwangerschap -->
                <xsl:for-each select="$param_zwangerschap/definitieve_a_terme_datum">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900928_20161206110006"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Voornemens -->
                <xsl:for-each select="$param_zwangerschap/voornemens[voorgenomen_plaats_baring_tijdens_zwangerschap_type_locatie]">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901000_20161206110206"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Prenatale controle -->
                <xsl:for-each select="$param_zwangerschap/prenatale_controle">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901003_20161206110335"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Diagnose(n) deze zwangerschap -->
                <xsl:for-each select="$param_zwangerschap/diagnose">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901092_20180220162421"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Intra-uteriene behandeling -->
                <xsl:for-each select="$param_zwangerschap/intrauteriene_behandeling">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901006_20161206110631"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Wijze einde zwangerschap -->
                <xsl:for-each select="$param_zwangerschap/wijze_einde_zwangerschap">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900876_20161206094326"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!--  Bevalling -->
                <xsl:for-each select="$param_bevalling">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901101_20180226150516"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Medisch onderzoek - Maternale onderzoeksgegevens -->
                <xsl:for-each select="$param_medisch_onderzoek">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900985_20161206111047"/>
                    </pertinentInformation3>
                </xsl:for-each>
                <!-- Postnatale fase -->
                <xsl:for-each select="$param_postnatale_fase[diagnoseinterventie_postpartum | diagnoseinterventie_postnataal]">
                    <pertinentInformation3 typeCode="PERT" contextConductionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900983_20161202180940"/>
                    </pertinentInformation3>
                </xsl:for-each>
            </CareProvisionEvent>
        </subject2>
    </xsl:template>
</xsl:stylesheet>
