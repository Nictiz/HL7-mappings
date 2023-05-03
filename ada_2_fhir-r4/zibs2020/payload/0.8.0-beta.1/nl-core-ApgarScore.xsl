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
    xmlns:local="urn:fhir:stu3:functions" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada apgar_score to FHIR Observation conforming to profiles nl-core-ApgarScore-1Minute, nl-core-ApgarScore-5Minute and nl-core-ApgarScore-10Minute</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create an nl-core-ApgarScore instance as an Observation FHIR instance from ada apgar_score element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
        <xd:param name="profile">Optional string that represents the profile of which a FHIR resource should be created. Defaults to 'nl-core-ApgarScore-1Minute'.</xd:param>
    </xd:doc>
    <xsl:template match="apgar_score" name="nl-core-ApgarScore" mode="nl-core-ApgarScore" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="profile" select="'nl-core-ApgarScore-1Minute'" as="xs:string"/>
        
        <xsl:variable name="apgarScoreCode">
            <xsl:choose>
                <xsl:when test="$profile = 'nl-core-ApgarScore-1Minute'">
                    <xsl:value-of select="'9272-6'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-5Minute'">
                    <xsl:value-of select="'9274-2'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-10Minute'">
                    <xsl:value-of select="'9271-8'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apgarScoreCodeDisplay">
            <xsl:choose>
                <xsl:when test="$profile = 'nl-core-ApgarScore-1Minute'">
                    <xsl:value-of select="'1 minute Apgar Score'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-5Minute'">
                    <xsl:value-of select="'5 minute Apgar Score'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-10Minute'">
                    <xsl:value-of select="'10 minute Apgar Score'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apgarRespiratoryScoreCode">
            <xsl:choose>
                <xsl:when test="$profile = 'nl-core-ApgarScore-1Minute'">
                    <xsl:value-of select="'32410-3'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-5Minute'">
                    <xsl:value-of select="'32415-2'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-10Minute'">
                    <xsl:value-of select="'32405-3'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apgarRespiratoryScoreCodeDisplay">
            <xsl:choose>
                <xsl:when test="$profile = 'nl-core-ApgarScore-1Minute'">
                    <xsl:value-of select="'1 minute Apgar Respiratory effort'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-5Minute'">
                    <xsl:value-of select="'5 minute Apgar Respiratory effort'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-10Minute'">
                    <xsl:value-of select="'10 minute Apgar Respiratory effort'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apgarAppearanceScoreCode">
            <xsl:choose>
                <xsl:when test="$profile = 'nl-core-ApgarScore-1Minute'">
                    <xsl:value-of select="'32406-1'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-5Minute'">
                    <xsl:value-of select="'32411-1'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-10Minute'">
                    <xsl:value-of select="'32401-2'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apgarAppearanceScoreCodeDisplay">
            <xsl:choose>
                <xsl:when test="$profile = 'nl-core-ApgarScore-1Minute'">
                    <xsl:value-of select="'1 minute Apgar Color'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-5Minute'">
                    <xsl:value-of select="'5 minute Apgar Color'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-10Minute'">
                    <xsl:value-of select="'10 minute Apgar Color'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apgarPulseScoreCode">
            <xsl:choose>
                <xsl:when test="$profile = 'nl-core-ApgarScore-1Minute'">
                    <xsl:value-of select="'32407-9'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-5Minute'">
                    <xsl:value-of select="'32412-9'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-10Minute'">
                    <xsl:value-of select="'32402-0'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apgarPulseScoreCodeDisplay">
            <xsl:choose>
                <xsl:when test="$profile = 'nl-core-ApgarScore-1Minute'">
                    <xsl:value-of select="'1 minute Apgar Heart rate'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-5Minute'">
                    <xsl:value-of select="'5 minute Apgar Heart rate'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-10Minute'">
                    <xsl:value-of select="'10 minute Apgar Heart rate'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apgarGrimaceScoreCode">
            <xsl:choose>
                <xsl:when test="$profile = 'nl-core-ApgarScore-1Minute'">
                    <xsl:value-of select="'32409-5'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-5Minute'">
                    <xsl:value-of select="'32414-5'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-10Minute'">
                    <xsl:value-of select="'32404-6'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apgarGrimaceScoreCodeDisplay">
            <xsl:choose>
                <xsl:when test="$profile = 'nl-core-ApgarScore-1Minute'">
                    <xsl:value-of select="'1 minute Apgar Reflex irritability'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-5Minute'">
                    <xsl:value-of select="'5 minute Apgar Reflex irritability'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-10Minute'">
                    <xsl:value-of select="'10 minute Apgar Reflex irritability'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apgarMuscleToneScoreCode">
            <xsl:choose>
                <xsl:when test="$profile = 'nl-core-ApgarScore-1Minute'">
                    <xsl:value-of select="'32408-7'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-5Minute'">
                    <xsl:value-of select="'32413-7'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-10Minute'">
                    <xsl:value-of select="'32403-8'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apgarMuscleToneScoreCodeDisplay">
            <xsl:choose>
                <xsl:when test="$profile = 'nl-core-ApgarScore-1Minute'">
                    <xsl:value-of select="'1 minute Apgar Muscle tone'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-5Minute'">
                    <xsl:value-of select="'5 minute Apgar Muscle tone'"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-ApgarScore-10Minute'">
                    <xsl:value-of select="'10 minute Apgar Muscle tone'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:for-each select="$in">
            <Observation>                
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profile"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/{$profile}"/>
                </meta>
                
                <status value="final"/>
                
                <code>
                    <coding>
                        <system value="http://loinc.org"/>
                        <code value="{$apgarScoreCode}"/>
                        <display value="{$apgarScoreCodeDisplay}"/>
                    </coding>
                </code>
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                
                <xsl:for-each select="apgar_score_datum_tijd">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
                </xsl:for-each>
                
                <xsl:for-each select="apgar_score_totaal">
                    <valueInteger>
                        <xsl:attribute name="value">
                            <xsl:value-of select="@value"/>
                        </xsl:attribute>
                    </valueInteger>
                </xsl:for-each>
                
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </text>
                    </note>
                </xsl:for-each>
                
                <xsl:for-each select="ademhaling_score">
                    <component>
                        <code>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="{$apgarRespiratoryScoreCode}"/>
                                <display value="{$apgarRespiratoryScoreCodeDisplay}"/>
                            </coding>
                        </code>
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </component>
                </xsl:for-each>
                
                <xsl:for-each select="huidskleur_score">
                    <component>
                        <code>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="{$apgarAppearanceScoreCode}"/>
                                <display value="{$apgarAppearanceScoreCodeDisplay}"/>
                            </coding>
                        </code>
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </component>
                </xsl:for-each>
                
                <xsl:for-each select="hartslag_score">
                    <component>
                        <code>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="{$apgarPulseScoreCode}"/>
                                <display value="{$apgarPulseScoreCodeDisplay}"/>
                            </coding>
                        </code>
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </component>
                </xsl:for-each>
                
                <xsl:for-each select="reflexen_score">
                    <component>
                        <code>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="{$apgarGrimaceScoreCode}"/>
                                <display value="{$apgarGrimaceScoreCodeDisplay}"/>
                            </coding>
                        </code>
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </component>
                </xsl:for-each>
                
                <xsl:for-each select="spierspanning_score">
                    <component>
                        <code>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="{$apgarMuscleToneScoreCode}"/>
                                <display value="{$apgarMuscleToneScoreCodeDisplay}"/>
                            </coding>
                        </code>
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </component>
                </xsl:for-each>                
            </Observation>
        </xsl:for-each>
    </xsl:template>
        
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="apgar_score" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Apgar score observation</xsl:text>
            <xsl:if test="apgar_score_datum_tijd[@value]">
                <xsl:value-of select="concat('measurement date ', apgar_score_datum_tijd/@value)"/>
            </xsl:if>
            <xsl:if test="apgar_score_totaal[@value]">
                <xsl:value-of select="concat('score ', apgar_score_totaal/@value)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
</xsl:stylesheet>