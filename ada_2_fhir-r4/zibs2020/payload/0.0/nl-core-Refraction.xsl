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
        <xd:desc>Converts ada Refraction to FHIR Observation conforming to profile nl-core-Refraction</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Unwrap refractie_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="refractie_registratie">
        <xsl:apply-templates select="refractie" mode="nl-core-Refraction"/><!-- Vul hier de juiste elementnamen en mode in -->
    </xsl:template>

    <xsl:template match="refractie" name="nl-core-Refraction" mode="nl-core-Refraction">
        <Observation>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Refraction"/>
            </meta>
            <status value="final"/>
            <code>
                <coding>
                    <system value="http://snomed.info/sct"/>
                    <code value="251718005"/>
                    <display value="Refractive power (observable entity)"/>
                </coding>
            </code>
            
            <xsl:for-each select="refractie_datum_tijd">
                <effectiveDateTime>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2FHIRDate">
                            <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </effectiveDateTime>
            </xsl:for-each>
            
            <xsl:for-each select="anatomische_locatie[lateraliteit]">
                <bodySite>
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-AnatomicalLocation.Laterality">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="lateraliteit"/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                    
                    <!-- TODO: Should this default to "eye" -->
                    <xsl:if test=".[@value]">
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:if>
                </bodySite>
            </xsl:for-each>
            
            <xsl:for-each select="refractie_meet_methode">
                <method>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </method>
            </xsl:for-each>
            
            <xsl:for-each select="cilindrische_refractie">
                <xsl:for-each select="cilindrische_refractie_waarde">
                    <xsl:call-template name="_refractionComponent">
                        <xsl:with-param name="snomedCode">251797004</xsl:with-param>
                        <xsl:with-param name="snomedDisplay">Power of cylinder</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="cilindrische_refractie_as">
                    <xsl:call-template name="_refractionComponent">
                        <xsl:with-param name="snomedCode">251799001</xsl:with-param>
                        <xsl:with-param name="snomedDisplay">Axis of cylinder</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:for-each>

            <xsl:for-each select="prisma">
                <xsl:for-each select="prisma_waarde">
                    <xsl:call-template name="_refractionComponent">
                        <xsl:with-param name="snomedCode">251762001</xsl:with-param>
                        <xsl:with-param name="snomedDisplay">Prism power</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="prisma_basis">
                    <xsl:call-template name="_refractionComponent">
                        <xsl:with-param name="snomedCode">246223004</xsl:with-param>
                        <xsl:with-param name="snomedDisplay">Prism base direction</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:for-each>
            
            <xsl:for-each select="sferische_refractie">
                <xsl:for-each select="sferische_refractie_waarde">
                    <xsl:call-template name="_refractionComponent">
                        <xsl:with-param name="snomedCode">251795007</xsl:with-param>
                        <xsl:with-param name="snomedDisplay">Power of sphere</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="sferisch_equivalent">
                    <xsl:call-template name="_refractionComponent">
                        <xsl:with-param name="snomedCode">112881000146107</xsl:with-param>
                        <xsl:with-param name="snomedDisplay">Spherical equivalent</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:for-each>
            
            <xsl:for-each select="lees_additie">
                <xsl:call-template name="_refractionComponent">
                    <xsl:with-param name="snomedCode">251718005</xsl:with-param>
                    <xsl:with-param name="snomedDisplay">Refractive power</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </Observation>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Helper template to create an Observation.component with the specified SNOMED code and the context translated to valueQuantity.</xd:desc>
    </xd:doc>
    <xsl:template name="_refractionComponent">
        <xsl:param name="snomedCode"/>
        <xsl:param name="snomedDisplay"/>
        <component>
            <code>
                <coding>
                    <system value="http://snomed.info/sct"/>
                    <code value="{$snomedCode}"/>
                    <display value="{$snomedDisplay}"/>
                </coding>
            </code>
            <valueQuantity>
                <value value="{@value}"/>
                <unit value="{@unit}"/>
                <system value="http://unitsofmeasure.org"/>
                <code value="{nf:convert_ADA_unit2UCUM_FHIR(@unit)}"/>
            </valueQuantity>
        </component>
    </xsl:template>
</xsl:stylesheet>
