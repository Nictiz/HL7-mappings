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
        <xd:desc>Converts ADA [...] to FHIR Coverage and Organization resources conforming to profile nl-core-Payer and nl-core-Payer-Organization</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-Payer instance as a [resource name] FHIR instance from ADA [ADA instance name].</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-Payer" mode="nl-core-Payer" match="betaler" as="element(f:Coverage)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Coverage>
                <xsl:variable name="startDate" select="verzekeraar/verzekering/begin_datum_tijd/@value"/>
                <xsl:variable name="endDate" select="verzekeraar/verzekering/eind_datum_tijd/@value"/>
                
                <xsl:call-template name="insertLogicalId"/>
                
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-AllergyIntolerance"/>
                </meta>
                
                <status>
                    <xsl:choose>
                        <xsl:when test="xs:date($endDate) lt current-date() or xs:dateTime($endDate) lt current-dateTime()">
                            <xsl:attribute name="value" select="'cancelled'"/>
                        </xsl:when>
                        <xsl:when test="xs:date($endDate) gt current-date() or xs:dateTime($endDate) gt current-dateTime()">
                            <xsl:attribute name="value" select="'active'"/>
                        </xsl:when>
                        <xsl:when test="$startDate and not($endDate)">
                            <xsl:attribute name="value" select="'active'"/>
                        </xsl:when>
                        <xsl:when test="not($startDate) and not($endDate)">
                            <xsl:attribute name="value" select="'draft'"/>
                        </xsl:when>
                    </xsl:choose>
                </status>
                
                <xsl:for-each select="verzekeraar/verzekering/verzekeringssoort">
                    <type>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </type>
                </xsl:for-each>
                
                <xsl:for-each select="verzekeraar/verzekerde_nummer">
                    <subscriberId value="{normalize-space(@value)}"/>
                </xsl:for-each>
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn">beneficiary</xsl:with-param>
                </xsl:call-template>
                
                <xsl:if test="$startDate or $endDate">
                    <period>
                        <xsl:for-each select="$startDate">
                            <start>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="$startDate"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </start>
                        </xsl:for-each>
                        <xsl:for-each select="$endDate">
                            <end>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="$endDate"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </end>
                        </xsl:for-each>
                    </period>
                </xsl:if>
                
                <!-- TO DO!!! -->
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$payor"/>
                    <xsl:with-param name="wrapIn">payor</xsl:with-param>
                </xsl:call-template>
            </Coverage>
        
        </xsl:for-each>
        
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="betaler" mode="_generateId">
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="betaler" mode="_generateDisplay">
    </xsl:template>
</xsl:stylesheet>
