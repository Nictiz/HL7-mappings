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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" exclude-result-prefixes="#all" version="2.0">

    <xsl:import href="../../../fhir_2_ada_mp_include.xsl"/>
    <xsl:output indent="yes"/>

    <xd:doc>
        <xd:desc>Starts transformation for [...] 9.0.7 from ADA to HL7 FHIR.</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_beschikbaarstellen_verstrekkingenvertaling.xsd">
            <meta status="new" created-by="generated" last-update-by="generated">
                <xsl:attribute name="creation-date" select="current-dateTime()"/>
                <xsl:attribute name="last-update-date" select="current-dateTime()"/>
            </meta>
            <data>
                <beschikbaarstellen_medicatieoverzicht app="mp-mp907" shortName="beschikbaarstellen_verstrekkingenvertaling" formName="uitwisselen_verstrekkingenvertaling" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.102" transactionEffectiveDate="2016-03-23T16:32:43" prefix="mp-" language="nl-NL">
                    <xsl:attribute name="title">Generated from HL7 FHIR Medication Overview 9.0.7 xml</xsl:attribute>
                    <xsl:attribute name="id">DUMMY</xsl:attribute>

                    <xsl:choose>
                        <xsl:when test="count(f:Bundle/f:entry/f:resource/f:Patient) ge 2 or count(distinct-values(f:Bundle/f:entry/f:resource/(f:MedicationRequest | f:MedicationDispense | f:MedicationStatement)/f:subject/f:reference/@value)) ge 2">
                            <xsl:call-template name="util:logMessage">
                                <xsl:with-param name="level" select="$logWARN"/>
                                <xsl:with-param name="msg">Multiple Patients and/or subject references found. Please check.</xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Patient" mode="nl-core-patient-2.1"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:for-each-group select="f:Bundle/f:entry/f:resource/(f:MedicationRequest | f:MedicationDispense | f:MedicationStatement)" group-by="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']/f:valueIdentifier/concat(f:system/@value, f:value/@value)">
                        <medicamenteuze_behandeling>
                            <identificatie>
                                <xsl:attribute name="value" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']/f:valueIdentifier/f:value/@value"/>
                                <xsl:attribute name="root" select="local:getOid(f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']/f:valueIdentifier/f:system/@value)"/>
                            </identificatie>
                            <!-- toedieningsafspraak -->
                            <xsl:apply-templates select="current-group()[self::f:MedicationDispense/f:category/f:coding/f:code/@value = '422037009']" mode="zib-AdministrationAgreement-2.2"/>
                            <!-- verstrekking -->
                            <xsl:apply-templates select="current-group()[self::f:MedicationDispense/f:category/f:coding/f:code/@value = '373784005']" mode="zib-Dispense-2.2"/>
                        </medicamenteuze_behandeling>
                    </xsl:for-each-group>
                </beschikbaarstellen_medicatieoverzicht>
            </data>
        </adaxml>
    </xsl:template>

</xsl:stylesheet>
