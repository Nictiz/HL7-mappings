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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:import href="../../../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada hartfrequentie to FHIR Observation conforming to profile http://nictiz.nl/fhir/StructureDefinition/nl-core-HeartRate</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Unwrap hartfrequentie_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="hartfrequentie_registratie">
        <xsl:apply-templates select="hartfrequentie" mode="nl-core-HeartRate"/>
    </xsl:template>
    
    <xsl:template match="hartfrequentie" name="nl-core-HeartRate" mode="nl-core-HeartRate">
        <Observation>
            <id value="nl-core-HeartRate-01"/>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-HeartRate"/>
            </meta>
            <status value="final"/>
            <category>
                <coding>
                    <system value="http://terminology.hl7.org/CodeSystem/observation-category"/>
                    <code value="vital-signs"/>
                    <display value="Vital Signs"/>
                </coding>
            </category>
            <code>
                <coding>
                    <system value="http://loinc.org"/>
                    <code value="8867-4"/>
                    <display value="Heart rate"/>
                </coding>
            </code>
            <xsl:for-each select="hartfrequentie_datum_tijd">
                <effectiveDateTime>
                    <xsl:call-template name="date-to-datetime">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </effectiveDateTime>
            </xsl:for-each>
            <xsl:for-each select="hartfrequentie_waarde">
                <valueQuantity>
                    <xsl:call-template name="hoeveelheid-to-Quantity">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueQuantity>
            </xsl:for-each>
            <xsl:for-each select="toelichting">
                <note>
                    <text>
                        <xsl:call-template name="string-to-string">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </text>
                </note>
            </xsl:for-each>
            <xsl:for-each select="hartslag_meet_methode">
                <method>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </method>
            </xsl:for-each>
            <xsl:for-each select="hartslag_regelmatigheid">
                <component>
                    <code>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="301112006"/>
                            <display value="Finding of heart rhythm"/>
                        </coding>
                    </code>
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCodeableConcept>
                </component>
            </xsl:for-each>
            <xsl:for-each select="interpretatie_frequentie">
                <component>
                    <code>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="301113001"/>
                            <display value="Finding of heart rate"/>
                        </coding>
                    </code>
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCodeableConcept>
                </component>
            </xsl:for-each>
        </Observation>
    </xsl:template>
</xsl:stylesheet>