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
        <xd:desc>Converts ADA decubitus_wond to FHIR Condition resource conforming to profile nl-core-PressureUlcer, and Observation and DocumentReference resources conforming to the profiles for the different wound characteristics, alle grouped using an Observation conforming to profile nl-core-wounds.WoundCharacteristics.</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Entry template for ADA decubitus_wond. Creates the nl-core-PressureUlcer instance plus all relevant Observation resources for the wound characteristics.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="decubitus_wond" name="nl-core-PressureUlcer" mode="nl-core-PressureUlcer" as="element()+">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>

        <xsl:for-each select="$in">
            <xsl:call-template name="_nl-core-PressureUlcer">
                <xsl:with-param name="subject" select="$subject"/>
            </xsl:call-template>
            <xsl:if test="$in[
                wondlengte/@value or
                wondbreedte/@value or
                wonddiepte/@value or
                datum_laatste_verbandwissel/@value]">
                <xsl:call-template name="nl-core-wounds.WoundCharacteristics">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-PressureUlcer instance as a Condition FHIR instance from ADA decubitus_wond element. This template is marked as 'internal' with an underscore for the name and mode, because it is not the entry point for the transformation of the ADA brandwond element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wond" name="_nl-core-PressureUlcer" mode="_nl-core-PressureUlcer" as="element(f:Condition)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Condition>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile">nl-core-PressureUlcer</xsl:with-param>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>                
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="399912005"/>
                        <display value="Pressure ulcer"/>
                    </coding>
                </code>
                <xsl:for-each select="anatomische_locatie">
                    <bodySite>
                        <xsl:call-template name="nl-core-AnatomicalLocation"/>
                    </bodySite>
                </xsl:for-each>
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
                <xsl:for-each select="decubitus_categorie">
                    <stage>
                        <summary>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </summary>
                    </stage>
                </xsl:for-each>
                <xsl:if test="$in[wondlengte/@value or
                    wondbreedte/@value or
                    wonddiepte/@value or
                    datum_laatste_verbandwissel/@value]">
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
</xsl:stylesheet>