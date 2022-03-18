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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" exclude-result-prefixes="#all" version="2.0">

    <xsl:variable name="ext-TimeInterval-Period">http://nictiz.nl/fhir/StructureDefinition/ext-TimeInterval-Period</xsl:variable>

    <xd:doc>
        <xd:desc>Template to resolve f:extension zib-Medication-PeriodOfUse</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url = $ext-TimeInterval-Period]" mode="ext-TimeInterval-Period">
        <xsl:apply-templates select="f:valuePeriod" mode="ext-TimeInterval-Period"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to resolve f:valuePeriod</xd:desc>
    </xd:doc>
    <xsl:template match="f:valuePeriod" mode="ext-TimeInterval-Period">
        <xsl:apply-templates select="f:start" mode="#current"/>
        <xsl:apply-templates select="f:end" mode="#current"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:start to gebruiksperiode_start</xd:desc>
    </xd:doc>
    <xsl:template match="f:start" mode="ext-TimeInterval-Period">
        <xsl:call-template name="datetime-to-datetime">
            <xsl:with-param name="adaElementName">start_datum_tijd</xsl:with-param>
            <xsl:with-param name="adaDatatype">datetime</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:end to gebruiksperiode_eind</xd:desc>
    </xd:doc>
    <xsl:template match="f:end" mode="ext-TimeInterval-Period">
        <xsl:call-template name="datetime-to-datetime">
            <xsl:with-param name="adaElementName">eind_datum_tijd</xsl:with-param>
            <xsl:with-param name="adaDatatype">datetime</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
