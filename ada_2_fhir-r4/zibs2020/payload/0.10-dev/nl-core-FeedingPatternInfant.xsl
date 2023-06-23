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
        <xd:desc>Converts ada voedingspatroon_zuigeling to FHIR Observation conforming to profile nl-core-FeedingPatternInfant</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create an nl-core-FeedingPatternInfant instance as an Observation FHIR instance from ada voedingspatroon_zuigeling element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="patient">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="voedingspatroon_zuigeling" name="nl-core-FeedingPatternInfant" mode="nl-core-FeedingPatternInfant" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-FeedingPatternInfant"/>
                </meta>
                
                <xsl:for-each select="voedingsadvies">
                    <basedOn>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="voedingsadvies"/>
                            <xsl:with-param name="profile" select="'nl-core-NutritionAdvice'"/>
                        </xsl:call-template>
                    </basedOn>
                </xsl:for-each>
                
                <status value="final"/>
                
                <code>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="289145007"/>
                        <display value="bevinding betreffende voedingspatroon van zuigeling"/>
                    </coding>
                </code>
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                
                <xsl:for-each select="voedingspatroon_zuigeling_datum_tijd">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
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
                
                <xsl:for-each select="voeding_toevoeging">
                    <component>
                        <code>
                            <coding>
                                <system value="http://snomed.info/sct"/>
                                <code value="373453009"/>
                                <display value="voedingssupplement"/>
                            </coding>
                        </code>
                        <valueString>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueString>
                    </component>
                </xsl:for-each>
                
                <xsl:for-each select="voeding_frequentie">
                    <component>
                        <code>
                            <coding>
                                <system value="http://snomed.info/sct"/>
                                <code value="364653007"/>
                                <display value="frequentie van voeding van zuigeling"/>
                            </coding>
                        </code>
                        <valueString>
                            <xsl:call-template name="hoeveelheid-to-Quantity">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueString>
                    </component>
                </xsl:for-each>
                
                <xsl:for-each select="voeding">
                    <component>
                        <xsl:for-each select="voeding_methode">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-FeedingPatternInfant.FeedingMethod">
                                <valueCodeableConcept>
                                    <xsl:call-template name="code-to-CodeableConcept">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueCodeableConcept>
                            </extension>
                        </xsl:for-each>
                        
                        <code>
                            <coding>
                                <system value="http://snomed.info/sct"/>
                                <code value="109021000146107"/>
                                <display value="soort zuigelingenvoeding"/>
                            </coding>
                        </code>
                        
                        <xsl:for-each select="voeding_soort">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </xsl:for-each>
                    </component>
                </xsl:for-each>
            </Observation>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>