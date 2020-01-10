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
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:pharm="urn:ihe:pharm:medication" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../hl7_2_ada_mp_include.xsl"/>
    <xsl:import href="../../../../zibs2017/payload/all-zibs.xsl"/>

    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
    <!-- Dit is een conversie van MP 9.1.0 naar ADA 9.0 voorschrift bericht -->
    <!-- de xsd variabelen worden gebruikt om de juiste conceptId's te vinden voor de ADA xml -->
    <xsl:param name="schema" select="document('../ada_schemas/sturen_medicatievoorschrift.xsd')"/>
    <xsl:variable name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schema, 'medicamenteuze_behandeling'))"/>

    <xsl:variable name="templateId-medicatieafspraak" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9275', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9235', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9216'"/>
    <xsl:variable name="templateId-verstrekkingsverzoek" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9301', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9257'"/>
    <xsl:variable name="templateId-medicamenteuze-behandeling">2.16.840.1.113883.2.4.3.11.60.20.77.10.9084</xsl:variable>
    <xsl:variable name="templateId-lichaamsgewicht" select="'2.16.840.1.113883.2.4.3.11.60.7.10.28', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9123'"/>
    <xsl:variable name="templateId-lichaamslengte" select="'2.16.840.1.113883.2.4.3.11.60.7.10.30', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9122'"/>
    <xsl:variable name="templateId-labuitslag" select="'2.16.840.1.113883.2.4.3.11.60.7.10.31'"/>


    <!-- if this xslt is used stand alone the template below could be used. -->
    <xsl:template match="/">
        <xsl:variable name="patient-recordTarget" select="//hl7:recordTarget/hl7:patientRole"/>
        <xsl:call-template name="Voorschrift-90-ADA">
            <xsl:with-param name="patient" select="$patient-recordTarget"/>
            <xsl:with-param name="xsd-mbh" select="$schemaFragment"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create adaxml for transaction voorschrift</xd:desc>
        <xd:param name="patient">HL7 patient</xd:param>
        <xd:param name="xsd-mbh">schemaFragment for MBH</xd:param>
    </xd:doc>
    <xsl:template name="Voorschrift-90-ADA">
        <xsl:param name="patient" select="//hl7:recordTarget/hl7:patientRole"/>
        <xsl:param name="xsd-mbh" select="$schemaFragment"/>
        <xsl:call-template name="doGeneratedComment">
            <xsl:with-param name="in" select="//*[hl7:ControlActProcess]"/>
        </xsl:call-template>
        <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_sturen_medicatievoorschrift.xsd">
            <meta status="new" created-by="generated" last-update-by="generated">
                <xsl:attribute name="creation-date" select="current-dateTime()"/>
                <xsl:attribute name="last-update-date" select="current-dateTime()"/>
            </meta>
            <data>
                <sturen_medicatievoorschrift app="mp-mp9" shortName="sturen_medicatievoorschrift" formName="sturen_voorschrift" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.95" transactionEffectiveDate="2015-12-01T10:32:15" versionDate="" prefix="mp-" language="nl-NL" title="testbericht ADA conversie" id="cd1badfb-2076-4c6f-b08e-bddbc7972340">
                    <xsl:for-each select="$patient">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1_20180601000000">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="language" select="$language"/>
                            <xsl:with-param name="schema" select="$schema"/>
                            <xsl:with-param name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schema, 'patient'))"/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <!-- medicatiebouwstenen -->
                    <xsl:variable name="component" select="//*[hl7:templateId/@root = $templateId-medicatieafspraak] | //*[hl7:templateId/@root = $templateId-verstrekkingsverzoek]"/>
                    <xsl:for-each-group select="$component" group-by="concat(hl7:entryRelationship/hl7:procedure[hl7:templateId = $templateId-medicamenteuze-behandeling]/hl7:id/@root, hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = $templateId-medicamenteuze-behandeling]/hl7:id/@extension)">
                        <!-- medicamenteuze_behandeling -->
                        <medicamenteuze_behandeling>
                            <xsl:copy-of select="nf:getADAComplexTypeConceptId($schemaFragment)"/>
                            <xsl:for-each select="hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = $templateId-medicamenteuze-behandeling]/hl7:id">
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
                            <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-medicatieafspraak]">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9275_20191121115247">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="schema" select="$schema"/>
                                    <xsl:with-param name="schemaFragment" select="$schemaFragment"/>
                                </xsl:call-template>
                            </xsl:for-each>
                            <!-- verstrekkingsverzoek -->
                            <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-verstrekkingsverzoek]">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9301_20191125141436">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="schema" select="$schema"/>
                                    <xsl:with-param name="schemaFragment" select="$schemaFragment"/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </medicamenteuze_behandeling>
                    </xsl:for-each-group>
                    <!-- lengte / gewicht van vóór 9.1.0 die in MA zitten ook converteren -->
                    <!-- lichaamslengte  -->
                    <!-- todo ook datum/tijd support toevoegen en in zibs2017 zetten -->
                    <xsl:for-each select="$component//hl7:entryRelationship/*[hl7:templateId/@root = $templateId-lichaamslengte]/hl7:value">
                        <lichaamslengte conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23023">
                            <lengte_waarde value="{./@value}" unit="{nf:convertUnit_UCUM2ADA(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23024"> </lengte_waarde>
                        </lichaamslengte>
                    </xsl:for-each>
                    <!-- lichaamsgewicht  -->
                    <xsl:for-each select="$component//hl7:entryRelationship/*[hl7:templateId/@root = $templateId-lichaamsgewicht]/hl7:value">
                        <lichaamsgewicht conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23028">
                            <gewicht_waarde value="{./@value}" unit="{nf:convertUnit_UCUM2ADA(./@unit)}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23029"/>
                        </lichaamsgewicht>
                    </xsl:for-each>
                    <!-- labuitslag -->
                    <xsl:for-each select="//*[hl7:templateId/@root = $templateId-labuitslag]">
                        <xsl:variable name="zibroot" as="element()?">
                            <xsl:call-template name="HL7element2Zibroot4Lab"/>
                        </xsl:variable>
                        <xsl:call-template name="zib-LaboratoryTestResult-Observation-4.1">
                            <xsl:with-param name="zibroot" select="$zibroot"/>
                        </xsl:call-template>


                    </xsl:for-each>
                </sturen_medicatievoorschrift>
            </data>
        </adaxml>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle HL7 stuff to create an ada zibRoot HCIM</xd:desc>
        <xd:param name="schemaFragment">Optional for generating ada conceptId's. XSD Schema complexType for ada parent of zibroot</xd:param>
    </xd:doc>
    <xsl:template name="HL7element2Zibroot4Lab" match="hl7:*" mode="HL7element2Zibroot4Lab">
        <xsl:param name="schemaFragment" as="element(xs:complexType)?"/>

        <!-- multi language support for ada element names -->
        <xsl:variable name="elmZibroot">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">hcimroot</xsl:when>
                <xsl:otherwise>zibroot</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmZibrootIdentification">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">identification_number</xsl:when>
                <xsl:otherwise>identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:element name="{$elmZibroot}">
            <xsl:variable name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmZibroot))"/>
            <xsl:copy-of select="nf:getADAComplexTypeConceptId($schemaFragment)"/>

            <!-- identification number -->
            <xsl:for-each select="hl7:id">
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmZibrootIdentification)))"/>
                    <xsl:with-param name="elemName" select="$elmZibrootIdentification"/>
                </xsl:call-template>
            </xsl:for-each>

        </xsl:element>
    </xsl:template>


</xsl:stylesheet>
