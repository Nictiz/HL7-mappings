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

	<xsl:variable name="nlcoreLaboratoryTestResult">http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult</xsl:variable>
	<xsl:variable name="extLaboratoryTestResultSequelTo">http://hl7.org/fhir/StructureDefinition/observation-sequelTo</xsl:variable>
	<xsl:variable name="extLaboratoryTestResultEdifactReferenceNumber">http://nictiz.nl/fhir/StructureDefinition/ext-EdifactReferenceNumber</xsl:variable>
	<xsl:variable name="extLaboratoryTestResultCopyIndicator">http://nictiz.nl/fhir/StructureDefinition/ext-CopyIndicator</xsl:variable>
	<xsl:variable name="extLaboratoryTestResultSpecimenSequenceNumber">http://hl7.org/fhir/StructureDefinition/specimen-sequenceNumber</xsl:variable>
	<xsl:variable name="extLaboratoryTestResultSpecimenMorphology">http://nictiz.nl/fhir/StructureDefinition/ext-LaboratoryTestResult.Specimen.Morphology</xsl:variable>
	<xsl:variable name="extLaboratoryTestResultSpecimenLaterality">http://nictiz.nl/fhir/StructureDefinition/ext-AnatomicalLocation.Laterality</xsl:variable>
	
	<xd:doc>
		<xd:desc>Template to convert f:Observation to ADA laboratorium_uitslag. Expects 1 Observation at a time, unless multiple ungrouped tests need to be in one laboratoryTestResult</xd:desc>
		<xd:param name="laboratoryTests">If you need to send in more than 1 Observation because they are part of the same laboratoryTestResult but are otherwise ungrouped, use this parameter</xd:param>
		<xd:param name="laboratoryTestMembers">If you need to send in panel members instead of letting it auto-calculate, do so here</xd:param>
		<xd:param name="performer">If you need to send in the performer instead of letting it auto-calculate, do so here</xd:param>
	</xd:doc>
	<xsl:template match="f:Observation" mode="nl-core-LaboratoryTestResult">
		<xsl:param name="laboratoryTests" select="." as="element(f:Observation)*"/>
		<xsl:param name="laboratoryTestMembers" select="$laboratoryTests[not(f:hasMember)] | $laboratoryTests/f:hasMember/nf:resolveRefInBundle(.)/*" as="element(f:Observation)*"/>
		<xsl:param name="performer" select="($laboratoryTests | $laboratoryTestMembers)/f:performer/nf:resolveRefInBundle(.)/*" as="element(f:Organization)*"/>
		
		<xsl:if test="count($performer) gt 1">
			<xsl:call-template name="util:logMessage">
				<xsl:with-param name="level" select="$logFATAL"/>
				<xsl:with-param name="msg">Unsupported call of nl-core-LaboratoryTestResult. Observations with different performers cannot be grouped</xsl:with-param>
				<xsl:with-param name="terminate" select="true()"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="$laboratoryTests[f:hasMember] and $laboratoryTests[not(f:hasMember)]">
			<xsl:call-template name="util:logMessage">
				<xsl:with-param name="level" select="$logFATAL"/>
				<xsl:with-param name="msg">Unsupported call of nl-core-LaboratoryTestResult. You can send in 1 Observation with hasMember or multiple Observations without hasMember, not both</xsl:with-param>
				<xsl:with-param name="terminate" select="true()"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="count(distinct-values($laboratoryTests/f:extension[@url = $extLaboratoryTestResultEdifactReferenceNumber]/f:valueString/@value)) gt 1">
			<xsl:call-template name="util:logMessage">
				<xsl:with-param name="level" select="$logFATAL"/>
				<xsl:with-param name="msg">Unsupported call of nl-core-LaboratoryTestResult. You cannot group Observations from different Edifact messages as they would not have belonged together</xsl:with-param>
				<xsl:with-param name="terminate" select="true()"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="count(distinct-values(($laboratoryTests | $laboratoryTestMembers)/f:extension[@url = $extLaboratoryTestResultEdifactReferenceNumber]/f:valueString/@value)) gt 1">
			<xsl:call-template name="util:logMessage">
				<xsl:with-param name="level" select="$logFATAL"/>
				<xsl:with-param name="msg">Unsupported call of nl-core-LaboratoryTestResult. Observations with hasMember cannot be in a different Edifact message from their members</xsl:with-param>
				<xsl:with-param name="terminate" select="true()"/>
			</xsl:call-template>
		</xsl:if>
		
		<laboratorium_uitslag>
			<!-- identificatie -->
			<xsl:apply-templates select="$laboratoryTests[f:hasMember]/f:identifier" mode="#current"/>
			<xsl:apply-templates select="($laboratoryTests/f:extension[@url = $extLaboratoryTestResultEdifactReferenceNumber])[1]" mode="#current"/>
			<xsl:apply-templates select="($laboratoryTests/f:extension[@url = $extLaboratoryTestResultCopyIndicator])[1]" mode="#current"/>

			<!-- laboratorium_test -->
			<xsl:apply-templates select="$laboratoryTestMembers" mode="nl-core-LaboratoryTestResult-Member"/>
			
			<!-- monster -->
			<xsl:apply-templates select="($laboratoryTests/f:specimen | $laboratoryTestMembers/f:specimen)[1]/nf:resolveRefInBundle(.)/*" mode="#current"/>
			
			<!-- onderzoek -->
			<xsl:apply-templates select="$laboratoryTests[f:hasMember]/f:code" mode="#current"/>
			
			<!-- resultaat_status -->
			<xsl:apply-templates select="$laboratoryTests[f:hasMember]/f:status" mode="#current"/>

			<!-- toelichting -->
			<xsl:apply-templates select="$laboratoryTests[f:hasMember]/f:note" mode="nl-core-Note"/>

			<!-- uitvoerder -->
			<xsl:apply-templates select="$performer" mode="#current"/>
		</laboratorium_uitslag>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:extension $urlExtAsAgreedIndicator to volgens_afspraak_indicator element.</xd:desc>
	</xd:doc>
	<xsl:template match="f:extension[@url = $extLaboratoryTestResultEdifactReferenceNumber]" mode="nl-core-LaboratoryTestResult">
		<edifact_referentienummer value="{f:valueString/@value}"/>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:extension reason for deviation to medicatie_toediening_reden_van_afwijken element.</xd:desc>
	</xd:doc>
	<xsl:template match="f:extension[@url = $extLaboratoryTestResultCopyIndicator]" mode="nl-core-LaboratoryTestResult">
		<kopie_indicator value="{f:valueBoolean/@value}"/>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:identifier to identificatie</xd:desc>
	</xd:doc>
	<xsl:template match="f:identifier" mode="nl-core-LaboratoryTestResult">
		<xsl:call-template name="Identifier-to-identificatie">
			<xsl:with-param name="adaElementName">laboratorium_uitslag_identificatie</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:status to resultaat_status</xd:desc>
	</xd:doc>
	<xsl:template match="f:status" mode="nl-core-LaboratoryTestResult">
		<xsl:variable name="mapStatus" as="element()*">
			<map inValue="pending" code="pending" codeSystem="{$oidZIBLaboratoriumUitslagTestUitslagStatus}" codeSystemName="{$oidMap[@oid=$oidZIBLaboratoriumUitslagTestUitslagStatus]/@displayName}" displayName="{$zibLaboratoryResultStatusMap[@hl7Code='pending']/@displayName}"/>
			<map inValue="preliminary" code="preliminary" codeSystem="{$oidZIBLaboratoriumUitslagTestUitslagStatus}" codeSystemName="{$oidMap[@oid=$oidZIBLaboratoriumUitslagTestUitslagStatus]/@displayName}" displayName="{$zibLaboratoryResultStatusMap[@hl7Code='preliminary']/@displayName}"/>
			<map inValue="final" code="final" codeSystem="{$oidZIBLaboratoriumUitslagTestUitslagStatus}" codeSystemName="{$oidMap[@oid=$oidZIBLaboratoriumUitslagTestUitslagStatus]/@displayName}" displayName="{$zibLaboratoryResultStatusMap[@hl7Code='final']/@displayName}"/>
			<map inValue="appended" code="appended" codeSystem="{$oidZIBLaboratoriumUitslagTestUitslagStatus}" codeSystemName="{$oidMap[@oid=$oidZIBLaboratoriumUitslagTestUitslagStatus]/@displayName}" displayName="{$zibLaboratoryResultStatusMap[@hl7Code='appended']/@displayName}"/>
			<map inValue="corrected" code="corrected" codeSystem="{$oidZIBLaboratoriumUitslagTestUitslagStatus}" codeSystemName="{$oidMap[@oid=$oidZIBLaboratoriumUitslagTestUitslagStatus]/@displayName}" displayName="{$zibLaboratoryResultStatusMap[@hl7Code='corrected']/@displayName}"/>
		</xsl:variable>
		<xsl:if test="@value = $mapStatus/@inValue">
			<resultaat_status>
				<xsl:call-template name="code-to-code">
					<xsl:with-param name="value" select="@value"/>
					<xsl:with-param name="codeMap" as="element()*" select="$mapStatus"/>
				</xsl:call-template>
			</resultaat_status>
		</xsl:if>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:Observation to laboratorium_test</xd:desc>
	</xd:doc>
	<xsl:template match="f:Observation" mode="nl-core-LaboratoryTestResult-Member">
		<laboratorium_test>
			<!-- test_identificatie -->
			<xsl:apply-templates select="f:identifier" mode="#current"/>
			<!-- test_code -->
			<xsl:apply-templates select="f:code" mode="#current"/>
			<!-- testmethode -->
			<xsl:apply-templates select="f:method" mode="#current"/>
			<!-- test_datum -->
			<xsl:apply-templates select="f:*[starts-with(local-name(),'effective')]" mode="#current"/>
			<!-- test_uitslag -->
			<xsl:choose>
				<xsl:when test="f:dataAbsentReason">
					<xsl:variable name="mapStatus" select="$fhirDataAbsentReason_to_NullFlavor/*" as="element()*"/>
					<xsl:if test="@value = $mapStatus/@inCode">
						<test_uitslag>
							<xsl:call-template name="code-to-code">
								<xsl:with-param name="value" select="f:dataAbsentReason/@value"/>
								<xsl:with-param name="codeMap" as="element()*" select="$mapStatus"/>
							</xsl:call-template>
						</test_uitslag>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="f:*[starts-with(local-name(), 'value')]" mode="#current"/>
				</xsl:otherwise>
			</xsl:choose>
			<!-- test_uitslag_status -->
			<xsl:apply-templates select="f:status" mode="#current"/>
			<!-- referentie_ondergrens / referentie_bovengrens -->
			<xsl:apply-templates select="f:referenceRange" mode="#current"/>
			<!-- interpretatie_vlaggen -->
			<xsl:apply-templates select="f:interpretation[f:coding]" mode="#current"/>
			<!-- uitslag_interpretatie -->
			<xsl:apply-templates select="f:interpretation[f:text]" mode="#current"/>
		</laboratorium_test>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:identifier to test_identificatie</xd:desc>
	</xd:doc>
	<xsl:template match="f:identifier" mode="nl-core-LaboratoryTestResult-Member">
		<xsl:call-template name="Identifier-to-identificatie">
			<xsl:with-param name="adaElementName">test_identificatie</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:code to test_code</xd:desc>
	</xd:doc>
	<xsl:template match="f:code" mode="nl-core-LaboratoryTestResult-Member">
		<xsl:call-template name="CodeableConcept-to-code">
			<xsl:with-param name="adaElementName">test_code</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:identifier to test_identificatie</xd:desc>
	</xd:doc>
	<xsl:template match="f:method" mode="nl-core-LaboratoryTestResult-Member">
		<xsl:call-template name="CodeableConcept-to-code">
			<xsl:with-param name="adaElementName">testmethode</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:effectiveDateTime to test_datum_tijd</xd:desc>
	</xd:doc>
	<xsl:template match="f:effectiveDateTime" mode="nl-core-LaboratoryTestResult-Member">
		<xsl:call-template name="datetime-to-datetime">
			<xsl:with-param name="adaElementName">test_datum_tijd</xsl:with-param>
			<xsl:with-param name="adaDatatype">datetime</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:valueQuantity to test_uitslag</xd:desc>
	</xd:doc>
	<xsl:template match="f:valueQuantity" mode="nl-core-LaboratoryTestResult-Member">
		<xsl:call-template name="Quantity-to-hoeveelheid">
			<xsl:with-param name="adaElementName">test_uitslag</xsl:with-param>
			<xsl:with-param name="adaDatatype">quantity</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xd:doc>
		<xd:desc>Template to convert f:valueCodeableConcept to test_uitslag</xd:desc>
	</xd:doc>
	<xsl:template match="f:valueCodeableConcept" mode="nl-core-LaboratoryTestResult-Member">
		<xsl:call-template name="CodeableConcept-to-code">
			<xsl:with-param name="adaElementName">test_uitslag</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xd:doc>
		<xd:desc>Template to convert f:valueString to test_uitslag</xd:desc>
	</xd:doc>
	<xsl:template match="f:valueString" mode="nl-core-LaboratoryTestResult-Member">
		<test_uitslag value="{@value}" datatype="string"/>
	</xsl:template>
	<xd:doc>
		<xd:desc>Template to convert f:valueBoolean to test_uitslag</xd:desc>
	</xd:doc>
	<xsl:template match="f:valueBoolean" mode="nl-core-LaboratoryTestResult-Member">
		<test_uitslag value="{@value}" datatype="boolean"/>
	</xsl:template>
	<xd:doc>
		<xd:desc>Template to convert f:valueInteger to test_uitslag</xd:desc>
	</xd:doc>
	<xsl:template match="f:valueInteger" mode="nl-core-LaboratoryTestResult-Member">
		<test_uitslag value="{@value}" datatype="count"/>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:status to resultaat_status</xd:desc>
	</xd:doc>
	<xsl:template match="f:status" mode="nl-core-LaboratoryTestResult-Member">
		<xsl:variable name="mapStatus" as="element()*">
			<map inValue="pending" code="pending" codeSystem="{$oidZIBLaboratoriumUitslagTestUitslagStatus}" codeSystemName="{$oidMap[@oid=$oidZIBLaboratoriumUitslagTestUitslagStatus]/@displayName}" displayName="{$zibLaboratoryResultStatusMap[@hl7Code='pending']/@displayName}"/>
			<map inValue="preliminary" code="preliminary" codeSystem="{$oidZIBLaboratoriumUitslagTestUitslagStatus}" codeSystemName="{$oidMap[@oid=$oidZIBLaboratoriumUitslagTestUitslagStatus]/@displayName}" displayName="{$zibLaboratoryResultStatusMap[@hl7Code='preliminary']/@displayName}"/>
			<map inValue="final" code="final" codeSystem="{$oidZIBLaboratoriumUitslagTestUitslagStatus}" codeSystemName="{$oidMap[@oid=$oidZIBLaboratoriumUitslagTestUitslagStatus]/@displayName}" displayName="{$zibLaboratoryResultStatusMap[@hl7Code='final']/@displayName}"/>
			<map inValue="appended" code="appended" codeSystem="{$oidZIBLaboratoriumUitslagTestUitslagStatus}" codeSystemName="{$oidMap[@oid=$oidZIBLaboratoriumUitslagTestUitslagStatus]/@displayName}" displayName="{$zibLaboratoryResultStatusMap[@hl7Code='appended']/@displayName}"/>
			<map inValue="corrected" code="corrected" codeSystem="{$oidZIBLaboratoriumUitslagTestUitslagStatus}" codeSystemName="{$oidMap[@oid=$oidZIBLaboratoriumUitslagTestUitslagStatus]/@displayName}" displayName="{$zibLaboratoryResultStatusMap[@hl7Code='corrected']/@displayName}"/>
		</xsl:variable>
		<xsl:if test="@value = $mapStatus/@inValue">
			<test_uitslag_status>
				<xsl:call-template name="code-to-code">
					<xsl:with-param name="value" select="@value"/>
					<xsl:with-param name="codeMap" as="element()*" select="$mapStatus"/>
				</xsl:call-template>
			</test_uitslag_status>
		</xsl:if>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:referenceRange to referentie_ondergrens and referentie_bovengrens</xd:desc>
	</xd:doc>
	<xsl:template match="f:referenceRange" mode="nl-core-LaboratoryTestResult-Member">
		<xsl:for-each select="f:high">
			<xsl:call-template name="Quantity-to-hoeveelheid">
				<xsl:with-param name="adaElementName">referentie_bovengrens</xsl:with-param>
				<xsl:with-param name="adaDatatype">quantity</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
		<xsl:for-each select="f:low">
			<xsl:call-template name="Quantity-to-hoeveelheid">
				<xsl:with-param name="adaElementName">referentie_ondergrens</xsl:with-param>
				<xsl:with-param name="adaDatatype">quantity</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:interpretation to uitslag_interpetatie</xd:desc>
	</xd:doc>
	<xsl:template match="f:interpretation[f:coding]" mode="nl-core-LaboratoryTestResult-Member">
		<xsl:variable name="allowableSnomedConcepts" select="$zibInterpretatieVlaggen_to_fhirObservationInterpretation/map/(@inCode | @inValue)"/>
		<xsl:variable name="validSnomedCoding" select="f:coding[f:system/@value = $oidMap[@oid = $oidSNOMEDCT]/@uri][f:code/@value = $allowableSnomedConcepts]"/>
		<xsl:choose>
			<xsl:when test="$validSnomedCoding">
				<interpretatie_vlaggen>
					<xsl:call-template name="Coding-to-code">
						<xsl:with-param name="in" select="$validSnomedCoding"/>
					</xsl:call-template>
				</interpretatie_vlaggen>
			</xsl:when>
			<xsl:otherwise>
				<!-- Note: constants.xsl uses @inCode instead of @inValue - requires updated code-to-code -->
				<xsl:variable name="mapStatus" select="$fhirObservationInterpretation_to_zibInterpretatieVlaggen/map" as="element()*"/>
				<xsl:for-each-group select="f:coding/f:code/@value[. = $mapStatus/@inCode]" group-by=".">
					<interpretatie_vlaggen>
						<xsl:call-template name="code-to-code">
							<xsl:with-param name="value" select="current-grouping-key()"/>
							<xsl:with-param name="codeMap" as="element()*" select="$mapStatus"/>
						</xsl:call-template>
					</interpretatie_vlaggen>
				</xsl:for-each-group>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:interpretation to uitslaginterpretatie</xd:desc>
	</xd:doc>
	<xsl:template match="f:interpretation[f:text]" mode="nl-core-LaboratoryTestResult-Member">
		<uitslag_interpretatie value="{f:text/@value}"/>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:specimen to monster</xd:desc>
	</xd:doc>
	<xsl:template match="f:Specimen" mode="nl-core-LaboratoryTestResult">
		<xsl:variable name="specimenSubject" select="f:subject/nf:resolveRefInBundle(.)/*" as="element()"/>
		<monster>
			<!-- monsternummer -->
			<xsl:apply-templates select="f:identifier" mode="nl-core-LaboratoryTestResult-Specimen"/>
			<!-- monstervolgnummer -->
			<xsl:apply-templates select="f:container/f:extension[@url = $extLaboratoryTestResultSpecimenSequenceNumber]/f:valueInteger" mode="nl-core-LaboratoryTestResult-Specimen"/>
			<!-- containertype -->
			<xsl:apply-templates select="f:container/f:type" mode="nl-core-LaboratoryTestResult-Specimen"/>
			<!-- monstermateriaal -->
			<xsl:apply-templates select="f:type" mode="nl-core-LaboratoryTestResult-Specimen"/>
			<!-- anatomische_locatie -->
			<xsl:apply-templates select="f:collection/f:bodySite" mode="nl-core-LaboratoryTestResult-Specimen"/>
			<!-- microorganisme -->
			<!-- TODO - not sure how. Specimen.code could be a microorganism, if Specimen.parent is populated, but in real life Specimen.parent could also have a value for other reasons -->
			<!-- verzamelvolume -->
			<xsl:apply-templates select="f:collection/f:quantity" mode="nl-core-LaboratoryTestResult-Specimen"/>
			<!-- verzamelperiode -->
			<xsl:apply-templates select="f:collection/f:collectedPeriod" mode="nl-core-LaboratoryTestResult-Specimen"/>
			<!-- afname_datum_tijd -->
			<xsl:apply-templates select="f:collection/f:collectedDateTime" mode="nl-core-LaboratoryTestResult-Specimen"/>
			<!-- aanname_datum_tijd -->
			<xsl:apply-templates select="f:collection/f:receivedTime" mode="nl-core-LaboratoryTestResult-Specimen"/>
			<!-- afnameprocedure -->
			<xsl:apply-templates select="f:collection/f:method" mode="nl-core-LaboratoryTestResult-Specimen"/>
			<!-- morfologie -->
			<xsl:apply-templates select="f:collection/f:bodySite/f:extension[@url = $extLaboratoryTestResultSpecimenMorphology]/f:valueCodeableConcept" mode="nl-core-LaboratoryTestResult-Specimen"/>
			<!-- bron_monster -->
			<xsl:apply-templates select="$specimenSubject/self::f:Device" mode="nl-core-LaboratoryTestResult-Specimen"/>
			<!-- toelichting -->
			<xsl:apply-templates select="f:note" mode="nl-core-Note"/>
		</monster>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:identifier to monsternummer</xd:desc>
	</xd:doc>
	<xsl:template match="f:identifier" mode="nl-core-LaboratoryTestResult-Specimen">
		<xsl:call-template name="Identifier-to-identificatie">
			<xsl:with-param name="adaElementName">monsternummer</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:extension[@url = $extLaboratoryTestResultSpecimenSequenceNumber] to monstervolgnummer</xd:desc>
	</xd:doc>
	<xsl:template match="f:container/f:extension[@url = $extLaboratoryTestResultSpecimenSequenceNumber]/f:valueInteger" mode="nl-core-LaboratoryTestResult-Specimen">
		<monstervolgnummer value="{@value}" datatype="count"/>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:container/f:type to containertype</xd:desc>
	</xd:doc>
	<xsl:template match="f:container/f:type" mode="nl-core-LaboratoryTestResult-Specimen">
		<xsl:call-template name="CodeableConcept-to-code">
			<xsl:with-param name="adaElementName">containertype</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:code to monstermateriaal</xd:desc>
	</xd:doc>
	<xsl:template match="f:type" mode="nl-core-LaboratoryTestResult-Specimen">
		<xsl:call-template name="CodeableConcept-to-code">
			<xsl:with-param name="adaElementName">monstermateriaal</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:collection/f:bodySite to anatomische_locatie</xd:desc>
	</xd:doc>
	<xsl:template match="f:collection/f:bodySite" mode="nl-core-LaboratoryTestResult-Specimen">
		<anatomische_locatie>
			<xsl:for-each select="f:coding">
				<locatie>
					<xsl:call-template name="Coding-to-code"/>
				</locatie>
			</xsl:for-each>
			<xsl:for-each select="f:extension[@url = $extLaboratoryTestResultSpecimenLaterality]/f:valueCodeableConcept">
				<xsl:call-template name="CodeableConcept-to-code">
					<xsl:with-param name="adaElementName">lateraliteit</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
		</anatomische_locatie>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:collection/f:quantity to verzamelvolume</xd:desc>
	</xd:doc>
	<xsl:template match="f:collection/f:quantity" mode="nl-core-LaboratoryTestResult-Specimen">
		<xsl:call-template name="Quantity-to-hoeveelheid">
			<xsl:with-param name="adaElementName">verzamelvolume</xsl:with-param>
			<xsl:with-param name="adaDatatype">quantity</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:collection/f:collectionPeriod to verzamelperiode</xd:desc>
	</xd:doc>
	<xsl:template match="f:collection/f:collectedPeriod" mode="nl-core-LaboratoryTestResult-Specimen">
		<verzamelperiode>
			<xsl:for-each select="f:start">
				<xsl:call-template name="datetime-to-datetime">
					<xsl:with-param name="adaElementName">start_datum_tijd</xsl:with-param>
					<xsl:with-param name="adaDatatype">datetime</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="f:end">
				<xsl:call-template name="datetime-to-datetime">
					<xsl:with-param name="adaElementName">eind_datum_tijd</xsl:with-param>
					<xsl:with-param name="adaDatatype">datetime</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
		</verzamelperiode>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:effectiveDateTime to test_datum_tijd</xd:desc>
	</xd:doc>
	<xsl:template match="f:collection/f:collectedDateTime" mode="nl-core-LaboratoryTestResult-Specimen">
		<xsl:call-template name="datetime-to-datetime">
			<xsl:with-param name="adaElementName">afname_datum_tijd</xsl:with-param>
			<xsl:with-param name="adaDatatype">datetime</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:receivedTime to aanname_datum_tijd</xd:desc>
	</xd:doc>
	<xsl:template match="f:collection/f:receivedTime" mode="nl-core-LaboratoryTestResult-Specimen">
		<xsl:call-template name="datetime-to-datetime">
			<xsl:with-param name="adaElementName">aanname_datum_tijd</xsl:with-param>
			<xsl:with-param name="adaDatatype">datetime</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:collection/f:method to afnameprocedure</xd:desc>
	</xd:doc>
	<xsl:template match="f:collection/f:method" mode="nl-core-LaboratoryTestResult-Specimen">
		<xsl:call-template name="CodeableConcept-to-code">
			<xsl:with-param name="adaElementName">afnameprocedure</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:Device to bron_monster</xd:desc>
	</xd:doc>
	<xsl:template match="f:Device" mode="nl-core-LaboratoryTestResult-Specimen">
		<bron_monster value="{f:deviceName/f:name/@value}"/>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:collection/f:extension[@url = $extLaboratoryTestResultSpecimenMorphology]/f:valueCodeableConcept to morfologie</xd:desc>
	</xd:doc>
	<xsl:template match="f:collection/f:bodySite/f:extension[@url = $extLaboratoryTestResultSpecimenMorphology]/f:valueCodeableConcept" mode="nl-core-LaboratoryTestResult-Specimen">
		<xsl:call-template name="CodeableConcept-to-code">
			<xsl:with-param name="adaElementName">morfologie</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xd:doc>
		<xd:desc>Template to convert f:Organization to uitvoerder</xd:desc>
	</xd:doc>
	<xsl:template match="f:Organization" mode="nl-core-LaboratoryTestResult">
		<uitvoerder>
			<xsl:apply-templates select="." mode="nl-core-HealthcareProvider-Organization">
				<xsl:with-param name="doAdaId" select="false()" as="xs:boolean"/>
			</xsl:apply-templates>
		</uitvoerder>
	</xsl:template>

</xsl:stylesheet>
