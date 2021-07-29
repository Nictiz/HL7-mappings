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
        <xd:desc>Create a nl-core-AdministrationAgreement instance as a MedicationDispense FHIR instance from ADA toedienings_afspraak.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-AdministrationAgreement" mode="nl-core-AdministrationAgreement" match="toedieningsafspraak" as="element(f:MedicationDispense)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="medicationReference" select="geneesmiddel_bij_toedienings_afspraak" as="element()?"/>
        <xsl:param name="performer" select="verstrekker" as="element()?"/>
        <xsl:param name="authorizingPrescription" select="medicatieafspraak" as="element()?"/>
        
        <xsl:for-each select="$in">
            <MedicationDispense>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-AdministrationAgreement"/>
                </meta>
                
                <xsl:for-each select="toedieningsafspraak_aanvullende_informatie">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-AdministrationAgreement.AdditionalInformation">
                        <valueCoding>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </valueCoding>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="reden_afspraak">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-AdministrationAgreement.AgreementReason">
                        <valueString>
                            <xsl:call-template name="string-to-string"/>
                        </valueString>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="toedieningsafspraak_datum_tijd">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-AdministrationAgreement.AdministrationAgreementDateTime">
                        <valueDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="./@value"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </valueDateTime>
                    </extension>
                </xsl:for-each>

                <xsl:for-each select="gebruiksinstructie">
                    <xsl:call-template name="ext-RenderedDosageInstruction"/>
                </xsl:for-each>
                
                <xsl:for-each select="gebruiksperiode">
                    <xsl:call-template name="ext-TimeInterval.Period"/>
                    <xsl:call-template name="ext-TimeInterval.Duration"/>
                </xsl:for-each>
                
                <xsl:for-each select="toedieningsafspraak_stop_type">
                    <modifierExtension url="http://nictiz.nl/fhir/StructureDefinition/ext-StopType">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </valueCodeableConcept>
                    </modifierExtension>
                </xsl:for-each>
                
                <xsl:for-each select="gebruiksinstructie">
                    <xsl:call-template name="ext-InstructionsForUse.RepeatPeriodCyclicalSchedule"/>
                </xsl:for-each>
                
                <!-- TODO: Add status. The guidance is not clear how this relates to CancelledIndicator and other zib concepts -->
    
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="422037009"/>
                        <display value="toedieningsafspraak"/>
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
                
            </MedicationDispense>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="toedieningsafspraak" mode="_generateId">
        <!-- TODO -->
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="toedieningsafspraak" mode="_generateDisplay">
        <xsl:variable name="parts">
            <xsl:value-of select="'Administration agreement'"/>
            <xsl:if test="reden_afspraak[@value]">
                <xsl:value-of select="concat('for ', reden_afspraak/@value)"/>
            </xsl:if>
            <xsl:if test="toedieningsafspraak_datum_tijd[@value]">
                <xsl:value-of select="concat(' (', toedieningsafspraak_datum_tijd/@value, ')')"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ' ')"/>
    </xsl:template>
</xsl:stylesheet>
