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
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ADA alcohol_gebruik to FHIR resource conforming to profile nl-core-AlcoholUse</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-AlcoholUse instance as a Observation FHIR instance from ADA alcohol_gebruik.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template match="alcohol_gebruik" name="nl-core-AlcoholUse" mode="nl-core-AlcoholUse" as="element(f:Observation)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-AlcoholUse"/>
                </meta>
                <!-- 
                <status>
                    <xsl:attribute name="value" select="'final'"/>
                </status>
                 -->
                
                
                <code>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="228273003"/>
                        <display value="bevinding betreffende alcoholgebruik"/>
                    </coding>
                </code>
                
                <xsl:for-each select="alcohol_gebruik_status">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </code>
                </xsl:for-each>
                
                <!--  
                <xsl:for-each select="waarneming_gebruik/start_datum">
                    <code>
                        <text>
                            <xsl:attribute name="value" select="./@value"/>
                        </text>
                    </code>
                </xsl:for-each>
                
                <xsl:for-each select="waarneming_gebruik/hoeveelheid">
                    <component>
                        <code>
                            <coding>
                                <system value="http://snomed.info/sct"/>
                                <code value="160573003"/>
                                <display value="inname van alcohol/>
                                
                                ER STAAT DEPRECETED 
                            </coding>
                        </code>
                        <valueCodeableConcept>
                             <xsl:call-template name="code-to-CodeableConcept"/>
                        </valueCodeableConcept>
                    </component>
                </xsl:for-each>
                
                -->
                
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:attribute name="value" select="./@value"/>
                        </text>
                    </note>
                </xsl:for-each>

            </Observation>
        </xsl:for-each>
        
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="alcohol_gebruik" mode="_generateId">
        <xsl:value-of select="substring(replace(string-join(//*[@displayName or @value]/(@displayName, @value)[1], '-'), '[^A-Za-z0-9-.]', ''), 0, 63)"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="alcohol_gebruik" mode="_generateDisplay">
        <xsl:choose>
            <xsl:when test="alcohol_gebruik_status[@displayName]">
                <xsl:value-of select="normalize-space(alcohol_gebruik_status/@displayName)"/>
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
</xsl:stylesheet>
