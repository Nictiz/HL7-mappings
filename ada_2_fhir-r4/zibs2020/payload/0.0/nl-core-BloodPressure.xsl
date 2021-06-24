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
        <xd:desc>Converts ada bloeddruk to FHIR Procedure conforming to profile http://nictiz.nl/fhir/StructureDefinition/nl-core-BloodPressure</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Unwrap bloeddruk_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="bloeddruk_registratie">
        <xsl:apply-templates select="bloeddruk" mode="nl-core-BloodPressure"/>
    </xsl:template>
    
    <xsl:template match="bloeddruk" name="nl-core-BloodPressure" mode="nl-core-BloodPressure">
        <Observation>
            <id value="nl-core-BloodPressure-01"/>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-BloodPressure"/>
            </meta>
            <xsl:for-each select="houding">
                <extension url="http://hl7.org/fhir/StructureDefinition/observation-bodyPosition">
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCodeableConcept>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="bloeddruk_datum_tijd">
                <effectiveDateTime>
                    <xsl:call-template name="date-to-datetime">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </effectiveDateTime>
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
            <xsl:for-each select="meet_locatie">
                <bodySite>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </bodySite>
            </xsl:for-each>                  
            <xsl:for-each select="systolische_bloeddruk">
                <component>
                    <valueQuantity>
                        <xsl:call-template name="hoeveelheid-to-Quantity">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueQuantity>
                </component>
            </xsl:for-each>
            <xsl:for-each select="manchet_type">
                <component>
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCodeableConcept>
                </component>
            </xsl:for-each>
            <xsl:for-each select="diastolische_bloeddruk">
                <component>
                    <valueQuantity>
                        <xsl:call-template name="hoeveelheid-to-Quantity">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueQuantity>
                </component>
            </xsl:for-each>
        </Observation>
    </xsl:template>
</xsl:stylesheet>