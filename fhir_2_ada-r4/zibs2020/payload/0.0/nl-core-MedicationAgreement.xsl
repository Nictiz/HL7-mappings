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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir"
	xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:util="urn:hl7:utilities" exclude-result-prefixes="#all" version="2.0">

	<xsl:variable name="zib-MedicationAgreement" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement'"/>
	<xsl:variable name="practitionerrole-reference" select="'http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference'"/>
	<xsl:variable name="zib-Medication-StopType" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-StopType'"/>
	<xsl:variable name="zib-Medication-PeriodOfUse" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse'"/>
	<xsl:variable name="zib-MedicationAgreement-BasedOnAgreementOrUse" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-BasedOnAgreementOrUse'"/>
	<xsl:variable name="zib-MedicationUse-Duration" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration'"/>
	<xsl:variable name="zib-Medication-CopyIndicator" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-CopyIndicator'"/>
<!--xxxwim-->
    <xsl:variable name="medication-AdditionalInformation" select="'http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAgreement.MedicationAgreementAdditionalInformation'"/>
    <xsl:variable name="extStoptype" select="'http://nictiz.nl/fhir/StructureDefinition/ext-StopType'"/>
<!--xxxwim geen gerealteerde zib of nl_core gevonden-->
    <xsl:variable name="ext-Context-EpisodeOfCare" select="'http://nictiz.nl/fhir/StructureDefinition/ext-Context-EpisodeOfCare'"/>

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
		    <xsl:apply-templates select="f:encounter[f:type/@value eq 'Encounter']"  mode="#current"/>
		    <!-- xxxwim  relatie_zorgepisode -->
		    <xsl:apply-templates select="f:extension[@url = $ext-Context-EpisodeOfCare]"  mode="#current"/>
			<!-- geannuleerd_indicator  -->
			<xsl:apply-templates select="f:status" mode="#current"/>
			<!-- stoptype -->
		    <xsl:apply-templates select="f:ModifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-StopType']" mode="ext-Medication-stop-type"/>
			<!-- relatie_naar_afspraak_of_gebruik -->
			<xsl:apply-templates select="f:extension[@url = $zib-MedicationAgreement-BasedOnAgreementOrUse]" mode="#current"/>
			<!-- relaties_ketenzorg -->
			<xsl:apply-templates select="f:context" mode="#current"/>
			<!-- voorschrijver -->
			<xsl:apply-templates select="f:requester" mode="#current"/>
			<!-- reden_wijzigen_of_staken -->
			<xsl:apply-templates select="f:reasonCode" mode="#current"/>
			<!-- reden_van_voorschrijven -->
			<xsl:apply-templates select="f:reasonReference" mode="#current"/>
			<!-- afgesproken_geneesmiddel -->
			<xsl:apply-templates select="f:medicationReference" mode="#current"/>
			<!-- gebruiksinstructie -->
			<xsl:apply-templates select="f:dosageInstruction" mode="nl-core-InstructionsForUse"/>
			<!-- lichaamslengte -->
			<xsl:apply-templates select="f:supportingInformation" mode="resolve-bodyHeight"/>
			<!-- lichaamsgewicht -->
			<xsl:apply-templates select="f:supportingInformation" mode="resolve-bodyWeight"/>
			<!-- aanvullende_informatie -->
		    <xsl:apply-templates select="f:extension[@url = $medication-AdditionalInformation]" mode="#current"/>
			<!-- kopie indicator -->
			<xsl:apply-templates select="f:extension[@url = $zib-Medication-CopyIndicator]" mode="ext-zib-Medication-CopyIndicator-2.0"/>
			<!-- toelichting -->
			<xsl:apply-templates select="f:note" mode="#current"/>
		</medicatieafspraak>
	</xsl:template>

 
    <!--xxxwim:-->
    <xd:doc>
        <xd:desc>Template to convert f:extension medication-AdditionalInformation to aanvullende_informatie element.</xd:desc>
        <xd:param name="adaElementName">Optional alternative ADA element name.</xd:param>
    </xd:doc>
    <xsl:template match="f:extension[@url='http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAgreement.MedicationAgreementAdditionalInformation']" mode="nl-core-MedicationAgreement">
        <xsl:param name="adaElementName" tunnel="yes" select="'aanvullende_informatie'"/>
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="f:valueCodeableConcept"/>
            <xsl:with-param name="adaElementName" select="$adaElementName"/>
        </xsl:call-template>
    </xsl:template>

<!--xxxwim:
    <xd:doc>
        <xd:desc>Template to resolve f:modifierExtension zib-Medication-StopType.</xd:desc>
    </xd:doc>
    <xsl:template match="f:modifierExtension[@url ='http://nictiz.nl/fhir/StructureDefinition/ext-StopType']" mode="nl-core-MedicationAgreement">
        <xsl:apply-templates select="f:valueCodeableConcept" mode="#current"/>
    </xsl:template>
    <xd:doc>
        <xd:desc>Template to convert f:valueCodeableConcept to stoptype.</xd:desc>
    </xd:doc>
    <xsl:template match="f:valueCodeableConcept" mode="ext-zib-Medication-Stop-Type-2.0">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'stoptype'"/>
        </xsl:call-template>    
    </xsl:template>-->

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
			<!-- xxxwim: element 'f:medicationReference' komt overeen met de cómbi 'afgesproken_geneesmiddel/farmaceutisch_product',
				dus 1 element wordt 2 elementen -->	
			<farmaceutisch_product value="{nf:convert2NCName(./f:reference/@value)}"/>
<!--xxxwim: removed:		moet naar bouwstenen
			<xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:Medication" mode="zib-PharmaceuticalProduct-2.0"/>-->
		</afgesproken_geneesmiddel>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:authoredOn to afspraakdatum</xd:desc>
	</xd:doc>
	<xsl:template match="f:authoredOn" mode="nl-core-MedicationAgreement">
		<medicatieafspraak_datum_tijd>
			<xsl:attribute name="value">
				<xsl:call-template name="format2ADADate">
					<xsl:with-param name="dateTime" select="@value"/>
				</xsl:call-template>
			</xsl:attribute>
			<!--<xsl:attribute name="datatype">datetime</xsl:attribute>-->
		</medicatieafspraak_datum_tijd>
	</xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:encounter to relatie_contact</xd:desc>
    </xd:doc>
    <xsl:template match="f:encounter" mode="nl-core-MedicationAgreement">
    <relatie_contact>
        <xsl:call-template name="Identifier-to-identificatie">
            <xsl:with-param name="in" select="f:identifier"/>   
            <xsl:with-param name="adaElementName">identificatienummer</xsl:with-param>
        </xsl:call-template>
    </relatie_contact>
    </xsl:template>
<!--xxxwim-->
    <xd:doc>
        <xd:desc>Template to convert f:extension/f:valueReference to relatie_zorgepisode</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url = $ext-Context-EpisodeOfCare]" mode="nl-core-MedicationAgreement">
        <relatie_zorgepisode>
            <xsl:call-template name="Identifier-to-identificatie">
                <xsl:with-param name="in" select="f:valueReference/f:identifier"/>   
                <xsl:with-param name="adaElementName">identificatienummer</xsl:with-param>
            </xsl:call-template>
        </relatie_zorgepisode>
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
			<zorgverlener value="{nf:convert2NCName(./f:reference/@value)}">
			</zorgverlener>
			<!-- xxxwim: de entry/fullUrl/@value met content resource/PractitionerRole/specialty moet nog in de bouwstenen/zorgverlener-->			
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
		<xsl:variable name="reference" select="f:reference/@value"/>
		<reden_van_voorschrijven>
			<!--<xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $reference]/f:Observation" mode="general-observation"/>-->
		    <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $reference]/f:resource/f:Condition[f:meta/f:profile/@value = 'http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem']" mode="nl-core-Problem"/>
		</reden_van_voorschrijven>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:extension with extension url "$zib-MedicationAgreement-BasedOnAgreementOrUse" to relatie_naar_afspraak_of_gebruik</xd:desc>
	</xd:doc>
	<xsl:template match="f:extension[@url = $zib-MedicationAgreement-BasedOnAgreementOrUse]" mode="nl-core-MedicationAgreement">
		<relatie_naar_afspraak_of_gebruik>
			<xsl:choose>
				<xsl:when test="f:valueReference/f:reference">
					<xsl:variable name="referenceValue" select="f:valueReference/f:reference/@value"/>
					<xsl:variable name="resource" select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource"/>
					<xsl:variable name="resourceCategoryCode" select="$resource/f:*/f:category/f:coding/f:code/@value"/>
					<xsl:choose>
						<xsl:when test="$resourceCategoryCode = '16076005'">
							<!-- medicatieafspraak -->
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="$resource/f:MedicationRequest/f:identifier"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$resourceCategoryCode = '422037009'">
							<!-- toedieningsafspraak -->
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="$resource/f:MedicationDispense/f:identifier"/>
								<xsl:with-param name="adaElementName">identificatie_23288</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$resourceCategoryCode = '6'">
							<!-- medicatiegebruik -->
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="$resource/f:MedicationStatement/f:identifier"/>
								<xsl:with-param name="adaElementName">identificatie_23289</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="f:valueReference/f:identifier">
					<xsl:variable name="identifier_type" select="f:valueReference/f:identifier/f:type/f:coding/f:value/@value"/>
					<xsl:variable name="referenceValue" select="f:valueReference/f:identifier/concat(f:system/@value, f:value/@value)"/>
					<xsl:variable name="medicationagreement_resource"
						select="ancestor::f:Bundle/f:entry/f:resource/f:MedicationRequest[f:category/f:coding/f:code/@value = '16076005']/f:identifier[concat(f:system/@value, f:value/@value) = $referenceValue]"/>
					<xsl:variable name="administrationagreement_resource"
						select="ancestor::f:Bundle/f:entry/f:resource/f:MedicationDispense[f:category/f:coding/f:code/@value = '422037009']/f:identifier[concat(f:system/@value, f:value/@value) = $referenceValue]"/>
					<xsl:variable name="medicationuse_resource"
						select="ancestor::f:Bundle/f:entry/f:resource/f:MedicationStatement[f:category/f:coding/f:code/@value = '6']/f:identifier[concat(f:system/@value, f:value/@value) = $referenceValue]"/>
					<xsl:choose>
						<!-- First try to use the f:derivedFrom/f:identifier based on the f:identifier/f:type -->
						<xsl:when test="$identifier_type = '16076005'">
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="f:valueReference/f:identifier"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$identifier_type = '422037009'">
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="f:valueReference/f:identifier"/>
								<xsl:with-param name="adaElementName">identificatie_23288</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$identifier_type = '6'">
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="f:valueReference/f:identifier"/>
								<xsl:with-param name="adaElementName">identificatie_23289</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<!-- Try to resolve f:derivedFrom/f:identifier within Bundle -->
						<xsl:when test="$medicationagreement_resource">
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="$medicationagreement_resource"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$administrationagreement_resource">
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="$administrationagreement_resource"/>
								<xsl:with-param name="adaElementName">identificatie_23288</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$medicationuse_resource">
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="$medicationuse_resource"/>
								<xsl:with-param name="adaElementName">identificatie_23289</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="util:logMessage">
						<xsl:with-param name="level" select="$logERROR"/>
						<xsl:with-param name="msg">
							<xsl:text>MedicationRequest with fullUrl '</xsl:text>
							<xsl:value-of select="parent::f:MedicationRequest/parent::f:resource/preceding-sibling::f:fullUrl/@value"/>
							<xsl:text>' .extension BasedOnAgreementOrUse reference cannot be resolved within the Bundle nor can the type of reference be determined by the identifier.type. Therefore information (relatie_naar_afspraak_of_gebruik/identificatie, identificatie_23288 or identificatie_23289) will be lost.</xsl:text>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</relatie_naar_afspraak_of_gebruik>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:context to relaties_ketenzorg with identificatie_contactmoment of identificatie_episode based on identifier or reference.</xd:desc>
	</xd:doc>
	<xsl:template match="f:context" mode="nl-core-MedicationAgreement">
		<relaties_ketenzorg>
			<!-- identificatie_contactmoment - zib-Encounter - resource: Encounter -->
			<!-- identificatie_episode - nl-core-episodeofcare - resource: EpisodeOfCare -->
			<xsl:choose>
				<xsl:when test="f:reference">
					<xsl:variable name="referenceValue" select="f:reference/@value"/>
					<xsl:variable name="resource" select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource"/>
					<xsl:choose>
						<xsl:when test="$resource/f:Encounter">
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="$resource/f:Encounter/f:identifier"/>
								<xsl:with-param name="adaElementName">identificatie_contactmoment</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$resource/f:EpisodeOfCare">
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="$resource/f:EpisodeOfCare/f:identifier"/>
								<xsl:with-param name="adaElementName">identificatie_episode</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="f:identifier">
					<xsl:variable name="referenceValue" select="f:identifier/concat(f:system/@value, f:value/@value)"/>
					<xsl:variable name="encounter_resource" select="ancestor::f:Bundle/f:entry/f:resource/f:Encounter/f:identifier[concat(f:system/@value, f:value/@value) = $referenceValue]"/>
					<xsl:variable name="episodeofcare_resource" select="ancestor::f:Bundle/f:entry/f:resource/f:EpisodeOfCare/f:identifier[concat(f:system/@value, f:value/@value) = $referenceValue]"/>
					<xsl:choose>
						<!-- Try to resolve f:identifier within Bundle -->
						<xsl:when test="$encounter_resource">
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="$encounter_resource"/>
								<xsl:with-param name="adaElementName">identificatie_contactmoment</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$episodeofcare_resource">
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="$episodeofcare_resource"/>
								<xsl:with-param name="adaElementName">identificatie_episode</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="util:logMessage">
						<xsl:with-param name="level" select="$logERROR"/>
						<xsl:with-param name="msg">
							<xsl:text>MedicationRequest with fullUrl '</xsl:text>
							<xsl:value-of select="parent::f:MedicationRequest/parent::f:resource/preceding-sibling::f:fullUrl/@value"/>
							<xsl:text>' .context reference cannot be resolved within the Bundle nor can the type of reference be determined by the identifier. Therefore information (identificatie_contactmoment or identificatie_episode) will be lost.</xsl:text>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</relaties_ketenzorg>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:note to toelichting</xd:desc>
	</xd:doc>
	<xsl:template match="f:note" mode="nl-core-MedicationAgreement">
		<toelichting value="{f:text/@value}"/>
	</xsl:template>

</xsl:stylesheet>
