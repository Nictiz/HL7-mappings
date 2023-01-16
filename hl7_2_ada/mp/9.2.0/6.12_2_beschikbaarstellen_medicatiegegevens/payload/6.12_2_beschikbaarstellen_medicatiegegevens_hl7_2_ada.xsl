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
    <xsl:import href="../../../hl7_2_ada_mp_include.xsl"/>
    <!--    <xsl:import href="../../../../zibs2017/payload/all-zibs.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    
<!--    <xsl:param name="deduplicateAdaBouwstenen" as="xs:boolean?" select="false()"/>-->
        <xsl:param name="deduplicateAdaBouwstenen" as="xs:boolean?" select="true()"/>    

    <xsl:variable name="transaction-name">beschikbaarstellen_medicatiegegevens</xsl:variable>
    <xsl:variable name="transaction-oid">2.16.840.1.113883.2.4.3.11.60.20.77.4.301</xsl:variable>
    <xsl:variable name="transaction-effectiveDate" as="xs:dateTime">2022-02-07T00:00:00</xsl:variable>
    <xsl:variable name="ada-formname">medicatiegegevens</xsl:variable>
    <xsl:variable name="mpVersion">mp92</xsl:variable>

    <xd:doc>
        <xd:desc>Template voor converteren van de 6.12 XML</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="verstrekkingslijst-612" select="//hl7:QURX_IN990113NL/hl7:ControlActProcess/hl7:subject/hl7:MedicationDispenseList"/>
        <xsl:choose>
            <!-- alleen inhoudelijke conversie als er ook een verstrekkingenlijst is -->
            <xsl:when test="$verstrekkingslijst-612">
                <xsl:call-template name="Verstrekking_612">
                    <xsl:with-param name="dispense-lists" select="$verstrekkingslijst-612"/>
                </xsl:call-template>
            </xsl:when>
            <!-- anders alleen root element om valide xml in output te hebben -->
            <xsl:otherwise>
                <beschikbaarstellen_medicatiegegevens app="mp-mp92" shortName="{$transaction-name}" formName="{$ada-formname}" transactionRef="{$transaction-oid}" transactionEffectiveDate="{$transaction-effectiveDate}" prefix="mp-" language="nl-NL"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc>Converteert een verstrekkingenlijst</xd:desc>
        <xd:param name="dispense-lists"/>
    </xd:doc>
    <xsl:template name="Verstrekking_612">
        <xsl:param name="dispense-lists" as="element()*"/>

        <xsl:variable name="adaXml">
            <xsl:comment>Generated from HL7v3 verstrekkingenlijst 6.12 xml with message id (QURX_IN990113NL/id) <xsl:value-of select="concat('root: ', /hl7:QURX_IN990113NL/hl7:id/@root, ' and extension: ', /hl7:QURX_IN990113NL/hl7:id/@extension)"/>.</xsl:comment>
            <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../beschikbaarstellen_medicatiegegevens/ada_schemas/ada_beschikbaarstellen_medicatiegegevens.xsd">
                <meta status="new" created-by="generated" last-update-by="generated">
                    <xsl:attribute name="creation-date" select="current-dateTime()"/>
                    <xsl:attribute name="last-update-date" select="current-dateTime()"/>
                </meta>
                <data>
                    <xsl:for-each select="$dispense-lists">
                        <xsl:variable name="patient" select="./hl7:subject/hl7:Patient"/>
                        <xsl:variable name="dispense-events" select="./hl7:component/hl7:medicationDispenseEvent"/>
                        <beschikbaarstellen_medicatiegegevens app="mp-mp92" shortName="{$transaction-name}" formName="{$ada-formname}" transactionRef="{$transaction-oid}" transactionEffectiveDate="{$transaction-effectiveDate}" prefix="mp-" language="nl-NL">
                            <xsl:attribute name="title">Generated from HL7v3 verstrekkingenlijst 6.12 xml</xsl:attribute>
                            <xsl:attribute name="id" select="tokenize(base-uri(), '/')[last()]"/>
                            <xsl:for-each select="$patient">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.816_20130521000000_2_907"/>
                            </xsl:for-each>
                            <xsl:for-each select="$dispense-events">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.110_20130521000000_2_MP920">
                                    <xsl:with-param name="current-dispense-event" select="."/>
                                    <xsl:with-param name="transaction" select="$transaction-name"/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </beschikbaarstellen_medicatiegegevens>
                    </xsl:for-each>
                </data>
            </adaxml>
        </xsl:variable>
        
        <xsl:variable name="adaXmlWithBouwstenen">
            <xsl:choose>
                <xsl:when test="$deduplicateAdaBouwstenen = true()">
                    <xsl:variable name="adaXmlDeduplicated">
                        <xsl:apply-templates select="$adaXml" mode="deduplicateBouwstenenStep1"/>
                    </xsl:variable>
                    <xsl:apply-templates select="$adaXmlDeduplicated" mode="deduplicateBouwstenenStep2"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- don't deduplicate the bouwstenen -->
                    <xsl:apply-templates select="$adaXml" mode="handleBouwstenen"/>
                </xsl:otherwise>
            </xsl:choose>            
        </xsl:variable>
        
        <xsl:apply-templates select="$adaXmlWithBouwstenen" mode="handleMP92AdaNameChanges"/>
                
    </xsl:template>
</xsl:stylesheet>
