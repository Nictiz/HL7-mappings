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
    xmlns:nm="http://www.nictiz.nl/mapping"
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
        <xd:desc>Create a nl-core-DispenseRequest instance as a MedicationRequest FHIR instance from ADA verstrekkingsverzoek.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-DispenseRequest" mode="nl-core-DispenseRequest" match="verstrekkingsverzoek" as="element(f:MedicationRequest)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="medicationReference" select="te_verstrekken_geneesmiddel" as="element()?"/>
        <xsl:param name="performer" select="beoogd_verstrekker" as="element()?"/>
        
        <xsl:for-each select="$in">
            <MedicationRequest>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-DispenseRequest"/>
                </meta>
                
                <xsl:for-each select="aanvullende_wensen">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-DispenseRequest.AdditionalWishes">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>
                
                <!-- There's no mapping from the zib to the status, so we'll default to unknown -->
                <status value="unknown"/>
                
                <!-- TODO: Proposed to use proposal as default, but this is not definite -->
                <intent value="proposal"/>
                
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="52711000146108"/>
                        <display value="verstrekkingsverzoek"/>
                    </coding>
                </category>
                
                <xsl:for-each select="$medicationReference">
                    <medicationReference>
                        <xsl:call-template name="makeReference"/>
                    </medicationReference>
                </xsl:for-each>
                
                <xsl:for-each select="$subject">
                    <subject>
                        <xsl:call-template name="makeReference"/>
                    </subject>
                </xsl:for-each>
                
                <xsl:for-each select="verstrekkingsverzoek_datum">
                    <authoredOn>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="./@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </authoredOn>
                </xsl:for-each>
                
                <performer> <!-- There's at most 1 perfomer, so we can write both elements here -->
                    <actor>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="profile">nl-core-HealthcareProvider-Organization</xsl:with-param>
                        </xsl:call-template>
                    </actor>
                </performer>
                
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string"/>
                        </text>
                    </note>
                </xsl:for-each>
                
                <xsl:variable name="dispenseRequest" as="element()*">
                    <xsl:for-each select="verbruiksperiode">
                        <xsl:call-template name="ext-TimeInterval.Duration"/>
                        <xsl:call-template name="ext-TimeInterval.Period">
                            <xsl:with-param name="wrapIn">validityPeriod</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    
                    <xsl:for-each select="aantal_herhalingen">
                        <numberOfRepeatsAllowed value="{./@value}"/>
                    </xsl:for-each>
                    
                    <xsl:for-each select="te_verstrekken_hoeveelheid">
                        <quantity>
                            <xsl:call-template name="hoeveelheid-to-Quantity"/>
                        </quantity>
                    </xsl:for-each>
                    
                </xsl:variable>
                <xsl:if test="count($dispenseRequest) &gt; 0">
                    <dispenseRequest>
                        <xsl:copy-of select="$dispenseRequest"/>
                    </dispenseRequest>
                </xsl:if>
            </MedicationRequest>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="verstrekkingsverzoek" mode="_generateId">
        <!-- TODO -->
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="verstrekkingsverzoek" mode="_generateDisplay">
        <!-- TODO -->
    </xsl:template>
</xsl:stylesheet>
