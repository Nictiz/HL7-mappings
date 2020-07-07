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
    xmlns:nf="http://www.nictiz.nl/functions" 
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>-->
    
    <xsl:variable name="humanname-assembly-order" select="'http://hl7.org/fhir/StructureDefinition/humanname-assembly-order'"/>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:name" mode="nl-core-humanname-2.0">
        <xsl:variable name="nameUsage" select="f:extension[@url=$humanname-assembly-order]/f:valueCode/@value"/>
        <naamgegevens>
            <xsl:apply-templates select="f:text" mode="#current"/>
            <xsl:apply-templates select="f:given" mode="#current"/>
            <xsl:apply-templates select="f:extension[@url=$humanname-assembly-order]" mode="#current">
                <xsl:with-param name="nameUsage" select="$nameUsage"/>
            </xsl:apply-templates>
            <xsl:apply-templates select="f:family" mode="#current">
                <xsl:with-param name="nameUsage" select="$nameUsage"/>
            </xsl:apply-templates>
            <!-- to do: geslachtsnaam_partner -->
        </naamgegevens>
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:text" mode="nl-core-humanname-2.0">
        <ongestructureerde_naam>
            <xsl:attribute name="value" select="@value"/>
        </ongestructureerde_naam>
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:given" mode="nl-core-humanname-2.0">
        <xsl:variable name="iso21090-EN-qualifier" select="f:extension[@url='http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier']/f:valueCode/@value"/>
        <xsl:variable name="elementName">
            <xsl:choose>
                <xsl:when test="$iso21090-EN-qualifier='BR'">voornamen</xsl:when>
                <xsl:when test="$iso21090-EN-qualifier='IN'">initialen</xsl:when>
                <xsl:when test="$iso21090-EN-qualifier='CL'">roepnaam</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="{$elementName}">
            <xsl:attribute name="value" select="@value"/>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
        <xd:param name="nameUsage"></xd:param>
    </xd:doc>
    <xsl:template match="f:extension[@url=$humanname-assembly-order]" mode="nl-core-humanname-2.0">
        <xsl:param name="nameUsage" required="yes"/>
        <naamgebruik>
            <xsl:choose>
                <xsl:when test="$nameUsage='NL1'">
                    <xsl:attribute name="value">1</xsl:attribute>
                    <xsl:attribute name="code">NL1</xsl:attribute>
                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                    <xsl:attribute name="displayName">Eigen geslachtsnaam</xsl:attribute>
                </xsl:when>
                <xsl:when test="$nameUsage='NL2'">
                    <xsl:attribute name="value">2</xsl:attribute>
                    <xsl:attribute name="code">NL2</xsl:attribute>
                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                    <xsl:attribute name="displayName">Geslachtsnaam partner</xsl:attribute>
                </xsl:when>
                <xsl:when test="$nameUsage='NL3'">
                    <xsl:attribute name="value">3</xsl:attribute>
                    <xsl:attribute name="code">NL3</xsl:attribute>
                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                    <xsl:attribute name="displayName">Geslachtsnaam partner gevolgd door eigen geslachtsnaam</xsl:attribute>
                </xsl:when>
                <xsl:when test="$nameUsage='NL4'">
                    <xsl:attribute name="value">4</xsl:attribute>
                    <xsl:attribute name="code">NL4</xsl:attribute>
                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                    <xsl:attribute name="displayName">Eigen geslachtsnaam gevolgd door geslachtsnaam partner</xsl:attribute>
                </xsl:when>
                <!-- otherwise: we nemen aan NL4 - Eigen geslachtsnaam gevolgd door geslachtsnaam partner zodat iig geen informatie 'verdwijnt' -->
                <xsl:otherwise>
                    <xsl:attribute name="value">4</xsl:attribute>
                    <xsl:attribute name="code">NL4</xsl:attribute>
                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.101.5.4</xsl:attribute>
                    <xsl:attribute name="displayName">Eigen geslachtsnaam gevolgd door geslachtsnaam partner</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
        </naamgebruik>
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:family" mode="nl-core-humanname-2.0">
        <geslachtsnaam>
            <xsl:choose>
                <xsl:when test="f:extension">
                    <xsl:for-each select="f:extension">
                        <xsl:variable name="extensionUrl" select="@url"/>
                        <xsl:variable name="elementName">
                            <xsl:choose>
                                <xsl:when test="$extensionUrl='http://hl7.org/fhir/StructureDefinition/humanname-own-prefix'">voorvoegsels</xsl:when>
                                <xsl:when test="$extensionUrl='http://hl7.org/fhir/StructureDefinition/humanname-own-name'">achternaam</xsl:when>
                                <xsl:when test="$extensionUrl='http://hl7.org/fhir/StructureDefinition/humanname-partner-prefix'">voorvoegsels_partner</xsl:when>
                                <xsl:when test="$extensionUrl='http://hl7.org/fhir/StructureDefinition/humanname-partner-name'">achternaam_partner</xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:element name="{$elementName}">
                            <xsl:attribute name="value" select="f:valueString/@value"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="@value">
                        <achternaam value="{@value}"/>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>            
        </geslachtsnaam>
    </xsl:template>
    
</xsl:stylesheet>