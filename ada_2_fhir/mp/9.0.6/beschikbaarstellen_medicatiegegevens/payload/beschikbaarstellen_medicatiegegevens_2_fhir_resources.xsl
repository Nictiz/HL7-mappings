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
	<xd:doc>
		<xd:desc>XSLT doesn't have a function for UUID. It will generate an id based on the first element in the input. If you appreciate a UUID or other id, please supply here.</xd:desc>
	</xd:doc>

	<xsl:variable name="commonEntries" as="element(f:entry)*">
		<xsl:copy-of select="$patient-entry | $practitioners/f:entry | $organizations/f:entry | $practitionerRoles/f:entry | $products/f:entry | $locations/f:entry"/>
	</xsl:variable>

	<xd:doc>
		<xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen medicatiegegevens".</xd:desc>
	</xd:doc>
	<xsl:template match="/">
		<xsl:call-template name="Medicatiegegevens_90_resources">
			<xsl:with-param name="mbh" select="//beschikbaarstellen_medicatiegegevens/medicamenteuze_behandeling"/>
		</xsl:call-template>
	</xsl:template>
	<xd:doc>
		<xd:desc>Build the individual FHIR resources.</xd:desc>
		<xd:param name="mbh">ada medicamenteuze behandeling</xd:param>
	</xd:doc>
	<xsl:template name="Medicatiegegevens_90_resources">
		<xsl:param name="mbh"/>
		<xsl:apply-templates select="$patient-entry//f:Patient" mode="doResourceInResultdoc"/>
		<xsl:apply-templates select="$practitioners//f:Practitioner" mode="doResourceInResultdoc"/>
		<xsl:apply-templates select="$organizations//f:Organization" mode="doResourceInResultdoc"/>
		<xsl:apply-templates select="$practitionerRoles//f:PractitionerRole" mode="doResourceInResultdoc"/>
		<xsl:apply-templates select="$products//f:Medication" mode="doResourceInResultdoc"/>
		<xsl:apply-templates select="$locations//f:Location" mode="doResourceInResultdoc"/>
		<!-- medicatieafspraken -->
		<xsl:variable name="bouwstenen">
			<xsl:for-each select="$mbh/medicatieafspraak">
				<xsl:call-template name="zib-MedicationAgreement-2.0">
					<xsl:with-param name="medicatieafspraak" select="."/>
				</xsl:call-template>
			</xsl:for-each>
			<!-- verstrekkingsverzoeken -->
			<xsl:for-each select="$mbh/verstrekkingsverzoek">
				<xsl:call-template name="zib-DispenseRequest-2.0">
					<xsl:with-param name="verstrekkingsverzoek" select="."/>
				</xsl:call-template>
			</xsl:for-each>
		<!-- toedieningsafspraken -->
			<xsl:for-each select="$mbh/toedieningsafspraak">
				<entry xmlns="http://hl7.org/fhir">
					<fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
					<resource>
						<xsl:call-template name="zib-AdministrationAgreement-2.0">
							<xsl:with-param name="toedieningsafspraak" select="."/>
							<xsl:with-param name="medicationdispense-id" select="if ($referById) then ./identificatie/@value else ()"/>
						</xsl:call-template>
					</resource>
				</entry>
			</xsl:for-each>
			<!-- verstrekkingen -->
			<xsl:for-each select="$mbh/verstrekking">
				<entry xmlns="http://hl7.org/fhir">
					<fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
					<resource>
						<xsl:call-template name="zib-Dispense-2.0">
							<xsl:with-param name="verstrekking" select="."/>
							<xsl:with-param name="medicationdispense-id" select="if ($referById) then (./identificatie/@value) else ()"/>
						</xsl:call-template>
					</resource>
				</entry>
			</xsl:for-each>
			<!-- medicatie_gebruik -->
			<xsl:for-each select="$mbh/medicatie_gebruik">
				<xsl:call-template name="zib-MedicationUse-2.0">
					<xsl:with-param name="medicatiegebruik" select="."/>
					<xsl:with-param name="medicationstatement-id" select="if ($referById) then (./identificatie/@value) else ()"/>
				</xsl:call-template>
			</xsl:for-each>
		</xsl:variable>		

		<xsl:apply-templates select="$bouwstenen//f:resource/*" mode="doResourceInResultdoc"/>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="f:resource/*" mode="doResourceInResultdoc">
		<xsl:variable name="zib-name" select="tokenize(./f:meta/f:profile/@value, './')[last()]"/>
		<xsl:result-document href="./fhir_instance/resources/{$usecase}-{$zib-name}-{./f:id/@value}.xml">
			<xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/STU3/bundle.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
			<xsl:copy-of select="."/>
		</xsl:result-document>
	</xsl:template>

</xsl:stylesheet>
