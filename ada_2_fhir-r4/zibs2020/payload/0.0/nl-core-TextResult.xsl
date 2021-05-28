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
        <xd:desc>Unwrap tekst_uitslag_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="tekst_uitslag_registratie">
        <xsl:apply-templates select="tekst_uitslag" mode="nl-core-TextResult"/>
    </xsl:template>
    
    <xsl:template match="tekst_uitslag" name="nl-core-TextResult" mode="nl-core-TextResult">
        <DiagnosticReport>
            <id value="nl-core-TextResult-01"/>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-TextResult"/>
            </meta>
            <xsl:for-each select="tekst_uitslag_status">
                <status>
                    <xsl:call-template name="code-to-code">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                </status>
            </xsl:for-each>
            <xsl:for-each select="tekst_uitslag_type">
                <code>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </code>
            </xsl:for-each>
            <xsl:for-each select="tekst_uitslag_datum_tijd">
                <effectiveDateTime>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2FHIRDate">
                            <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </effectiveDateTime>
            </xsl:for-each>
            <xsl:for-each select="visueel_resultaat">
                <media>
                    <link>
                        <reference value="Media/nl-core-TextResult-Media-01"/>
                        <display value="Visual examination results"/>
                        <!--<xsl:call-template name="nl-core-TextResult-Media-Reference"/>-->
                    </link>
                </media>
            </xsl:for-each>
            <xsl:for-each select="tekst_resultaat">
                <conclusion value="{@value}"/>
            </xsl:for-each>
        </DiagnosticReport>
    </xsl:template>
    
</xsl:stylesheet>
