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
        <xd:desc>Helper stylesheet for the common components in zibs Burnwound, PressureUlcer and Wound. Converts ADA instances for these common components to the FHIR Observation and FHIR DocumentReference resources conforming to their respective profiles, and groups them in an Observation conforming to profile nl-core-wounds.WoundCharacteristics.</xd:desc>
    </xd:doc>

    <xsl:variable name="profileNameWoundCharacteristics">nl-core-wounds.WoundCharacteristics</xsl:variable>
    <xd:doc>
        <xd:desc>Creates an nl-core-wounds.WoundCharacteristics instance as an Observation FHIR instance from ADA brandwond, decubitus_wond or wond elements, if they contain characteristics that need to be expressed as Observations or DocumentReference resources.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="(brandwond | decubitus_wond | wond)[wond_weefsel/@value or wond_infectie/@value or wond_vochtigheid/@value or wond_rand/@value or wondlengte/@value or wondbreedte/@value or wonddiepte/@value or datum_laatste_verbandwissel/@value]" name="nl-core-wounds.WoundCharacteristics" mode="nl-core-wounds.WoundCharacteristics" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameWoundCharacteristics"/>
                </xsl:call-template>
                <meta>
                    <profile value="{concat($urlBaseNictizProfile, $profileNameWoundCharacteristics)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="225552003"/>
                        <display value="Wound finding"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="./(wond_weefsel, wond_infectie, wond_vochtigheid, wond_rand, wondlengte, wondbreedte, wonddiepte, datum_laatste_verbandwissel, uitgebreidheid)">
                    <hasMember>
                        <xsl:call-template name="makeReference"/>
                    </hasMember>
                </xsl:for-each>
            </Observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-wounds.WoundLength instance as an Observation FHIR instance from ADA wondlengte element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wondlengte[parent::decubitus_wond or parent::wond]" name="nl-core-wounds.WoundLength" mode="nl-core-wounds.WoundLength" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidLOINC]/@uri}"/>
                        <code value="39126-8"/>
                        <display value="Length of Wound"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <valueQuantity>
                    <xsl:call-template name="hoeveelheid-to-Quantity"/>
                </valueQuantity>
            </Observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-wounds.WoundWidth instance as an Observation FHIR instance from ADA wondbreedte element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wondbreedte[parent::decubitus_wond or parent::wond]" name="nl-core-wounds.WoundWidth" mode="nl-core-wounds.WoundWidth" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidLOINC]/@uri}"/>
                        <code value="39125-0"/>
                        <display value="Width of Wound"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <valueQuantity>
                    <xsl:call-template name="hoeveelheid-to-Quantity"/>
                </valueQuantity>
            </Observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-wounds.WoundDepth instance as an Observation FHIR instance from ADA wonddiepte element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wonddiepte[parent::decubitus_wond or parent::wond]" name="nl-core-wounds.WoundDepth" mode="nl-core-wounds.WoundDepth" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidLOINC]/@uri}"/>
                        <code value="39127-6"/>
                        <display value="Depth of Wound"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <valueQuantity>
                    <xsl:call-template name="hoeveelheid-to-Quantity"/>
                </valueQuantity>
            </Observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-wounds.DateOfLastDressingChange instance as an Observation FHIR instance from ADA datum_laatste_verbandwissel element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="datum_laatste_verbandwissel[parent::brandwond or parent::decubitus_wond or parent::wond]" name="nl-core-wounds.DateOfLastDressingChange" mode="nl-core-wounds.DateOfLastDressingChange" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="360541000146109"/>
                        <display value="Date of last change of wound dressing"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <valueDateTime>
                    <xsl:call-template name="date-to-datetime"/>
                </valueDateTime>
            </Observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-wounds.WoundImage instance as a DocumentReference FHIR instance from ADA wond_foto element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wond_foto[parent::brandwond or parent::decubitus_wond or parent::wond]" name="nl-core-wounds.WoundImage" mode="nl-core-wounds.WoundImage" as="element(f:DocumentReference)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <DocumentReference>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="current"/>
                <type>
                    <coding>
                        <code>
                            <system value="{$oidMap[@oid=$oidLOINC]/@uri}"/>
                            <code value="72170-4"/>
                            <display value="Photographic image"/>
                        </code>
                    </coding>
                </type>
                <content>
                    <attachment>
                        <xsl:call-template name="blob-to-attachment"/>
                    </attachment>
                </content>
                <context>
                    <related>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="parent::*"/>
                            <xsl:with-param name="profile">nl-core-wounds.WoundCharacteristics</xsl:with-param>
                        </xsl:call-template>
                    </related>
                </context>
            </DocumentReference>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="(brandwond | decubitus_wond | wond)[wond_weefsel/@value or wond_infectie/@value or wond_vochtigheid/@value or wond_rand/@value or wondlengte/@value or wondbreedte/@value or wonddiepte/@value or datum_laatste_verbandwissel/@value]"  mode="_generateDisplay">
        <xsl:text>Wound finding</xsl:text>
    </xsl:template>

    <xsl:template match="wondlengte" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Wound length</xsl:text>
            <xsl:if test=".[@value and @unit]">
                <xsl:value-of select="concat(./@value, ' ', ./@unit)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>

    <xsl:template match="wondbreedte" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Wound width</xsl:text>
            <xsl:if test=".[@value and @unit]">
                <xsl:value-of select="concat(./@value, ' ', ./@unit)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>

    <xsl:template match="wonddiepte" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Wound depth</xsl:text>
            <xsl:if test=".[@value and @unit]">
                <xsl:value-of select="concat(./@value, ' ', ./@unit)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>

    <xsl:template match="datum_laatste_verbandwissel" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Date of last dressing change</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@value"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>

    <xsl:template match="wond_foto" mode="_generateDisplay">
        <xsl:text>Wound image</xsl:text>
    </xsl:template>
</xsl:stylesheet>