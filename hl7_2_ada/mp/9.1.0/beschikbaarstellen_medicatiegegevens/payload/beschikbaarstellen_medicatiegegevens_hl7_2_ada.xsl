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
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:pharm="urn:ihe:pharm:medication" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../hl7_2_ada_mp_include.xsl"/>
    <xsl:import href="../../../../zibs2017/payload/all-zibs.xsl"/>
    <xd:doc>
        <xd:desc>Dit is een conversie van MP 9.1.0 naar ADA 9.1 beschikbaarstellen medicatiegegevens</xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
    <!-- parameter to control whether or not the result should contain a reference to the ada xsd -->
    <xsl:param name="outputSchemaRef" as="xs:boolean" select="false()"/>

    <xsl:variable name="templateId-medicatieafspraak" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9275', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9235'"/>
    <xsl:variable name="templateId-verstrekkingsverzoek" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9301', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9257'"/>
    <xsl:variable name="templateId-toedieningsafspraak" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9299', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9259'"/>
    <xsl:variable name="templateId-verstrekking" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9294', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9255'"/>
    <xsl:variable name="templateId-medicatiegebruik" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9279', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9208'"/>
    <xsl:variable name="templateId-medicamenteuze-behandeling">2.16.840.1.113883.2.4.3.11.60.20.77.10.9084</xsl:variable>

    <xd:doc>
        <xd:desc> if this xslt is used stand alone the template below could be used. </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <!-- todo, add CDA-variant to xpath -->
        <xsl:variable name="medicatiegegevens-lijst-90" select="//hl7:organizer[hl7:code[@code = '102'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.4']]"/>
        <xsl:call-template name="Medicatiegegevens-90-ADA">
            <xsl:with-param name="medicatiegegevens-lijst" select="$medicatiegegevens-lijst-90"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handles HL7 9.1.0 medication information, transforms it to ada.</xd:desc>
        <xd:param name="medicatiegegevens-lijst">HL7 9.1.0 organizer with medication information.</xd:param>
    </xd:doc>
    <xsl:template name="Medicatiegegevens-90-ADA">
        <xsl:param name="medicatiegegevens-lijst" select="//hl7:organizer[hl7:code[@code = '102'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.4']]"/>
        <xsl:call-template name="doGeneratedComment">
            <xsl:with-param name="in" select="$medicatiegegevens-lijst/ancestor::*[hl7:ControlActProcess]"/>
        </xsl:call-template>
        <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <xsl:if test="$outputSchemaRef">
                <xsl:attribute name="xsi:noNamespaceSchemaLocation">../ada_schemas/ada_beschikbaarstellen_medicatiegegevens.xsd</xsl:attribute>
            </xsl:if>
            <meta status="new" created-by="generated" last-update-by="generated">
                <xsl:attribute name="creation-date" select="current-dateTime()"/>
                <xsl:attribute name="last-update-date" select="current-dateTime()"/>
            </meta>
            <data>
                <xsl:for-each select="$medicatiegegevens-lijst">
                    <xsl:call-template name="doGeneratedComment"/>
                    <xsl:variable name="patient" select="hl7:recordTarget/hl7:patientRole"/>
                    <beschikbaarstellen_medicatiegegevens app="mp-mp910" shortName="beschikbaarstellen_medicatiegegevens" formName="uitwisselen_medicatiegegevens" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.102" transactionEffectiveDate="2016-03-23T16:32:43" prefix="mp-" language="nl-NL" title="Generated" id="TODO">
                        <xsl:variable name="filename" select="tokenize(document-uri(/), '/')[last()]"/>
                        <xsl:variable name="extension" select="tokenize($filename, '\.')[last()]"/>
                        <xsl:variable name="theId" select="replace($filename, concat('.', $extension, '$'), '')"/>
                        <xsl:attribute name="title" select="$theId"/>
                        <xsl:attribute name="id" select="$theId"/>

                        <xsl:for-each select="$patient">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1_20180601000000">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="language" select="$language"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:variable name="component" select=".//*[hl7:templateId/@root = ($templateId-medicatieafspraak, $templateId-verstrekkingsverzoek, $templateId-toedieningsafspraak, $templateId-verstrekking, $templateId-medicatiegebruik)]"/>
                        <xsl:for-each-group select="$component" group-by="hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = $templateId-medicamenteuze-behandeling]/hl7:id/concat(@root, @extension)">
                            <!-- medicamenteuze_behandeling -->
                            <medicamenteuze_behandeling>
                                <xsl:for-each select="./hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = $templateId-medicamenteuze-behandeling]/hl7:id">
                                    <xsl:variable name="elemName">identificatie</xsl:variable>
                                    <xsl:element name="{$elemName}">
                                        <xsl:for-each select="@extension">
                                            <xsl:attribute name="value" select="."/>
                                        </xsl:for-each>
                                        <xsl:for-each select="@root">
                                            <xsl:attribute name="root" select="."/>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:for-each>
                                <!-- medicatieafspraak -->
                                <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-medicatieafspraak]">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9275_20191121115247">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </xsl:for-each>
                                <!-- verstrekkingsverzoek -->
                                <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-verstrekkingsverzoek]">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9301_20191125141436">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </xsl:for-each>
                                <!-- toedieningsafspraak -->
                                <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-toedieningsafspraak]">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9299_20191125140232">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </xsl:for-each>
                                <!-- verstrekking -->
                                <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-verstrekking]">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9294_20191121175237">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </xsl:for-each>
                                <!-- medicatiegebruik -->
                                <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-medicatiegebruik]">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9281_20191121142645">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </medicamenteuze_behandeling>
                        </xsl:for-each-group>
                    </beschikbaarstellen_medicatiegegevens>
                </xsl:for-each>
            </data>
        </adaxml>
    </xsl:template>
</xsl:stylesheet>
