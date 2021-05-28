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
        <xd:desc>Unwrap soepverslag_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="soepverslag_registratie">
        <xsl:apply-templates select="soepverslag" mode="nl-core-SOAPReport"/>
    </xsl:template>
    
    <xsl:template match="soepverslag" name="nl-core-SOAPReport" mode="nl-core-SOAPReport">
        <Composition>
            <id value="nl-core-SOAPReport-01"/>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-SOAPReport"/>
            </meta>
            <status value="final"/>
            <type>
                <coding>
                    <system value="http://loinc.org" />
                    <code value="67781-5" />
                    <display value="Summarization of encounter note Narrative"/>
                </coding>
            </type>
            <xsl:for-each select="soepverslag_datum_tijd">
                <date>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2FHIRDate">
                            <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </date>
            </xsl:for-each>
            <xsl:for-each select="auteur">
                <author>
                    <reference value="PractitionerRole/nl-core-PractitionerRole-xx"/>
                    <display value="Huisarts H.A. Janszens"/>
                    <!--<xsl:for-each select="zorgverlener">
                            <xsl:call-template name="nl-core-HealthProfessional-PractitionerRole-Reference"/>
                        </xsl:for-each>-->
                    <!--This must be dynamic in the future-->
                </author>
            </xsl:for-each>
            <title value="Example nl-core-SOAPReport"/>
            <xsl:for-each select="soepregel">
                <section>
                    <xsl:for-each select="soepregel_code">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-SOAPReport.SOAPLineCode">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </xsl:for-each>
                    <xsl:for-each select="soepregel_naam">
                        <code>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </code>
                    </xsl:for-each>
                    <entry>
                        <xsl:variable name="display">
                            <xsl:variable name="regel" select="substring(soepregel_naam/@displayName, 1, 1)"/>
                            <xsl:choose>
                                <xsl:when test="$regel = 'B'">P</xsl:when>
                                <xsl:otherwise><xsl:value-of select="$regel"/></xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <reference value="Observation/nl-core-SOAPReport-Observation-0{position()}"/>
                        <display value="{$display}-regel"/>
                        <!--<xsl:call-template name="nl-core-SOAPReport-Observation-Reference"/>-->
                    </entry>
                </section>
            </xsl:for-each>
        </Composition>
    </xsl:template>

</xsl:stylesheet>
