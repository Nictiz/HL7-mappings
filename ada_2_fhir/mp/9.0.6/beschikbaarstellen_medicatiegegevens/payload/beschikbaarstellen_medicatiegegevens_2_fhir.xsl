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
	<xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
	<xsl:include href="../../../2_fhir_mp_include.xsl"/>
	<xd:doc>
		<xd:desc>XSLT doesn't have a function for UUID. It will generate an id based on the first element in the input. If you appreciate a UUID or other id, please supply here.</xd:desc>
	</xd:doc>
	<xsl:param name="bundle-id" select="generate-id(./*)"/>

	<xsl:variable name="patient-entry" as="element(f:entry)?">
		<!-- Patient, there should be only one in the input doc -->
		<xsl:for-each select="//beschikbaarstellen_medicatiegegevens/patient">
			<!-- For privacy reasons always use UUID as fullUrl for patient -->
			<xsl:variable name="patient-fullUrl" select="nf:get-fhir-uuid()"/>
			<entry>
				<fullUrl value="{$patient-fullUrl}"/>
				<resource>
					<xsl:call-template name="nl-core-patient-2.0">
						<xsl:with-param name="ada-patient" select="."/>
						<!-- don't pass patient-id because we are using urn:oid or urn:uuid in the fullUrl, there may NOT be a patient-id in the resource itself -->
					</xsl:call-template>
				</resource>
			</entry>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="practitioners" as="element()*">
		<!-- Zorgverleners in Practitioners -->
		<xsl:for-each-group select="//zorgverlener" group-by="string-join(nf:ada-za-id(./zorgverlener_identificatie_nummer)/(@value | @root))">
			<xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPractitioner(.)">
				<!-- uuid als fullUrl genereren vanaf de tweede groep -->
				<xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
				<unieke-zorgverlener xmlns="">
					<group-key xmlns="">
						<xsl:value-of select="current-grouping-key()"/>
					</group-key>
					<xsl:apply-templates select="current-group()[1]" mode="doPractitioner">
						<xsl:with-param name="uuid" select="$uuid"/>
					</xsl:apply-templates>
				</unieke-zorgverlener>
			</xsl:for-each-group>
		</xsl:for-each-group>
	</xsl:variable>
	<xsl:variable name="organizations" as="element()*">
		<!-- Zorgaanbieders -->
		<xsl:for-each-group select="//zorgaanbieder[not(zorgaanbieder)]" group-by="string-join(nf:ada-za-id(./zorgaanbieder_identificatie_nummer)/(@value | @root))">
			<xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
				<xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
				<unieke-zorgaanbieder xmlns="">
					<group-key xmlns="">
						<xsl:value-of select="current-grouping-key()"/>
					</group-key>
					<xsl:apply-templates select="current-group()[1]" mode="doOrganization">
						<xsl:with-param name="uuid" select="$uuid"/>
					</xsl:apply-templates>
				</unieke-zorgaanbieder>
			</xsl:for-each-group>
		</xsl:for-each-group>
	</xsl:variable>
	<xsl:variable name="practitionerRoles" as="element()*">
		<!-- Zorgverleners in PractitionerRoles -->
		<xsl:for-each-group select="//zorgverlener" group-by="nf:getGroupingKeyDefault(.)">
			<unieke-practitionerRole xmlns="">
				<group-key xmlns="">
					<xsl:value-of select="current-grouping-key()"/>
				</group-key>
				<xsl:apply-templates select="current-group()[1]" mode="doPractitionerRole">
					<xsl:with-param name="practitioners" select="$practitioners"/>
					<xsl:with-param name="organizations" select="$organizations"/>
				</xsl:apply-templates>
			</unieke-practitionerRole>
		</xsl:for-each-group>
	</xsl:variable>
	<xsl:variable name="products" as="element()*">
		<!-- Magistrale producten (niet-gecodeerd op hoogste niveau -->
		<xsl:for-each-group select="//product[product_code/@codeSystem = $oidNullFlavor]" group-by="nf:getGroupingKeyDefault(.)">
				<uniek-product xmlns="">
					<group-key xmlns="">
						<xsl:value-of select="current-grouping-key()"/>
					</group-key>
					<xsl:for-each select="current-group()[1]">
						<entry xmlns="http://hl7.org/fhir">
							<fullUrl value="{nf:get-fhir-uuid()}"/>
							<resource>
								<xsl:call-template name="zib-Product">
									<xsl:with-param name="product" select="."/>
								</xsl:call-template>
							</resource>
						</entry>
					</xsl:for-each>
				</uniek-product>
		</xsl:for-each-group>
	</xsl:variable>
	
	<xsl:variable name="commonEntries" as="element(f:entry)*">
		<xsl:copy-of select="$patient-entry | $practitioners/f:entry | $organizations/f:entry | $practitionerRoles/f:entry | $products/f:entry"/>
	</xsl:variable>

	<xd:doc>
		<xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen medicatiegegevens".</xd:desc>
	</xd:doc>
	<xsl:template match="/">
		<xsl:call-template name="Medicatiegegevens_90">
			<xsl:with-param name="ada-patient" select="//beschikbaarstellen_medicatiegegevens/patient"/>
			<xsl:with-param name="mbh" select="//beschikbaarstellen_medicatiegegevens/medicamenteuze_behandeling"/>
		</xsl:call-template>
	</xsl:template>
	<xd:doc>
		<xd:desc>Build a FHIR Bundle of type searchset.</xd:desc>
		<xd:param name="ada-patient">ada patient</xd:param>
		<xd:param name="mbh">ada medicamenteuze behandeling</xd:param>
	</xd:doc>
	<xsl:template name="Medicatiegegevens_90">
		<xsl:param name="ada-patient"/>
		<xsl:param name="mbh"/>
		<xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/STU3/bundle.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
		<Bundle xsl:exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir http://hl7.org/fhir/STU3/bundle.xsd">
			<type value="searchset"/>
			<xsl:variable name="entries" as="element(f:entry)*">
				<!-- common entries (patient, practitioners, organizations, practitionerroles -->
				<xsl:copy-of select="$commonEntries"/>

				<!-- medicatieafspraak -->
				<xsl:for-each select="$mbh/medicatieafspraak">
					<xsl:call-template name="zib-MedicationAgreement-2.0">
						<xsl:with-param name="patient" select="$ada-patient"/>
						<xsl:with-param name="patient-fullUrl" select="$patient-entry/f:fullUrl/@value"/>
						<xsl:with-param name="medicatieafspraak" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- verstrekkingsverzoek -->
				<xsl:for-each select="$mbh/verstrekkingsverzoek">
					<entry xmlns="http://hl7.org/fhir">
						<fullUrl value="{./identificatie[1]/string-join((@value,@root),'--')}"/>
						<resource>
							<xsl:call-template name="zib-DispenseRequest-2.0">
								<xsl:with-param name="patient" select="$ada-patient"/>
								<xsl:with-param name="verstrekkingsverzoek" select="."/>
							</xsl:call-template>
						</resource>
					</entry>
				</xsl:for-each>
				<!-- toedieningsafspraak -->
				<xsl:for-each select="$mbh/toedieningsafspraak">
					<entry xmlns="http://hl7.org/fhir">
						<fullUrl value="{./identificatie[1]/string-join((@value,@root),'--')}"/>
						<resource>
							<xsl:call-template name="zib-AdministrationAgreement-2.0">
								<xsl:with-param name="patient" select="$ada-patient"/>
								<xsl:with-param name="toedieningsafspraak" select="."/>
							</xsl:call-template>
						</resource>
					</entry>
				</xsl:for-each>
				<!-- TODO medicatie in eigen resource bij magistralen, is nu contained opgenomen bij MA/TA -->
				<!--<xsl:if test="$medication/hl7:code[1][@nullFlavor]">
                <entry>
                    <fullUrl value="{generate-id($medication)}"/>
                    <resource>
                        <xsl:apply-templates select="$medication"/>
                    </resource>
                </entry>
            </xsl:if>-->
				<xsl:for-each select="$mbh/verstrekking">
					<entry xmlns="http://hl7.org/fhir">
						<fullUrl value="{./identificatie[1]/string-join((@value,@root),'--')}"/>
						<resource>
							<xsl:call-template name="zib-Dispense-2.0">
								<xsl:with-param name="patient" select="$ada-patient"/>
								<xsl:with-param name="verstrekking" select="."/>
							</xsl:call-template>
						</resource>
					</entry>
				</xsl:for-each>
				<xsl:for-each select="$mbh/medicatie_gebruik">
					<entry xmlns="http://hl7.org/fhir">
						<fullUrl value="{./identificatie[1]/string-join((@value,@root),'--')}"/>
						<resource>
							<xsl:call-template name="zib-MedicationUse-2.0">
								<xsl:with-param name="patient" select="$ada-patient"/>
								<xsl:with-param name="medicatiegebruik" select="."/>
							</xsl:call-template>
						</resource>
					</entry>
				</xsl:for-each>
			</xsl:variable>
			<total value="{count($entries)}"/>
			<xsl:copy-of select="$entries"/>
		</Bundle>
	</xsl:template>

	

</xsl:stylesheet>
