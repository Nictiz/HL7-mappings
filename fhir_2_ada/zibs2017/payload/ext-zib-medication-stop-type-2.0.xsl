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
    xmlns:nf="http://www.nictiz.nl/functions" 
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>-->
    
    <xd:doc>
        <xd:desc>Resolves zib-Medication-StopType f:modifierExtension.</xd:desc>
    </xd:doc>
    <xsl:template match="f:modifierExtension[@url ='http://nictiz.nl/fhir/StructureDefinition/zib-Medication-StopType']" mode="ext-zib-Medication-Stop-Type-2.0">
        <xsl:apply-templates select="f:valueCodeableConcept" mode="#current"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Transforms f:valueCodeableConcept to ADA stoptype.</xd:desc>
    </xd:doc>
    <xsl:template match="f:valueCodeableConcept" mode="ext-zib-Medication-Stop-Type-2.0">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'stoptype'"/>
        </xsl:call-template>    
    </xsl:template>
        
</xsl:stylesheet>