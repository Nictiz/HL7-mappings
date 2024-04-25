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
        <xd:desc>TODO</xd:desc>
    </xd:doc>
        
    <xd:doc>
        <xd:desc>TODO</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="(brandwond | decubitus_wond | wond)[wond_weefsel/@value or wond_infectie/@value or wond_vochtigheid/@value or wond_rand/@value or wondlengte/@value or wondbreedte/@value or wonddiepte/@value or datum_laatste_verbandwissel/@value]" name="nl-core-wounds.WoundCharacteristics" mode="nl-core-wounds.WoundCharacteristics" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile">nl-core-wounds.WoundCharacteristics</xsl:with-param>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundLength"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="225552003"/>
                        <display value="bevinding betreffende verwonding"/>
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
        <xd:desc>TODO</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wondlengte" name="nl-core-wounds.WoundLength" mode="nl-core-wounds.WoundLength" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundLength"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="http://loinc.org"/>
                        <code value="39126-8"/>
                        <display value="Lengte [afmeting] in wond"/>
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
        <xd:desc>TODO</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wondbreedte" name="nl-core-wounds.WoundWidth" mode="nl-core-wounds.WoundWidth" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundWidth"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="http://loinc.org"/>
                        <code value="39125-0"/>
                        <display value="Breedte [afmeting] in wond"/>
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
        <xd:desc>TODO</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wonddiepte" name="nl-core-wounds.WoundDepth" mode="nl-core-wounds.WoundDepth" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundDepth"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="http://loinc.org"/>
                        <code value="39127-6"/>
                        <display value="Diepte [afmeting] in wond"/>
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
        <xd:desc>TODO</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="datum_laatste_verbandwissel" name="nl-core-wounds.DateOfLastDressingChange" mode="nl-core-wounds.DateOfLastDressingChange" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.DateOfLastDressingChange"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="360541000146109-6"/>
                        <display value="datum van laatste verbandwissel"/>
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
        <xd:desc>TODO</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wond_foto" name="nl-core-wounds.WoundImage" mode="nl-core-wounds.WoundImage" as="element(f:DocumentReference)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <DocumentReference>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundImage"/>
                </meta>
                <status value="current"/>
                <type>
                    <coding>
                        <code>
                            <system value="http://loinc.org"/>
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
        <xsl:text>Bevinding betreffende verwonding</xsl:text>
    </xsl:template>

    <xsl:template match="wondlengte" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Wondlengte</xsl:text>
            <xsl:if test=".[@value and @unit]">
                <xsl:value-of select="concat(./@value, ' ', ./@unit)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>

    <xsl:template match="wondbreedte" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Wondbreedte</xsl:text>
            <xsl:if test=".[@value and @unit]">
                <xsl:value-of select="concat(./@value, ' ', ./@unit)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>

    <xsl:template match="wonddiepte" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Wonddiepte</xsl:text>
            <xsl:if test=".[@value and @unit]">
                <xsl:value-of select="concat(./@value, ' ', ./@unit)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>

    <xsl:template match="datum_laatste_verbandwissel" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Datum laatste verbandwissel</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@value"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>

    <xsl:template match="wond_foto" mode="_generateDisplay">
        <xsl:text>Wondfoto</xsl:text>
    </xsl:template>
</xsl:stylesheet>