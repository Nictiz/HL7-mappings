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
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../2_hl7_mp_include_612.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>

    <xsl:param name="logLevel" select="$logDEBUG"/>
    


    <!-- Dit is een conversie van ADA MP9 2.0 beschikbaarstellen_medicatiegegevens naar MP 6.12 verstrekkingen bericht -->
    <xsl:template match="/">
        <xsl:variable name="transaction" select="//beschikbaarstellen_medicatiegegevens"/>
        <xsl:if test="$transaction/medicamenteuze_behandeling[toedieningsafspraak | medicatieverstrekking | verstrekking]">
            <xsl:call-template name="verstrekkingenlijst612">
                <xsl:with-param name="patient" select="$transaction/patient"/>
                <xsl:with-param name="mbh" select="$transaction/medicamenteuze_behandeling[toedieningsafspraak | medicatieverstrekking | verstrekking]"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="verstrekkingenlijst612">
        <xsl:param name="patient"/>
        <xsl:param name="mbh"/>

        <xsl:if test="$logLevel = $logDEBUG">
            <xsl:processing-instruction name="xml-model">href="file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schematron_closed_warnings/mp-medverslstresp.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>
            <xsl:comment>Generated from ada instance with title: "<xsl:value-of select="$mbh/../@title"/>" and id: "<xsl:value-of select="$mbh/../@id"/>".</xsl:comment>
        </xsl:if>
        <QURX_IN990113NL xsl:exclude-result-prefixes="nf">
            <xsl:if test="$logLevel = $logDEBUG">
                <xsl:attribute name="xsi:schemaLocation">urn:hl7-org:v3 file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/Publicaties/20200122/mp-xml-20200122T161947/schemas/QURX_IN990113NL.xsd</xsl:attribute>
            </xsl:if>
            <id extension="0123456789" root="2.16.840.1.113883.2.4.6.6.1.1"/>
            <creationTime value="20080701090549"/>
            <versionCode code="NICTIZEd2005-Okt"/>
            <interactionId extension="QURX_IN990113NL" root="2.16.840.1.113883.1.6"/>
            <profileId root="2.16.840.1.113883.2.4.3.11.1" extension="810"/>
            <processingCode code="P"/>
            <processingModeCode code="T"/>
            <acceptAckCode code="NE"/>
            <acknowledgement typeCode="AA">
                <targetMessage>
                    <id extension="0123456789" root="2.16.528.1.1007.3.3.1234567.1"/>
                </targetMessage>
            </acknowledgement>
            <receiver>
                <device>
                    <id extension="01234567" root="2.16.840.1.113883.2.4.6.6"/>
                    <!-- EVS van ziekenhuis Medisch Centrum Oost o.b.v. landelijke applicatie ID -->
                </device>
            </receiver>
            <sender>
                <device>
                    <id extension="1" root="2.16.840.1.113883.2.4.6.6"/>
                    <!-- LSP -->
                </device>
            </sender>
            <ControlActProcess moodCode="EVN">
                <authorOrPerformer typeCode="AUT">
                    <participant>
                        <AssignedDevice>
                            <id extension="009876543" root="2.16.528.1.1007.3.2"/>
                            <!-- AIS van openbare apotheek De Gulle Gaper (UZI services certificaat) -->
                            <id extension="00765432" root="2.16.840.1.113883.2.4.6.6"/>
                            <!-- AIS van openbare apotheek De Gulle Gaper (landelijke applicatie ID) -->
                            <Organization>
                                <id extension="01234567" root="2.16.528.1.1007.3.3"/>
                                <name>Apotheek De Gulle Gaper</name>
                                <!-- openbare apotheek De Gulle Gaper (UZI Register Abonnee nr.) -->
                            </Organization>
                        </AssignedDevice>
                    </participant>
                </authorOrPerformer>
                <subject>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9026_20150318000000">
                        <xsl:with-param name="patient" select="$patient"/>
                        <xsl:with-param name="toedieningsafspraak" select="$mbh/toedieningsafspraak"/>
                    </xsl:call-template>
                </subject>
                <!-- TODO, move this to separate wrapper functionality -->
                <queryAck>
                    <queryId extension="default-value" root="1.2.3.999"/>
                    <queryResponseCode code="OK"/>
                    <resultTotalQuantity value="1"/>
                    <resultCurrentQuantity value="1"/>
                    <resultRemainingQuantity value="0"/>
                </queryAck>
            </ControlActProcess>
        </QURX_IN990113NL>
    </xsl:template>
</xsl:stylesheet>
