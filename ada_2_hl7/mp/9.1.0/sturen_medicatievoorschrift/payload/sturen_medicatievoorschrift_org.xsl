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
<xsl:stylesheet exclude-result-prefixes="#default" xmlns:sdtc="urn:hl7-org:sdtc"  xmlns:pharm="urn:ihe:pharm:medication" xmlns:nf="http://www.nictiz.nl/functions" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../2_hl7_mp_include.xsl"/>
    <!-- Generates a HL7 message based on ADA input -->
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
    <!-- only give dateT a value if you want conversion of relative T dates -->
    <!--    <xsl:param name="dateT" as="xs:date?" select="current-date()"/>-->
    <xsl:param name="schematron-ref" as="xs:boolean" select="true()"/>
    
    <xsl:template match="/">
        <xsl:call-template name="Voorschrift_90">
            <xsl:with-param name="in" select="//sturen_medicatievoorschrift"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="Voorschrift_90">
        <xsl:param name="in" select="//sturen_medicatievoorschrift"/>
        
        <xsl:variable name="patient" select="$in/patient"/>
        <xsl:variable name="mbh" select="$in/medicamenteuze_behandeling"/>

        <xsl:if test="$schematron-ref">
            <xsl:processing-instruction name="nictiz">status="example"</xsl:processing-instruction>
            <!--            <xsl:processing-instruction name="xml-model">phase="#ALL" href="../../schematron_closed_warnings/mp-MP90_vo.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>-->
            <xsl:processing-instruction name="xml-model">phase="#ALL" href="file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schematron_closed_warnings/mp-MP90_vo.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>
        </xsl:if>
        <xsl:comment>Generated from ada instance with title: "<xsl:value-of select="$mbh/../@title"/>" and id: "<xsl:value-of select="$mbh/../@id"/>".</xsl:comment>
        <organizer xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication" xsi:schemaLocation="urn:hl7-org:v3 file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schemas/organizer.xsd" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9272"/>
            <code code="95" displayName="Voorschrift" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.4" codeSystemName="ART DECOR transacties"/>
            <statusCode nullFlavor="NI"/>
            <!-- Patient -->
            <xsl:for-each select="$patient">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3_20170602000000">
                    <xsl:with-param name="patient" select="."/>
                </xsl:call-template>
            </xsl:for-each>
            <!-- Medicamenteuze behandeling -->
            <xsl:for-each select="$mbh">
                <!-- Medicatieafspraak -->
                <xsl:for-each select="medicatieafspraak[not(kopie_indicator/@value = 'true')]">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9275_20191121115247">
                            <xsl:with-param name="ma" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- Medicatieafspraak -->
                <xsl:for-each select="medicatieafspraak[kopie_indicator/@value = 'true']">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9277_20191121123918">
                            <xsl:with-param name="ma" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- Verstrekkingsverzoek -->
                <xsl:for-each select="verstrekkingsverzoek">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9301_20191125141436">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>                
             </xsl:for-each>
            <!-- Lichaamslengte -->
            <xsl:for-each select="$in/lichaamslengte[.//(@value | @code)]">
                <component typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.30_20171025000000"/>
                </component>
            </xsl:for-each>               
            <!-- Lichaamsgewicht -->
            <xsl:for-each select="$in/lichaamsgewicht[.//(@value | @code)]">
                <component typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.28_20171025000000"/>
                </component>
            </xsl:for-each>
            <!-- Laboratoriumuitslag -->
            <xsl:for-each select="$in/laboratorium_uitslag[.//(@value | @code)]">
                <component typeCode="COMP">
                    <xsl:call-template name="hl7-LaboratoryObservation-20171205"/>
                </component>
            </xsl:for-each>
            
        </organizer>
    </xsl:template>
</xsl:stylesheet>
