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
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>
    <xsl:import href="nl-core-address-2.0.xsl"/>
    <xsl:import href="nl-core-contactpoint-1.0.xsl"/>-->
    
    <xsl:template match="f:Organization" mode="nl-core-organization-2.0">
        <zorgaanbieder>
            <!-- zorgaanbieder_identificatienummer -->
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <!-- organisatie_naam -->
            <xsl:apply-templates select="f:name" mode="#current"/>
            <!-- contactgegevens -->
            <xsl:apply-templates select="f:telecom" mode="nl-core-contactpoint-1.0"/>
            <!-- adresgegevens -->
            <xsl:apply-templates select="f:address" mode="nl-core-address-2.0"/>
        </zorgaanbieder>
    </xsl:template>
    
    <xsl:template match="f:identifier" mode="nl-core-organization-2.0">
        <xsl:param name="organizationIdUnderscore" select="false()" tunnel="yes"/>
        <xsl:variable name="adaElementName">
            <xsl:choose>
                <xsl:when test="$organizationIdUnderscore=true()">zorgaanbieder_identificatie_nummer</xsl:when>
                <xsl:otherwise>zorgaanbieder_identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="Identifier-to-identificatie">
            <xsl:with-param name="adaElementName" select="$adaElementName"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="f:name" mode="nl-core-organization-2.0">
        <organisatie_naam value="{@value}"/>
    </xsl:template>
    
</xsl:stylesheet>