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
        <xd:desc>Converts ADA brandwond to FHIR Condition resource conforming to profile nl-core-Burnwound, and Observation and DocumentReference resources conforming to the profiles for the different wound characteristics, alle grouped using an Observation conforming to profile nl-core-wounds.WoundCharacteristics.</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Entry template for ADA brandwond. Creates the nl-core-Burnwound instance plus all relevant Observation resources for the wound characteristics.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="brandwond" name="nl-core-Burnwound" mode="nl-core-Burnwound" as="element()+">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>

        <xsl:for-each select="$in">
            <xsl:call-template name="_nl-core-Burnwound">
                <xsl:with-param name="subject" select="$subject"/>
            </xsl:call-template>
            <xsl:if test="$in[uitgebreidheid/@value or datum_laatste_verbandwissel/@value]">
                <xsl:call-template name="nl-core-wounds.WoundCharacteristics">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-Burnwound instance as a Condition FHIR instance from ADA brandwond element. This template is marked as 'internal' with an underscore for the name and mode, because it is not the entry point for the transformation of the ADA brandwond element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="brandwond" name="_nl-core-Burnwound" mode="_nl-core-Burnwound" as="element(f:Condition)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Condition>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile">nl-core-Burnwound</xsl:with-param>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>                
                <category>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="125666000"/>
                        <display value="Burn"/>
                    </coding>
                </category>
                <xsl:for-each select="brandwond_soort">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </code>
                </xsl:for-each>

                <!-- Zib Burnwound contains a bug where Laterality is still defined as a separate concept, while it is
                     also present in zib AnatomicalLocation, so we have to account for the situation where Location is
                     present as part of AnatomicalLocation and where Location is seperate. -->
                <xsl:if test=".[anatomische_locatie or lateraliteit]">
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
                        <xsl:for-each select="anatomische_locatie">
                            <xsl:call-template name="nl-core-AnatomicalLocation"/>
                        </xsl:for-each>
                    </bodySite>
                </xsl:if>

                <xsl:for-each select="$subject">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$subject"/>
                        <xsl:with-param name="wrapIn" select="'subject'"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="ontstaans_datum">
                    <onsetDateTime>
                        <xsl:call-template name="date-to-datetime"/>
                    </onsetDateTime>
                </xsl:for-each>
                <xsl:for-each select="dieptegraad">
                    <stage>
                        <summary>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </summary>
                    </stage>
                </xsl:for-each>
                <xsl:if test="$in[uitgebreidheid/@value or datum_laatste_verbandwissel/@value]">
                    <evidence>
                        <detail>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="profile">nl-core-wounds.WoundCharacteristics</xsl:with-param>
                            </xsl:call-template>
                        </detail>
                    </evidence>
                </xsl:if>
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </text>
                    </note>
                </xsl:for-each>
            </Condition>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-Burnwound.Extent instance as an Observation FHIR instance from ADA uitgebreidheid element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="uitgebreidheid[parent::brandwond]" name="nl-core-Burnwound.Extent" mode="nl-core-Burnwound.Extent" as="element(f:Observation)?">
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
                        <code value="360531000146101"/>
                        <display value="Extent of burn"/>
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

    <xsl:template match="uitgebreidheid[parent::brandwond]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Extent of burn</xsl:text>
            <xsl:if test=".[@value and @unit]">
                <xsl:value-of select="concat(./@value, ' ', ./@unit)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
</xsl:stylesheet>