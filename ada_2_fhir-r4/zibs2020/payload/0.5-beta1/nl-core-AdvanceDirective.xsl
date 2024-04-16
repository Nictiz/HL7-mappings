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
        <xd:desc>Converts ada wilsverklaring to FHIR Consent resource conforming to profile nl-core-AdvanceDirective.</xd:desc>
    </xd:doc>
    
    <xsl:variable name="profileNameAdvanceDirective">nl-core-AdvanceDirective</xsl:variable>
    
    <xd:doc>
        <xd:desc>Converts ada wilsverklaring to FHIR Consent resource conforming to profile nl-core-AdvanceDirective.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wilsverklaring" name="nl-core-AdvanceDirective" mode="nl-core-AdvanceDirective" as="element(f:Consent)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="disorder" select="aandoening/probleem" as="element()?"/>
        <xsl:param name="representative" select="vertegenwoordiger/contactpersoon" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Consent>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameAdvanceDirective"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <xsl:for-each select="$disorder">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-AdvanceDirective.Disorder">
                        <valueReference>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="$disorder"/>
                            </xsl:call-template>
                        </valueReference>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="toelichting">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-Comment">
                        <valueString>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueString>
                    </extension>
                </xsl:for-each>
                <status value="active"/>
                <scope>
                    <coding>
                        <system value="http://terminology.hl7.org/CodeSystem/consentscope"/>
                        <code value="adr"/>
                        <display value="Advanced Care Directive"/>
                    </coding>
                </scope>
                <category>
                    <coding>
                        <system value="http://terminology.hl7.org/CodeSystem/consentcategorycodes"/>
                        <code value="acd"/>
                        <display value="Advance Directive"/>
                    </coding>
                </category>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'patient'"/>
                </xsl:call-template>
                <xsl:for-each select="wilsverklaring_datum">
                    <dateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </dateTime>
                </xsl:for-each>
                <xsl:for-each select="wilsverklaring_document">
                    <sourceAttachment>
                        <!-- Needed to satisfy constraint att-1. 'application/octet-stream' is basically 'unknown' ('arbitrary binary data') -->
                        <contentType value="application/octet-stream"/>
                        <data value="{@value}"/>
                    </sourceAttachment>
                </xsl:for-each>
                <policy>
                    <uri value="https://wetten.overheid.nl/"/>
                </policy>
                <xsl:if test="wilsverklaring_type or $representative">
                    <provision>
                        <xsl:for-each select="$representative">
                            <actor>
                                <role>
                                    <coding>
                                        <system value="http://terminology.hl7.org/CodeSystem/v3-RoleCode"/>
                                        <code value="RESPRSN"/>
                                        <display value="responsible party"/>
                                    </coding>
                                </role>
                                <reference>
                                    <xsl:call-template name="makeReference">
                                        <xsl:with-param name="in" select="$representative"/>
                                    </xsl:call-template>
                                </reference>
                            </actor>
                        </xsl:for-each>
                        <xsl:for-each select="wilsverklaring_type">
                            <code>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </code>
                        </xsl:for-each>
                    </provision>
                </xsl:if>
            </Consent>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="wilsverklaring" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Wilsverklaring</xsl:text>
            <xsl:value-of select="wilsverklaring_type/@displayName"/>
            <xsl:value-of select="wilsverklaring_datum/@value"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
    
</xsl:stylesheet>