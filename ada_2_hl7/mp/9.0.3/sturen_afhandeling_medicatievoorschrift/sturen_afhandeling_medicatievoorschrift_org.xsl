<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#default"/>
    <!--<xsl:include href="../../../hl7/hl7_include.xsl"/>-->
    <xsl:include href="../mp_include.xsl"/>
    <xsl:include href="../../../zib1bbr/zib1bbr_include.xsl"/>
    <xsl:include href="../../../naw/naw_include.xsl"/>
    <xsl:template match="/">
        <xsl:call-template name="AfhandelenVoorschrift_90">
            <xsl:with-param name="patient" select="//sturen_afhandeling_medicatievoorschrift/patient"/>
            <xsl:with-param name="mbh" select="//sturen_afhandeling_medicatievoorschrift/medicamenteuze_behandeling"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="AfhandelenVoorschrift_90">
        <xsl:param name="patient"/>
        <xsl:param name="mbh"/>
        
        <xsl:processing-instruction name="xml-model">href="file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schematron_closed_warnings/mp-MP90_av.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>

        <organizer xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication" xsi:schemaLocation="urn:hl7-org:v3 file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schemas/organizer.xsd" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9124"/>
            <code code="131" displayName="Afhandeling voorschrift" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.4" codeSystemName="ART DECOR transacties"/>
            <statusCode nullFlavor="NI"/>
            <!-- Patient -->
            <xsl:for-each select="$patient">
                <xsl:call-template
                    name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9119_20160710204856">
                    <xsl:with-param name="patient" select="."/>
                </xsl:call-template>
                <!-- Vanaf volgende publicatie het ZIB template gaan gebruiken: -->
                <!--<xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3_20170602000000">
                    <xsl:with-param name="patient" select="."/>
                </xsl:call-template>-->
            </xsl:for-each>
            
            <xsl:for-each select="$mbh">
                <!-- Toedieningsafspraak -->
                <xsl:for-each select="./toedieningsafspraak">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9152_20160726163318">
                            <xsl:with-param name="ta" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- Verstrekking -->
                <xsl:for-each select="./verstrekking">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9094_20160623194106">
                            <xsl:with-param name="vs" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
            </xsl:for-each>
        </organizer>
    </xsl:template>
    
</xsl:stylesheet>
