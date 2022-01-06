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

	<xsl:variable name="medication-AdditionalInformation" select="'http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAgreement.MedicationAgreementAdditionalInformation'"/>
	<!--xxxwim geen gerelateerde zib of nl_core gevonden-->
	<xsl:variable name="extRelatedMedicationUse" select="'http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAgreement.RelatedMedicationUse'"/>

	<xd:doc>
		<xd:desc>Template to convert f:MedicationRequest to ADA medicatieafspraak</xd:desc>
	</xd:doc>
	<xsl:template match="f:MedicationRequest" mode="nl-core-MedicationAgreement">
		<medicatieafspraak>
			<!-- identificatie -->
			<xsl:apply-templates select="f:identifier" mode="#current"/>
			<!-- afspraakdatum -->
			<xsl:apply-templates select="f:authoredOn" mode="#current"/>
			<!-- gebruiksperiode -->
			<xsl:if test="f:extension[@url = $ext-TimeInterval-Period] or f:extension[@url = $ext-TimeInterval-Duration]">
				<gebruiksperiode>
					<xsl:apply-templates select="f:extension[@url = $ext-TimeInterval-Period]" mode="ext-TimeInterval-Period"/>
					<xsl:apply-templates select="f:extension[@url = $ext-TimeInterval-Duration]" mode="ext-TimeInterval-Duration"/>
				</gebruiksperiode>
			</xsl:if>
			<!-- relatie_contact -->
			<xsl:apply-templates select="f:encounter[f:type/@value eq 'Encounter']" mode="contextContactEpisodeOfCare"/>
			<!-- relatie_zorgepisode -->
			<xsl:apply-templates select="f:extension[@url = $extContextEpisodeOfCare]/f:valueReference" mode="contextContactEpisodeOfCare"/>
			<!-- geannuleerd_indicator niet voor MA -->
<!--			<xsl:apply-templates select="f:status" mode="#current"/>-->
			<!-- stop_type -->
		    <xsl:apply-templates select="f:modifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-StopType']" mode="nl-core-ext-StopType"/>
			<!-- relatie medicatieafspraak -->
			<xsl:apply-templates select="f:priorPrescription" mode="#current"/>
			<!-- relatie_medicatiegebruik -->
			<xsl:apply-templates select="f:extension[@url = $extRelatedMedicationUse]" mode="#current"/>
			<!-- voorschrijver -->
			<xsl:apply-templates select="f:requester" mode="#current"/>
			<!-- reden_wijzigen_of_staken -->
			<xsl:apply-templates select="f:reasonCode" mode="#current"/>
			<!-- reden_van_voorschrijven -->
			<xsl:apply-templates select="f:reasonReference" mode="#current"/>
			<!-- afgesproken_geneesmiddel -->
			<xsl:apply-templates select="f:medicationReference" mode="#current"/>
			<!-- gebruiksinstructie -->
			<xsl:call-template name="nl-core-InstructionsForUse"/>
			<!-- aanvullende_informatie -->
			<xsl:apply-templates select="f:extension[@url = $medication-AdditionalInformation]" mode="#current"/>
			<!-- kopie indicator -->
			<xsl:apply-templates select="f:extension[@url = $extCopyIndicator]" mode="ext-CopyIndicator"/>
			<!-- toelichting -->
		    <xsl:apply-templates select="f:note" mode="nl-core-Note"/>
		</medicatieafspraak>
	</xsl:template>


	<!--xxxwim:-->
	<xd:doc>
		<xd:desc>Template to convert f:extension medication-AdditionalInformation to aanvullende_informatie element.</xd:desc>
		<xd:param name="adaElementName">Optional alternative ADA element name.</xd:param>
	</xd:doc>
	<xsl:template match="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAgreement.MedicationAgreementAdditionalInformation']" mode="nl-core-MedicationAgreement">
		<xsl:param name="adaElementName" tunnel="yes" select="'aanvullende_informatie'"/>
		<xsl:call-template name="CodeableConcept-to-code">
			<xsl:with-param name="in" select="f:valueCodeableConcept"/>
			<xsl:with-param name="adaElementName" select="$adaElementName"/>
		</xsl:call-template>
	</xsl:template>
	<xd:doc>
		<xd:desc>Template to convert f:extension/relatedMedicationUse to aanvullende_informatie element.</xd:desc>
	</xd:doc>
	<xsl:template match="f:extension[@url = $extRelatedMedicationUse]" mode="nl-core-MedicationAgreement">
		<relatie_medicatiegebruik>
			<identificatie value="{f:valueReference/f:identifier/f:value/@value}" root="{f:valueReference/f:identifier/f:system/replace(@value, 'urn:oid:', '')}"/>
		</relatie_medicatiegebruik>
	</xsl:template>



<!--	<xd:doc>
		<xd:desc>Template to resolve f:modifierExtension ext-Medication-stop-type.</xd:desc>
	</xd:doc>
	<xsl:template match="f:modifierExtension[@url = $extStoptype]" mode="nl-core-MedicationAgreement">
		<xsl:apply-templates select="f:valueCodeableConcept" mode="#current"/>
	</xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:valueCodeableConcept to stoptype.</xd:desc>
    </xd:doc>
    <xsl:template match="f:valueCodeableConcept" mode="nl-core-MedicationAgreement">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'medicatieafspraak_stop_type'"/>
        </xsl:call-template>
    </xsl:template>
    -->
    <xd:doc>
		<xd:desc>Template to resolve priorPrescription.</xd:desc>
	</xd:doc>
	<xd:doc>
		<xd:desc>Template to convert f:authorizingPrescription to relatie_medicatieafspraak</xd:desc>
	</xd:doc>
	<xsl:template match="f:priorPrescription" mode="nl-core-MedicationAgreement">
		<relatie_medicatieafspraak>
			<xsl:call-template name="Reference-to-identificatie"/>
		</relatie_medicatieafspraak>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:identifier to identificatie</xd:desc>
	</xd:doc>
	<xsl:template match="f:identifier" mode="nl-core-MedicationAgreement">
		<xsl:call-template name="Identifier-to-identificatie"/>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:medicationReference to afgesproken_geneesmiddel</xd:desc>
	</xd:doc>
	<xsl:template match="f:medicationReference" mode="nl-core-MedicationAgreement">
		<xsl:variable name="referenceValue" select="f:reference/@value"/>
		<afgesproken_geneesmiddel>
			<farmaceutisch_product value="{nf:convert2NCName(f:reference/@value)}" datatype="reference"/>
		</afgesproken_geneesmiddel>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:authoredOn to afspraakdatum</xd:desc>
	</xd:doc>
	<xsl:template match="f:authoredOn" mode="nl-core-MedicationAgreement">
		<xsl:call-template name="datetime-to-datetime">
			<xsl:with-param name="adaElementName">medicatieafspraak_datum_tijd</xsl:with-param>
			<xsl:with-param name="adaDatatype">datetime</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:status to geannuleerd_indicator. Only the FHIR status value 'entered-in-error' is used in this mapping.</xd:desc>
	</xd:doc>
	<xsl:template match="f:status" mode="nl-core-MedicationAgreement">
		<xsl:if test="@value = 'entered-in-error'">
			<geannuleerd_indicator value="true"/>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:requester to voorschrijver</xd:desc>
	</xd:doc>
	<xsl:template match="f:requester" mode="nl-core-MedicationAgreement">
		<voorschrijver>
			<zorgverlener value="{nf:convert2NCName(f:reference/@value)}" datatype="reference"/> 
		</voorschrijver>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:reasonCode to reden_wijzigen_of_staken</xd:desc>
	</xd:doc>
	<xsl:template match="f:reasonCode" mode="nl-core-MedicationAgreement">
		<xsl:call-template name="CodeableConcept-to-code">
			<xsl:with-param name="in" select="."/>
			<xsl:with-param name="adaElementName" select="'reden_wijzigen_of_staken'"/>
		</xsl:call-template>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:reasonReference to reden_van_voorschrijven</xd:desc>
	</xd:doc>
	<xsl:template match="f:reasonReference" mode="nl-core-MedicationAgreement">
		<xsl:variable name="resource" select="nf:resolveRefInBundle(.)"/>
		<reden_van_voorschrijven>
			<xsl:apply-templates select="$resource/f:*" mode="nl-core-Problem"/>
		</reden_van_voorschrijven>
	</xsl:template>

</xsl:stylesheet>
