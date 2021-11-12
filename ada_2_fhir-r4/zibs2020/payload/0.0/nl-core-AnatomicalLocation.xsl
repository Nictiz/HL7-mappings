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
    xmlns:nm="http://www.nictiz.nl/mappings"
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada anatomische_locatie to FHIR valueCodableConcept element conforming to profile nl-core-AnatomicalLocation</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Produces FHIR valueCodableConcept element conforming to profile nl-core-AnatomicalLocation</xd:desc>
        <xd:param name="in">Ada 'anatomische_locatie' element containing the zib data</xd:param>
    </xd:doc>
    <xsl:template match="anatomische_locatie" mode="nl-core-AnatomicalLocation" name="nl-core-AnatomicalLocation" as="element()*">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="wrap" select="false()" as="xs:boolean"/>
        <xsl:param name="profile"/>
        
        <xsl:for-each select="$in">
            <xsl:choose>
                <xsl:when test="$wrap">
                    <valueCodeableConcept>
                        <xsl:call-template name="_doAnatomicalLocation">
                            <xsl:with-param name="profile" select="$profile"/>
                        </xsl:call-template>
                    </valueCodeableConcept>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="_doAnatomicalLocation">
                        <xsl:with-param name="profile" select="$profile"/>    
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="_doAnatomicalLocation">
        <xsl:param name="profile"/>
        
        <xsl:for-each select="lateraliteit">
            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-AnatomicalLocation.Laterality">
                <valueCodeableConcept>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueCodeableConcept>
            </extension>
        </xsl:for-each>
        <xsl:choose>
            <xsl:when test="$profile = 'nl-core-HearingFunction.HearingAid'">
                <xsl:for-each select="hulpmiddel_anatomische_locatie">
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="locatie">
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
</xsl:stylesheet>
