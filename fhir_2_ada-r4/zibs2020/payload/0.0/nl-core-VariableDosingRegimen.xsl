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

<!--
mode = nl-core-VariableDosingRegimen
alle  ZZZNEW templates gaan mee
TODO
WisselendDoseerschema in beschikbaarstellen_medicatiegegevens_2_ada.xsl boven medicatieafspraak inbrengen
-->



<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:util="urn:hl7:utilities" exclude-result-prefixes="#all" version="2.0">

	<xsl:variable name="variableDosingRegimen" select="'http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAgreement.RelatedMedicationUse'"/>

	<xd:doc>
		<xd:desc>Template to convert f:MedicationRequest/f:meta/f:profile[value="http://nictiz.nl/fhir/StructureDefinition/nl-core-VariableDosingRegimen"] to ADA wisselend_doseerschema</xd:desc>
	</xd:doc>
	<xsl:template match="f:MedicationRequest" mode="nl-core-VariableDosingRegimen">
		<wisselend_doseerschema>
			<!-- identificatie -->
			<xsl:apply-templates select="f:identifier" mode="#current"/>
			<!-- wisselend_doseerschema_datum_tijd -->
			<xsl:apply-templates select="f:authoredOn" mode="#current"/>
			<!-- gebruiksperiode -->
			<xsl:if test="f:extension[@url = ($urlExtTimeInterval-Period, $urlExtTimeIntervalPeriod)] or f:extension[@url = ($urlExtTimeInterval-Duration, $urlExtTimeIntervalDuration)]">
				<gebruiksperiode>
					<xsl:apply-templates select="f:extension[@url = ($urlExtTimeInterval-Period, $urlExtTimeIntervalPeriod)]" mode="urlExtTimeInterval-Period"/>
					<xsl:apply-templates select="f:extension[@url = ($urlExtTimeInterval-Duration, $urlExtTimeIntervalDuration)]" mode="urlExtTimeInterval-Duration"/>
				</gebruiksperiode>
			</xsl:if>
			<!-- stoptype -->
			<xsl:apply-templates select="f:modifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-StopType']" mode="nl-core-ext-StopType"/>
			<!-- reden_wijzigen_of_staken -->
			<xsl:apply-templates select="f:reasonCode" mode="#current"/>
			<!-- afgesproken_geneesmiddel -->
			<xsl:apply-templates select="f:medicationReference" mode="#current"/>
			<!-- relatie medicatieafspraak / relatie_wisselend_doseerschema zie opmerkingen WDS -->
			<xsl:apply-templates select="f:basedOn" mode="#current"/>
			<xsl:apply-templates select="f:priorPrescription" mode="#current"/>
			<!-- relatie_contact -->
			<xsl:apply-templates select="f:encounter[f:type/@value eq 'Encounter']" mode="contextContactEpisodeOfCare"/>
			<!-- relatie_zorgepisode -->
			<xsl:apply-templates select="f:extension[@url = $urlExtContextEpisodeOfCare]/f:valueReference" mode="contextContactEpisodeOfCare"/>
			<!--auteur/zorgverlener-->
			<xsl:apply-templates select="f:requester" mode="#current"/>
			<!-- gebruiksinstructie -->
			<xsl:call-template name="nl-core-InstructionsForUse"/>
			<!-- kopie indicator -->
			<xsl:apply-templates select="f:extension[@url = $extCopyIndicator] | f:reportedBoolean" mode="ext-CopyIndicator"/>
			<!-- toelichting -->
			<xsl:apply-templates select="f:note" mode="#current"/>
		</wisselend_doseerschema>
	</xsl:template>




	<xd:doc>
		<xd:desc>Template to convert f:requester to auteur/zorgverlener</xd:desc>
	</xd:doc>
	<xsl:template match="f:requester" mode="nl-core-VariableDosingRegimen">
		<auteur>
			<zorgverlener value="{nf:convert2NCName(f:reference/@value)}" datatype="reference"/>
		</auteur>
	</xsl:template>


	<!--xxxwim:-->
	<xd:doc>
		<xd:desc>Template to convert f:extension medication-AdditionalInformation to aanvullende_informatie element.</xd:desc>
		<xd:param name="adaElementName">Optional alternative ADA element name.</xd:param>
	</xd:doc>
	<xsl:template match="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAgreement.MedicationAgreementAdditionalInformation']" mode="nl-core-VariableDosingRegimen">
		<xsl:param name="adaElementName" tunnel="yes" select="'aanvullende_informatie'"/>
		<xsl:call-template name="CodeableConcept-to-code">
			<xsl:with-param name="in" select="f:valueCodeableConcept"/>
			<xsl:with-param name="adaElementName" select="$adaElementName"/>
		</xsl:call-template>
	</xsl:template>




	<!--	<xd:doc>
		<xd:desc>Template to resolve f:modifierExtension ext-Medication-stop-type.</xd:desc>
	</xd:doc>
	<xsl:template match="f:modifierExtension[@url = $extStoptype]" mode="nl-core-VariableDosingRegimen">
		<xsl:apply-templates select="f:valueCodeableConcept" mode="#current"/>
	</xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:valueCodeableConcept to stoptype.</xd:desc>
    </xd:doc>
    <xsl:template match="f:valueCodeableConcept" mode="nl-core-VariableDosingRegimen">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'medicatieafspraak_stop_type'"/>
        </xsl:call-template>
    </xsl:template>
    -->
	<xd:doc>
		<!-- ZZZNEW -->
		<xd:desc>Template to resolve priorPrescription.</xd:desc>
	</xd:doc>
	<xd:doc>
		<xd:desc>Template to convert f:f:basedOn to relatie_medicatieafspraak</xd:desc>
	</xd:doc>
	<xsl:template match="f:basedOn" mode="nl-core-VariableDosingRegimen">
		<relatie_medicatieafspraak>
			<xsl:call-template name="Reference-to-identificatie"/>
		</relatie_medicatieafspraak>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:f:priorPrescription to relatie_wisselend_doseerschema</xd:desc>
	</xd:doc>
	<xsl:template match="f:priorPrescription" mode="nl-core-VariableDosingRegimen">
		<relatie_wisselend_doseerschema>
			<xsl:call-template name="Reference-to-identificatie"/>
		</relatie_wisselend_doseerschema>
	</xsl:template>

	<xd:doc>
		<!-- ZZZNEW -->
		<xd:desc>Template to convert f:identifier to identificatie</xd:desc>
	</xd:doc>
	<xsl:template match="f:identifier" mode="nl-core-VariableDosingRegimen">
		<xsl:call-template name="Identifier-to-identificatie"/>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:medicationReference to afgesproken_geneesmiddel</xd:desc>
	</xd:doc>
	<xsl:template match="f:medicationReference" mode="nl-core-VariableDosingRegimen">
		<afgesproken_geneesmiddel>
			<farmaceutisch_product value="{nf:convert2NCName(f:reference/@value)}" datatype="reference"/>
		</afgesproken_geneesmiddel>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:authoredOn to wisselend_doseerschema_datum_tijd</xd:desc>
	</xd:doc>
	<xsl:template match="f:authoredOn" mode="nl-core-VariableDosingRegimen">
		<xsl:call-template name="datetime-to-datetime">
			<xsl:with-param name="adaElementName">wisselend_doseerschema_datum_tijd</xsl:with-param>
			<xsl:with-param name="adaDatatype">datetime</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:reasonCode to reden_wijzigen_of_staken</xd:desc>
	</xd:doc>
	<xsl:template match="f:reasonCode" mode="nl-core-VariableDosingRegimen">
		<xsl:call-template name="CodeableConcept-to-code">
			<xsl:with-param name="in" select="."/>
			<xsl:with-param name="adaElementName" select="'reden_wijzigen_of_staken'"/>
		</xsl:call-template>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:note to toelichting</xd:desc>
	</xd:doc>
	<xsl:template match="f:note" mode="nl-core-VariableDosingRegimen">
		<toelichting value="{f:text/@value}"/>
	</xsl:template>

</xsl:stylesheet>
