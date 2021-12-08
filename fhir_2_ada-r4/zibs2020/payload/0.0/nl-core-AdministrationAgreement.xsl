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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:util="urn:hl7:utilities" exclude-result-prefixes="#all" version="2.0">

    <xsl:variable name="nl-core-AdministrationAgreement" select="'http://nictiz.nl/fhir/StructureDefinition/nl-core-AdministrationAgreement'"/>
    <xsl:variable name="ext-AdministrationAgreement-DateTime">http://nictiz.nl/fhir/StructureDefinition/ext-AdministrationAgreement.AdministrationAgreementDateTime</xsl:variable>
    <xsl:variable name="ext-AdministrationAgreement-AgreementReason">http://nictiz.nl/fhir/StructureDefinition/ext-AdministrationAgreement.AgreementReason</xsl:variable>

    <xsl:variable name="practitionerrole-reference" select="'http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference'"/>
    <xsl:variable name="zib-Medication-StopType" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-StopType'"/>
    <xsl:variable name="zib-Medication-CopyIndicator" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-CopyIndicator'"/>
    <xsl:variable name="zib-Medication-AdditionalInformation" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation'"/>

    <xd:doc>
        <xd:desc>Template to convert f:MedicationRequest to ADA toedieningsafspraak</xd:desc>
    </xd:doc>
    <xsl:template match="f:MedicationDispense" mode="nl-core-AdministrationAgreement">
        <toedieningsafspraak>
            <xsl:apply-templates select="f:extension[@url = $zib-Medication-PeriodOfUse]" mode="ext-zib-Medication-PeriodOfUse-2.0"/>
            <!-- identificatie -->
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <!-- toedieningsafspraak_datum_tijd -->
            <xsl:apply-templates select="f:extension[@url = $ext-AdministrationAgreement-DateTime]" mode="#current"/>
            <!-- gebruiksperiode -->
            <xsl:if test="f:extension[@url = $ext-TimeInterval-Period] or f:extension[@url = $ext-TimeInterval-Duration]">
                <gebruiksperiode>
                    <xsl:apply-templates select="f:extension[@url = $ext-TimeInterval-Period]" mode="ext-TimeInterval-Period"/>
                    <xsl:apply-templates select="f:extension[@url = $ext-TimeInterval-Duration]" mode="ext-TimeInterval-Duration"/>
                </gebruiksperiode>
            </xsl:if>
            <!-- geannuleerd_indicator  -->
            <xsl:apply-templates select="f:status" mode="#current"/>
            <!-- TODO toedieningsafspraak_stop_type -->
            <xsl:apply-templates select="f:modifierExtension[@url = $zib-Medication-StopType]" mode="ext-zib-Medication-Stop-Type-2.0"/>
            <!-- verstrekker -->
            <xsl:apply-templates select="f:performer" mode="#current"/>
            <!-- reden_afspraak -->
            <xsl:apply-templates select="f:extension[@url=$ext-AdministrationAgreement-AgreementReason]" mode="#current"/>
            <!-- geneesmiddel_bij_toedieningsafspraak -->
            <xsl:apply-templates select="f:medicationReference" mode="#current"/>
            <!-- gebruiksinstructie -->
            <xsl:apply-templates select="f:dosageInstruction" mode="nl-core-InstructionsForUse"/>
           <!-- aanvullende_informatie -->
            <xsl:apply-templates select="f:extension[@url = $zib-Medication-AdditionalInformation]" mode="ext-zib-Medication-AdditionalInformation-2.0"/>
            <!-- kopie indicator -->
            <xsl:apply-templates select="f:extension[@url = $zib-Medication-CopyIndicator]" mode="ext-zib-Medication-CopyIndicator-2.0"/>
            <!-- toelichting -->
            <xsl:apply-templates select="f:note" mode="#current"/>
        </toedieningsafspraak>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:identifier to identificatie</xd:desc>
    </xd:doc>
    <xsl:template match="f:identifier" mode="nl-core-AdministrationAgreement">
        <xsl:call-template name="Identifier-to-identificatie"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:medicationReference to afgesproken_geneesmiddel</xd:desc>
    </xd:doc>
    <xsl:template match="f:medicationReference" mode="nl-core-AdministrationAgreement">
        <xsl:variable name="referenceValue" select="f:reference/@value"/>
        <geneesmiddel_bij_toedieningsafspraak>
            <farmaceutisch_product datatype="reference" value="{f:reference/@value}"/>  
<!--            <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:Medication" mode="zib-PharmaceuticalProduct-2.0"/>-->
        </geneesmiddel_bij_toedieningsafspraak>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:extension[@url = $ext-AdministrationAgreement-DateTime] to toedieningsafspraak_datum_tijd</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url = $ext-AdministrationAgreement-DateTime]" mode="nl-core-AdministrationAgreement">
        <toedieningsafspraak_datum_tijd>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="f:valueDateTime/@value"/>
                </xsl:call-template>
            </xsl:attribute>
        </toedieningsafspraak_datum_tijd>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:status to geannuleerd_indicator. Only the FHIR status value 'entered-in-error' is used in this mapping.</xd:desc>
    </xd:doc>
    <xsl:template match="f:status" mode="nl-core-AdministrationAgreement">
        <xsl:if test="@value = 'entered-in-error'">
            <geannuleerd_indicator value="true"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:performer to verstrekker</xd:desc>
    </xd:doc>
    <xsl:template match="f:performer" mode="nl-core-AdministrationAgreement">
        <verstrekker>
            <zorgaanbieder datatype="reference" value="{f:actor[f:type/@value='Organization']/f:reference/@value}"/>            
        </verstrekker>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:extension[@url=$ext-AdministrationAgreement-AgreementReason] to reden_afspraak</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url=$ext-AdministrationAgreement-AgreementReason]" mode="nl-core-AdministrationAgreement">
        <reden_afspraak value="{f:valueString/@value}"/>
    </xsl:template>

     <xd:doc>
        <xd:desc>Template to convert f:note to toelichting</xd:desc>
    </xd:doc>
    <xsl:template match="f:note" mode="nl-core-AdministrationAgreement">
        <toelichting value="{f:text/@value}"/>
    </xsl:template>

</xsl:stylesheet>
