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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:pharm="urn:ihe:pharm:medication" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../hl7_2_ada_mp_include.xsl"/>
    <xsl:import href="../../../../zibs2017/payload/all-zibs.xsl"/>
    <xd:doc>
        <xd:desc>Dit is een conversie van MP 9.1.0 naar ADA 9.1 sturen_voorstel_medicatieafspraak</xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes"/>
    <!-- de xsd variabelen worden gebruikt om de juiste conceptId's te vinden voor de ADA xml -->
    <xsl:param name="schema" select="document('../ada_schemas/sturen_voorstel_medicatieafspraak.xsd')"/>

    <xsl:variable name="templateId-voorstel-medicatieafspraak" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9153'"/>
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
        <xsl:variable name="medicatiegegevens-lijst-90" select="//hl7:organizer[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.4']]"/>
        <xsl:call-template name="sturen_voorstel_medicatieafspraak">
            <xsl:with-param name="in" select="$medicatiegegevens-lijst-90"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handles HL7 9.1.0 HL7 input, transforms it to ada.</xd:desc>
        <xd:param name="in">HL7 9.1.0 organizer to be transformed.</xd:param>
    </xd:doc>
    <xsl:template name="sturen_voorstel_medicatieafspraak">
        <xsl:param name="in" select="//hl7:organizer[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.4']]"/>
        <xsl:call-template name="doGeneratedComment">
            <xsl:with-param name="in" select="$in/ancestor::*[hl7:ControlActProcess]"/>
        </xsl:call-template>
        <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_sturen_voorstel_medicatieafspraak.xsd">
            <meta status="new" created-by="generated" last-update-by="generated">
                <xsl:attribute name="creation-date" select="current-dateTime()"/>
                <xsl:attribute name="last-update-date" select="current-dateTime()"/>
            </meta>
            <data>
                <xsl:for-each select="$in">
                    <xsl:call-template name="doGeneratedComment"/>
                    <xsl:variable name="patient" select="hl7:recordTarget/hl7:patientRole"/>
                    <sturen_voorstel_medicatieafspraak app="mp-mp910" shortName="sturen_voorstel_medicatieafspraak" formName="voorstel_medicatieafspraak" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.107" transactionEffectiveDate="2016-04-13T17:06:07" prefix="mp-" language="nl-NL" title="Generated" id="TODO">
                        <xsl:variable name="filename" select="tokenize(document-uri(/), '/')[last()]"/>
                        <xsl:variable name="extension" select="tokenize($filename, '\.')[last()]"/>
                        <xsl:variable name="theId" select="replace($filename, concat('.', $extension, '$'), '')"/>
                        <xsl:attribute name="title" select="$theId"/>
                        <xsl:attribute name="id" select="$theId"/>

                        <xsl:for-each select="$patient">
                            <xsl:variable name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schema, 'sturen_voorstel_medicatieafspraak'))"/>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1_20180601000000">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="language" select="$language"/>
                                <xsl:with-param name="schema" select="$schema"/>
                                <xsl:with-param name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, 'patient'))"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:variable name="component" select=".//*[hl7:templateId/@root = ($templateId-voorstel-medicatieafspraak)]"/>

                        <!-- There should be max one medicamenteuze behandeling -->
                        <xsl:for-each-group select="$component" group-by="hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = $templateId-medicamenteuze-behandeling]/hl7:id/concat(@root, @extension)">
                            <!-- voorstelgegevens -->
                            <xsl:variable name="elemName">voorstelgegevens</xsl:variable>
                            <xsl:variable name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schema, $elemName))"/>
                            <xsl:element name="{$elemName}">
                                <xsl:copy-of select="nf:getADAComplexTypeConceptId($schemaFragment)"/>

                                <!-- todo, test this for CDA docs -->
                                <!-- voorstel -->
                                <xsl:variable name="elemName">voorstel</xsl:variable>
                                <xsl:variable name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schema, $elemName))"/>
                                <xsl:element name="{$elemName}">
                                    <xsl:copy-of select="nf:getADAComplexTypeConceptId($schemaFragment)"/>

                                    <!-- identificatie -->
                                    <xsl:for-each select="../../hl7:id[@root | @nullFlavor]">
                                        <xsl:variable name="elemName">identificatie</xsl:variable>
                                        <xsl:call-template name="handleII">
                                            <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elemName)))"/>
                                            <xsl:with-param name="elemName" select="$elemName"/>
                                        </xsl:call-template>
                                    </xsl:for-each>

                                    <!-- voorstel_datum -->
                                    <xsl:for-each select="hl7:author/hl7:time[@value | @nullFlavor]">
                                        <xsl:variable name="elemName">voorstel_datum</xsl:variable>
                                        <xsl:call-template name="handleTS">
                                            <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elemName)))"/>
                                            <xsl:with-param name="elemName" select="$elemName"/>
                                        </xsl:call-template>
                                    </xsl:for-each>

                                    <!-- auteur -->
                                    <xsl:for-each select="hl7:author">
                                        <xsl:variable name="elemName">auteur</xsl:variable>
                                        <xsl:variable name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elemName))"/>
                                        <xsl:element name="{$elemName}">
                                            <xsl:copy-of select="nf:getADAComplexTypeConceptId($schemaFragment)"/>
                                            <!-- auteur_is_patient -->
                                            <xsl:for-each select="hl7:assignedAuthor[hl7:code/@code = 'ONESELF']">
                                                <xsl:variable name="elemName">auteur_is_patient</xsl:variable>
                                                <xsl:element name="{$elemName}">
                                                    <xsl:attribute name="value">true</xsl:attribute>
                                                    <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elemName)))"/>
                                                </xsl:element>
                                            </xsl:for-each>
                                            <!-- auteur_is_zorgverlener -->
                                            <xsl:for-each select=".[hl7:assignedAuthor[hl7:assignedPerson]]">
                                                <xsl:variable name="elemName">auteur_is_zorgverlener</xsl:variable>
                                                <xsl:variable name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elemName))"/>
                                                <xsl:element name="{$elemName}">
                                                    <xsl:copy-of select="nf:getADAComplexTypeConceptId($schemaFragment)"/>
                                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="schema" select="$schema"/>
                                                        <xsl:with-param name="schemaFragment" select="$schemaFragment"/>
                                                    </xsl:call-template>
                                                </xsl:element>
                                            </xsl:for-each>
                                        </xsl:element>
                                    </xsl:for-each>
                                    <!-- medicamenteuze_behandeling -->
                                    <xsl:variable name="elemName">medicamenteuze_behandeling</xsl:variable>
                                    <xsl:variable name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schema, $elemName))"/>
                                    <xsl:element name="{$elemName}">
                                        <xsl:copy-of select="nf:getADAComplexTypeConceptId($schemaFragment)"/>

                                        <!-- identificatie -->
                                        <xsl:for-each select="./hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = $templateId-medicamenteuze-behandeling]/hl7:id">
                                            <xsl:variable name="elemName">identificatie</xsl:variable>
                                            <xsl:element name="{$elemName}">
                                                <xsl:for-each select="@extension">
                                                    <xsl:attribute name="value" select="."/>
                                                </xsl:for-each>
                                                <xsl:for-each select="@root">
                                                    <xsl:attribute name="root" select="."/>
                                                </xsl:for-each>
                                                <xsl:copy-of select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elemName)))"/>
                                            </xsl:element>
                                        </xsl:for-each>

                                        <!-- medicatieafspraak -->
                                        <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-voorstel-medicatieafspraak]">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9153_20160726162345">
                                                <xsl:with-param name="in" select="."/>
                                                <xsl:with-param name="schema" select="$schema"/>
                                                <xsl:with-param name="schemaFragment" select="$schemaFragment"/>
                                            </xsl:call-template>
                                        </xsl:for-each>

                                    </xsl:element>
                                    <!-- toelichting -->
                                    <xsl:for-each select="../../hl7:component/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                                        <xsl:variable name="elemName">toelichting</xsl:variable>
                                        <xsl:variable name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schema, $elemName))"/>
                                        <xsl:element name="{$elemName}">
                                            <xsl:attribute name="value" select="./text()"/>
                                            <xsl:copy-of select="nf:getADAComplexTypeConceptId($schemaFragment)"/>
                                        </xsl:element>
                                    </xsl:for-each>
                                </xsl:element>
                            </xsl:element>
                        </xsl:for-each-group>

                    </sturen_voorstel_medicatieafspraak>
                </xsl:for-each>
            </data>
        </adaxml>

    </xsl:template>
</xsl:stylesheet>
