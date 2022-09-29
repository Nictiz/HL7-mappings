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
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="language" as="xs:string?">nl-NL</xsl:param>
 
    <xd:doc>
        <xd:desc>Mapping of comment concept in zib/ADA to HL7 CDA template 2.16.840.1.113883.2.4.3.11.60.3.10.0.32.</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc> 
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000" match="toelichting | comment" mode="HandleComment">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <act classCode="ACT" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.0.32"/>
                <code code="48767-8" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="Annotation comment"/>
                <text mediaType="text/plain">
                    <xsl:value-of select="@value"/>
                </text>
            </act>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
