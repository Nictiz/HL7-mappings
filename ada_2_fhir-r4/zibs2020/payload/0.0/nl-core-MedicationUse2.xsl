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
        <xd:desc>Converts ADA medicatie_toediening to FHIR MedicationStatement conforming to profile nl-core-MedicationUse2</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-MedicationUse2 instance as a MedicationStatement FHIR instance from ADA medicatie_toediening.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">The MedicationStatement.subject as ADA element or reference.</xd:param>
        <xd:param name="medicationReference">The MedicationStatement.medicationReference as ADA element or reference.</xd:param>
        <xd:param name="prescriber">The MedicationStatement.prescriber as ADA element or reference.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-MedicationUse2" mode="nl-core-MedicationUse2" match="medicatie_toediening" as="element(f:MedicationStatement)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="medicationReference" select="gebruiks_product/farmaceutisch_product" as="element()?"/>
        <xsl:param name="prescriber" select="voorschrijver" as="element()?"/>
        
        <xsl:for-each select="$in">
            <MedicationStatement>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicationUse2"/>
                </meta>
                
                <xsl:for-each select="gebruiksinstructie">
                    <xsl:call-template name="ext-RenderedDosageInstruction"/>
                </xsl:for-each>
                
                <xsl:for-each select="gebruiksperiode">
                    <xsl:call-template name="ext-TimeInterval.Duration"/>
                </xsl:for-each>
                
                <xsl:for-each select="$prescriber">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationUse2.Prescriber">
                        <valueReference>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="profile">nl-core-HealthProfessional-PractitionerRole</xsl:with-param>
                            </xsl:call-template>
                        </valueReference>
                    </extension>
                </xsl:for-each>

                <xsl:for-each select="volgens_afspraak_indicator">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationUse2.AsAgreedIndicator">
                        <valueBoolean>
                            <xsl:attribute name="value">
                                <xsl:call-template name="boolean-to-boolean"/>
                            </xsl:attribute>
                        </valueBoolean>
                    </extension>                    
                </xsl:for-each>
                
                <xsl:for-each select="gebruiksinstructie">
                    <xsl:call-template name="ext-InstructionsForUse.RepeatPeriodCyclicalSchedule"/>
                </xsl:for-each>
                
                <status>
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test="not(medicatie_gebruik_stop_type[@code]) and gebruik_indicator/@value = 'true'">active</xsl:when>
                            <xsl:when test="medicatie_gebruik_stop_type/@code = '113381000146106' and gebruik_indicator/@value = 'false'">on-hold</xsl:when>
                            <xsl:when test="medicatie_gebruik_stop_type/@code = '113371000146109' and gebruik_indicator/@value = 'false'">stopped</xsl:when>
                            <!-- When GebruikIndicator is false but there's no stop type, the profile states that
                                 we should use not-taken, completed, intended or entered-in-error. However, we cant't
                                 know which it is so we'll default to unknown. -->
                            <xsl:otherwise>unknown</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </status>
                
                <xsl:for-each select="reden_wijzigen_of_stoppen_gebruik">
                    <statusReason>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </statusReason>
                </xsl:for-each>
                
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="422979000"/>
                        <display value="bevinding betreffende gedrag met betrekking tot medicatieregime"/>
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
            
                <xsl:for-each select="gebruiksperiode">
                    <xsl:call-template name="ext-TimeInterval.Period">
                        <xsl:with-param name="wrapIn">effectivePeriod</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="medicatie_gebruik_datum_tijd">
                    <dateAsserted>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="./@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </dateAsserted>
                </xsl:for-each>
                
                <xsl:for-each select="reden_gebruik">
                    <reasonCode>
                        <text>
                            <xsl:attribute name="value" select="./@value"/>
                        </text>
                    </reasonCode>
                </xsl:for-each>
                
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:attribute name="value" select="./@value"/>
                        </text>
                    </note>
                </xsl:for-each>
                
                <xsl:for-each select="gebruiksinstructie">
                    <xsl:call-template name="nl-core-InstructionsForUse.DosageInstruction">
                        <xsl:with-param name="wrapIn">dosage</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
            </MedicationStatement>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="medicatie_toediening" mode="_generateId">
        <xsl:variable name="parts">
            <xsl:text>dispense</xsl:text>
            <xsl:value-of select="medicatie_gebruik_datum_tijd/@value"/>
            <xsl:value-of select="gebruik_indicator/@displayName"/>
            <xsl:value-of select="reden_gebruik/@value"/>
            <xsl:value-of select="concat(medicatie_gebruik_stop_type/@value, medicatie_gebruik_stop_type/@unit)"/>
            <xsl:value-of select="concat(reden_wijzigen_of_stoppen_gebruik/@value, reden_wijzigen_of_stoppen_gebruik/@unit)"/>
            <xsl:value-of select="toelichting/@value"/>
        </xsl:variable>
        <xsl:value-of select="substring(replace(string-join($parts, '-'), '[^A-Za-z0-9-.]', ''), 1, 64)"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="medicatie_toediening" mode="_generateDisplay">
        <xsl:variable name="parts">
            <xsl:text>Medication use</xsl:text>
            <xsl:if test="medicatie_gebruik_datum_tijd/[@value]">
                <xsl:value-of select="concat('dispense date', medicatie_gebruik_datum_tijd/@value)"/>
            </xsl:if>
            <xsl:value-of select="reden_gebruik/@value"/>
            <xsl:value-of select="toelichting/@value"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ', ')"/>
    </xsl:template>
</xsl:stylesheet>
