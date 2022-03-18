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

	<!-- TODO currently the 907 version, we should upgrade to 920 -->
	<!--<xsl:import href="../../../../../fhir_2_ada/mp/fhir_2_ada_mp_include.xsl"/>-->
	<xsl:import href="../../../../zibs2020/payload/zib_latest_package.xsl"/>
	<xsl:output indent="yes" omit-xml-declaration="yes"/>

	<xd:doc>
		<xd:desc>Base template for the main interaction.</xd:desc>
	</xd:doc>
	<xsl:template match="/">
	    <xsl:variable name="bouwstenen" as="element()*">
			<!--  contactpersoon -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:RelatedPerson" mode="nl-core-ContactPerson"/>
			<!-- farmaceutisch_product -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Medication" mode="nl-core-PharmaceuticalProduct"/>
			<!-- zorgverlener -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:PractitionerRole" mode="resolve-HealthProfessional-PractitionerRole"/>
			<!-- zorgaanbieder -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Organization" mode="nl-core-HealthcareProvider-Organization"/>
			<!-- TODO lichaamslengte -->
			<!-- TODO lichaamsgewicht -->
		</xsl:variable>
	    
		<adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_beschikbaarstellen_medicatiegegevens.xsd">
			<meta status="new" created-by="generated" last-update-by="generated" creation-date="{current-dateTime()}" last-update-date="{current-dateTime()}"/>
			<data>
				<beschikbaarstellen_medicatiegegevens app="mp-mp920" shortName="beschikbaarstellen_medicatiegegevens" formName="medicatiegegevens" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.172" transactionEffectiveDate="2021-04-02T09:33:39" prefix="mp-" language="nl-NL">
					<xsl:attribute name="title">Generated from HL7 FHIR medicatiegegevens</xsl:attribute>
					<xsl:attribute name="id">DUMMY</xsl:attribute>

					<xsl:choose>
						<xsl:when test="count(f:Bundle/f:entry/f:resource/f:Patient) ge 2 or count(distinct-values(f:Bundle/f:entry/f:resource/(f:MedicationRequest | f:MedicationDispense | f:MedicationStatement)/f:subject/f:reference/@value)) ge 2">
							<xsl:message terminate="yes">Multiple Patients and/or subject references found. Please check.</xsl:message>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Patient" mode="nl-core-Patient"/>
						</xsl:otherwise>
					</xsl:choose>
				    <xsl:for-each-group select="f:Bundle/f:entry/f:resource/(f:MedicationRequest | f:MedicationDispense | f:MedicationStatement | f:MedicationAdministration)" group-by="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-PharmaceuticalTreatment.Identifier']/f:valueIdentifier/concat(f:system/@value, f:value/@value)">
						<medicamenteuze_behandeling>
							<identificatie>
								<xsl:attribute name="value" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-PharmaceuticalTreatment.Identifier']/f:valueIdentifier/f:value/@value"/>
								<xsl:attribute name="root" select="local:getOid(f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-PharmaceuticalTreatment.Identifier']/f:valueIdentifier/f:system/@value)"/>
							</identificatie>
						    <!-- medicatieafspraak -->
							<xsl:apply-templates select="current-group()[self::f:MedicationRequest/f:category/f:coding/f:code/@value = '16076005']" mode="nl-core-MedicationAgreement"/>
						    <!-- verstrekkingsverzoek -->
						    <xsl:apply-templates select="current-group()[self::f:MedicationRequest/f:category/f:coding/f:code/@value = '52711000146108']" mode="nl-core-DispenseRequest"/>
						    <!--WisselendDoseerschema in f:MedicationRequest-->
						    <xsl:apply-templates select="current-group()[self::f:MedicationRequest/f:category/f:coding/f:code/@value = '395067002']" mode="nl-core-VariableDosingRegimen"/>
							<!-- toedieningsafspraak -->
							<xsl:apply-templates select="current-group()[self::f:MedicationDispense/f:category/f:coding/f:code/@value = '422037009']" mode="nl-core-AdministrationAgreement"/>
							<!-- verstrekking -->
						    <xsl:apply-templates select="current-group()[self::f:MedicationDispense/f:category/f:coding/f:code/@value = '373784005']" mode="nl-core-MedicationDispense"/>
						    
							<!-- medicatie_gebruik -->
						    <xsl:apply-templates select="current-group()[self::f:MedicationStatement/f:category/f:coding/f:code/@value='422979000']" mode="nl-core-MedicationUse2"/>
							<!-- medicatietoediening -->
							<xsl:apply-templates select="current-group()[self::f:MedicationAdministration]" mode="nl-core-MedicationAdministration"/>
							
						</medicamenteuze_behandeling>
					</xsl:for-each-group>
					<!--xxxwim bouwstenen -->
				    <xsl:if test="$bouwstenen/element()">
					<bouwstenen>
						<xsl:for-each select="$bouwstenen">
							<xsl:copy-of select="."/>
						</xsl:for-each>
					</bouwstenen>
				    </xsl:if>

				</beschikbaarstellen_medicatiegegevens>
			</data>
		</adaxml>
	</xsl:template>
    

</xsl:stylesheet>
