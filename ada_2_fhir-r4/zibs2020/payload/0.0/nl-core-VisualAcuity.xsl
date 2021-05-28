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

<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions" 
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <!-- Can be uncommented for debug purposes. Please comment before committing! -->
    <xsl:import href="../../../fhir/2_fhir_fhir_include.xsl"/>
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada [...] to FHIR [...] conforming to profile [...]</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Unwrap visus_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="visus_registratie">
        <xsl:apply-templates select="visus" mode="nl-core-VisualAcuity"/>
    </xsl:template>
    
    <xsl:template match="visus" name="nl-core-VisualAcuity" mode="nl-core-VisualAcuity">
        <Observation>
            <id value="nl-core-VisualAcuity-01"/>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-VisualAcuity"/>
            </meta>
            <xsl:for-each select="visus_meet_hulpmiddel">
                <extension url="http://hl7.org/fhir/StructureDefinition/observation-deviceCode">
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCodeableConcept>
                </extension>
            </xsl:for-each>
            <status value="final"/>
            <code>
                <coding>
                    <system value="http://snomed.info/sct"/>
                    <code value="16830007"/>
                    <display value="onderzoek van visus"/>
                </coding>
            </code>
            <xsl:for-each select="visus_datum_tijd">
                <effectiveDateTime>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2FHIRDate">
                            <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </effectiveDateTime>
            </xsl:for-each>
            <xsl:for-each select="decimale_visus_waarde">
                <valueQuantity>
                    <value value="{@value}"/>
                    <unit value="decimal"/>
                    <system value="http://unitsofmeasure.org"/>
                    <code value="{nf:convert_ADA_unit2UCUM_FHIR('decimal')}"/>
                </valueQuantity>
            </xsl:for-each>
            <xsl:for-each select="anatomische_locatie[lateraliteit]">
                <bodySite>
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-AnatomicalLocation.Laterality">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="lateraliteit"/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                    
                    <!-- TODO: Should this default to "eye" -->
                    <xsl:if test=".[@value]">
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:if>
                </bodySite>
            </xsl:for-each>
            <xsl:for-each select="visus_meting_type">
                <component>
                    <code>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="TODO-ZIB-1445"/>
                        </coding>
                    </code>
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCodeableConcept>
                </component>
            </xsl:for-each>
            <xsl:for-each select="visus_meting_kaart">
                <component>
                    <code>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="363691001"/>
                        </coding>
                    </code>
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCodeableConcept>
                </component>
            </xsl:for-each>
            <xsl:for-each select="afstand_tot_kaart">
                <component>
                    <code>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="TODO-ZIB-1441"/>
                        </coding>
                    </code>
                    <valueQuantity>
                        <value value="{@value}"/>
                        <unit value="m"/>
                        <system value="http://unitsofmeasure.org"/>
                        <code value="{nf:convert_ADA_unit2UCUM_FHIR('m')}"/>
                    </valueQuantity>
                </component>
            </xsl:for-each>
        </Observation>
    </xsl:template>
    
</xsl:stylesheet>
