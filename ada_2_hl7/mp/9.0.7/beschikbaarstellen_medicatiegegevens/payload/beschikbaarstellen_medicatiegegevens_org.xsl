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
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#default"/>
    <xsl:include href="../../../2_hl7_mp_include.xsl"/>
    <!-- phase="#ALL" achteraan de volgende regel zorgt dat oXygen niet met een phase chooser dialoog komt elke keer dat je de HL7 XML opent -->
   <xsl:template match="/">
       <xsl:processing-instruction name="xml-model">href="file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schematron_closed_warnings/mp-MP90_mg.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>
       <xsl:choose>
            <xsl:when test="count(//beschikbaarstellen_medicatiegegevens) gt 1">
                <batch xmlns="">
                    <xsl:for-each select="//beschikbaarstellen_medicatiegegevens">
                        <xsl:call-template name="Medicatiegegevens_90">
                            <xsl:with-param name="patient" select="./patient"/>
                            <xsl:with-param name="mbh" select="./medicamenteuze_behandeling"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </batch>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="Medicatiegegevens_907">
                    <xsl:with-param name="patient" select="//beschikbaarstellen_medicatiegegevens/patient"/>
                    <xsl:with-param name="mbh" select="//beschikbaarstellen_medicatiegegevens/medicamenteuze_behandeling"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="Medicatiegegevens_907">
        <xsl:param name="patient" as="element()?"/>
        <xsl:param name="mbh" as="element()*"/>

   
        <organizer xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication" xsi:schemaLocation="urn:hl7-org:v3 file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schemas/organizer.xsd" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9239"/>
            <code code="102" displayName="Medicatiegegevens" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.4" codeSystemName="ART DECOR transacties"/>
            <statusCode nullFlavor="NI"/>
            <!-- Patient -->
            <xsl:for-each select="$patient">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3_20170602000000">
                    <xsl:with-param name="patient" select="."/>
                </xsl:call-template>
            </xsl:for-each>

            <xsl:for-each select="$mbh">
                <!-- Medicatieafspraak -->
                <xsl:for-each select="./medicatieafspraak">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9235_20181204143321">
                            <xsl:with-param name="ma" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- Verstrekkingsverzoek -->
                <xsl:for-each select="./verstrekkingsverzoek">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9257_20181206151013">
                            <xsl:with-param name="vv" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- Toedieningsafspraak -->
                <xsl:for-each select="./toedieningsafspraak">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9259_20181206160523">
                            <xsl:with-param name="ta" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- Verstrekking -->
                <xsl:for-each select="./verstrekking">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9255_20181206145856">
                            <xsl:with-param name="vs" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- Medicatiegebruik -->
                <xsl:for-each select="./medicatie_gebruik">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9246_20181205101627">
                            <xsl:with-param name="gb" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
            </xsl:for-each>
        </organizer>
    </xsl:template>

</xsl:stylesheet>
