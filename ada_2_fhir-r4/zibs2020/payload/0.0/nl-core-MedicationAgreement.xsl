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
        <xd:desc>Converts ADA medicatieafspraak to FHIR MedicationRequest conforming to profile nl-core-MedicationAgreement</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-MedicationAgreement instance as a MedicationRequest FHIR instance from ADA medicatieafspraak.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">The MedicationRequest.subject as ADA element or reference.</xd:param>
        <xd:param name="medicationReference">The MedicationRequest.medicationReference as ADA element or reference.</xd:param>
        <xd:param name="requester">The MedicationRequest.requester as ADA element or reference.</xd:param>
        <xd:param name="reasonReference">The MedicationRequest.reasonReference as ADA element or reference.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-MedicationAgreement" mode="nl-core-MedicationAgreement" match="medicatieafspraak" as="element(f:MedicationRequest)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="medicationReference" select="afgesprokengeneesmiddel" as="element()?"/>
        <xsl:param name="requester" select="voorschrijver" as="element()?"/>
        <xsl:param name="reasonReference" select="reden_van_voorschrijven" as="element()?"/>
        
        <xsl:for-each select="$in">
            <MedicationRequest>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicationAgreement"/>
                </meta>
                
                <xsl:for-each select="medicatieafspraak_aanvullende_informatie">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAgreement.MedicationAgreementAdditionalInformation">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="gebruiksinstructie">
                    <xsl:call-template name="ext-RenderedDosageInstruction"/>
                </xsl:for-each>
                
                <xsl:for-each select="gebruiksperiode">
                    <xsl:call-template name="ext-TimeInterval.Period"/>
                    <xsl:call-template name="ext-TimeInterval.Duration"/>
                </xsl:for-each>
                
                <xsl:for-each select="gebruiksinstructie">
                    <xsl:call-template name="ext-InstructionsForUse.RepeatPeriodCyclicalSchedule"/>
                </xsl:for-each>
                
                <xsl:for-each select="medicatieafspraak_stop_type">
                    <modifierExtension url="http://nictiz.nl/fhir/StructureDefinition/ext-StopType">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </valueCodeableConcept>
                    </modifierExtension>
                </xsl:for-each>
                
                <status>
                    <xsl:attribute name="value">
                        <!-- Internally convert the TimeInterval to a Period using the ext-TimeInterval-Period template
                             so we can perform the required logic using a start and end datetime. -->
                        <xsl:variable name="period" as="element(f:temp)?">
                            <xsl:call-template name="ext-TimeInterval.Period">
                                <xsl:with-param name="in" select="gebruiksperiode"/>
                                <xsl:with-param name="wrapIn">temp</xsl:with-param>
                            </xsl:call-template>
                        </xsl:variable>
                            
                        <xsl:choose>
                            <xsl:when test="medicatieafspraak_stop_type/@code = '113381000146106'">stopped</xsl:when>
                            <xsl:when test="medicatieafspraak_stop_type/@code = '113371000146109'">on-hold</xsl:when>
                            <xsl:when test="
                                $period/f:start[@value] and 
                                ($period/f:start/@value castable as xs:date     and xs:date($period/f:start/@value)     &lt; current-date()) or
                                ($period/f:start/@value castable as xs:dateTime and xs:dateTime($period/f:start/@value) &lt; current-dateTime())">active</xsl:when>
                            <xsl:when test="
                                $period/f:start[@value] and $period/f:end[@value] and 
                                (($period/f:start/@value castable as xs:date     and xs:date($period/f:start/@value)     &gt; current-date()) or 
                                 ($period/f:start/@value castable as xs:dateTime and xs:dateTime($period/f:start/@value) &gt; current-dateTime())) and
                                (($period/f:end[@value]  castable as xs:date     and xs:date($period/f:end/@value)       &lt; current-date()) or
                                 ($period/f:end[@value]  castable as xs:dateTime and xs:dateTime($period/f:end/@value)   &lt; current-dateTime()))">active</xsl:when>
                            <xsl:otherwise>unknown</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </status>
                
                <intent value="order"/>
                
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="16076005"/>
                        <display value="voorschrijven"/>
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
                
                <xsl:for-each select="medicatieafspraak_datum_tijd">
                    <authoredOn>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="./@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </authoredOn>
                </xsl:for-each>
                
                <xsl:for-each select="$requester">
                    <requester>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="profile">nl-core-HealthProfessional-PractitionerRole</xsl:with-param>
                        </xsl:call-template>
                    </requester>
                </xsl:for-each>
                
                <xsl:for-each select="reden_medicatieafspraak">
                    <reasonCode>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </reasonCode>
                </xsl:for-each>
                
                <xsl:for-each select="$reasonReference">
                    <reasonReference>
                        <xsl:call-template name="makeReference"/>
                    </reasonReference>
                </xsl:for-each>
                
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string"/>
                        </text>
                    </note>
                </xsl:for-each>
                
                <xsl:for-each select="gebruiksinstructie">
                    <xsl:call-template name="nl-core-InstructionsForUse.DosageInstruction">
                        <xsl:with-param name="wrapIn">dosageInstruction</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
            </MedicationRequest>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="medicatieafspraak" mode="_generateId">
        <xsl:variable name="parts">
            <xsl:text>agreement</xsl:text>
            <xsl:value-of select="reden_van_voorschrijven/@displayName"/>
            <xsl:value-of select="medicatieafspraaks_datum_tijd/@value"/>
            <xsl:value-of select="toelichting/@value"/>
        </xsl:variable>
        <xsl:value-of select="substring(replace(string-join($parts, '-'), '[^A-Za-z0-9-.]', ''), 1, 64)"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="medicatieafspraak" mode="_generateDisplay">
        <xsl:variable name="parts">
            <xsl:value-of select="afgesprokengeneesmiddel/@display"/>
            <xsl:value-of select="medicatieafspraak_datum_tijd/@value"/>
            <xsl:value-of select="medicatieafspraak_stop_type/@display"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, '-')"/>
    </xsl:template>
</xsl:stylesheet>
