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
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:include href="../../../hl7_2_ada_mp_include.xsl"/>
    <!-- Dit is een conversie van MP 6.12 naar ADA 9.0 voorschrift transactie -->
    <!-- de xsd variabelen worden gebruikt om de juiste conceptId's te vinden voor de ADA xml -->
    <xsl:variable name="xsd-ada" select="document('file:/C:/SVN/art_decor/trunk/ada-data/projects/mp-mp9/schemas/beschikbaarstellen_medicatiegegevens.xsd')"/>
    <xsl:variable name="mbh-complexType" select="$xsd-ada//xs:schema/xs:complexType[@name = 'beschikbaarstellen_medicatiegegevens_type']//xs:element[@name = 'medicamenteuze_behandeling']/@type"/>
    <xsl:variable name="xsd-mbh" select="$xsd-ada/xs:schema/xs:complexType[@name = $mbh-complexType]"/>
    <xd:doc>
        <xd:desc>Template voor converteren van de 6.12 XML</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="verstrekkingslijst-612" select="//hl7:QURX_IN990113NL/hl7:ControlActProcess/hl7:subject/hl7:MedicationDispenseList"/>
        <xsl:if test="$verstrekkingslijst-612">
            <!-- alleen conversie naar 9 medicatiegegevens als er ook een verstrekkingenlijst is -->
            <xsl:call-template name="Verstrekking_612">
                <xsl:with-param name="dispense-lists" select="$verstrekkingslijst-612"/>
             </xsl:call-template>
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="dispense-lists"/>
      </xd:doc>
    <xsl:template name="Verstrekking_612">
        <xsl:param name="dispense-lists"/>
   
        <xsl:comment>Generated from HL7v3 verstrekkingenlijst 6.12 xml with message id (QURX_IN990113NL/id) <xsl:value-of select="concat('root: ', /hl7:QURX_IN990113NL/hl7:id/@root, ' and extension: ', /hl7:QURX_IN990113NL/hl7:id/@extension)"/>.</xsl:comment>
        <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_beschikbaarstellen_medicatiegegevens.xsd">
            <meta status="new" created-by="generated" last-update-by="generated">
                <xsl:attribute name="creation-date" select="current-dateTime()"/>
                <xsl:attribute name="last-update-date" select="current-dateTime()"/>
            </meta>
            <data>
                <xsl:for-each select="$dispense-lists">
                    <xsl:variable name="patient" select="./hl7:subject/hl7:Patient"/>
                    <xsl:variable name="dispense-events" select="./hl7:component/hl7:medicationDispenseEvent"/>
                    <beschikbaarstellen_medicatiegegevens app="mp-mp9" shortName="beschikbaarstellen_medicatiegegevens" formName="uitwisselen_medicatiegegevens" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.102" transactionEffectiveDate="2016-03-23T16:32:43" prefix="mp-" language="nl-NL">
                        <xsl:attribute name="title">Generated from HL7v3 verstrekkingenlijst 6.12 xml</xsl:attribute>
                        <xsl:attribute name="id">DUMMY</xsl:attribute>
                        <xsl:for-each select="$patient">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.816_20130521000000"/>
                        </xsl:for-each>
                        <xsl:for-each select="$dispense-events">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.110_20130521000000">
                                <xsl:with-param name="current-dispense-event" select="."/>
                                <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                <xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
                            </xsl:call-template>
                        </xsl:for-each>
                    </beschikbaarstellen_medicatiegegevens>
                </xsl:for-each>
            </data>
        </adaxml>
        <!--        <xsl:comment>Input HL7 xml below</xsl:comment>
        <xsl:call-template name="copyElementInComment">
            <xsl:with-param name="element" select="$dispense-list"/>
        </xsl:call-template>
-->
    </xsl:template>
</xsl:stylesheet>
