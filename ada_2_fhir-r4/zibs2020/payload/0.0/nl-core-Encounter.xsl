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
        <xd:desc>Converts ada contact to FHIR Encounter resource conforming to profile nl-core-Encounter</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-Contactperson as a RelatedPerson FHIR instance from ada Contactpersoon.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="participantIndividual">Optional ADA instance or ADA reference element for a HealthProfessional-PractitionerRole instance to participant.individual</xd:param>
        <xd:param name="location">Optional ADA instance or ADA reference element for a HealthcareProvider instance to location.location.</xd:param>
    </xd:doc>
    <xsl:template match="contact" name="nl-core-Encounter" mode="nl-core-Encounter" as="element(f:Encounter)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="participantIndividual" select="contact_met/zorgverlener"/>
        <xsl:param name="location" select="locatie/zorgaanbieder"/>
        
        <xsl:for-each select="$in">
            <Encounter>
                <xsl:variable name="startDate" select="begin_datum_tijd"/>
                <xsl:variable name="endDate" select="eind_datum_tijd"/>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Encounter"/>
                </meta>
                <!-- Guidance for Encounter.status from the profile:
                This element is implictly mapped to the zib concepts NL-CM:15.1.3 (StartDateTime) and NL-CM:15.1.4 (EndDateTime). Unless the status is explicitly recorded, the following guidance applies:

                * When StartDateTime is in the future, `.status` will usually be set to _planned_.
                * When StartDateTime is in the past and EndDateTime is present and in the future, `.status` will usually be set to _in-progress_.
                * When EndDateTime is present and in the past, `.status` will usually be set to _finished_.
                * When EndDateTime is not present, this means it was a point-in-time encounter and `.status` will usually be set to _finished_.
                * When a system is unable to infer the status from the StartDateTime and EndDateTime, `.status` will be set to _unknown_.
                -->
                <status>
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test="$startDate and nf:isFuture($startDate/@value)">planned</xsl:when>
                            <xsl:when test="$startDate and nf:isPast($startDate/@value) and $endDate and nf:isFuture($endDate/@value)">in-progress</xsl:when>
                            <xsl:when test="$endDate and nf:isPast($endDate/@value)">finished</xsl:when>
                            <xsl:when test="$startDate and not($endDate)">finished</xsl:when>
                            <xsl:otherwise>unknown</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </status>
                <xsl:for-each select="contact_type[@code]">
                    <class>
                        <xsl:call-template name="code-to-Coding">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </class>
                </xsl:for-each>
                <xsl:for-each select="contact_met">
                    <participant>
                        <individual>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="$participantIndividual"/>
                                <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                            </xsl:call-template>
                        </individual>
                    </participant>
                </xsl:for-each>
                <xsl:if test="$startDate or $endDate">
                    <period>
                        <xsl:if test="$startDate">
                            <start>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string($startDate/@value)"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </start>
                        </xsl:if>
                        <xsl:if test="$endDate">
                            <end>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string($endDate/@value)"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </end>
                        </xsl:if>
                    </period>
                </xsl:if>
                <xsl:for-each select="reden_contact">
                    <reasonReference>
                        <xsl:for-each select="toelichting_reden_contact">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-Comment">
                                <valueString>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueString>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select="probleem">
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="profile" select="'nl-core-Problem'"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:for-each select="verrichting">
                            <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="'nl-core-Procedure-event'"/>
                        </xsl:call-template>
                        </xsl:for-each>
                        <xsl:for-each select="afwijkende_uitslag">
                            <xsl:comment>TODO: nl-core-LaboratoryTestResult</xsl:comment>
                            <!--<xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="'nl-core-LaboratoryTestResult'"/>
                        </xsl:call-template>-->
                        </xsl:for-each>
                    </reasonReference>
                </xsl:for-each>
                <xsl:if test="herkomst or bestemming">
                    <hospitalization>
                        <xsl:for-each select="herkomst">
                            <admitSource>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </admitSource>
                        </xsl:for-each>
                        <xsl:for-each select="bestemming">
                            <dischargeDisposition>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </dischargeDisposition>
                        </xsl:for-each>
                    </hospitalization>
                </xsl:if>
                <xsl:for-each select="locatie">
                    <location>
                        <location>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="$location"/>
                                <xsl:with-param name="profile" select="'nl-core-HealthcareProvider'"/>
                            </xsl:call-template>
                        </location>
                    </location>
                </xsl:for-each>
            </Encounter>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="contact" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Encounter</xsl:text>
            <xsl:if test="contact_type[@displayName]">
                <xsl:value-of select="concat('type ', contact_type/@displayName)"/>
            </xsl:if>
            <xsl:if test="begin_datum_tijd[@value]">
                <xsl:value-of select="concat('from ', begin_datum_tijd/@value)"/>
            </xsl:if>
            <xsl:if test="eind_datum_tijd[@value]">
                <xsl:value-of select="concat('until ', eind_datum_tijd/@value)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
    
</xsl:stylesheet>