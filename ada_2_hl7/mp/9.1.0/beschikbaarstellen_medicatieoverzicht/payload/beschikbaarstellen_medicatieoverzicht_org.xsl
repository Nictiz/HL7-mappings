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
<xsl:stylesheet exclude-result-prefixes="nf xd xs xsl" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nf="http://www.nictiz.nl/functions" version="2.0">
    <xsl:import href="../../../2_hl7_mp_include.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:param name="dateT" as="xs:date?" select="current-date()"/>
    <xsl:param name="schematron-ref" as="xs:boolean" select="true()"/>
    <!--    <xsl:param name="schematronBaseDir">file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/</xsl:param>-->
    <xsl:param name="schematronBaseDir">../</xsl:param>

    <xsl:template match="/">
        <xsl:call-template name="Medicatieoverzicht_90">
            <xsl:with-param name="patient" select="//beschikbaarstellen_medicatieoverzicht/patient"/>
            <xsl:with-param name="mbh" select="//beschikbaarstellen_medicatieoverzicht/medicamenteuze_behandeling"/>
            <xsl:with-param name="docGeg" select="//beschikbaarstellen_medicatieoverzicht/documentgegevens"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="Medicatieoverzicht_90">
        <xsl:param name="patient"/>
        <xsl:param name="mbh"/>
        <xsl:param name="docGeg"/>

        <xsl:if test="$schematron-ref">
            <xsl:processing-instruction name="nictiz">status="example"</xsl:processing-instruction>
            <xsl:processing-instruction name="xml-model">phase="#ALL" href="<xsl:value-of select="$schematronBaseDir"/>schematron_closed_warnings/mp-MP90_mo.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>
        </xsl:if>

        <organizer xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication" xsi:schemaLocation="urn:hl7-org:v3 file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schemas/organizer.xsd" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9286"/>
            <code code="129" displayName="Medicatieoverzicht" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.4" codeSystemName="ART DECOR transacties"/>
            <statusCode nullFlavor="NI"/>

            <!-- Documentdatum -->
            <xsl:call-template name="makeEffectiveTime">
                <xsl:with-param name="effectiveTime" select="$docGeg/document_datum"/>
            </xsl:call-template>

            <!-- Patient -->
            <xsl:for-each select="$patient">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1_20180611000000"/>
            </xsl:for-each>

            <!-- Auteur (=samenstellende organisatie (of patient) van hele overzicht) -->
            <xsl:for-each select="$docGeg/auteur">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9171_20180111143827">
                    <xsl:with-param name="auteur" select="."/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- Verificatie patient -->
            <xsl:for-each select="$docGeg/verificatie_patient">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9179_20170523115538"/>
            </xsl:for-each>

            <!-- Verificatie zorgverlener -->
            <xsl:for-each select="$docGeg/verificatie_zorgverlener">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9180_20170523115753"/>
            </xsl:for-each>

            <xsl:for-each select="$mbh">
                <!-- eigen Medicatieafspraak -->
                <xsl:for-each select="./medicatieafspraak[not(kopie_indicator/@value = 'true')]">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9275_20191121115247"/>
                    </component>
                </xsl:for-each>
                <!-- andermans Medicatieafspraak -->
                <xsl:for-each select="./medicatieafspraak[kopie_indicator/@value = 'true']">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9277_20191121123918"/>
                    </component>
                </xsl:for-each>
                <!-- eigen Toedieningsafspraak -->
                <xsl:for-each select="toedieningsafspraak[not(kopie_indicator/@value = 'true')]">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9299_20191125140232">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- andermans Toedieningsafspraak -->
                <xsl:for-each select="./toedieningsafspraak[kopie_indicator/@value = 'true']">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9303_20191125142708">
                            <xsl:with-param name="ta" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- eigen Medicatiegebruik -->
                <xsl:for-each select="./medicatie_gebruik[not(kopie_indicator/@value = 'true')]">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9281_20191121142645">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- andermans Medicatiegebruik -->
                <xsl:for-each select="./medicatie_gebruik[kopie_indicator/@value = 'true']">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9287_20191121150123">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>

            </xsl:for-each>
        </organizer>
    </xsl:template>

</xsl:stylesheet>
