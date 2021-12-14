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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" exclude-result-prefixes="#all" version="2.0">

    <xd:doc>
        <xd:desc>Template to convert f:Organization to ADA zorgaanbieder</xd:desc>
    </xd:doc>
    <xsl:template match="f:Organization" mode="nl-core-HealthcareProvider-Organization">
        
        <xsl:variable name="entryFullURrlAtValue" select="./../../f:fullUrl/@value"/>
        
        <zorgaanbieder id="{nf:convert2NCName($entryFullURrlAtValue)}">
            <!-- zorgaanbieder_identificatienummer -->
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <!-- organisatie_naam -->
            <xsl:apply-templates select="f:name" mode="#current"/>
            <!-- contactgegevens TODO -->
            <xsl:apply-templates select="f:telecom" mode="nl-core-contactpoint-1.0"/>
            <!-- adresgegevens -->
            <xsl:apply-templates select="f:address" mode="nl-core-AddressInformation"/>
        </zorgaanbieder>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:identifier to zorgverlener_identificatienummer</xd:desc>
        <xd:param name="organizationIdUnderscore">Optional boolean to create ADA element zorgaanbieder_identificatie_nummer</xd:param>
    </xd:doc>
    <xsl:template match="f:identifier" mode="nl-core-HealthcareProvider-Organization">
        <xsl:param name="organizationIdUnderscore" select="false()" tunnel="yes"/>
        <xsl:variable name="adaElementName">
            <xsl:choose>
                <xsl:when test="$organizationIdUnderscore = true()">zorgaanbieder_identificatie_nummer</xsl:when>
                <xsl:otherwise>zorgaanbieder_identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="Identifier-to-identificatie">
            <xsl:with-param name="adaElementName" select="$adaElementName"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:name to organisatie_naam</xd:desc>
    </xd:doc>
    <xsl:template match="f:name" mode="nl-core-HealthcareProvider-Organization">
        <organisatie_naam value="{@value}"/>
    </xsl:template>

</xsl:stylesheet>
