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
        <xd:desc>Converts ADA medicatieverstrekking to FHIR MedicationDispense conforming to profile nl-core-MedicationDispense</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-MedicationDispense instance as a MedicationDispense FHIR instance from ADA medicatieverstrekking.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">The MedicationDispense.subject as ADA element or reference.</xd:param>
        <xd:param name="medicationReference">The MedicationDispense.medicationReference as ADA element or reference.</xd:param>
        <xd:param name="performer">The MedicationDispense.requester as ADA element or reference.</xd:param>
        <xd:param name="authorizingPrescription">The MedicationDispense.authorizingPrescription as ADA element or reference.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-MedicationDispense" mode="nl-core-MedicationDispense" match="medicatieverstrekking" as="element(f:MedicationDispense)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="medicationReference" select="verstrekt_geneesmiddel/farmaceutisch_product" as="element()?"/>
        <xsl:param name="performer" select="verstrekker/zorgaanbieder" as="element()?"/>
        <xsl:param name="authorizingPrescription" select="verstrekkingsverzoek/verstrekkingsverzoek" as="element()?"/>
        
        <xsl:for-each select="$in">
            <MedicationDispense>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationDispense"/>
                </meta>
                
                <xsl:for-each select="medicatieverstrekking_aanvullende_informatie">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationDispense.MedicationDispenseAdditionalInformation">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="aanschrijf_datum">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationDispense.RequestDate">
                        <valueDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="./@value"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </valueDateTime>
                    </extension>
                </xsl:for-each>
                    
                <xsl:for-each select="distributievorm">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationDispense.DistributionForm">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </valueCodeableConcept>
                    </extension>    
                </xsl:for-each>
                
                <!-- It is expected that in most use cases only actual, executed, medication dispenses are exchanged which result in a _completed_ value. We use completed as a default value. 
                    See https://github.com/Nictiz/Nictiz-R4-zib2020/issues/122 -->
                <status value="completed"/>
                
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="373784005"/>
                        <display value="verstrekken van medicatie"/>
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
                
                <xsl:for-each select="$performer">
                    <performer> <!-- There's at most 1 perfomer, so we can write both elements here -->
                        <actor>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="profile">nl-core-HealthcareProvider-Organization</xsl:with-param>
                            </xsl:call-template>
                        </actor>
                    </performer>
                </xsl:for-each>
                
                <xsl:for-each select="$authorizingPrescription">
                    <authorizingPrescription>
                        <xsl:call-template name="makeReference"/>
                    </authorizingPrescription>
                </xsl:for-each>
                
                <xsl:for-each select="verstrekte_hoeveelheid">
                    <quantity>
                        <!-- TODO: Handle G-standaard extension -->
                        <xsl:call-template name="hoeveelheid-to-Quantity"/>
                    </quantity>
                </xsl:for-each>
                
                <xsl:for-each select="verbruiksduur">
                    <daysSupply>
                        <xsl:call-template name="hoeveelheid-to-Quantity"/>
                    </daysSupply>
                </xsl:for-each>
                
                <xsl:for-each select="medicatieverstrekkings_datum_tijd">
                    <whenHandedOver>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="./@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </whenHandedOver>
                </xsl:for-each>
                
                <!-- TODO: DispenseLocation is a string in the zib, but mapped to a Location reference in FHIR. How should this be handled? Should a Location resource be created from just the string? -->
                
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string"/>
                        </text>
                    </note>
                </xsl:for-each>
            </MedicationDispense>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="medicatieverstrekking" mode="_generateId">
        <xsl:variable name="parts">
            <xsl:text>dispense</xsl:text>
            <xsl:value-of select="medicatieverstrekking_datum_tijd/@value"/>
            <xsl:value-of select="aanschrijf_datum/@value"/>
            <xsl:value-of select="distributievorm/@displayName"/>
            <xsl:value-of select="concat(verbruiksduur/@value, verbruiksduur/@unit)"/>
            <xsl:value-of select="medicatieverstrekking_aanvullende_informatie/@displayName"/>
            <xsl:value-of select="concat(verstrekte_hoeveelheid/@value, verstrekte_hoeveelheid/@unit)"/>
            <xsl:value-of select="toelichting/@value"/>
            <xsl:value-of select="afleverlocatie/@value"/>
        </xsl:variable>
        <xsl:value-of select="substring(replace(string-join($parts, '-'), '[^A-Za-z0-9-.]', ''), 1, 64)"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="medicatieverstrekking" mode="_generateDisplay">
        <xsl:variable name="parts">
            <xsl:text>Medication dispense</xsl:text>
            <xsl:if test="medicatieverstrekking_datum_tijd/@value">
                <xsl:value-of select="concat('dispense date', medicatieverstrekking_datum_tijd/@value)"/>
            </xsl:if>
            <xsl:value-of select="afleverlocatie/@value"/>
            <xsl:value-of select="toelichting/@value"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ', ')"/>
    </xsl:template>
</xsl:stylesheet>
