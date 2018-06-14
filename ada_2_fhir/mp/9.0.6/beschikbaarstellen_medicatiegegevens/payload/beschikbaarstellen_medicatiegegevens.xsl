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
<xsl:stylesheet xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns="http://hl7.org/fhir" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA MP9-transaction, to HL7 FHIR STU3 profiles <xd:a href="https://simplifier.net/NictizSTU3/zib-AdministrationAgreement">http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAdministrationAgreement</xd:a>. The HL7 V3 interaction contains both logistical information and therapeutic information.</xd:p>
            <xd:p><xd:b>History:</xd:b> <xd:ul>
                <xd:li>2018-06-12 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
            </xd:ul></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#default"/>
    <xsl:include href="../../../mp_include.xsl"/>
    <xd:doc>
        <xd:desc>XSLT doesn't have a function for UUID. It will generate an id based on the first element in the input. If you appreciate a UUID or other id, please supply here.</xd:desc>
    </xd:doc>
    <xsl:param name="bundle-id" select="generate-id(/*)"/>
    <xd:doc>
        <xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen medicatiegegevens".</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:call-template name="Medicatiegegevens_90">
            <xsl:with-param name="patient" select="//beschikbaarstellen_medicatiegegevens/patient"/>
            <xsl:with-param name="mbh" select="//beschikbaarstellen_medicatiegegevens/medicamenteuze_behandeling"/>
        </xsl:call-template>
    </xsl:template>
    <xd:doc>
        <xd:desc>Build a FHIR Bundle of type searchset.</xd:desc>
        <xd:param name="patient">ada patient</xd:param>
        <xd:param name="mbh">ada medicamenteuze behandeling</xd:param>
    </xd:doc>
    <xsl:template name="Medicatiegegevens_90">
        <xsl:param name="patient"/>
        <xsl:param name="mbh"/>
        
        <xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/STU3/bundle.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <Bundle xmlns="http://hl7.org/fhir" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir http://hl7.org/fhir/STU3/bundle.xsd">
            <xsl:comment> TODO Check Bundle elements </xsl:comment>
            <id value="{$bundle-id}"/>
            <type value="searchset"/>
            <xsl:variable name="entries" as="element(f:entry)*">
                <!-- original lines stolen from AHE -->
                <!--<xsl:apply-templates select="hl7:ControlActProcess"/>
                <xsl:apply-templates select="." mode="doOperationOutcome"/>-->
                <!-- ada version -->
                <xsl:for-each select="$mbh/toedieningsafspraak">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{./identificatie[1]/string-join((@value,@root),'--')}"/>
                        <resource>
                            <xsl:call-template name="zib-AdministrationAgreement-2.0">
                                <xsl:with-param name="patient" select="$patient"/>
                                <xsl:with-param name="toedieningsafspraak" select="."/>
                            </xsl:call-template>
                        </resource>
                    </entry>
                    <!--<xsl:if test="$medication/hl7:code[1][@nullFlavor]">
                <entry>
                    <fullUrl value="{generate-id($medication)}"/>
                    <resource>
                        <xsl:apply-templates select="$medication"/>
                    </resource>
                </entry>
            </xsl:if>-->
                </xsl:for-each>
                
            </xsl:variable>
            <total value="{count($entries)}"/>
            <xsl:copy-of select="$entries"/>
        </Bundle>
     </xsl:template>
</xsl:stylesheet>
