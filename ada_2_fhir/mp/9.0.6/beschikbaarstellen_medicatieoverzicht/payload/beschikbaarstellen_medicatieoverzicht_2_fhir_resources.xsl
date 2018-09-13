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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns="http://hl7.org/fhir" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
			<xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA MP9-transaction, to HL7 FHIR STU3 profiles <xd:a href="https://simplifier.net/NictizSTU3/zib-AdministrationAgreement">http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAdministrationAgreement</xd:a>. The HL7 V3 interaction contains both logistical information and therapeutic information.</xd:p>
			<xd:p>
				<xd:b>History:</xd:b>
				<xd:ul>
					<xd:li>2018-06-12 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
				</xd:ul>
			</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:output method="xml" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="../../../2_fhir_mp_include.xsl"/>
	<xsl:param name="referByIdOverride" as="xs:boolean" select="true()"/>
	<xsl:variable name="usecase">mp9</xsl:variable>

	<xsl:variable name="commonEntries" as="element(f:entry)*">
		<xsl:copy-of select="$patient-entry | $practitioners/f:entry | $organizations/f:entry | $practitionerRoles/f:entry | $products/f:entry | $locations/f:entry"/>
	</xsl:variable>

	<xd:doc>
		<xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen medicatieoverzicht".</xd:desc>
	</xd:doc>
	<xsl:template match="/">
		<xsl:call-template name="medicatieoverzicht_90_resources">
			<xsl:with-param name="mbh" select="//beschikbaarstellen_medicatieoverzicht/medicamenteuze_behandeling"/>
		</xsl:call-template>
	</xsl:template>
	<xd:doc>
		<xd:desc>Build the individual FHIR resources.</xd:desc>
		<xd:param name="mbh">ada medicamenteuze behandeling</xd:param>
	</xd:doc>
	<xsl:template name="medicatieoverzicht_90_resources">
		<xsl:param name="mbh"/>

		<xsl:variable name="entries" as="element(f:entry)*">
			<!-- common entries (patient, practitioners, organizations, practitionerroles, products, locations, bouwstenen -->
			<xsl:copy-of select="$commonEntries"/>
			<xsl:copy-of select="$bouwstenen"/>
		</xsl:variable>

		<xsl:variable name="medicatieoverzicht-list" as="element(f:entry)*">
			<xsl:for-each select="$mbh/../documentgegevens">
				<xsl:call-template name="medicatieoverzicht-9.0.6">
					<xsl:with-param name="documentgegevens" select="."/>
					<xsl:with-param name="entries" select="$entries"/>
				</xsl:call-template>
			</xsl:for-each>
		</xsl:variable>

		<xsl:apply-templates select="($entries | $medicatieoverzicht-list/f:entry)/f:resource/*" mode="doResourceInResultdoc"/>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="f:resource/*" mode="doResourceInResultdoc">
		<xsl:variable name="zib-name" select="tokenize(./f:meta/f:profile/@value, './')[last()]"/>
		<xsl:result-document href="./{$usecase}-{$zib-name}-{./f:id/@value}.xml">
			<xsl:copy-of select="."/>
		</xsl:result-document>
	</xsl:template>

</xsl:stylesheet>
