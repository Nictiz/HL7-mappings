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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!--    <xsl:import href="../../zib2017bbr/2_hl7_zib2017bbr_include.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="language" as="xs:string?">nl-NL</xsl:param>
 
    <xd:doc>
        <xd:desc>Mapping of zib nl.zorg.Lichaamsgewicht 3.2 concept in ADA to HL7 CDA template 	2.16.840.1.113883.2.4.3.11.60.121.10.19 
                 Created for MP voorschrift, currently only supports fields used in those scenario's</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>    
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.19_20210701000000" match="lichaamsgewicht | body_weight" mode="HandleBodyWeight">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:for-each select="$in">
            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.121.10.19"/>
                <!-- id -->
                <xsl:for-each select="((zibroot | hcimroot)/(identificatienummer | identification_number)| identificatienummer | identification_number)[@value | @nullFlavor | @root]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                <code code="29463-7" codeSystem="{$oidLOINC}" displayName="Body Weight"/>
                <xsl:call-template name="makeEffectiveTime">
                    <xsl:with-param name="effectiveTime" select="gewicht_datum_tijd | weight_date_time"/>
                    <xsl:with-param name="nullIfAbsent" select="true()"/>
                </xsl:call-template>
                <xsl:for-each select="(gewicht_waarde | weight_value)[@value | @nullFlavor]">
                    <xsl:call-template name="makePQValue"/>
                </xsl:for-each>
                <!-- todo clothing -->
                <!-- toelichting, text is mandatory in this template so do not output anything when there is no @value in input -->
                <xsl:for-each select="(toelichting | comment)[@value]">
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                    </entryRelationship>
                </xsl:for-each>
            </observation>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
