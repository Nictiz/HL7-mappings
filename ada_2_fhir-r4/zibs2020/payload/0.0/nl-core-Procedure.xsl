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
        <xd:desc>Converts ada verrichting to FHIR Procedure conforming to profile http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Unwrap verrichting_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="verrichting_registratie">
        <xsl:apply-templates select="verrichting" mode="nl-core-Procedure"/>
    </xsl:template>
    
    <xsl:template match="verrichting" name="nl-core-Procedure" mode="nl-core-Procedure">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="fhirMetadata" as="element()*" tunnel="yes"/>
        
        <Procedure>
            <xsl:if test="$logicalId">
                <id value="{$logicalId}"/>
            </xsl:if>
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
                    <reference value="ServiceRequest/nl-core-Procedure-ServiceRequest-01"/>
                    <!--<xsl:call-template name="nl-core-Procedure-ServiceRequest-Reference"/>-->
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
            <subject>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" as="element()">
                        <!-- How do we end up with Patient? Do we need a parameter? Is it enough if just 1 patient is present in $fhirMetaData? -->
                        <xsl:choose>
                            <xsl:when test="count($fhirMetadata[@type = 'patient']) = 1">
                                <xsl:copy-of select="$fhirMetadata[@type = 'patient']"/>
                            </xsl:when>
                            <!--<xsl:when test="$subject">
                                <xsl:copy-of select="$subject"/>
                            </xsl:when>-->
                            <!--<xsl:when test="onderwerp/patient-id">
                                This system is only implemented in zib2020 ADAforms, does it have any merit outside of it?
                                <!-\- TO DO -\->
                            </xsl:when>-->
                            <xsl:otherwise>
                                <xsl:message terminate="yes"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:with-param>
                    <xsl:with-param name="elementName">patient</xsl:with-param>
                </xsl:call-template>
            </subject>
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
                        <!--<xsl:call-template name="nl-core-HealthProfessional-PractitionerRole-Reference"/>-->
                    </actor>
                </performer>
            </xsl:for-each>
            <xsl:for-each select="locatie">
                <location>
                    <!--<xsl:call-template name="nl-core-HealthcareProvider-Reference"/>-->
                </location>
            </xsl:for-each>
            <xsl:for-each select="indicatie">
                <reasonReference>
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" as="element()">
                            <xsl:choose>
                                <xsl:when test="probleem[@datatype = 'reference']">
                                    <!--This system is only implemented in zib2020 ADAforms, does it have any merit outside of it?-->
                                    <xsl:variable name="adaId" select="probleem/@value"/>
                                    <xsl:copy-of select="//referenties/probleem[@id = $adaId]"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:with-param>
                        <xsl:with-param name="elementName">probleem</xsl:with-param>
                    </xsl:call-template>
                </reasonReference>
            </xsl:for-each>
            <xsl:for-each select="verrichting_anatomische_locatie">
                <bodySite>
                    <xsl:for-each select="lateraliteit">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-AnatomicalLocation.Laterality">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </xsl:for-each>
                    <xsl:for-each select="locatie">
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </bodySite>
            </xsl:for-each>
            
            <!-- .report here - mapping from TextResult -->
            
            <xsl:for-each select="medisch_hulpmiddel">
                <focalDevice>
                    <manipulated>
                        <!--<xsl:call-template name="nl-core-MedicalDevice-Reference"/>-->
                    </manipulated>
                </focalDevice>
            </xsl:for-each>
        </Procedure>
    </xsl:template>
    
</xsl:stylesheet>
