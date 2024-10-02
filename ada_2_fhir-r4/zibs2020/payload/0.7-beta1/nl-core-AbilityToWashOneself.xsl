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
        <xd:desc>Converts ada vermogen_tot_zich_wassen to FHIR Observation conforming to profile nl-core-AbilityToWashOneself.</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create an nl-core-AbilityToWashOneself instance as an Observation FHIR instance from ada vermogen_tot_zich_wassen element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="vermogen_tot_zich_wassen" name="nl-core-AbilityToWashOneself" mode="nl-core-AbilityToWashOneself" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-AbilityToWashOneself"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="284785009"/>
                        <display value="vermogen om zich te wassen"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="zich_wassen">
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCodeableConcept>
                </xsl:for-each>
                <xsl:for-each select="te_wassen_lichaamsdeel">
                    <component>
                        <code>
                            <coding>
                                <system value="http://snomed.info/sct"/>
                                <code value="38866009"/>
                                <display value="structuur van lichaamsdeel"/>
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
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="vermogen_tot_zich_wassen" mode="_generateDisplay">
        <xsl:variable name="parts">
            <xsl:text>AbilityToWashOneself observation: </xsl:text>
            <xsl:if test="zich_wassen/@displayName">
                <xsl:value-of select="zich_wassen/@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ', ')"/>     
    </xsl:template>
    
</xsl:stylesheet>