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
        <xd:desc>Converts ada gezinssituatie to FHIR Observation conforming to profile nl-core-FamilySituation</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create an nl-core-FamilySituation instance as an Observation FHIR instance from ada gezinssituatie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="gezinssituatie" name="nl-core-FamilySituation" mode="nl-core-FamilySituation" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <!-- Reference to burgerlijke_staat is handled by including it in the Patient -->
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-FamilySituation"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="365470003"/>
                        <display value="bevinding betreffende gegevens over gezin en gezinssamenstelling"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="toelichting_gezinssituatie">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </text>
                    </note>
                </xsl:for-each>
                <xsl:for-each select="gezinssamenstelling">
                    <component>
                        <code>
                            <coding>
                                <system value="http://snomed.info/sct"/>
                                <code value="224130005"/>
                                <display value="gezinssamenstelling"/>
                            </coding>
                        </code>
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </component>
                </xsl:for-each>
                <xsl:for-each select="aantal_kinderen">
                    <component>
                        <code>
                            <coding>
                                <system value="http://snomed.info/sct"/>
                                <code value="224118004"/>
                                <display value="aantal nakomelingen"/>
                            </coding>
                        </code>
                        <valueInteger>
                            <xsl:attribute name="value">
                                <xsl:value-of select="@value"/>
                            </xsl:attribute>
                        </valueInteger>
                    </component>
                </xsl:for-each>
                <xsl:for-each select="aantal_kinderen_inwonend">
                    <component>
                        <code>
                            <coding>
                                <system value="http://snomed.info/sct"/>
                                <code value="55811000146107"/>
                                <display value="	
                                    aantal thuiswonende kinderen"/>
                            </coding>
                        </code>
                        <valueInteger>
                            <xsl:attribute name="value">
                                <xsl:value-of select="@value"/>
                            </xsl:attribute>
                        </valueInteger>
                    </component>
                </xsl:for-each>
                <xsl:for-each select="zorgtaak">
                    <component>
                        <code>
                            <coding>
                                <system value="http://snomed.info/sct"/>
                                <code value="270111000146104"/>
                                <display value="zorgtaken"/>
                            </coding>
                        </code>
                        <valueString>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueString>
                    </component>
                </xsl:for-each>
                <xsl:for-each select="kind">
                    <component>
                        <xsl:for-each select="inwonend">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-FamiliySituation.LivingAtHome">
                                <valueBoolean>
                                    <xsl:call-template name="boolean-to-boolean"/>
                                </valueBoolean>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select="toelichting_kind">
                            <xsl:call-template name="ext-Comment"/>
                        </xsl:for-each>
                        <code>
                            <coding>
                                <system value="http://snomed.info/sct"/>
                                <code value="67822003"/>
                                <display value="kind"/>
                            </coding>
                        </code>
                        <xsl:for-each select="geboortedatum">
                            <valueDateTime>
                                <xsl:call-template name="date-to-datetime">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueDateTime>
                        </xsl:for-each>
                    </component>
                </xsl:for-each>
            </Observation>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>