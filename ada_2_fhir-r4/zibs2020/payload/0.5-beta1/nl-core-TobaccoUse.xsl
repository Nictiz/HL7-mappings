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
        <xd:desc>Converts ADA tabak_gebruik to FHIR Observation resource conforming to profile nl-core-TobaccoUse.</xd:desc>
    </xd:doc>
    
    <xsl:variable name="profileNameTobaccoUse">nl-core-TobaccoUse</xsl:variable>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-TobaccoUse instance as an Observation FHIR instance from ADA tabak_gebruik element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="tabak_gebruik" name="nl-core-TobaccoUse" mode="nl-core-TobaccoUse" as="element(f:Observation)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameTobaccoUse"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="365980008"/>
                        <display value="bevinding betreffende tabakgebruik en blootstelling aan tabaksrook"/>
                    </coding>
                </code>
                
                <xsl:for-each select="$subject">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$subject"/>
                        <xsl:with-param name="wrapIn" select="'subject'"/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:if test="waarneming_gebruik/start_datum or waarneming_gebruik/stop_datum">
                    <effectivePeriod>
                        <xsl:for-each select="waarneming_gebruik/start_datum">
                            <start>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="@value"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </start>
                        </xsl:for-each>
                        <xsl:for-each select="waarneming_gebruik/stop_datum">
                            <end>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="@value"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </end>
                        </xsl:for-each>
                    </effectivePeriod>
                </xsl:if>
                
                <xsl:for-each select="tabak_gebruik_status">
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </valueCodeableConcept>
                </xsl:for-each>
                
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:attribute name="value" select="./@value"/>
                        </text>
                    </note>
                </xsl:for-each>
                
                <xsl:for-each select="soort_tabak_gebruik">
                    <component>
                        <code>
                            <coding>
                                <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                <code value="53661000146106"/>
                                <!-- There is no NL display in Snomed for this code. -->
                                <display value="Type of tobacco used"/>
                            </coding>
                        </code>
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </valueCodeableConcept>
                    </component>
                </xsl:for-each>
                
                <xsl:for-each select="waarneming_gebruik/hoeveelheid">
                    <component>
                        <code>
                            <coding>
                                <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                <code value="266918002"/>
                                <!-- There is no NL display in Snomed for this code. -->
                                <display value="Tobacco smoking consumption"/>
                            </coding>
                        </code>
                        <valueQuantity>
                            <xsl:call-template name="hoeveelheid-to-Quantity">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueQuantity	>
                    </component>
                </xsl:for-each>
                
                <xsl:for-each select="waarneming_gebruik/pack_years">
                    <component>
                        <code>
                            <coding>
                                <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                <code value="401201003"/>
                                <display value="pakjaren"/>
                            </coding>
                        </code>
                        <valueInteger>
                            <xsl:attribute name="value" select="./@value"/>
                        </valueInteger>
                    </component>
                </xsl:for-each>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="tabak_gebruik" mode="_generateId">
        <xsl:variable name="parts">
            <xsl:text>TobaccoUse</xsl:text>
            <xsl:value-of select="tabak_gebruik_status/@displayName"/>
            <xsl:value-of select="soort_tabak_gebruik/@displayName"/>
            <xsl:value-of select="waarneming_gebruik/start_datum/@value"/>
            <xsl:value-of select="waarneming_gebruik/stop_datum/@value"/>
            <xsl:value-of select="waarneming_gebruik/hoeveelheid/@value"/>
            <xsl:value-of select="waarneming_gebruik/pack_years/@value"/>
            <xsl:value-of select="toelichting/@value"/>
        </xsl:variable>
        <xsl:value-of select="substring(replace(string-join($parts, '-'), '[^A-Za-z0-9-.]', ''), 1, 64)"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="tabak_gebruik" mode="_generateDisplay">
        <xsl:variable name="parts">
            <xsl:text>TobaccoUse observation</xsl:text>
            <xsl:value-of select="soort_tabak_gebruik/@displayName"/>
            <xsl:if test="waarneming_gebruik/start_datum/@value">
                <xsl:value-of select="concat('start datum:', waarneming_gebruik/start_datum/@value)"/>
            </xsl:if>
            <xsl:if test="waarneming_gebruik/stop_datum/@value">
                <xsl:value-of select="concat('stop datum: ', waarneming_gebruik/stop_datum/@value)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ', ')"/>     
    </xsl:template>
</xsl:stylesheet>