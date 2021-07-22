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
        <xd:desc>Converts ada probleem to FHIR Procedure conforming to profile nl-core-Procedure</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create an nl-core-Procedure as a Procedure FHIR instance from ada verrichting element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="verrichting" name="nl-core-Procedure" mode="nl-core-Procedure" as="element(f:Procedure)">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="report" as="element(tekst_uitslag)?"/>
        <xsl:for-each select="$in">
            <Procedure>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure"/>
                </meta>
                <xsl:for-each select="verrichting_methode">
                    <extension url="http://hl7.org/fhir/StructureDefinition/procedure-method">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="aanvrager">
                    <basedOn>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="$in"/>
                            <xsl:with-param name="profile" select="'nl-core-Procedure-ServiceRequest'"/>
                        </xsl:call-template>
                    </basedOn>
                </xsl:for-each>
                <status value="completed"/>
                <xsl:for-each select="verrichting_type">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:choose>
                    <xsl:when test="verrichting_start_datum and verrichting_eind_datum">
                        <performedPeriod>
                            <xsl:call-template name="startend-to-Period">
                                <xsl:with-param name="start" select="verrichting_start_datum"/>
                                <xsl:with-param name="end" select="verrichting_eind_datum"/>
                            </xsl:call-template>
                        </performedPeriod>
                    </xsl:when>
                    <xsl:when test="verrichting_start_datum">
                        <performedDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </performedDateTime>
                    </xsl:when>
                </xsl:choose>
                <xsl:for-each select="uitvoerder">
                    <performer>
                        <actor>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="zorgverlener"/>
                                <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                            </xsl:call-template>
                        </actor>
                    </performer>
                </xsl:for-each>
                <xsl:for-each select="locatie">
                    <location>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="zorgaanbieder"/>
                            <xsl:with-param name="profile" select="'nl-core-HealthcareProvider'"/>
                        </xsl:call-template>
                    </location>
                </xsl:for-each>
                <xsl:for-each select="indicatie">
                    <reasonReference>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="probleem"/>
                            <xsl:with-param name="profile" select="'nl-core-Problem'"/>
                        </xsl:call-template>
                    </reasonReference>
                </xsl:for-each>
                <xsl:for-each select="verrichting_anatomische_locatie">
                    <bodySite>
                        <xsl:call-template name="nl-core-AnatomicalLocation"/>
                    </bodySite>
                </xsl:for-each>
                
                <xsl:for-each select="$report">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="profile" select="'nl-core-TextResult'"/>
                        <xsl:with-param name="wrapIn" select="'report'"/>
                    </xsl:call-template>
                </xsl:for-each>

                <!--<xsl:for-each select="medisch_hulpmiddel">
                    <focalDevice>
                        <manipulated>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="medisch_hulpmiddel"/>
                                <xsl:with-param name="profile" select="'nl-core-MedicalDevice'"/>
                            </xsl:call-template>
                        </manipulated>
                    </focalDevice>
                </xsl:for-each>-->
            </Procedure>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>