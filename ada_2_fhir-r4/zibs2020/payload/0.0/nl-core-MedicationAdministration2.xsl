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
        <xd:desc>Create a nl-core-[zib name] instance as a [resource name] FHIR instance from ADA [ADA instance name].</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-MedicationAdministration2" mode="nl-core-MedicationAdministration2" match="medicatie_toediening" as="element(f:MedicationAdministration)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="medicationReference" select="toedienings_product" as="element()?"/>
        <xsl:param name="admistrationAgreement" select="gerelateerde_afspraak/toedieningsafspraak" as="element()?"/>
        <xsl:param name="request" select="gerelateerde_afspraak/medicatieafspraak" as="element()?"/>
        <xsl:param name="performer" select="toediener/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <MedicationAdministration>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicationAdministration2"/>
                </meta>
                
                <xsl:for-each select="afgesproken_datum_tijd">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAdministration.AgreedDateTime">
                        <valueDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="./@value"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </valueDateTime>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="dubbele_controle_uitgevoerd">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAdministration.DoubleCheckPerformed">
                        <valueBoolean>
                            <xsl:call-template name="boolean-to-boolean"/>
                        </valueBoolean>
                    </extension>
                </xsl:for-each>

                <xsl:for-each select="afwijkende_toediening">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAdministration.DeviatingAdministration">
                        <valueBoolean>
                            <xsl:call-template name="boolean-to-boolean"/>
                        </valueBoolean>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="medicatie_toediening_reden_van_afwijken">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAdministration.ReasonForDeviation">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="medicatie_toediening_status">
                    <status>
                        <xsl:attribute name="value">
                            <xsl:call-template name="code-to-code">
                                <xsl:with-param name="codeMap" as="element()*">
                                    <map inCodeSystem="{$oidHL7ActStatus}" inCode="active"    code="in-progress"/>
                                    <map inCodeSystem="{$oidHL7ActStatus}" inCode="suspended" code="on-hold"/>
                                    <map inCodeSystem="{$oidHL7ActStatus}" inCode="aborted"   code="stopped"/>
                                    <map inCodeSystem="{$oidHL7ActStatus}" inCode="completed" code="completed"/>
                                    <map inCodeSystem="{$oidHL7ActStatus}" inCode="cancelled" code="not-done"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:attribute>
                    </status>
                </xsl:for-each>
                
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="18629005"/>
                        <display value="toediening van medicatie"/>
                    </coding>
                </category>
                
                <xsl:for-each select="$medicationReference">
                    <medicationReference>
                        <xsl:call-template name="makeReference"/>
                    </medicationReference>
                </xsl:for-each>
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn">subject</xsl:with-param>
                </xsl:call-template>
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$admistrationAgreement"/>
                    <xsl:with-param name="wrapIn">supportingInformation</xsl:with-param>
                </xsl:call-template>
                
                <xsl:for-each select="toedienings_datum_tijd">
                    <effectiveDateTime>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="./@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </effectiveDateTime>
                </xsl:for-each>
                
                <xsl:for-each select="$performer">
                    <performer> <!-- There's at most 1 perfomer, so we can write both elements here -->
                        <actor>
                            <xsl:call-template name="makeReference"/>
                        </actor>
                    </performer>
                </xsl:for-each>
                
                <xsl:for-each select="$request">
                    <request>
                        <xsl:call-template name="makeReference"/>
                    </request>
                </xsl:for-each>
                
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string"/>
                        </text>
                    </note>
                </xsl:for-each>
                
                <xsl:variable name="dosage">
                    <xsl:for-each select="toedieningsweg">
                        <route>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </route>
                    </xsl:for-each>
                    <xsl:for-each select="toegediende_hoeveelheid">
                        <dose>
                            <xsl:call-template name="hoeveelheid-to-Quantity"/>
                        </dose>
                    </xsl:for-each>
                    
                    <!-- TODO: It's not clear yet how to map zib Range here. Also see https://bits.nictiz.nl/browse/ZIB-815 -->
                </xsl:variable>
                <xsl:if test="$dosage">
                    <dosage>
                        <xsl:copy-of select="$dosage"/>
                    </dosage>
                </xsl:if>
            </MedicationAdministration>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="medicatie_toediening" mode="_generateId">
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="medicatie_toediening" mode="_generateDisplay">
    </xsl:template>
</xsl:stylesheet>
