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
        <xsl:variable name="entryFullURrlAtValue" select="../../f:fullUrl/@value"/>
        <zorgaanbieder id="{nf:convert2NCName($entryFullURrlAtValue)}">
            <!-- zorgaanbieder_identificatienummer -->
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <!-- organisatie_naam -->
            <xsl:apply-templates select="f:name" mode="#current"/>
            <!-- contactgegevens -->
            <xsl:if test="f:telecom">
                <contactgegevens>
                    <xsl:apply-templates select="f:telecom" mode="nl-core-ContactInformation"/>
                </contactgegevens>
            </xsl:if>
            <!-- adresgegevens -->
            <xsl:apply-templates select="f:address" mode="nl-core-AddressInformation"/>
            <!-- organisatie_type -->
            <xsl:apply-templates select="f:type" mode="#current"/>
            <!-- organisatie_locatie TODO -->
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


    <xd:doc>
        <xd:desc>Template to convert f:type to organisatie_type</xd:desc>
    </xd:doc>

    <xsl:template match="f:type" mode="nl-core-HealthcareProvider-Organization">
        <xsl:choose>
            <xsl:when test="f:coding/f:system[@value = concat('urn:oid:', $oidAGBSpecialismen) or @value=$oidMap[@oid=$oidAGBSpecialismen]/@uri]">
                <afdeling_specialisme>
                    <xsl:call-template name="Coding-to-code">
                        <xsl:with-param name="in" select="f:coding"/>
                    </xsl:call-template>
                </afdeling_specialisme>
            </xsl:when>
            <xsl:when test="f:coding/f:system[@value = concat('urn:oid:', $oidRoleCodeNLOrganizations) or @value=$oidMap[@oid=$oidRoleCodeNLOrganizations]/@uri]">
                <organisatie_type>
                    <xsl:call-template name="Coding-to-code">
                        <xsl:with-param name="in" select="f:coding"/>
                    </xsl:call-template>
                </organisatie_type>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
