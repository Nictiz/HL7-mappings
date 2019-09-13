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
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../hl7/2_hl7_hl7_include.xsl"/> 
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#default"/>

    
    
    <xd:doc>
        <xd:desc>Zwangerschapsduur bij geboorte</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900200_20120808000000">
        <observation classCode="OBS" moodCode="EVN">
            <code code="412726003" displayName="Length of gestation at birth" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid = $oidSNOMEDCT]/@displayName}"/>
             <!-- moet in dagen -->
            <value xsi:type="PQ" unit="d">
                <xsl:attribute name="value" select="@value"/>
            </value>
        </observation>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> Aantal geboren kinderen </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.900358_20161206130005">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.900358"/>
            <code code="NBorn16" codeSystem="2.16.840.1.113883.2.4.4.13" displayName="Aantal geboren kinderen"/>
            <!-- Item(s) :: aantal_geboren_kinderen-->
            <xsl:call-template name="makeINTValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Type partus 2.3.3 </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901107_20180228162810" match="type_partus" mode="HandleTypePartus">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901107"/>
            <code code="364336006" codeSystem="{$oidSNOMEDCT}" displayName="Type partus"/>
            <!-- Item(s) :: type_partus -->
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>
    
    </xsl:stylesheet>
