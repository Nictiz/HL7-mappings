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
        <xd:desc>Converts ADA alert to FHIR resource conforming to profile nl-core-Alert</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-Alert instance as a Flag FHIR instance from ADA alert.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template match="alert" name="nl-core-Alert" mode="nl-core-Alert" as="element(f:Flag)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Flag>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Alert"/>
                </meta>
                
                <xsl:for-each select="referenties/probleem">
                    <extension url="http://hl7.org/fhir/StructureDefinition/flag-detail">
                        <valueReference>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="profile" select="'nl-core-Problem'"/>
                            </xsl:call-template>
                        </valueReference>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="toelichting">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-Comment">
                        <valueString>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueString>
                    </extension>
                </xsl:for-each>
                
                <status>
                    <xsl:choose>
                        <xsl:when test="xs:date(eind_datum_tijd/@value) lt current-date() or xs:dateTime(eind_datum_tijd/@value) lt current-dateTime()">
                            <xsl:attribute name="value" select="'inactive'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="value" select="'active'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </status>
                
                <xsl:for-each select="alert_type">
                    <category>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </category>
                </xsl:for-each>
                
                <xsl:for-each select="alert_naam">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </code>
                </xsl:for-each>
                
                <xsl:for-each select="$subject">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$subject"/>
                        <xsl:with-param name="wrapIn" select="'subject'"/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:if test="begin_datum_tijd or eind_datum_tijd">
                    <period>
                        <xsl:if test="begin_datum_tijd">
                            <start>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(begin_datum_tijd/@value)"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </start>
                        </xsl:if>
                        <xsl:if test="eind_datum_tijd">
                            <end>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(eind_datum_tijd/@value)"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </end>
                        </xsl:if>
                    </period>
                </xsl:if>
            </Flag>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="alert" mode="_generateId">
        <xsl:variable name="parts">
            <xsl:text>Alert</xsl:text>
            <xsl:value-of select="alert_type/@displayName"/>
            <xsl:value-of select="alert_naam/@displayName"/>
            <xsl:if test="begin_datum_tijd/@value">
                <xsl:value-of select="concat('start datum', begin_datum_tijd/@value)"/>
            </xsl:if>
            <xsl:if test="eind_datum_tijd/@value">
                <xsl:value-of select="concat('eind datum', eind_datum_tijd/@value)"/>
            </xsl:if>
            <xsl:value-of select="toelichting/@value"/>
        </xsl:variable>
        <xsl:value-of select="substring(replace(string-join($parts, '-'), '[^A-Za-z0-9-.]', ''), 1, 64)"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="alert" mode="_generateDisplay">
        <xsl:variable name="parts">
            <xsl:text>Alert</xsl:text>
            <xsl:value-of select="alert_type/@displayName"/>
            <xsl:value-of select="alert_naam/@displayName"/>
            <xsl:value-of select="concat(waarneming_gebruik/hoeveelheid/@value, waarneming_gebruik/hoeveelheid/@unit)"/>
            <xsl:if test="begin_datum_tijd/@value">
                <xsl:value-of select="concat('start datum', begin_datum_tijd/@value)"/>
            </xsl:if>
            <xsl:if test="eind_datum_tijd/@value">
                <xsl:value-of select="concat('eind datum', eind_datum_tijd/@value)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ', ')"/>     
    </xsl:template>
</xsl:stylesheet>
