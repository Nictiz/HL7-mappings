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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" exclude-result-prefixes="#all" version="2.0">
	<xsl:import href="../../payload/mp9_latest_package.xsl"/>
	<xsl:output indent="yes" omit-xml-declaration="yes"/>

	<xd:doc>
		<xd:desc>Base template for the main interaction.</xd:desc>
	</xd:doc>
	<xsl:template name="ada_sturen_medicatievoorschrift" match="/">
		<xsl:variable name="bouwstenen" as="element()*">
			<!--  contactpersoon -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:RelatedPerson" mode="nl-core-ContactPerson"/>
			<!-- farmaceutisch_product -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Medication" mode="nl-core-PharmaceuticalProduct"/>
			<!-- zorgverlener -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:PractitionerRole" mode="resolve-HealthProfessional-PractitionerRole"/>
			<!-- zorgaanbieder -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Organization" mode="nl-core-HealthcareProvider-Organization"/>
			<!-- lichaamslengte -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Observation[f:code/f:coding/f:code/@value = $bodyHeightLOINCcode]" mode="nl-core-BodyHeight"/>
			<!-- lichaamsgewicht -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Observation[f:code/f:coding/f:code/@value = $bodyWeightLOINCcode]" mode="nl-core-BodyWeight"/>
		</xsl:variable>

		<adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_sturen_medicatievoorschrift.xsd">
			<meta status="new" created-by="generated" last-update-by="generated"/>
			<data>
				<sturen_medicatievoorschrift app="mp-mp93" shortName="sturen_medicatievoorschrift" formName="sturen_medicatievoorschrift" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.395" transactionEffectiveDate="2022-06-30T00:00:00" versionDate="" prefix="mp-" language="nl-NL">
					<xsl:attribute name="title">Generated from HL7 FHIR sturen_medicatievoorschrift</xsl:attribute>
					<xsl:attribute name="id">
						<xsl:choose>
							<xsl:when test="string-length(//f:Bundle[1]/f:id/@value) gt 0">
								<xsl:value-of select="//f:Bundle[1]/f:id/@value"/>
							</xsl:when>
							<xsl:otherwise>DUMMY</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>

					<xsl:choose>
						<xsl:when test="count(f:Bundle/f:entry/f:resource/f:Patient) ge 2 or count(distinct-values(f:Bundle/f:entry/f:resource/(f:MedicationRequest | f:MedicationDispense | f:MedicationStatement)/f:subject/f:reference/@value)) ge 2">
							<xsl:message terminate="yes">Multiple Patients and/or subject references found. Please check.</xsl:message>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Patient" mode="nl-core-Patient"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:for-each-group select="f:Bundle/f:entry/f:resource/(f:MedicationRequest | f:MedicationDispense | f:MedicationStatement | f:MedicationAdministration)" group-by="f:extension[@url = $urlExtPharmaceuticalTreatmentIdentifier]/f:valueIdentifier/concat(f:system/@value, f:value/@value)">
						<medicamenteuze_behandeling>
							<identificatie>
								<xsl:attribute name="value" select="f:extension[@url = $urlExtPharmaceuticalTreatmentIdentifier]/f:valueIdentifier/f:value/@value"/>
								<xsl:attribute name="root" select="local:getOid(f:extension[@url = $urlExtPharmaceuticalTreatmentIdentifier]/f:valueIdentifier/f:system/@value)"/>
							</identificatie>
							<!-- medicatieafspraak -->
							<xsl:apply-templates select="current-group()[self::f:MedicationRequest/f:category/f:coding/f:code/@value = $maCode]" mode="mp-MedicationAgreement"/>
							<!--WisselendDoseerschema in f:MedicationRequest-->
							<xsl:apply-templates select="current-group()[self::f:MedicationRequest/f:category/f:coding/f:code/@value = $wdsCode]" mode="nl-core-VariableDosingRegimen"/>
							<!-- verstrekkingsverzoek -->
							<xsl:apply-templates select="current-group()[self::f:MedicationRequest/f:category/f:coding/f:code/@value = $vvCode]" mode="nl-core-DispenseRequest"/>
						</medicamenteuze_behandeling>
					</xsl:for-each-group>
					<xsl:if test="$bouwstenen/*">
						<bouwstenen>
							<xsl:copy-of select="$bouwstenen"/>
						</bouwstenen>
					</xsl:if>

				</sturen_medicatievoorschrift>
			</data>
		</adaxml>
	</xsl:template>


</xsl:stylesheet>
