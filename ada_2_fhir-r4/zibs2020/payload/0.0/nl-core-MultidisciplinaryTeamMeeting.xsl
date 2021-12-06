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
        <xd:desc>Converts ADA patientbespreking to FHIR resource conforming to profile nl-core-MultidisciplinaryTeamMeeting and nl-core-MultidisciplinaryTeamMeeting.Plan</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-MultidisciplinaryTeamMeeting as an Encounter FHIR instance from ada patientbespreking.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient</xd:param>
    </xd:doc>
    <xsl:template match="patientbespreking" name="nl-core-MultidisciplinaryTeamMeeting" mode="nl-core-MultidisciplinaryTeamMeeting" as="element(f:Encounter)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Encounter>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-MultidisciplinaryTeamMeeting'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-MultidisciplinaryTeamMeeting"/>
                </meta>
                <xsl:for-each select="patientbespreking_label">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MultidisciplinaryTeamMeeting.PatientConsultationLabel">
                        <valueString>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueString>
                    </extension>
                </xsl:for-each>
                
                <status value="unknown"/>
                <class>
                    <text value="MultidisciplinaryTeamMeeting"/>
                </class>
                <type>
                    <system value="http://snomed.info/sct"/>
                    <code value="384682003"/>
                    <display value="multidisciplinaire zorgbespreking"/>
                </type>
                
                <xsl:for-each select="$subject">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$subject"/>
                        <xsl:with-param name="wrapIn" select="'subject'"/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="deelnemer">
                    <participant>
                        <xsl:for-each select="rol_deelnemer">
                            <type>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </type>
                        </xsl:for-each>
                        <xsl:for-each select="zorgverlener">
                            <individual>
                                <xsl:call-template name="makeReference">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                                </xsl:call-template>
                            </individual>
                        </xsl:for-each>
                        <xsl:for-each select="contactpersoon">
                            <individual>
                                <xsl:call-template name="makeReference">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="profile" select="'nl-core-ContactPerson'"/>
                                </xsl:call-template>
                            </individual>
                        </xsl:for-each>
                        <xsl:for-each select="patient">
                            <individual>
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-Encounter-PatientParticipant">
                                    <valueReference>
                                        <xsl:call-template name="makeReference">
                                            <xsl:with-param name="in" select="$subject"/>
                                            <xsl:with-param name="profile" select="'nl-core-Patient'"/>
                                        </xsl:call-template>
                                    </valueReference>
                                </extension> 
                            </individual>
                        </xsl:for-each>
                    </participant>
                </xsl:for-each>
                <xsl:for-each select="patientbespreking_datum_tijd">
                    <period>
                            <start>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(patientbespreking_datum_tijd/@value)"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </start>
                            <end>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(patientbespreking_datum_tijd/@value)"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </end>
                    </period>
                </xsl:for-each>
                <xsl:for-each select="probleem">
                    <reasonReference>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="profile" select="'nl-core-Problem'"/>
                            </xsl:call-template>
                    </reasonReference>
                </xsl:for-each>
            </Encounter>
        </xsl:for-each>
    </xsl:template>
    
    
    <xsl:template match="beleid" name="nl-core-MultidisciplinaryTeamMeeting.Plan" mode="nl-core-MultidisciplinaryTeamMeeting.Plan" as="element(f:CarePlan)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:for-each select="$in">
            <CarePlan>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-MultidisciplinaryTeamMeeting.Plan'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-MultidisciplinaryTeamMeeting.Plan"/>
                </meta>
            </CarePlan>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="patientbespreking" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>multidisciplinaire zorgbespreking</xsl:text>
            <xsl:if test="patientbespreking_label[@value]">
                <xsl:value-of select="concat('type ', patientbespreking_label/@value)"/>
            </xsl:if>
            <xsl:if test="patientbespreking_datum_tijd[@value]">
                <xsl:value-of select="concat('op ', patientbespreking_datum_tijd/@value)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
    
</xsl:stylesheet>
