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
        <xd:desc>Converts ada visus to FHIR Observation conforming to profile nl-core-VisualAcuity</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a FHIR Observation instance conforming to profile nl-core-VisualAcuity from ada visus element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="visus" name="nl-core-VisualAcuity" mode="nl-core-VisualAcuity" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-VisualAcuity"/>
                </meta>
                <xsl:for-each select="visus_meet_hulpmiddel">
                    <extension url="http://hl7.org/fhir/StructureDefinition/observation-deviceCode">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="16830007"/>
                        <display value="onderzoek van visus"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="visus_datum_tijd">
                    <effectiveDateTime>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </effectiveDateTime>
                </xsl:for-each>
                <xsl:for-each select="decimale_visus_waarde">
                    <valueQuantity>
                        <value value="{@value}"/>
                        <unit value="decimal"/>
                        <system value="http://unitsofmeasure.org"/>
                        <code value="{nf:convert_ADA_unit2UCUM_FHIR('decimal')}"/>
                    </valueQuantity>
                </xsl:for-each>
                <xsl:for-each select="anatomische_locatie[lateraliteit]">
                    <bodySite>
                        <xsl:call-template name="nl-core-AnatomicalLocation"/>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="81745001"/>
                            <display value="structuur van bulbus oculi (lichaamsstructuur)"/>
                        </coding>
                    </bodySite>
                </xsl:for-each>
                <xsl:for-each select="visus_meting_type">
                    <component>
                        <code>
                            <coding>
                                <system value="http://snomed.info/sct"/>
                                <code value="16830007"/>
                                <display value="onderzoek van visus (verrichting)"/>
                            </coding>
                        </code>
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </component>
                </xsl:for-each>
                <xsl:for-each select="visus_meting_kaart">
                    <component>
                        <code>
                            <coding>
                                <system value="http://snomed.info/sct"/>
                                <code value="363691001"/>
                                <display value="verrichting ingedeeld naar hulpmiddel (verrichting)"/>
                            </coding>
                        </code>
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </component>
                </xsl:for-each>
                <xsl:for-each select="afstand_tot_kaart">
                    <component>
                        <code>
                            <coding>
                                <system value="http://snomed.info/sct"/>
                                <code value="152731000146106"/>
                                <display value="distance to visual acuity chart (observable entity)"/>
                            </coding>
                        </code>
                        <valueQuantity>
                            <value value="{@value}"/>
                            <unit value="m"/>
                            <system value="http://unitsofmeasure.org"/>
                            <code value="{nf:convert_ADA_unit2UCUM_FHIR('m')}"/>
                        </valueQuantity>
                    </component>
                </xsl:for-each>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
