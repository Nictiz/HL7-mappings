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


    <xd:doc>
        <xd:desc>Template to resolve f:modifierExtension ext-Medication-stop-type.</xd:desc>
    </xd:doc>
    <xsl:template match="f:modifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-StopType']" mode="nl-core-ext-StopType">
        <xsl:apply-templates select="f:valueCodeableConcept" mode="#current"/>
    </xsl:template>
 
    
    <xd:doc>
        <xd:desc>Template to convert f:valueCodeableConcept to stoptype.</xd:desc>
    </xd:doc>
    <xsl:template match="f:valueCodeableConcept" mode="nl-core-ext-StopType">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName">
                <xsl:choose>
                    <xsl:when test="../parent::f:MedicationStatement">
                        <xsl:value-of select="'medicatie_gebruik_stop_type'"/>
                    </xsl:when>
                    <xsl:when test="../parent::f:MedicationRequest[f:meta/f:profile/@value eq 'http://nictiz.nl/fhir/StructureDefinition/nl-core-VariableDosingRegimen']">
                        <xsl:value-of select="'wisselend_doseerschema_stop_type'"/>
                    </xsl:when>
                    <xsl:when test="../parent::f:MedicationRequest[f:meta/f:profile/@value eq 'http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicationAgreement']">
                        <xsl:value-of select="'medicatieafspraak_stop_type'"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>