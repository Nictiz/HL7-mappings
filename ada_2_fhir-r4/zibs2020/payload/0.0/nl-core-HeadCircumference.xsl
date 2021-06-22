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
    
    <xsl:import href="../../../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada schedelomvang to FHIR Procedure conforming to profile http://nictiz.nl/fhir/StructureDefinition/nl-core-HeadCircumference</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Unwrap schedelomvang_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="schedelomvang_registratie">
        <xsl:apply-templates select="schedelomvang" mode="nl-core-HeadCircumference"/>
    </xsl:template>
    
    <xsl:template match="schedelomvang" name="nl-core-HeadCircumference" mode="nl-core-HeadCircumference">
        <Observation>
           <!-- <xsl:call-template name="insertLogicalId"/>-->
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-HeadCircumference"/>
            </meta>         
            <xsl:for-each select="schedelomvang_datum_tijd">
                <effectiveDateTime>
                    <xsl:call-template name="date-to-datetime">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </effectiveDateTime>
            </xsl:for-each>
            <xsl:for-each select="schedelomvang_waarde">
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
            <xsl:for-each select="schedelomvang_meetmethode">
                <method>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </method>
            </xsl:for-each>        
        </Observation>
    </xsl:template>    
</xsl:stylesheet>