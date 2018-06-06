<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:pharm="urn:ihe:pharm:medication" xmlns:nf="http://www.nictiz.nl/functions"  xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- Generates a HL7 message based on ADA input -->
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
    <!--<xsl:include href="../../../hl7/hl7_include.xsl"/>-->
    <xsl:include href="../../mp_include.xsl"/>
    <!--   <xsl:include href="../../../zib1bbr/zib1bbr_include.xsl"/>
    <xsl:include href="../../../naw/naw_include.xsl"/> -->
    <xsl:template match="/">
        <xsl:call-template name="Voorschrift_90">
            <xsl:with-param name="patient" select="//sturen_medicatievoorschrift/patient"/>
            <xsl:with-param name="mbh" select="//sturen_medicatievoorschrift/medicamenteuze_behandeling"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="Voorschrift_90">
        <xsl:param name="patient"/>
        <xsl:param name="mbh"/>

        <!-- phase="#ALL" achteraan de volgende regel zorgt dat oXygen niet met een phase chooser dialoog komt elke keer dat je de HL7 XML opent -->
        <xsl:processing-instruction name="xml-model">href="file:/C:/SVN/art_decor/branches/mp-qual-20180116T175225/schematron_closed_warnings/mp-MP90_vo.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>
        <xsl:comment>Generated from ada instance with title: "<xsl:value-of select="$mbh/../@title"/>" and id: "<xsl:value-of select="$mbh/../@id"/>".</xsl:comment>
        <organizer xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication" xsi:schemaLocation="urn:hl7-org:v3 file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schemas/organizer.xsd" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9126"/>
            <code code="95" displayName="Voorschrift" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.4" codeSystemName="ART DECOR transacties"/>
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
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9148_20160725130413">
                            <xsl:with-param name="ma" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- Verstrekkingsverzoek -->
                <xsl:for-each select="./verstrekkingsverzoek">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9087_20160621125157">
                            <xsl:with-param name="vv" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
            </xsl:for-each>
        </organizer>
        <xsl:comment>Input ada xml below</xsl:comment>
        <xsl:call-template name="copyElementInComment">
            <xsl:with-param name="element" select="$mbh/.."/>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
