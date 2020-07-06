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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    xmlns:local="urn:fhir:stu3:functions"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>-->
    
    <xsl:variable name="code-specification" select="'http://nictiz.nl/fhir/StructureDefinition/code-specification'"/>
    
    <xsl:template match="f:telecom" mode="nl-core-contactpoint-1.0">
        <xsl:choose>
            <xsl:when test="not(preceding-sibling::f:telecom)">
                <contactgegevens>
                    <xsl:if test="(.|following-sibling::f:telecom)/f:system/@value = 'phone'">
                        <xsl:for-each select="(.|following-sibling::f:telecom)[f:system/@value = 'phone']">
                            <telefoonnummers>
                                <telefoonnummer value="{f:value/@value}"/>
                                <xsl:if test="f:use/@value = 'mobile' or f:system/f:extension[@url = $code-specification]">
                                    <xsl:choose>
                                        <!-- 'old' situation -->
                                        <xsl:when test="f:use/@value = 'mobile' and not(f:system/f:extension[@url = $code-specification])">
                                            <telecom_type code="MC" codeSystem="2.16.840.1.113883.5.1119" codeSystemName="HL7 AddressUse" displayName="Mobile Phone"/>
                                        </xsl:when>
                                        <!-- 'new' situation -->
                                        <xsl:when test="f:system/f:extension[@url = $code-specification]">
                                            <xsl:call-template name="CodeableConcept-to-code">
                                                <xsl:with-param name="in" select="f:system/f:extension[@url = $code-specification]/f:valueCodeableConcept"/>
                                                <xsl:with-param name="adaElementName">telecom_type</xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:if>
                                <xsl:choose>
                                    <!-- 'old' situation -->
                                    <xsl:when test="f:use[not(@value = 'mobile') and not(f:extension/@url = $code-specification)]">
                                        <nummer_soort>
                                            <xsl:call-template name="code-to-code">
                                                <xsl:with-param name="value" select="f:use/@value"/>
                                                <xsl:with-param name="codeMap" as="element()*">
                                                    <map inValue="home" code="HP" codeSystem="2.16.840.1.113883.5.1119" displayName="Telefoonnummer thuis"/>
                                                    <map inValue="temp" code="TMP" codeSystem="2.16.840.1.113883.5.1119" displayName="Tijdelijk telefoonnummer"/>
                                                    <map inValue="work" code="WP" codeSystem="2.16.840.1.113883.5.1119" displayName="Zakelijk telefoonnummer"/>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </nummer_soort>
                                    </xsl:when>
                                    <!-- 'new' situation -->
                                    <xsl:when test="f:use/f:extension/@url = $code-specification">
                                        <xsl:call-template name="CodeableConcept-to-code">
                                            <xsl:with-param name="in" select="f:use/f:extension[@url = $code-specification]/f:valueCodeableConcept"/>
                                            <xsl:with-param name="adaElementName">nummer_soort</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:when>
                                </xsl:choose>
                            </telefoonnummers>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="(.|following-sibling::f:telecom)/f:system/@value = 'email'">
                        <xsl:for-each select="(.|following-sibling::f:telecom)[f:system/@value = 'email']">
                            <email_adressen>
                                <email_adres value="{f:value/@value}"/>
                                <!-- unclear where exactly the extension is located because of profiling error -->
                                <xsl:if test="(f:system|f:use)/f:extension[@url = $code-specification]">
                                    <xsl:call-template name="CodeableConcept-to-code">
                                        <xsl:with-param name="in" select="((f:system|f:use)/f:extension[@url = $code-specification]/f:valueCodeableConcept)[1]"/>
                                        <xsl:with-param name="adaElementName">email_soort</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:if>
                            </email_adressen>
                        </xsl:for-each>
                    </xsl:if>
                </contactgegevens>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>