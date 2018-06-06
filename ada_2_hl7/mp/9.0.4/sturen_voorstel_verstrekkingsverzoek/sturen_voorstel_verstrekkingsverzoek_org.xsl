<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#default"/>
    <!--<xsl:include href="../../../hl7/hl7_include.xsl"/>-->
    <xsl:include href="../mp_include.xsl"/>
    <xsl:include href="../../../zib1bbr/zib1bbr_include.xsl"/>
    <xsl:include href="../../../naw/naw_include.xsl"/>
    <xsl:template match="/">
        <xsl:call-template name="VoorstelVerstrekkingsverzoek_90">
            <xsl:with-param name="patient" select="//sturen_voorstel_verstrekkingsverzoek/patient"/>
            <xsl:with-param name="mbh" select="//sturen_voorstel_verstrekkingsverzoek/medicamenteuze_behandeling"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="VoorstelVerstrekkingsverzoek_90">
        <xsl:param name="patient"/>
        <xsl:param name="mbh"/>
        
        <!-- phase="#ALL" achteraan de volgende regel zorgt dat oXygen niet met een phase chooser dialoog komt elke keer dat je de HL7 XML opent --> 
        <xsl:processing-instruction name="xml-model">href="file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schematron_closed_warnings/mp-MP90_vvv.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>

        <organizer xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication" xsi:schemaLocation="urn:hl7-org:v3 file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schemas/organizer.xsd" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9130"/>
            <code code="104" displayName="Voorstel verstrekkingsverzoek" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.4" codeSystemName="ART DECOR transacties"/>
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
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9185_20170818000000">
                            <xsl:with-param name="ma" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- Voorstel Verstrekkingsverzoek -->
                <xsl:for-each select="./verstrekkingsverzoek">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9131_20160714202241"> 
                            <xsl:with-param name="vvv" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
            </xsl:for-each>
        </organizer>
    </xsl:template>
        
</xsl:stylesheet>
