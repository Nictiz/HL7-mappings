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
        <xd:desc>Converts ada medicatie_contra_indicatie element to FHIR resource conforming to profile nl-core-MedicationContraIndication</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-MedicationContraIndication FHIR Flag resource from ada medicatie_contra_indicatie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>       
    </xd:doc>
    <xsl:template match="medicatie_contra_indicatie" name="nl-core-MedicationContraIndication" mode="nl-core-MedicationContraIndication" as="element(f:Flag)?">
        <xsl:param name="in" select="." as="element()?"/>
        
        <xsl:param name="subject" select="patient" as="element()?"/>
        <xsl:param name="author" select="melder/*" as="element()?"/>
          
        <xsl:for-each select="$in">
            <Flag>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicationContraIndication"/>
                </meta>

                <xsl:for-each select="reden_van_afsluiten">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationContraIndication.ReasonClosure">
                        <valueString value="{@value}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="toelichting">
                    <xsl:call-template name="ext-Comment"/>
                </xsl:for-each>
                <status>
                    <xsl:choose>
                        <xsl:when test="xs:date(eind_datum/@value) lt current-date()">
                            <xsl:attribute name="value" select="'inactive'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="value" select="'active'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </status>
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="140401000146105"/>
                        <display value="contra-indicatie met betrekking op medicatiebewaking"/>
                    </coding>
                </category>
                <xsl:for-each select="medicatie_contra_indicatie_naam">
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
                <xsl:if test="begin_datum or eind_datum">
                    <period>
                        <xsl:if test="begin_datum">
                            <start>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(begin_datum/@value)"/>
                                        <xsl:with-param name="precision" select="'DAY'"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </start>
                        </xsl:if>
                        <xsl:if test="eind_datum">
                            <end>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(eind_datum/@value)"/>
                                        <xsl:with-param name="precision" select="'DAY'"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </end>
                        </xsl:if>
                    </period>
                </xsl:if>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$author"/>
                    <xsl:with-param name="wrapIn" select="'author'"/>
                    <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"></xsl:with-param>
                </xsl:call-template>
            </Flag>
        </xsl:for-each>
    </xsl:template>  
</xsl:stylesheet>
