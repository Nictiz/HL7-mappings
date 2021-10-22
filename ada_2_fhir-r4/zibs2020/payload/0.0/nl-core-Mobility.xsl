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
        <xd:desc>Converts ADA [...] to FHIR [...] conforming to profile [...]</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-[zib name] instance as a [resource name] FHIR instance from ADA [ADA instance name].</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-Mobility" mode="nl-core-Mobility" match="mobiliteit" as="element(f:Observation)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility"/>
                </meta>
                <status value="final"/>
                
                <code>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="301438001"/>
                        <display value="vermogen tot mobiliteit"/>
                    </coding>
                </code>

                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template> 
    

                <xsl:copy-of select="nf:_createComponent(lopen, '282097004', 'loopvermogen')"/>
                <xsl:copy-of select="nf:_createComponent(traplopen, '301587001', 'vermogen tot traplopen')"/>
                <xsl:copy-of select="nf:_createComponent(houding_veranderen, '282869009', 'vermogen tot lichaamspositionering')"/>
                <xsl:copy-of select="nf:_createComponent(houding_handhaven, '249868004', 'vermogen om lichaamshouding aan te houden')"/>
                <xsl:copy-of select="nf:_createComponent(uitvoeren_transfer, '364666007', 'vermogen om te verplaatsen')"/>
                
            </Observation>
            
        </xsl:for-each>
    </xsl:template>
    
    <xsl:function name="nf:_createComponent">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="snomedCode" as="xs:string"/>
        <xsl:param name="snomedDisplay" as="xs:string"/>
        
        <xsl:for-each select="$in">
            <component>
                <code>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="{$snomedCode}"/>
                        <display value="{$snomedDisplay}"/>
                    </coding>
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </valueCodeableConcept>
                </code>
            </component>
        </xsl:for-each>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="mobiliteit" mode="_generateId">
        <xsl:value-of select="'temp'"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="mobiliteit" mode="_generateDisplay">
        <xsl:value-of select="'temp'"/>
    </xsl:template>
</xsl:stylesheet>
