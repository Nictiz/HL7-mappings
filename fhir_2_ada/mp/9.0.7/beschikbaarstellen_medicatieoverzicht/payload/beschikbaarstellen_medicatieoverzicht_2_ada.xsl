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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:util="urn:hl7:utilities"
    xmlns:f="http://hl7.org/fhir"
    xmlns:local="urn:fhir:stu3:functions"
    xmlns:nf="http://www.nictiz.nl/functions" 
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:import href="../../../fhir_2_ada_mp_include.xsl"/>
    <xsl:output indent="yes"/>
    
    <xsl:variable name="Bundle-MedicationOverview" select="'http://nictiz.nl/fhir/StructureDefinition/Bundle-MedicationOverview'"/>
    <xsl:variable name="MedicationOverview-Verification" select="'http://nictiz.nl/fhir/StructureDefinition/MedicationOverview-Verification'"/>
    
    <xd:doc>
        <xd:desc>Starts transformation for Medication Overview 9.0.7 from ADA to HL7 FHIR.</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_beschikbaarstellen_medicatieoverzicht.xsd">
            <meta status="new" created-by="generated" last-update-by="generated">
                <xsl:attribute name="creation-date" select="current-dateTime()"/>
                <xsl:attribute name="last-update-date" select="current-dateTime()"/>
            </meta>
            <data>
                <beschikbaarstellen_medicatieoverzicht app="mp-mp907" 
                    shortName="beschikbaarstellen_medicatieoverzicht"
                    formName="uitwisselen_medicatieoverzicht"
                    transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.102"
                    transactionEffectiveDate="2016-03-23T16:32:43"
                    prefix="mp-"
                    language="nl-NL">
                    <xsl:attribute name="title">Generated from HL7 FHIR Medication Overview 9.0.7 xml</xsl:attribute>
                    <xsl:attribute name="id">DUMMY</xsl:attribute>
                    
                    <xsl:choose>
                        <xsl:when test="count(f:Bundle/f:entry/f:resource/f:Patient) ge 2 or count(distinct-values(f:Bundle/f:entry/f:resource/(f:MedicationRequest|f:MedicationDispense|f:MedicationStatement)/f:subject/f:reference/@value)) ge 2">
                            <xsl:call-template name="util:logMessage">
                                <xsl:with-param name="level" select="$logWARN"/>
                                <xsl:with-param name="msg">Multiple Patients and/or subject references found. Please check.</xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="reference" select="f:Bundle[f:meta/f:profile/@value = $Bundle-MedicationOverview]/f:entry/f:resource/f:List[f:code/f:coding/f:code/@value = '11181000146103']/f:subject/f:reference/@value"/>
                            <xsl:apply-templates select="f:Bundle/f:entry[f:fullUrl/@value = $reference]/f:resource/f:Patient" mode="nl-core-patient-2.1"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:for-each-group select="f:Bundle/f:entry/f:resource/(f:MedicationRequest|f:MedicationDispense|f:MedicationStatement)" group-by="f:extension[@url='http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']/f:valueIdentifier/concat(f:system/@value,f:value/@value)">
                        <medicamenteuze_behandeling>
                            <identificatie>
                                <xsl:attribute name="value" select="f:extension[@url='http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']/f:valueIdentifier/f:value/@value"/>
                                <xsl:attribute name="root" select="local:getOid(f:extension[@url='http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']/f:valueIdentifier/f:system/@value)"/>
                            </identificatie>
                            <!-- medicatieafspraak -->
                            <xsl:apply-templates select="current-group()[self::f:MedicationRequest/f:category/f:coding/f:code/@value='16076005']" mode="zib-MedicationAgreement-2.2"/>
                            <!-- toedieningsafspraak -->
                            <xsl:apply-templates select="current-group()[self::f:MedicationDispense/f:category/f:coding/f:code/@value='422037009']" mode="zib-AdministrationAgreement-2.2"/>
                            <!-- medicatie_gebruik -->
                            <xsl:apply-templates select="current-group()[self::f:MedicationStatement/f:category/f:coding/f:code/@value='6']" mode="zib-MedicationUse-2.2"/>
                        </medicamenteuze_behandeling>
                    </xsl:for-each-group>
                    <xsl:apply-templates select="f:Bundle[f:meta/f:profile/@value = $Bundle-MedicationOverview]/f:entry/f:resource/f:List[f:code/f:coding/f:code/@value = '11181000146103']" mode="MedicationOverview-2.0"/>
                </beschikbaarstellen_medicatieoverzicht>
            </data>
        </adaxml>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Transforms MedicationOverview f:List resource to ADA documentgegevens.</xd:desc>
    </xd:doc>
    <xsl:template match="f:List" mode="MedicationOverview-2.0">
        <documentgegevens>
            <!-- document_datum -->
            <xsl:apply-templates select="f:date" mode="#current"/>
            <!-- auteur -->
            <xsl:apply-templates select="f:source" mode="#current"/>
            <!-- verificatie_patient -->
            <!-- verificatie_zorgverlener -->
            <xsl:apply-templates select="f:extension[@url = $MedicationOverview-Verification]" mode="#current"/>
        </documentgegevens>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Transforms f:date to ADA document_datum.</xd:desc>
    </xd:doc>
    <xsl:template match="f:date" mode="MedicationOverview-2.0">
        <document_datum>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>
            </xsl:attribute>
        </document_datum>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Transforms f:source to ADA auteur with either auteur_is_zorgaanbieder or auteur_is_patient child.</xd:desc>
    </xd:doc>
    <xsl:template match="f:source" mode="MedicationOverview-2.0">
        <xsl:variable name="MedicationOverview-SourceOrganization" select="'http://nictiz.nl/fhir/StructureDefinition/MedicationOverview-SourceOrganization'"/>
        <auteur>
            <xsl:choose>
                <xsl:when test="f:extension/@url = $MedicationOverview-SourceOrganization">
                    <xsl:variable name="reference" select="f:extension[@url = $MedicationOverview-SourceOrganization]/f:valueReference/f:reference/@value"/>
                    <auteur_is_zorgaanbieder>
                        <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$reference]/f:resource/f:Organization" mode="nl-core-organization-2.0"/>
                    </auteur_is_zorgaanbieder>
                </xsl:when>
                <xsl:when test="f:reference/@value = ancestor::f:Bundle/f:entry[f:resource/f:Patient]/f:fullUrl/@value">
                    <auteur_is_patient value="true"/>
                </xsl:when>
            </xsl:choose>
        </auteur>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Transforms MedicationOverview-Verification f:extension to ADA verificatie_patient and ADA verificatie_zorgverlener children.</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url = $MedicationOverview-Verification]" mode="MedicationOverview-2.0">
        <verificatie_patient>
            <xsl:if test="f:extension[@url = 'VerificationPatient']">
                <geverifieerd_met_patientq value="{f:extension[@url = 'VerificationPatient']/f:valueBoolean/@value}"/>
            </xsl:if>
            <xsl:if test="f:extension[@url = 'VerificationPatientDate']">
                <verificatie_datum>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2ADADate">
                            <xsl:with-param name="dateTime" select="f:extension[@url = 'VerificationPatientDate']/f:valueDateTime/f:value/@value"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </verificatie_datum>
            </xsl:if>
        </verificatie_patient>
        <verificatie_zorgverlener>
            <xsl:if test="f:extension[@url = 'VerificationHealthProfessional']">
                <geverifieerd_met_zorgverlenerq value="{f:extension[@url = 'VerificationHealthProfessional']/f:valueBoolean/@value}"/>
            </xsl:if>
            <xsl:if test="f:extension[@url = 'VerificationHealthProfessionalDate']">
                <verificatie_datum>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2ADADate">
                            <xsl:with-param name="dateTime" select="f:extension[@url = 'VerificationHealthProfessionalDate']/f:valueDateTime/f:value/@value"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </verificatie_datum>
            </xsl:if>
        </verificatie_zorgverlener>
    </xsl:template>
    
</xsl:stylesheet>