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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    xmlns:local="urn:fhir:stu3:functions"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>-->
    
    <xd:doc>
        <xd:desc>Template to resolve extention</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url ='http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse']" mode="ext-zib-Medication-PeriodOfUse-2.0">
        <xsl:apply-templates select="f:valuePeriod" mode="ext-zib-Medication-PeriodOfUse-2.0"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template for http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-PeriodOfUse</xd:desc>
    </xd:doc>
    <xsl:template match="f:valuePeriod" mode="ext-zib-Medication-PeriodOfUse-2.0">
        <xsl:apply-templates select="f:start" mode="#current"/>
        <xsl:apply-templates select="f:end" mode="#current"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template for converting f:start to gebruiksperiode_start</xd:desc>
    </xd:doc>
    <xsl:template match="f:start" mode="ext-zib-Medication-PeriodOfUse-2.0">
        <gebruiksperiode_start>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>               
            </xsl:attribute>
            <xsl:attribute name="datatype">datetime</xsl:attribute>
        </gebruiksperiode_start>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template for converting f:end to gebruiksperiode_eind</xd:desc>
    </xd:doc>
    <xsl:template match="f:end" mode="ext-zib-Medication-PeriodOfUse-2.0">
        <gebruiksperiode_eind>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>                          
            </xsl:attribute>
            <xsl:attribute name="datatype">datetime</xsl:attribute>
        </gebruiksperiode_eind>
    </xsl:template>
    
</xsl:stylesheet>
