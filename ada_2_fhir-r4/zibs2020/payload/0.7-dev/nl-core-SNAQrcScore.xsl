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
        <xd:desc>Converts ada snaqrc_score to FHIR Observation conforming to profile nl-core-SNAQrcScore</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create an nl-core-SNAQrcScore instance as an Observation FHIR instance from ada snaqrc_score element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="patient">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="snaqrc_score" name="nl-core-SNAQrcScore" mode="nl-core-SNAQrcScore" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-SNAQrcScore'"/>
                </xsl:call-template>
                
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-SNAQrcScore"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="108311000146106"/>
                        <display value="Short Nutritional Questionnaire for residential care"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="snaqrc_score_datum_tijd">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
                </xsl:for-each>
                <xsl:for-each select="totaal_score">
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
                <xsl:for-each select="gewichtsverlies_score">
                    <component>
                        <code>
                            <coding>
                                <system value="urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1"/>
                                <code value="4029003"/>
                                <display value="SNAQrcScore GewichtsverliesScore"/>
                            </coding>
                        </code>
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </component>
                </xsl:for-each>
                <xsl:for-each select="eetlust_score">
                    <component>
                        <code>
                            <coding>
                                <system value="urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1"/>
                                <code value="4029004"/>
                                <display value="SNAQrcScore EetlustScore"/>
                            </coding>
                        </code>
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </component>
                </xsl:for-each>
                <xsl:for-each select="bmiscore">
                    <component>
                        <code>
                            <coding>
                                <system value="urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1"/>
                                <code value="4029005"/>
                                <display value="SNAQrcScore BMIScore"/>
                            </coding>
                        </code>
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </component>
                </xsl:for-each>
                <xsl:for-each select="hulp_bij_eten">
                    <component>
                        <code>
                            <coding>
                                <system value="urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1"/>
                                <code value="4029008"/>
                                <display value="SNAQrcScore HulpBijEten"/>
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
</xsl:stylesheet>