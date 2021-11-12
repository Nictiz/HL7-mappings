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
<xsl:stylesheet exclude-result-prefixes="#default xs nf xd xsl" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3"  xmlns:sdtc="urn:hl7-org:sdtc" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../2_hl7_mp_include_91.xsl"/>
    <xsl:output method="xml" indent="yes" />
    <xsl:param name="schematron-ref" as="xs:boolean" select="true()"/>
    <!--    <xsl:param name="schematronBaseDir">file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/</xsl:param>-->
    <xsl:param name="schematronBaseDir">../</xsl:param>
    
    <xsl:template match="/">
        <xsl:call-template name="AfhandelenVoorschrift_90">
            <xsl:with-param name="patient" select="//sturen_afhandeling_medicatievoorschrift/patient"/>
            <xsl:with-param name="mbh" select="//sturen_afhandeling_medicatievoorschrift/medicamenteuze_behandeling"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="AfhandelenVoorschrift_90">
        <xsl:param name="patient"/>
        <xsl:param name="mbh"/>
        
         <xsl:if test="$schematron-ref">
            <xsl:processing-instruction name="nictiz">status="example"</xsl:processing-instruction>
            <xsl:processing-instruction name="xml-model">phase="#ALL" href="<xsl:value-of select="$schematronBaseDir"/>schematron_closed_warnings/mp-MP9_av.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>
        </xsl:if>
        
        <organizer xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication" xsi:schemaLocation="urn:hl7-org:v3 file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schemas/organizer.xsd" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9295"/>
            <code code="131" displayName="Afhandeling voorschrift" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.4" codeSystemName="ART DECOR transacties"/>
            <statusCode nullFlavor="NI"/>
            <!-- Patient -->
            <xsl:for-each select="$patient">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1_20180611000000"/>
            </xsl:for-each>
            
            <xsl:for-each select="$mbh">
                <!-- Toedieningsafspraak -->
                <xsl:for-each select="toedieningsafspraak">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9299_20191125140232"/>                          
                    </component>
                </xsl:for-each>
                <!-- Verstrekking -->
                <xsl:for-each select="verstrekking">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9294_20191121175237"/>
                    </component>
                </xsl:for-each>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    
</xsl:stylesheet>
