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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:util="urn:hl7:utilities"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" exclude-result-prefixes="#all" version="2.0">
	<xsl:import href="../../payload/mp_latest_package.xsl"/>
	<xsl:output indent="yes" omit-xml-declaration="yes"/>

	<xd:doc>
		<xd:desc>Base template for the main interaction.</xd:desc>
	</xd:doc>
	<xsl:template match="/">
		<xsl:variable name="bouwstenen" as="element()*">
			<!-- zorgverlener -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:PractitionerRole" mode="resolve-HealthProfessional-PractitionerRole"/>
			<!-- zorgaanbieder -->
			<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Organization" mode="nl-core-HealthcareProvider-Organization"/>
		</xsl:variable>

		<adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_sturen_antwoord_voorstel_verstrekkingsverzoek.xsd">
			<meta status="new" created-by="generated" last-update-by="generated"/>
			<data>
				<sturen_antwoord_voorstel_verstrekkingsverzoek app="mp-mp92" shortName="sturen_antwoord_voorstel_verstrekkingsverzoek" formName="sturen_antwoord_voorstel_verstrekkingsverzoek" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.331" transactionEffectiveDate="2022-02-07T00:00:00" versionDate="" prefix="mp-" language="nl-NL">
					<xsl:attribute name="title">Generated from HL7 FHIR sturen_antwoord_voorstel_verstrekkingsverzoek</xsl:attribute>
					<xsl:attribute name="id">DUMMY</xsl:attribute>

					<xsl:choose>
						<xsl:when test="count(f:Bundle/f:entry/f:resource/f:Patient) ge 2 or count(distinct-values(f:Bundle/f:entry/f:resource/(f:MedicationRequest | f:MedicationDispense | f:MedicationStatement)/f:subject/f:reference/@value)) ge 2">
							<xsl:call-template name="util:logMessage">
								<xsl:with-param name="level" select="$logFATAL"/>
								<xsl:with-param name="msg">Multiple Patients and/or subject references found. Please check.</xsl:with-param>
								<xsl:with-param name="terminate" select="true()"/>
							</xsl:call-template></xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Patient" mode="nl-core-Patient"/>
						</xsl:otherwise>
					</xsl:choose>
				
					<xsl:if test="$bouwstenen/*">
						<bouwstenen>
							<xsl:copy-of select="$bouwstenen"/>
						</bouwstenen>
					</xsl:if>
					<xsl:if test="f:Bundle/f:entry/f:resource/f:Communication">
						<voorstel_gegevens>
							<!-- should be only one Communication -->
							<xsl:apply-templates select="f:Bundle/f:entry/f:resource/f:Communication" mode="mp-antwoord">
								<xsl:with-param name="adaAntwoordElementName">antwoord_verstrekkingsverzoek</xsl:with-param>
							</xsl:apply-templates>
						</voorstel_gegevens>
					</xsl:if>

				</sturen_antwoord_voorstel_verstrekkingsverzoek>
			</data>
		</adaxml>
	</xsl:template>


</xsl:stylesheet>
