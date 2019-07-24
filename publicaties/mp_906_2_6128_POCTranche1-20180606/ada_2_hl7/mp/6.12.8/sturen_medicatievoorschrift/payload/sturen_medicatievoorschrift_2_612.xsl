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
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
    <xsl:include href="../../../2_hl7_mp_include.xsl"/>
    <!-- Dit is een conversie van ADA 9.0 naar MP 6.12 voorschrift bericht -->
    <xsl:template match="/">
        <xsl:variable name="voorschrift" select="//sturen_medicatievoorschrift"/>
        <xsl:if test="$voorschrift/medicamenteuze_behandeling[verstrekkingsverzoek]">
            <!-- alleen conversie naar 6.12 vooraankondiging als er ook een verstrekkingsverzoek is -->
            <xsl:call-template name="Voorschrift_612">
                <xsl:with-param name="patient" select="$voorschrift/patient"/>
                <xsl:with-param name="mbh" select="$voorschrift/medicamenteuze_behandeling[verstrekkingsverzoek]"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    <!-- Onderstaand named template kan ook aangeroepen worden buiten deze xslt -->
    <xsl:template name="Make_Voorschrift_612">
        <xsl:param name="voorschrift" select="//sturen_medicatievoorschrift"/>
        <xsl:if test="$voorschrift/medicamenteuze_behandeling[verstrekkingsverzoek]">
            <!-- alleen conversie naar 6.12 vooraankondiging als er ook een verstrekkingsverzoek is -->
            <xsl:call-template name="Voorschrift_612">
                <xsl:with-param name="patient" select="$voorschrift/patient"/>
                <xsl:with-param name="mbh" select="$voorschrift/medicamenteuze_behandeling[verstrekkingsverzoek]"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="Voorschrift_612">
        <xsl:param name="patient"/>
        <xsl:param name="mbh"/>

        <!-- phase="#ALL" achteraan de volgende regel zorgt dat oXygen niet met een phase chooser dialoog komt elke keer dat je de HL7 XML opent -->
        <xsl:processing-instruction name="xml-model">href="file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schematron_closed_warnings/mp-medvoors.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>
        <xsl:comment>Generated from ada instance with title: "<xsl:value-of select="$mbh/../@title"/>" and id: "<xsl:value-of select="$mbh/../@id"/>".</xsl:comment>
        <xsl:for-each select="$mbh/verstrekkingsverzoek">
            <subject>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.104_20130521000000">
                    <xsl:with-param name="patient" select="$patient"/>
                    <xsl:with-param name="verstrekkingsverzoek" select="."/>
                    <!-- NOTE! There can be more than one MA in MP9!-->
                    <!-- but only consider MA's that are not stop-MA's and not cancelled MA's
                        , since stop- and cancelled MA's are not understood in 6.12 -->
                    <xsl:with-param name="medicatieafspraak" select="./../medicatieafspraak[not(stoptype/@code)][not(geannuleerd_indicator/@value)]"/>
                </xsl:call-template>
            </subject>
        </xsl:for-each>
        <xsl:comment>Input ada xml below</xsl:comment>
        <xsl:call-template name="copyElementInComment">
            <xsl:with-param name="element" select="$mbh/.."/>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
