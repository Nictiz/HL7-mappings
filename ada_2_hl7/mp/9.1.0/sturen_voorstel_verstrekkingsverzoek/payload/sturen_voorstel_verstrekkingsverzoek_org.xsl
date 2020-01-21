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
<xsl:stylesheet exclude-result-prefixes="nf xd xs xsl" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication"  xmlns:nf="http://www.nictiz.nl/functions"  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../2_hl7_mp_include.xsl"/>
    <xsl:output method="xml" indent="yes" />
    
    <xd:doc>
        <xd:desc>Default template</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:call-template name="VoorstelVerstrekkingsverzoek_91">
            <xsl:with-param name="in" select="//sturen_voorstel_verstrekkingsverzoek"/>
         </xsl:call-template>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Voorstel Verstrekkingsverzoek</xd:desc>
        <xd:param name="in">The input ada transaction</xd:param>
    </xd:doc>
    <xsl:template name="VoorstelVerstrekkingsverzoek_91">
        <xsl:param name="in"/>
        
        <xsl:variable name="patient" select="$in/patient"/>
        <xsl:variable name="theVoorstel" select="$in/voorstelgegevens/voorstel"/>
        <xsl:variable name="mbh" select="$theVoorstel/medicamenteuze_behandeling"/>
        
        <!-- phase="#ALL" achteraan de volgende regel zorgt dat oXygen niet met een phase chooser dialoog komt elke keer dat je de HL7 XML opent --> 
        <xsl:processing-instruction name="xml-model">href="file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schematron_closed_warnings/mp-MP90_vvv.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>

        <organizer xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication" xsi:schemaLocation="urn:hl7-org:v3 file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schemas/organizer.xsd" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9130"/>
            <xsl:for-each select="$theVoorstel/identificatie[@value]">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>            
            <code code="104" displayName="Voorstel verstrekkingsverzoek" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.4" codeSystemName="ART DECOR transacties"/>
            <statusCode nullFlavor="NI"/>
            <!-- Patient -->
            <xsl:for-each select="$patient">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1_20180611000000">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            
            <xsl:for-each select="$mbh">
                <!-- Voorstel Verstrekkingsverzoek -->
                <xsl:for-each select="verstrekkingsverzoek">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9131_20160714202241"> 
                            <xsl:with-param name="vvv" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
            </xsl:for-each>
            
            <!-- Voorstel toelichtig -->
            <xsl:for-each select="$theVoorstel/toelichting">
                <component typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>
        
</xsl:stylesheet>
