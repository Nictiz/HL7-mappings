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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
	<xsl:include href="../fhir/2_fhir_fhir_include.xsl"/>

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
					<xsl:for-each select="current-group()[1]">
						<xsl:call-template name="practitioner-entry">
							<xsl:with-param name="uuid" select="$uuid"/>
						</xsl:call-template>
					</xsl:for-each>
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
					<xsl:for-each select="current-group()[1]">
						<xsl:call-template name="organization-entry">
							<xsl:with-param name="uuid" select="$uuid"/>
						</xsl:call-template>
					</xsl:for-each>
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
				<xsl:for-each select="current-group()[1]">
					<xsl:call-template name="practitionerRole-entry">
						<xsl:with-param name="practitioners" select="$practitioners"/>
						<xsl:with-param name="organizations" select="$organizations"/>
					</xsl:call-template>
				</xsl:for-each>
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
	<xsl:variable name="locations" as="element()*">
		<!-- Locaties -->
		<xsl:for-each-group select="//afleverlocatie" group-by="nf:getGroupingKeyDefault(.)">
			<unieke-locatie xmlns="">
				<group-key xmlns="">
					<xsl:value-of select="current-grouping-key()"/>
				</group-key>
				<xsl:for-each select="current-group()[1]">
					<entry xmlns="http://hl7.org/fhir">
						<fullUrl value="{nf:get-fhir-uuid()}"/>
						<resource>
							<xsl:call-template name="zib-Dispense-Location-2.0">
								<xsl:with-param name="ada-locatie" select="."/>
							</xsl:call-template>
						</resource>
					</entry>
				</xsl:for-each>
			</unieke-locatie>
		</xsl:for-each-group>
	</xsl:variable>


	<xd:doc>
		<xd:desc> Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-AdministrationAgreement/ </xd:desc>
		<xd:param name="patient"/>
		<xd:param name="patient-reference"/>
		<xd:param name="medicatieafspraak"/>
		<xd:param name="lengte"/>
		<xd:param name="gewicht"/>
		<xd:param name="reden-voorschrijven"/>
		<xd:param name="lengte-reference"/>
		<xd:param name="gewicht-reference"/>
		<xd:param name="reden-voorschrijven-reference"/>
	</xd:doc>
	<xsl:template name="MA-in-MedicationRequest-2.0">
		<xsl:param name="patient" as="element()?"/>
		<xsl:param name="patient-reference" as="xs:string?"/>
		<xsl:param name="medicatieafspraak" as="element()?"/>
		<xsl:param name="lengte" as="element()?"/>
		<xsl:param name="lengte-reference" as="xs:string?"/>
		<xsl:param name="gewicht" as="element()?"/>
		<xsl:param name="gewicht-reference" as="xs:string?"/>
		<xsl:param name="reden-voorschrijven" as="element()?"/>
		<xsl:param name="reden-voorschrijven-reference" as="xs:string?"/>

		<xsl:for-each select="$medicatieafspraak">
			<MedicationRequest xsl:exclude-result-prefixes="#all">
				<meta>
					<profile value="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement"/>
				</meta>
				<!-- gebruiksperiode_start /eind -->
				<xsl:for-each select=".[gebruiksperiode_start | gebruiksperiode_eind]">
					<xsl:call-template name="zib-Medication-Period-Of-Use-2.0">
						<xsl:with-param name="start" select="./gebruiksperiode_start"/>
						<xsl:with-param name="end" select="./gebruiksperiode_eind"/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- gebruiksperiode - duur -->
				<xsl:for-each select="./gebruiksperiode">
					<xsl:call-template name="zib-Medication-Use-Duration">
						<xsl:with-param name="duration" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- aanvullende_informatie -->
				<xsl:for-each select="./aanvullende_informatie">
					<xsl:call-template name="zib-Medication-AdditionalInformation">
						<xsl:with-param name="additionalInfo" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- relatie naar medicamenteuze behandeling -->
				<xsl:for-each select="./../identificatie">
					<xsl:call-template name="mbh-id-2-reference">
						<xsl:with-param name="in" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- kopie indicator -->
				<!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
				<xsl:for-each select="./kopie_indicator">
					<xsl:call-template name="zib-Medication-CopyIndicator">
						<xsl:with-param name="copyIndicator" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- herhaalperiode cyclisch schema -->
				<xsl:for-each select="./gebruiksinstructie/herhaalperiode_cyclisch_schema">
					<xsl:call-template name="zib-Medication-RepeatPeriodCyclicalSchedule">
						<xsl:with-param name="repeat-period" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- relatie naar medicatieafspraak of gebruik -->
				<xsl:for-each select="relatie_naar_afspraak_of_gebruik/(identificatie | identificatie_23288 | identificatie_23289)">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-BasedOnAgreementOrUse">
						<valueReference>
							<identifier>
								<xsl:call-template name="id-to-Identifier">
									<xsl:with-param name="in" select="."/>
								</xsl:call-template>
							</identifier>
							<display>
								<xsl:attribute name="value">
									<xsl:choose>
										<xsl:when test="./name() = 'identificatie'">relatie naar medicatieafspraak: </xsl:when>
										<xsl:when test="./name() = 'identificatie_23288'">relatie naar toedieningsafspraak: </xsl:when>
										<xsl:when test="./name() = 'identificatie_23289'">relatie naar medicatiegebruik: </xsl:when>
									</xsl:choose>
									<xsl:value-of select="./@value"/> -- <xsl:value-of select="./@root"/>
								</xsl:attribute>
							</display>
						</valueReference>
					</extension>
				</xsl:for-each>
				<!-- stoptype -->
				<xsl:for-each select="stoptype">
					<xsl:call-template name="zib-Medication-StopType">
						<xsl:with-param name="stopType" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- MA id -->
				<xsl:for-each select="./identificatie">
					<identifier>
						<xsl:call-template name="id-to-Identifier">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</identifier>
				</xsl:for-each>
				<!-- geannuleerd_indicator, in status -->
				<xsl:for-each select="./geannuleerd_indicator[@value = 'true']">
					<status value="entered-in-error"/>
				</xsl:for-each>
				<intent value="order"/>
				<!-- type bouwsteen, hier een medicatieafspraak -->
				<category>
					<coding>
						<system value="http://snomed.info/sct"/>
						<code value="16076005"/>
						<display value="Prescription (procedure)"/>
					</coding>
				</category>
				<!-- geneesmiddel -->
				<xsl:for-each select="./afgesproken_geneesmiddel/product/product_code">
					<xsl:choose>
						<xsl:when test=".[@codeSystem = $oidNullFlavor]">
							<medicationReference>
								<reference value="{nf:getFullUrl('PRODUCT', nf:getGroupingKeyDefault(./..))}"/>
								<display value="{./../product_specificatie/product_naam/@value}"/>
							</medicationReference>
						</xsl:when>
						<xsl:otherwise>
							<medicationCodeableConcept>
								<xsl:call-template name="code-to-CodeableConcept">
									<xsl:with-param name="in" select="."/>
								</xsl:call-template>
							</medicationCodeableConcept>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- patiënt -->
				<xsl:call-template name="patient-subject-reference">
					<xsl:with-param name="patient" select="$patient"/>
					<xsl:with-param name="patient-reference" select="$patient-reference"/>
				</xsl:call-template>
				<!-- lichaamslengte -->
				<xsl:for-each select="./lichaamslengte[.//@value]">
					<supportingInformation>
						<reference value="{$lengte-reference}"/>
						<display value="{concat('Lengte. ',./lengte_waarde/@value, ' ', ./lengte_waarde/@unit,'. Datum/tijd gemeten: ', format-dateTime(./lengte_datum_tijd/@value, '[D01] [MN,*-3], [Y0001] [H01]:[m01]'))}"/>
					</supportingInformation>
				</xsl:for-each>
				<!-- lichaamsgewicht -->
				<xsl:for-each select="./lichaamsgewicht[.//@value]">
					<supportingInformation>
						<reference value="{$gewicht-reference}"/>
						<display value="{concat('Gewicht. ',./gewicht_waarde/@value, ' ', ./gewicht_waarde/@unit,'. Datum/tijd gemeten: ', format-dateTime(./gewicht_datum_tijd/@value, '[D01] [MN,*-3], [Y0001] [H01]:[m01]'))}"/>
					</supportingInformation>
				</xsl:for-each>
				<!-- afspraakdatum -->
				<xsl:for-each select="./afspraakdatum[@value]">
					<authoredOn value="{nf:ada-2-dateTimeCET(./@value)}"/>
				</xsl:for-each>
				<!-- voorschrijver -->
				<xsl:for-each select="./voorschrijver[.//(@value | @code)]">
					<xsl:call-template name="zorgverlener-requester-ext">
						<xsl:with-param name="voorschrijver" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- reden afspraak -->
				<xsl:for-each select="./reden_afspraak">
					<reasonCode>
						<xsl:call-template name="code-to-CodeableConcept">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</reasonCode>
				</xsl:for-each>
				<!-- reden van voorschrijven -->
				<xsl:for-each select="./reden_van_voorschrijven/probleem">
					<reasonReference>
						<reference value="{$reden-voorschrijven-reference}"/>
						<display value="{normalize-space(string-join(.//(@displayName|@originalText), ' '))}"/>
					</reasonReference>
				</xsl:for-each>
				<!-- toelichting -->
				<xsl:for-each select="./toelichting[@value]">
					<note>
						<text value="{./@value}"/>
					</note>
				</xsl:for-each>
				<!-- gebruiksinstructie/doseerinstructie/dosering -->
				<xsl:for-each select="./gebruiksinstructie/doseerinstructie/dosering">
					<dosageInstruction>
						<xsl:call-template name="zib-InstructionsForUse-2.0">
							<xsl:with-param name="ada-dosering" select="."/>
						</xsl:call-template>
					</dosageInstruction>
				</xsl:for-each>
				<!-- verstrekker -->
				<xsl:call-template name="verstrekker-performer">
					<xsl:with-param name="verstrekker" select="./verstrekker"/>
				</xsl:call-template>
				<!-- toelichting -->


			</MedicationRequest>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="in"/>
	</xd:doc>
	<xsl:template name="mbh-id-2-reference">
		<xsl:param name="in" as="element()?"/>
		<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment">
			<valueIdentifier>
				<xsl:call-template name="id-to-Identifier">
					<xsl:with-param name="in" select="."/>
				</xsl:call-template>
			</valueIdentifier>
		</extension>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="ada-zorgaanbieder"/>
		<xd:param name="organization-id"/>
	</xd:doc>
	<xsl:template name="nl-core-organization-2.0">
		<xsl:param name="ada-zorgaanbieder" as="element()?"/>
		<xsl:param name="organization-id" as="xs:string?"/>
		<xsl:for-each select="$ada-zorgaanbieder">
			<Organization>
				<xsl:for-each select="$organization-id">
					<id value="{$organization-id}"/>
				</xsl:for-each>
				<xsl:for-each select="./zorgaanbieder_identificatie_nummer">
					<identifier>
						<xsl:call-template name="id-to-Identifier">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</identifier>
				</xsl:for-each>
				<!-- todo organisatietype / afdelingspecialisme -->
				<xsl:for-each select="./organisatie_naam">
					<name value="{./@value}"/>
				</xsl:for-each>
			</Organization>
		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="patient"/>
		<xd:param name="patient-id"/>
		<xd:param name="ada-patient"/>
	</xd:doc>
	<xsl:template name="nl-core-patient-2.0">
		<xsl:param name="patient"/>
		<xsl:param name="ada-patient" as="element()?"/>
		<xsl:param name="patient-id" as="xs:string?"/>
		<xsl:for-each select="$ada-patient">
			<Patient>
				<xsl:for-each select="$patient-id">
					<id value="{$patient-id}"/>
				</xsl:for-each>
				<meta>
					<profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-patient"/>
				</meta>
				<!-- patient_identificatienummer  -->
				<xsl:for-each select="./patient_identificatienummer[.//(@value)]">
					<identifier>
						<xsl:call-template name="id-to-Identifier">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</identifier>
				</xsl:for-each>
				<!-- naamgegevens -->
				<xsl:for-each select="./naamgegevens[.//(@value | @code)]">
					<xsl:call-template name="nl-core-humanname">
						<xsl:with-param name="ada-naamgegevens" select="."/>
						<xsl:with-param name="unstructured-name" select="./ongestructureerde_naam/@value"/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- geslacht -->
				<xsl:for-each select="./geslacht[.//(@value | @code)]">
					<xsl:call-template name="patient-gender">
						<xsl:with-param name="ada-geslacht" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- geboortedatum -->
				<xsl:for-each select="./geboortedatum[./@value]">
					<birthDate value="{./@value}"/>
				</xsl:for-each>
			</Patient>
		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="ada-zorgverlener">The practitioner in ada format</xd:param>
		<xd:param name="practitioner-id">The FHIR resource id.</xd:param>
	</xd:doc>
	<xsl:template name="nl-core-practitioner-2.0">
		<xsl:param name="ada-zorgverlener" as="element()?"/>
		<xsl:param name="practitioner-id" as="xs:string?"/>
		<!-- zorgverlener -->
		<xsl:for-each select="$ada-zorgverlener">
			<Practitioner>
				<xsl:for-each select="$practitioner-id">
					<id value="{$practitioner-id}"/>
				</xsl:for-each>
				<!-- zorgverlener_identificatie_nummer -->
				<xsl:for-each select="./zorgverlener_identificatie_nummer">
					<identifier>
						<xsl:call-template name="id-to-Identifier">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</identifier>
				</xsl:for-each>
				<!-- naamgegevens -->
				<xsl:for-each select="./zorgverlener_naam/naamgegevens">
					<xsl:call-template name="nl-core-humanname">
						<xsl:with-param name="ada-naamgegevens" select="."/>
					</xsl:call-template>
				</xsl:for-each>
			</Practitioner>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="ada-zorgverlener"/>
	</xd:doc>
	<xsl:template name="nl-core-practitionerrole-2.0">
		<xsl:param name="ada-zorgverlener" as="element()?"/>
		<xsl:for-each select="$ada-zorgverlener">
			<PractitionerRole>
				<xsl:for-each select=".[.//@value]">
					<practitioner>
						<reference value="{nf:getFullUrl('PRACTITIONER', nf:getGroupingKeyPractitioner(.))}"/>
						<display value="{normalize-space(string-join(.//naamgegevens[1]//*[not(name()='naamgebruik')]/@value,' '))}"/>
					</practitioner>
				</xsl:for-each>
				<xsl:for-each select="./zorgaanbieder[.//@value]">
					<organization>
						<reference value="{nf:getFullUrl('ORGANIZATION', nf:getGroupingKeyDefault(.//zorgaanbieder[not(zorgaanbieder)]))}"/>
						<display value="{normalize-space(.//organisatie_naam[1]/@value)}"/>
					</organization>
				</xsl:for-each>
				<xsl:for-each select="./zorgverlener_rol">
					<code>
						<xsl:call-template name="code-to-CodeableConcept">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</code>
				</xsl:for-each>
				<xsl:for-each select="./specialisme">
					<specialty>
						<xsl:call-template name="code-to-CodeableConcept">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</specialty>
				</xsl:for-each>
			</PractitionerRole>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="ada-persoon"/>
		<xd:param name="persoon-id"/>
		<xd:param name="patient"/>
		<xd:param name="ada-patient"/>
	</xd:doc>
	<xsl:template name="nl-core-relatedperson-2.0">
		<xsl:param name="patient"/>
		<xsl:param name="ada-persoon"/>
		<xsl:param name="ada-patient"/>
		<xsl:param name="persoon-id"/>

		<xsl:for-each select="$ada-persoon">
			<RelatedPerson>
				<id value="{$persoon-id}"/>
				<xsl:for-each select="./rol_of_functie">
					<extension url="http://fhir.nl/fhir/StructureDefinition/nl-core-relatedperson-role">
						<valueCodeableConcept>
							<xsl:call-template name="code-to-CodeableConcept">
								<xsl:with-param name="in" select="."/>
							</xsl:call-template>
						</valueCodeableConcept>
					</extension>
				</xsl:for-each>
				<patient>
					<xsl:call-template name="patient-reference">
						<xsl:with-param name="ada-patient" select="$ada-patient"/>
					</xsl:call-template>
				</patient>
				<xsl:for-each select="./naamgegevens">
					<xsl:call-template name="nl-core-humanname">
						<xsl:with-param name="ada-naamgegevens" select="."/>
					</xsl:call-template>
				</xsl:for-each>
			</RelatedPerson>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="ada-geslacht"/>
	</xd:doc>
	<xsl:template name="patient-gender">
		<xsl:param name="ada-geslacht" as="element()*"/>
		<xsl:for-each select="$ada-geslacht">
			<gender>
				<xsl:attribute name="value">
					<xsl:choose>
						<xsl:when test="./@code = 'M'">male</xsl:when>
						<xsl:when test="./@code = 'F'">female</xsl:when>
						<xsl:when test="./@code = 'UN'">other</xsl:when>
						<xsl:when test="./@code = 'UNK'">unknown</xsl:when>
						<xsl:otherwise>unknown</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</gender>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc>Helper template for patient as subject reference</xd:desc>
		<xd:param name="patient-reference"/>
		<xd:param name="ada-patient"/>
	</xd:doc>
	<xsl:template name="patient-reference">
		<xsl:param name="ada-patient" as="element()?"/>
		<xsl:param name="patient-reference" as="xs:string?"/>
		<reference value="{$patient-reference}"/>
		<xsl:for-each select="$ada-patient/naamgegevens[1][.//@value]">
			<display value="{normalize-space(string-join(.//*[not(name()='naamgebruik')]/@value,' '))}"/>
		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc>Helper template for patient as subject reference</xd:desc>
		<xd:param name="patient"/>
		<xd:param name="patient-reference"/>
	</xd:doc>
	<xsl:template name="patient-subject-reference">
		<xsl:param name="patient" as="element()?"/>
		<xsl:param name="patient-reference" as="xs:string?"/>
		<subject>
			<xsl:call-template name="patient-reference">
				<xsl:with-param name="ada-patient" select="$patient"/>
				<xsl:with-param name="patient-reference" select="$patient-reference"/>
			</xsl:call-template>
		</subject>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="verstrekker"/>
	</xd:doc>
	<xsl:template name="verstrekker-performer">
		<xsl:param name="verstrekker" as="element()?"/>
		<!-- verstrekker -->
		<xsl:for-each select="$verstrekker">
			<performer>
				<!-- in dataset toedieningsafspraak staat zorgaanbieder (onnodig) een keer extra genest -->
				<xsl:for-each select="./(zorgaanbieder[zorgaanbieder]/zorgaanbieder | zorgaanbieder[not(zorgaanbieder)])">
					<actor>
						<xsl:for-each select="./zorgaanbieder_identificatie_nummer">
							<identifier>
								<xsl:call-template name="id-to-Identifier">
									<xsl:with-param name="in" select="."/>
								</xsl:call-template>
							</identifier>
						</xsl:for-each>
						<xsl:for-each select="./organisatie_naam[@value]">
							<display value="{./@value}"/>
						</xsl:for-each>
					</actor>
				</xsl:for-each>
			</performer>
		</xsl:for-each>

	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="zorgverlener"/>
	</xd:doc>
	<xsl:template name="zorgverlener-requester">
		<xsl:param name="zorgverlener"/>
		<requester>
			<xsl:for-each select="$zorgverlener">
				<agent>
					<reference value="{nf:getFullUrl('PRACTITIONER',nf:getGroupingKeyPractitioner(.))}"/>
					<display value="{normalize-space(string-join(.//(naamgegevens)//@value, ' '))}"/>
				</agent>
				<xsl:for-each select="./zorgaanbieder/zorgaanbieder">
					<onBehalfOf>
						<reference value="{nf:getFullUrl('ORGANIZATION',nf:getGroupingKeyDefault(./zorgaanbieder[not(zorgaanbieder)]))}"/>
						<display value="{./organisatie_naam/@value}"/>
					</onBehalfOf>
				</xsl:for-each>
			</xsl:for-each>
		</requester>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="voorschrijver"/>
	</xd:doc>
	<xsl:template name="zorgverlener-requester-ext">
		<xsl:param name="voorschrijver"/>
		<xsl:for-each select="$voorschrijver/zorgverlener[.//(@value | @code)]">
			<requester>
				<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-RequesterRole">
					<valueReference>
						<reference value="{nf:getFullUrl('PRACTITIONERROLE', nf:getGroupingKeyDefault(.))}"/>
						<display value="{normalize-space(concat(string-join((.//naamgegevens[1]//*[not(name()='naamgebruik')]/@value), ' '), ' || ', string-join(.//organisatie_naam/@value |.//specialisme/@displayName,' || ')))}"/>
					</valueReference>
				</extension>
				<!-- agent is verplicht in FHIR, dit is eigenlijk dubbelop omdat de practitionerRole hier ook al naar verwijst -->
				<agent>
					<reference value="{nf:getFullUrl('PRACTITIONER', nf:getGroupingKeyPractitioner(.))}"/>
					<display value="{normalize-space(string-join(.//naamgegevens[1]//*[not(name()='naamgebruik')]/@value,' '))}"/>
				</agent>
			</requester>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="ada-naamgegevens"/>
		<xd:param name="unstructured-name"/>
	</xd:doc>
	<xsl:template name="nl-core-humanname" as="element()*">
		<xsl:param name="ada-naamgegevens" as="element()*"/>
		<xsl:param name="unstructured-name" as="xs:string?"/>
		<xsl:for-each select="$ada-naamgegevens[.//@value]">
			<name>
				<xsl:for-each select="./naamgebruik[@code]">
					<extension url="http://hl7.org/fhir/StructureDefinition/humanname-assembly-order">
						<valueCode value="{./@code}"/>
					</extension>
				</xsl:for-each>
				<!-- unstructured-name, not supported in zib datamodel, may be customized per transaction, therefore parameterized in this template -->
				<xsl:if test="string-length($unstructured-name) > 0">
					<text>
						<xsl:value-of select="."/>
					</text>
				</xsl:if>
				<xsl:if test="./(geslachtsnaam | geslachtsnaam_partner)[.//@value]">
					<family>
						<xsl:attribute name="value">
							<xsl:choose>
								<!-- Eigen geslachtsnaam -->
								<xsl:when test="./naamgebruik/@code = 'NL1'">
									<xsl:value-of select="normalize-space(string-join((./geslachtsnaam/voorvoegsels/@value, ././geslachtsnaam/achternaam/@value), ' '))"/>
								</xsl:when>
								<!-- 	Geslachtsnaam partner -->
								<xsl:when test="./naamgebruik/@code = 'NL2'">
									<xsl:value-of select="normalize-space(string-join((./geslachtsnaam_partner/voorvoegsels_partner/@value, ././geslachtsnaam_partner/achternaam_partner/@value), ' '))"/>
								</xsl:when>
								<!-- Geslachtsnaam partner gevolgd door eigen geslachtsnaam -->
								<xsl:when test="./naamgebruik/@code = 'NL3'">
									<xsl:value-of select="normalize-space(string-join((./geslachtsnaam_partner/voorvoegsels_partner/@value, ././geslachtsnaam_partner/achternaam_partner/@value, ./geslachtsnaam/voorvoegsels/@value, ././geslachtsnaam/achternaam/@value), ' '))"/>
								</xsl:when>
								<!-- Eigen geslachtsnaam gevolgd door geslachtsnaam partner -->
								<xsl:when test="./naamgebruik/@code = 'NL4'">
									<xsl:value-of select="normalize-space(string-join((./geslachtsnaam/voorvoegsels/@value, ././geslachtsnaam/achternaam/@value, ./geslachtsnaam_partner/voorvoegsels_partner/@value, ././geslachtsnaam_partner/achternaam_partner/@value), ' '))"/>
								</xsl:when>
								<!-- otherwise: we nemen aan NL4 - Eigen geslachtsnaam gevolgd door geslachtsnaam partner zodat iig geen informatie 'verdwijnt' -->
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(string-join((./geslachtsnaam/voorvoegsels/@value, ././geslachtsnaam/achternaam/@value, ./geslachtsnaam_partner/voorvoegsels_partner/@value, ././geslachtsnaam_partner/achternaam_partner/@value), ' '))"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<xsl:for-each select="./geslachtsnaam/voorvoegsels[@value]">
							<extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-prefix">
								<valueString value="{normalize-space(./@value)}"/>
							</extension>
						</xsl:for-each>
						<xsl:for-each select="./geslachtsnaam/achternaam[@value]">
							<extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-name">
								<valueString value="{normalize-space(./@value)}"/>
							</extension>
						</xsl:for-each>
						<xsl:for-each select="./geslachtsnaam_partner/voorvoegsels[@value]">
							<extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-prefix">
								<valueString value="{normalize-space(./@value)}"/>
							</extension>
						</xsl:for-each>
						<xsl:for-each select="./geslachtsnaam_partner/achternaam[@value]">
							<extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-name">
								<valueString value="{normalize-space(./@value)}"/>
							</extension>
						</xsl:for-each>
					</family>
				</xsl:if>
				<xsl:for-each select="./voornamen[.//@value]">
					<given value="{normalize-space(./@value)}">
						<extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
							<valueCode value="BR"/>
						</extension>
					</given>
				</xsl:for-each>
				<xsl:for-each select="./initialen[.//@value]">
					<given value="{normalize-space(./@value)}">
						<extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
							<valueCode value="IN"/>
						</extension>
					</given>
				</xsl:for-each>
				<xsl:for-each select="./roepnaam[.//@value]">
					<given value="{normalize-space(./@value)}">
						<extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
							<valueCode value="CL"/>
						</extension>
					</given>
				</xsl:for-each>
				<xsl:for-each select="prefix[not(tokenize(@qualifier, '\s') = 'VV')]">
					<prefix value="{.}"/>
				</xsl:for-each>
				<xsl:for-each select="suffix[.//@value]">
					<suffix value="{.}"/>
				</xsl:for-each>
				<xsl:if test="validTime[.//@value]">
					<period>
						<!-- <xsl:call-template name="IVL_TS-to-Period">
                     <xsl:with-param name="in" select="validTime"/>
                  </xsl:call-template>
            -->
					</period>
				</xsl:if>
			</name>
		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="patient"/>
		<xd:param name="patient-fullUrl"/>
		<xd:param name="verstrekkingsverzoek"/>
	</xd:doc>
	<xsl:template name="VV-in-MedicationRequest-2.0">
		<xsl:param name="patient" as="element()?"/>
		<xsl:param name="patient-fullUrl" as="xs:string?"/>
		<xsl:param name="verstrekkingsverzoek" as="element()?"/>

		<xsl:for-each select="$verstrekkingsverzoek">
			<MedicationRequest>
				<meta>
					<profile value="http://nictiz.nl/fhir/StructureDefinition/zib-DispenseRequest"/>
				</meta>
				<!-- aanvullende_wensen in extensie -->
				<xsl:for-each select="aanvullende_wensen">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation">
						<valueCodeableConcept>
							<xsl:call-template name="code-to-CodeableConcept">
								<xsl:with-param name="in" select="."/>
							</xsl:call-template>
						</valueCodeableConcept>
					</extension>
				</xsl:for-each>
				<!-- relatie naar medicatieafspraak -->
				<xsl:for-each select="relatie_naar_medicatieafspraak/identificatie[not(@root = $oidNullFlavor)]">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-DispenseRequest-RelatedMedicationAgreement">
						<valueReference>
							<identifier>
								<xsl:call-template name="id-to-Identifier">
									<xsl:with-param name="in" select="."/>
								</xsl:call-template>
							</identifier>
							<display>
								<xsl:attribute name="value">Relatie naar medicatieafspraak, id = <xsl:value-of select="./string-join((@value, @root), ' -- ')"/></xsl:attribute>
							</display>
						</valueReference>
					</extension>
				</xsl:for-each>
				<!-- relatie naar medicamenteuze behandeling -->
				<xsl:for-each select="./../identificatie">
					<xsl:call-template name="mbh-id-2-reference">
						<xsl:with-param name="in" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- Verstrekkingsverzoek id -->
				<xsl:for-each select="./identificatie">
					<identifier>
						<xsl:call-template name="id-to-Identifier">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</identifier>
				</xsl:for-each>
				<intent value="order"/>
				<!-- type bouwsteen, hier een medicatieverstrekking -->
				<category>
					<coding>
						<system value="http://snomed.info/sct"/>
						<code value="52711000146108"/>
						<display value="Request to dispense medication to patient (situation)"/>
					</coding>
				</category>
				<!-- geneesmiddel -->
				<xsl:for-each select="./te_verstrekken_geneesmiddel/product/product_code[@code]">
					<xsl:choose>
						<xsl:when test=".[@codeSystem = $oidNullFlavor]">
							<medicationReference>
								<reference value="{nf:getFullUrl('PRODUCT',nf:getGroupingKeyDefault(./..))}"/>
								<display value="{./@originalText}"/>
							</medicationReference>
						</xsl:when>
						<xsl:otherwise>
							<medicationCodeableConcept>
								<xsl:call-template name="code-to-CodeableConcept">
									<xsl:with-param name="in" select="."/>
								</xsl:call-template>
							</medicationCodeableConcept>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- patiënt -->
				<xsl:call-template name="patient-subject-reference">
					<xsl:with-param name="patient" select="$patient"/>
					<xsl:with-param name="patient-reference" select="$patient-fullUrl"/>
				</xsl:call-template>
				<!-- verstrekkingsverzoek datum -->
				<xsl:for-each select="./datum[@value]">
					<authoredOn value="{nf:ada-2-dateTimeCET(./@value)}"/>
				</xsl:for-each>
				<!-- auteur -->
				<xsl:for-each select="./auteur[.//(@value | @code)]">
					<xsl:call-template name="zorgverlener-requester-ext">
						<xsl:with-param name="voorschrijver" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- toelichting -->
				<xsl:for-each select="./toelichting[@value]">
					<note>
						<text value="{./@value}"/>
					</note>
				</xsl:for-each>
				<!-- verstrekkingsverzoek zelf -->
				<dispenseRequest>
					<!-- afleverlocatie -->
					<xsl:for-each select="./afleverlocatie[@value]">
						<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-Location">
							<valueReference>
								<reference value="{nf:getFullUrl('LOCATION', nf:getGroupingKeyDefault(.))}"/>
								<display value="{./@value}"/>
							</valueReference>
						</extension>
					</xsl:for-each>
					<!-- verbruiksperiode start/eind -->
					<xsl:for-each select="./verbruiksperiode[(ingangsdatum | einddatum)/@value]">
						<validityPeriod>
							<start value="{./ingangsdatum/@value}"/>
							<end value="{./einddatum/@value}"/>
						</validityPeriod>
					</xsl:for-each>
					<!-- aantal_herhalingen -->
					<xsl:for-each select="./aantal_herhalingen[@value]">
						<numberOfRepeatsAllowed value="{./@value}"/>
					</xsl:for-each>
					<!-- te_verstrekken_hoeveelheid -->
					<xsl:for-each select="./te_verstrekken_hoeveelheid[.//@value]">
						<quantity>
							<xsl:call-template name="hoeveelheid-complex-to-Quantity">
								<xsl:with-param name="waarde" select="./aantal"/>
								<xsl:with-param name="eenheid" select="./eenheid"/>
							</xsl:call-template>
						</quantity>
					</xsl:for-each>
					<!-- verbruiksperiode -->
					<xsl:for-each select="./verbruiksperiode/duur[@value]">
						<expectedSupplyDuration>
							<xsl:call-template name="hoeveelheid-to-Duration">
								<xsl:with-param name="in" select="."/>
							</xsl:call-template>
						</expectedSupplyDuration>
					</xsl:for-each>
					<!--  -->
					<!-- beoogd verstrekker -->
					<xsl:for-each select="./beoogd_verstrekker">
						<performer>
							<!-- in dataset toedieningsafspraak staat zorgaanbieder (onnodig) een keer extra genest -->
							<xsl:for-each select="./zorgaanbieder">
								<reference value="{nf:getFullUrl('ORGANIZATION',nf:getGroupingKeyDefault(.))}"/>
								<display value="{./organisatie_naam/@value}"/>
							</xsl:for-each>
						</performer>
					</xsl:for-each>
				</dispenseRequest>
				<xsl:for-each select="./verstrekte_hoeveelheid[.//*[@value]]">
					<quantity>
						<xsl:call-template name="hoeveelheid-complex-to-Quantity">
							<xsl:with-param name="eenheid" select="./eenheid"/>
							<xsl:with-param name="waarde" select="./aantal"/>
						</xsl:call-template>
					</quantity>
				</xsl:for-each>
				<xsl:for-each select="./verbruiksduur[@value]">
					<daysSupply>
						<xsl:call-template name="hoeveelheid-to-Duration">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</daysSupply>
				</xsl:for-each>
			</MedicationRequest>
		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc> Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-AdministrationAgreement/ </xd:desc>
		<xd:param name="patient"/>
		<xd:param name="toedieningsafspraak"/>
		<xd:param name="patient-fullUrl"/>
	</xd:doc>
	<xsl:template name="zib-AdministrationAgreement-2.0">
		<xsl:param name="patient" as="element()?"/>
		<xsl:param name="patient-fullUrl" as="xs:string?"/>
		<xsl:param name="toedieningsafspraak" as="element()?"/>
		<xsl:for-each select="$toedieningsafspraak">
			<MedicationDispense>
				<meta>
					<profile value="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement"/>
				</meta>
				<!-- afspraakdatum -->
				<xsl:for-each select="./afspraakdatum[@value]">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-AuthoredOn">
						<valueDateTime value="{nf:ada-2-dateTimeCET(./@value)}"/>
					</extension>
				</xsl:for-each>
				<!-- reden afspraak -->
				<xsl:for-each select="./reden_afspraak">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-AgreementReason">
						<valueString value="{./@value}"/>
					</extension>
				</xsl:for-each>
				<!-- gebruiksperiode_start /eind -->
				<xsl:for-each select=".[gebruiksperiode_start | gebruiksperiode_eind]">
					<xsl:call-template name="zib-Medication-Period-Of-Use-2.0">
						<xsl:with-param name="start" select="./gebruiksperiode_start"/>
						<xsl:with-param name="end" select="./gebruiksperiode_eind"/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- gebruiksperiode - duur -->
				<xsl:for-each select="./gebruiksperiode">
					<xsl:call-template name="zib-Medication-Use-Duration">
						<xsl:with-param name="duration" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- aanvullende_informatie -->
				<xsl:for-each select="./aanvullende_informatie">
					<xsl:call-template name="zib-Medication-AdditionalInformation">
						<xsl:with-param name="additionalInfo" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- relatie naar medicamenteuze behandeling -->
				<xsl:for-each select="./../identificatie">
					<xsl:call-template name="mbh-id-2-reference">
						<xsl:with-param name="in" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- kopie indicator -->
				<!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
				<xsl:for-each select="./kopie_indicator">
					<xsl:call-template name="zib-Medication-CopyIndicator">
						<xsl:with-param name="copyIndicator" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- herhaalperiode cyclisch schema -->
				<xsl:for-each select="./gebruiksinstructie/herhaalperiode_cyclisch_schema">
					<xsl:call-template name="zib-Medication-RepeatPeriodCyclicalSchedule">
						<xsl:with-param name="repeat-period" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- stoptype -->
				<xsl:for-each select="stoptype">
					<xsl:call-template name="zib-Medication-StopType">
						<xsl:with-param name="stopType" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- TA id -->
				<xsl:for-each select="./identificatie">
					<identifier>
						<xsl:call-template name="id-to-Identifier">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</identifier>
				</xsl:for-each>
				<!-- geannuleerd_indicator, in status -->
				<xsl:for-each select="./geannuleerd_indicator[@value = 'true']">
					<status value="entered-in-error"/>
				</xsl:for-each>
				<!-- type bouwsteen, hier een toedieningsafspraak -->
				<category>
					<coding>
						<system value="http://snomed.info/sct"/>
						<code value="422037009"/>
						<display value="Provider medication administration instructions (procedure)"/>
					</coding>
				</category>
				<!-- geneesmiddel -->
				<xsl:for-each select="./geneesmiddel_bij_toedieningsafspraak/product/product_code">
					<xsl:choose>
						<xsl:when test=".[@codeSystem = $oidNullFlavor]">
							<medicationReference>
								<reference value="{nf:getFullUrl('PRODUCT', nf:getGroupingKeyDefault(./..))}"/>
								<display value="{./../product_specificatie/product_naam/@value}"/>
							</medicationReference>
						</xsl:when>
						<xsl:otherwise>
							<medicationCodeableConcept>
								<xsl:call-template name="code-to-CodeableConcept">
									<xsl:with-param name="in" select="."/>
								</xsl:call-template>
							</medicationCodeableConcept>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- patiënt -->
				<xsl:call-template name="patient-subject-reference">
					<xsl:with-param name="patient" select="$patient"/>
					<xsl:with-param name="patient-reference" select="$patient-fullUrl"/>
				</xsl:call-template>
				<!-- verstrekker -->
				<xsl:call-template name="verstrekker-performer">
					<xsl:with-param name="verstrekker" select="./verstrekker"/>
				</xsl:call-template>
				<!-- relatie naar medicatieafspraak -->
				<xsl:for-each select="relatie_naar_medicatieafspraak/identificatie[not(@root = $oidNullFlavor)]">
					<authorizingPrescription>
						<identifier>
							<xsl:call-template name="id-to-Identifier">
								<xsl:with-param name="in" select="."/>
							</xsl:call-template>
						</identifier>
						<display>
							<xsl:attribute name="value">relatie naar medicatieafspraak: <xsl:value-of select="./@value"/> -- <xsl:value-of select="./@root"/></xsl:attribute>
						</display>
					</authorizingPrescription>
				</xsl:for-each>
				<!-- toelichting -->
				<xsl:comment>Toelichting</xsl:comment>
				<xsl:for-each select="./toelichting[@value]">
					<note>
						<text value="{./@value}"/>
					</note>
				</xsl:for-each>

				<xsl:for-each select="./gebruiksinstructie/doseerinstructie/dosering">
					<dosageInstruction>
						<xsl:call-template name="zib-InstructionsForUse-2.0">
							<xsl:with-param name="ada-dosering" select="."/>
						</xsl:call-template>
					</dosageInstruction>
				</xsl:for-each>

			</MedicationDispense>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc> &lt;xsl:include href="../zib1bbr/zib1bbr_include.xsl"/&gt; &lt;xsl:include href="../naw/naw_include.xsl"/&gt; </xd:desc>
		<xd:param name="toedieningsschema"/>
	</xd:doc>
	<xsl:template name="zib-Administration-Schedule-2.0">
		<xsl:param name="toedieningsschema" as="element()?"/>
		<xsl:for-each select="$toedieningsschema">
			<timing>
				<xsl:if test="./../../doseerduur or ./../toedieningsduur or .//*[@value or @code]">
					<repeat>
						<!-- doseerduur -->
						<xsl:comment>doseerduur</xsl:comment>
						<xsl:for-each select="./../../doseerduur[@value]">
							<boundsDuration>
								<xsl:call-template name="hoeveelheid-to-Duration">
									<xsl:with-param name="in" select="."/>
								</xsl:call-template>
							</boundsDuration>
						</xsl:for-each>
						<!-- toedieningsduur -->
						<xsl:comment>toedieningsduur</xsl:comment>
						<xsl:for-each select="./../toedieningsduur[@value]">
							<duration value="{./@value}"/>
							<durationUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(./@unit)}"/>
						</xsl:for-each>
						<!-- frequentie -->
						<xsl:for-each select="./frequentie/aantal/(vaste_waarde | min)[@value]">
							<frequency value="{./@value}"/>
						</xsl:for-each>
						<xsl:for-each select="./frequentie/aantal/(max)[@value]">
							<frequencyMax value="{./@value}"/>
						</xsl:for-each>
						<!-- ./frequentie/tijdseenheid -->
						<xsl:for-each select="./frequentie/tijdseenheid">
							<xsl:comment>frequentie/tijdseenheid</xsl:comment>
							<period value="{./@value}"/>
							<periodUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(./@unit)}"/>
						</xsl:for-each>
						<!-- interval -->
						<xsl:for-each select="./interval">
							<xsl:comment>interval</xsl:comment>
							<period value="{./@value}"/>
							<periodUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(./@unit)}"/>
						</xsl:for-each>
						<xsl:for-each select="./weekdag">
							<dayOfWeek>
								<xsl:attribute name="value">
									<xsl:choose>
										<xsl:when test="./@code = '307145004'">mon</xsl:when>
										<xsl:when test="./@code = '307147007'">tue</xsl:when>
										<xsl:when test="./@code = '307148002'">wed</xsl:when>
										<xsl:when test="./@code = '307149005'">thu</xsl:when>
										<xsl:when test="./@code = '307150005'">fri</xsl:when>
										<xsl:when test="./@code = '307151009'">sat</xsl:when>
										<xsl:when test="./@code = '307146003'">sun</xsl:when>
									</xsl:choose>
								</xsl:attribute>
							</dayOfWeek>
						</xsl:for-each>
						<!-- toedientijd -->
						<xsl:for-each select="./toedientijd[@value]">
							<xsl:comment>toedientijd</xsl:comment>
							<timeOfDay value="{format-dateTime(./@value, '[H01]:[m01]:[s01]')}"/>
						</xsl:for-each>
						<!-- dagdeel -->
						<xsl:for-each select="./dagdeel[@code][not(@codeSystem = $oidNullFlavor)]">
							<xsl:comment>dagdeel</xsl:comment>
							<when>
								<xsl:attribute name="value">
									<xsl:choose>
										<xsl:when test="./@code = '73775008'">MORN</xsl:when>
										<xsl:when test="./@code = '255213009'">AFT</xsl:when>
										<xsl:when test="./@code = '3157002'">EVE</xsl:when>
										<xsl:when test="./@code = '2546009'">NIGHT</xsl:when>
									</xsl:choose>
								</xsl:attribute>
							</when>
						</xsl:for-each>
					</repeat>
				</xsl:if>
			</timing>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="lengte"/>
		<xd:param name="patient"/>
		<xd:param name="patient-reference"/>
	</xd:doc>
	<xsl:template name="zib-BodyHeight-2.0">
		<xsl:param name="lengte" as="element()*"/>
		<xsl:param name="patient" as="element()?"/>
		<xsl:param name="patient-reference" as="xs:string?"/>
		<xsl:for-each select="$lengte">
			<Observation>
				<meta>
					<profile value="http://nictiz.nl/fhir/StructureDefinition/zib-BodyHeight"/>
				</meta>
				<status value="final"/>
				<category>
					<coding>
						<system value="http://hl7.org/fhir/observation-category"/>
						<code value="vital-signs"/>
					</coding>
				</category>
				<code>
					<coding>
						<system value="http://loinc.org"/>
						<code value="8302-2"/>
						<display value="lichaamslengte"/>
					</coding>
				</code>
				<!-- patient reference -->
				<xsl:call-template name="patient-subject-reference">
					<xsl:with-param name="patient" select="$patient"/>
					<xsl:with-param name="patient-reference" select="$patient-reference"/>
				</xsl:call-template>
				<xsl:for-each select="$lengte/lengte_datum_tijd">
					<effectiveDateTime value="{./@value}"/>
				</xsl:for-each>
				<xsl:for-each select="$lengte/lengte_waarde">
					<valueQuantity>
						<!-- ada has cm or m, FHIR only allows cm -->
						<xsl:choose>
							<xsl:when test="./@unit = 'm'">
								<value value="{xs:double(./@value)*100}"/>
								<unit value="cm"/>
								<code value="cm"/>
							</xsl:when>
							<xsl:otherwise>
								<value value="{./@value}"/>
								<unit value="{./@unit}"/>
								<code value="{nf:convert_ADA_unit2UCUM_FHIR(./@unit)}"/>
							</xsl:otherwise>
						</xsl:choose>
					</valueQuantity>
				</xsl:for-each>
			</Observation>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="gewicht"/>
		<xd:param name="gewicht-id"/>
		<xd:param name="patient"/>
		<xd:param name="patient-id"/>
		<xd:param name="patient-reference"/>
	</xd:doc>
	<xsl:template name="zib-BodyWeight-2.0">
		<xsl:param name="gewicht-id"/>
		<xsl:param name="patient-id"/>
		<xsl:param name="gewicht" as="element()?"/>
		<xsl:param name="patient" as="element()?"/>
		<xsl:param name="patient-reference"/>
		<xsl:for-each select="$gewicht">
			<Observation>
				<meta>
					<profile value="http://nictiz.nl/fhir/StructureDefinition/zib-BodyWeight"/>
				</meta>
				<status value="final"/>
				<category>
					<coding>
						<system value="http://hl7.org/fhir/observation-category"/>
						<code value="vital-signs"/>
					</coding>
				</category>
				<code>
					<coding>
						<system value="http://loinc.org"/>
						<code value="29463-7"/>
						<display value="lichaamsgewicht"/>
					</coding>
				</code>
				<!-- patient reference -->
				<xsl:call-template name="patient-subject-reference">
					<xsl:with-param name="patient" select="$patient"/>
					<xsl:with-param name="patient-reference" select="$patient-reference"/>
				</xsl:call-template>
				<xsl:for-each select="$gewicht/gewicht_datum_tijd">
					<effectiveDateTime value="{./@value}"/>
				</xsl:for-each>
				<xsl:for-each select="$gewicht/gewicht_waarde">
					<valueQuantity>
						<value value="{./@value}"/>
						<unit value="{./@unit}"/>
						<code value="{nf:convert_ADA_unit2UCUM_FHIR(./@unit)}"/>
					</valueQuantity>
				</xsl:for-each>

			</Observation>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="patient"/>
		<xd:param name="verstrekking"/>
	</xd:doc>
	<xsl:template name="zib-Dispense-2.0">
		<xsl:param name="patient" as="element()?"/>
		<xsl:param name="verstrekking" as="element()?"/>

		<xsl:for-each select="$verstrekking">
			<MedicationDispense>
				<meta>
					<profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Dispense"/>
				</meta>
				<xsl:variable name="product" select="./verstrekt_geneesmiddel/product"/>
				<xsl:variable name="product-id" select="generate-id($product)"/>
				<xsl:variable name="afleverlocatie-id" select="generate-id(./afleverlocatie)"/>
				<!-- 'magistraal' geneesmiddel in een contained resource -->
				<xsl:for-each select="$product[product_code/@codeSystem = $oidNullFlavor]">
					<contained>
						<xsl:call-template name="zib-Product">
							<xsl:with-param name="product" select="."/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- afleverlocatie in een contained resource -->
				<xsl:for-each select="./afleverlocatie[@value]">
					<contained>
						<xsl:call-template name="zib-Dispense-Location-2.0">
							<xsl:with-param name="ada-locatie" select="."/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- distributievorm -->
				<xsl:for-each select="./distributievorm[@code]">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-DistributionForm">
						<valueCodeableConcept>
							<xsl:call-template name="code-to-CodeableConcept">
								<xsl:with-param name="in" select="."/>
							</xsl:call-template>
						</valueCodeableConcept>
					</extension>
				</xsl:for-each>
				<!-- aanschrijfdatum -->
				<xsl:for-each select="./aanschrijfdatum[@value]">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-RequestDate">
						<valueDateTime value="{./@value}"/>
					</extension>
				</xsl:for-each>
				<!-- aanvullende_informatie -->
				<xsl:for-each select="aanvullende_informatie">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation">
						<valueCodeableConcept>
							<xsl:call-template name="code-to-CodeableConcept">
								<xsl:with-param name="in" select="."/>
							</xsl:call-template>
						</valueCodeableConcept>
					</extension>
				</xsl:for-each>
				<!-- relatie naar medicamenteuze behandeling -->
				<xsl:for-each select="./../identificatie">
					<xsl:call-template name="mbh-id-2-reference">
						<xsl:with-param name="in" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- MVE id -->
				<xsl:for-each select="./identificatie">
					<identifier>
						<xsl:call-template name="id-to-Identifier">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</identifier>
				</xsl:for-each>
				<!-- type bouwsteen, hier een medicatieverstrekking -->
				<category>
					<coding>
						<system value="http://snomed.info/sct"/>
						<code value="373784005"/>
						<display value="Dispensing medication (procedure)"/>
					</coding>
				</category>
				<!-- geneesmiddel -->
				<xsl:for-each select="$product/product_code[@code]">
					<xsl:choose>
						<xsl:when test=".[@codeSystem = $oidNullFlavor]">
							<medicationReference>
								<reference value="{nf:getFullUrl('PRODUCT', nf:getGroupingKeyDefault(./..))}"/>
								<display value="{./@originalText}"/>
							</medicationReference>
						</xsl:when>
						<xsl:otherwise>
							<medicationCodeableConcept>
								<xsl:call-template name="code-to-CodeableConcept">
									<xsl:with-param name="in" select="."/>
								</xsl:call-template>
							</medicationCodeableConcept>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- patiënt -->
				<xsl:call-template name="patient-subject-reference">
					<xsl:with-param name="patient" select="$patient"/>
				</xsl:call-template>
				<!-- verstrekker -->
				<xsl:call-template name="verstrekker-performer">
					<xsl:with-param name="verstrekker" select="./verstrekker"/>
				</xsl:call-template>
				<!-- relatie naar verstrekkingsverzoek -->
				<xsl:for-each select="./relatie_naar_verstrekkingsverzoek/identificatie">
					<authorizingPrescription>
						<identifier>
							<xsl:call-template name="id-to-Identifier">
								<xsl:with-param name="in" select="."/>
							</xsl:call-template>
						</identifier>
					</authorizingPrescription>
				</xsl:for-each>
				<xsl:for-each select="./verstrekte_hoeveelheid[.//*[@value]]">
					<quantity>
						<xsl:call-template name="hoeveelheid-complex-to-Quantity">
							<xsl:with-param name="eenheid" select="./eenheid"/>
							<xsl:with-param name="waarde" select="./aantal"/>
						</xsl:call-template>
					</quantity>
				</xsl:for-each>
				<xsl:for-each select="./verbruiksduur[@value]">
					<daysSupply>
						<xsl:call-template name="hoeveelheid-to-Duration">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</daysSupply>
				</xsl:for-each>
				<xsl:for-each select="./datum[@value]">
					<whenHandedOver value="{./@value}"/>
				</xsl:for-each>
				<!-- afleverlocatie -->
				<xsl:for-each select="./afleverlocatie">
					<destination>
						<reference value="{$afleverlocatie-id}"/>
						<display value="{./@value}"/>
					</destination>
				</xsl:for-each>
				<xsl:for-each select="./toelichting[@value]">
					<note>
						<text value="{./@value}"/>
					</note>
				</xsl:for-each>

			</MedicationDispense>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="ada-locatie"/>
	</xd:doc>
	<xsl:template name="zib-Dispense-Location-2.0">
		<xsl:param name="ada-locatie" as="element()?" select="."/>
		<xsl:for-each select="$ada-locatie">
			<Location>
				<name value="{./@value}"/>
			</Location>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="patient"/>
		<xd:param name="verstrekkingsverzoek"/>
		<xd:param name="patient-fullUrl"/>
	</xd:doc>
	<xsl:template name="zib-DispenseRequest-2.0">
		<xsl:param name="patient" as="element()?"/>
		<xsl:param name="patient-fullUrl" as="xs:string?"/>
		<xsl:param name="verstrekkingsverzoek" as="element()?"/>

		<xsl:for-each select="$verstrekkingsverzoek">
			<entry>
				<fullUrl value="{nf:get-fhir-uuid()}"/>
				<resource>
					<xsl:call-template name="VV-in-MedicationRequest-2.0">
						<xsl:with-param name="patient" select="$patient"/>
						<xsl:with-param name="patient-fullUrl" select="$patient-fullUrl"/>
						<xsl:with-param name="verstrekkingsverzoek" select="."/>
					</xsl:call-template>
				</resource>
			</entry>

		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="ada-dosering">dosering element</xd:param>
	</xd:doc>
	<xsl:template name="zib-InstructionsForUse-2.0">
		<xsl:param name="ada-dosering"/>
		<xsl:for-each select="$ada-dosering">
			<xsl:for-each select="./../volgnummer[@value]">
				<sequence value="{./@value}"/>
			</xsl:for-each>
			<!-- gebruiksinstructie/omschrijving  -->
			<xsl:for-each select="./../../omschrijving[@value]">
				<text value="{./@value}"/>
			</xsl:for-each>
			<!-- gebruiksinstructie/aanvullende_instructie  -->
			<xsl:for-each select="./../../aanvullende_instructie[@code]">
				<additionalInstruction>
					<xsl:call-template name="code-to-CodeableConcept">
						<xsl:with-param name="in" select="."/>
					</xsl:call-template>
				</additionalInstruction>
			</xsl:for-each>
			<!-- dosering/toedieningsschema -->
			<xsl:for-each select="./toedieningsschema">
				<xsl:call-template name="zib-Administration-Schedule-2.0">
					<xsl:with-param name="toedieningsschema" select="."/>
				</xsl:call-template>
			</xsl:for-each>
			<!-- dosering/zo_nodig/criterium/code -->
			<xsl:for-each select="zo_nodig/criterium/code">
				<asNeededCodeableConcept>
					<xsl:variable name="in" select="."/>
					<!-- roep hier niet het standaard template aan omdat criterium/omschrijving ook nog omschrijving zou kunnen bevatten... -->
					<xsl:choose>
						<xsl:when test="$in[@codeSystem = $oidNullFlavor]">
							<extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
								<valueCode value="{$in/@code}"/>
							</extension>
						</xsl:when>
						<xsl:when test="$in[not(@codeSystem = $oidNullFlavor)]">
							<coding>
								<system value="{local:getUri($in/@codeSystem)}"/>
								<code value="{$in/@code}"/>
								<xsl:if test="$in/@displayName">
									<display value="{$in/@displayName}"/>
								</xsl:if>
								<!--<userSelected value="true"/>-->
							</coding>
							<!-- ADA heeft nog geen ondersteuning voor vertalingen, dus onderstaande is theoretisch -->
							<xsl:for-each select="$in/translation">
								<coding>
									<system value="{local:getUri(@codeSystem)}"/>
									<code value="{@code}"/>
									<xsl:if test="@displayName">
										<display value="{@displayName}"/>
									</xsl:if>
								</coding>
							</xsl:for-each>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="./../omschrijving[@value]">
							<text value="{./../omschrijving/@value}"/>
						</xsl:when>
						<xsl:when test="$in[@originalText]">
							<text value="{$in/@originalText}"/>
						</xsl:when>
					</xsl:choose>
				</asNeededCodeableConcept>
			</xsl:for-each>
			<!-- gebruiksinstructie/toedieningsweg -->
			<xsl:for-each select="./../../toedieningsweg">
				<route>
					<xsl:call-template name="code-to-CodeableConcept">
						<xsl:with-param name="in" select="."/>
					</xsl:call-template>
				</route>
			</xsl:for-each>
			<!-- dosering/keerdosis/aantal -->
			<xsl:for-each select="./keerdosis/aantal[vaste_waarde]">
				<doseQuantity>
					<xsl:call-template name="hoeveelheid-complex-to-Quantity">
						<xsl:with-param name="eenheid" select="./../eenheid"/>
						<xsl:with-param name="waarde" select="./vaste_waarde"/>
					</xsl:call-template>
				</doseQuantity>
			</xsl:for-each>
			<xsl:for-each select="./keerdosis/aantal[min | max]">
				<doseRange>
					<xsl:call-template name="minmax-to-Range">
						<xsl:with-param name="in" select="."/>
					</xsl:call-template>
				</doseRange>
			</xsl:for-each>
			<!-- maximale_dosering -->
			<xsl:for-each select="./zo_nodig/maximale_dosering[.//*[@value]]">
				<maxDosePerPeriod>
					<xsl:call-template name="quotient-to-Ratio">
						<xsl:with-param name="denominator" select="./tijdseenheid"/>
						<xsl:with-param name="numerator-aantal" select="./aantal"/>
						<xsl:with-param name="numerator-eenheid" select="./eenheid"/>
					</xsl:call-template>
				</maxDosePerPeriod>
			</xsl:for-each>
			<!-- toedieningssnelheid -->
			<xsl:for-each select="./toedieningssnelheid[.//*[@value]]">
				<xsl:for-each select=".[waarde/vaste_waarde]">
					<rateRatio>
						<xsl:call-template name="quotient-to-Ratio">
							<xsl:with-param name="denominator" select="./tijdseenheid"/>
							<xsl:with-param name="numerator-aantal" select="./waarde/vaste_waarde"/>
							<xsl:with-param name="numerator-eenheid" select="./eenheid"/>
						</xsl:call-template>
					</rateRatio>
				</xsl:for-each>
				<!-- variable toedieningssnelheid, alleen ondersteund voor hele tijdseenheden -->
				<xsl:for-each select=".[waarde/(min | max)][tijdseenheid/@value = '1']">
					<!-- we cannot use the G-standaard unit in this case, can only be communicated in FHIR using UCUM -->
					<!-- let's determine the right UCUM for the rate (toedieningssnelheid) -->
					<xsl:variable name="UCUM-rate" select="concat(nf:convertGstdBasiseenheid2UCUM(./eenheid/@code), '/', nf:convertTime_ADA_unit2UCUM_FHIR(./tijdseenheid/@unit))"/>
					<rateRange>
						<low>
							<value value="{./waarde/min/@value}"/>
							<unit value="{$UCUM-rate}"/>
							<system value="http://unitsofmeasure.org"/>
							<code value="{$UCUM-rate}"/>
						</low>
						<high>
							<value value="{./waarde/max/@value}"/>
							<unit value="{$UCUM-rate}"/>
							<system value="http://unitsofmeasure.org"/>
							<code value="{$UCUM-rate}"/>
						</high>
					</rateRange>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="additionalInfo"/>
	</xd:doc>
	<xsl:template name="zib-Medication-AdditionalInformation">
		<xsl:param name="additionalInfo" as="element()?"/>
		<!-- aanvullende_informatie -->
		<xsl:for-each select="$additionalInfo">
			<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation">
				<valueCodeableConcept>
					<xsl:call-template name="code-to-CodeableConcept">
						<xsl:with-param name="in" select="."/>
					</xsl:call-template>
				</valueCodeableConcept>
			</extension>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc> Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-MedicationAgreement/ 
		          Does the resources the medicationagreement refers to and then calls the template to make the resource MedicationRequest itself</xd:desc>
		<xd:param name="patient"/>
		<xd:param name="medicatieafspraak"/>
		<xd:param name="patient-fullUrl"/>
	</xd:doc>
	<xsl:template name="zib-MedicationAgreement-2.0">
		<xsl:param name="patient" as="element()?"/>
		<xsl:param name="patient-fullUrl" as="xs:string?"/>
		<xsl:param name="medicatieafspraak" as="element()?"/>
		<xsl:for-each select="$medicatieafspraak">
			<!-- lengte in eigen resource -->
			<xsl:variable name="lengte" select="./lichaamslengte"/>
			<xsl:variable name="lengte-fullUrl" select="nf:get-fhir-uuid()"/>
			<xsl:for-each select="$lengte[.//@value]">
				<entry xmlns="http://hl7.org/fhir">
					<fullUrl value="{$lengte-fullUrl}"/>
					<resource>
						<xsl:call-template name="zib-BodyHeight-2.0">
							<xsl:with-param name="lengte" select="."/>
							<!-- don't pass xxx-id because we are using urn:uuid in the fullUrl, there may NOT be an id in the resource itself -->
							<xsl:with-param name="patient" select="$patient"/>
							<xsl:with-param name="patient-reference" select="$patient-fullUrl"/>
						</xsl:call-template>
					</resource>
				</entry>
			</xsl:for-each>
			<!-- gewicht in eigen resource -->
			<xsl:variable name="gewicht" select="./lichaamsgewicht"/>
			<xsl:variable name="gewicht-fullUrl" select="nf:get-fhir-uuid()"/>
			<xsl:for-each select="$gewicht[.//@value]">
				<entry xmlns="http://hl7.org/fhir">
					<fullUrl value="{$gewicht-fullUrl}"/>
					<resource>
						<xsl:call-template name="zib-BodyWeight-2.0">
							<xsl:with-param name="gewicht" select="."/>
							<!-- don't pass xxx-id because we are using urn:uuid in the fullUrl, there may NOT be an id in the resource itself -->
							<xsl:with-param name="patient" select="$patient"/>
							<xsl:with-param name="patient-reference" select="$patient-fullUrl"/>
						</xsl:call-template>
					</resource>
				</entry>
			</xsl:for-each>
			<!-- reden van voorschrijven in eigen resource -->
			<xsl:variable name="reden-voorschrijven" select="./reden_van_voorschrijven/probleem"/>
			<xsl:variable name="reden-voorschrijven-fullUrl" select="nf:get-fhir-uuid()"/>
			<xsl:for-each select="$reden-voorschrijven[.//@code]">
				<entry xmlns="http://hl7.org/fhir">
					<fullUrl value="{$reden-voorschrijven-fullUrl}"/>
					<resource>
						<xsl:call-template name="zib-problem-2.0">
							<xsl:with-param name="ada-probleem" select="."/>
							<!-- don't pass condition-id because we are using urn:uuid in the fullUrl, there may NOT be an id in the resource itself -->
							<xsl:with-param name="ada-patient" select="$patient"/>
							<xsl:with-param name="patient-reference" select="$patient-fullUrl"/>
						</xsl:call-template>
					</resource>
				</entry>
			</xsl:for-each>
			<xsl:variable name="ma-fullurl" select="nf:get-fhir-uuid()"/>
			<entry xmlns="http://hl7.org/fhir">
				<fullUrl value="{$ma-fullurl}"/>
				<resource>
					<xsl:call-template name="MA-in-MedicationRequest-2.0">
						<xsl:with-param name="medicatieafspraak" select="."/>
						<xsl:with-param name="patient" select="$patient"/>
						<xsl:with-param name="patient-reference" select="$patient-fullUrl"/>
						<xsl:with-param name="lengte" select="$lengte"/>
						<xsl:with-param name="lengte-reference" select="$lengte-fullUrl"/>
						<xsl:with-param name="gewicht" select="$gewicht"/>
						<xsl:with-param name="gewicht-reference" select="$gewicht-fullUrl"/>
						<xsl:with-param name="reden-voorschrijven" select="$reden-voorschrijven"/>
						<xsl:with-param name="reden-voorschrijven-reference" select="$reden-voorschrijven-fullUrl"/>
					</xsl:call-template>
				</resource>
			</entry>
		</xsl:for-each>
	</xsl:template>


	<xd:doc>
		<xd:desc/>
		<xd:param name="copyIndicator"/>
	</xd:doc>
	<xsl:template name="zib-Medication-CopyIndicator">
		<xsl:param name="copyIndicator" as="element()?"/>
		<!-- kopie indicator -->
		<!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
		<xsl:for-each select="$copyIndicator">
			<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-CopyIndicator">
				<valueBoolean value="{(./@value='true')}"/>
			</extension>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="start"/>
		<xd:param name="end"/>
	</xd:doc>
	<xsl:template name="zib-Medication-Period-Of-Use-2.0">
		<xsl:param name="start" as="element()?"/>
		<xsl:param name="end" as="element()?"/>
		<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse">
			<valuePeriod>
				<xsl:for-each select="$start">
					<start value="{nf:ada-2-dateTimeCET(./@value)}"/>
				</xsl:for-each>
				<xsl:for-each select="$end">
					<end value="{nf:ada-2-dateTimeCET(./@value)}"/>
				</xsl:for-each>
			</valuePeriod>
		</extension>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="repeat-period"/>
	</xd:doc>
	<xsl:template name="zib-Medication-RepeatPeriodCyclicalSchedule">
		<xsl:param name="repeat-period" as="element()?"/>
		<!-- herhaalperiode cyclisch schema -->
		<xsl:for-each select="$repeat-period">
			<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule">
				<valueDuration>
					<xsl:call-template name="hoeveelheid-to-Duration">
						<xsl:with-param name="in" select="."/>
					</xsl:call-template>
				</valueDuration>
			</extension>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="stopType"/>
	</xd:doc>
	<xsl:template name="zib-Medication-StopType">
		<xsl:param name="stopType" as="element()?"/>
		<xsl:for-each select="$stopType">
			<modifierExtension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-StopType">
				<valueCodeableConcept>
					<xsl:call-template name="code-to-CodeableConcept">
						<xsl:with-param name="in" select="."/>
					</xsl:call-template>
				</valueCodeableConcept>
			</modifierExtension>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="patient"/>
		<xd:param name="medicatiegebruik"/>
	</xd:doc>
	<xsl:template name="zib-MedicationUse-2.0">
		<xsl:param name="patient"/>
		<xsl:param name="medicatiegebruik"/>
		<xsl:for-each select="$medicatiegebruik">
			<MedicationStatement>
				<meta>
					<profile value="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse"/>
				</meta>
				<!-- product met ingrediënten, niet gecodeerd product -->
				<!-- store the contained_id to later refer to -->
				<xsl:variable name="product" select="./gebruiks_product/product"/>
				<xsl:variable name="product-id" select="generate-id($product)"/>
				<!-- 'magistraal' geneesmiddel in een contained resource -->
				<xsl:for-each select="$product[product_code/@codeSystem = $oidNullFlavor]">
					<xsl:comment>'magistraal' geneesmiddel</xsl:comment>
					<contained>
						<xsl:call-template name="zib-Product">
							<xsl:with-param name="product" select="."/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- voorschrijver in contained resource -->
				<xsl:variable name="voorschrijver" select="./voorschrijver/zorgverlener"/>
				<xsl:variable name="voorschrijver-id" select="generate-id($voorschrijver)"/>
				<xsl:for-each select="$voorschrijver[.//@value]">
					<xsl:comment>voorschrijver</xsl:comment>
					<contained>
						<xsl:call-template name="nl-core-practitioner-2.0">
							<xsl:with-param name="ada-zorgverlener" select="."/>
							<xsl:with-param name="practitioner-id" select="$voorschrijver-id"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- voorschrijver/zorgaanbieder in contained resource -->
				<xsl:variable name="voorschrijver-za" select="$voorschrijver/zorgaanbieder/zorgaanbieder"/>
				<xsl:variable name="voorschrijver-za-id" select="generate-id($voorschrijver-za)"/>
				<xsl:for-each select="$voorschrijver-za[.//@value]">
					<xsl:comment>voorschrijver / zorgaanbieder</xsl:comment>
					<contained>
						<xsl:call-template name="nl-core-organization-2.0">
							<xsl:with-param name="ada-zorgaanbieder" select="."/>
							<xsl:with-param name="organization-id" select="$voorschrijver-za-id"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- auteur-zorgverlener in contained resource -->
				<xsl:variable name="auteur-is-zorgverlener" select="./auteur/auteur_is_zorgverlener"/>
				<xsl:variable name="auteur-is-zorgverlener-id" select="generate-id($auteur-is-zorgverlener)"/>
				<xsl:variable name="auteur-zorgverlener" select="$auteur-is-zorgverlener/zorgverlener"/>
				<xsl:variable name="auteur-zorgverlener-id" select="generate-id($auteur-zorgverlener)"/>
				<xsl:variable name="auteur-zorgaanbieder" select="$auteur-zorgverlener/zorgaanbieder/zorgaanbieder"/>
				<xsl:variable name="auteur-zorgaanbieder-id" select="generate-id($auteur-zorgaanbieder)"/>
				<xsl:for-each select="$auteur-is-zorgverlener[.//@value]">
					<contained>
						<xsl:call-template name="nl-core-practitionerrole-2.0">
							<xsl:with-param name="ada-zorgverlener" select="$auteur-is-zorgverlener/zorgverlener"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<xsl:for-each select="$auteur-zorgverlener[.//@value]">
					<contained>
						<xsl:call-template name="nl-core-practitioner-2.0">
							<xsl:with-param name="ada-zorgverlener" select="."/>
							<xsl:with-param name="practitioner-id" select="$auteur-zorgverlener-id"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- auteur-zorgverlener/zorgaanbieder in contained resource -->
				<xsl:variable name="auteur-zorgverlener-za" select="$auteur-zorgverlener/zorgaanbieder/zorgaanbieder"/>
				<xsl:variable name="auteur-zorgverlener-za-id" select="generate-id($auteur-zorgverlener-za)"/>
				<xsl:for-each select="$auteur-zorgverlener-za[.//@value]">
					<xsl:comment>auteur-zorgverlener / zorgaanbieder</xsl:comment>
					<contained>
						<xsl:call-template name="nl-core-organization-2.0">
							<xsl:with-param name="ada-zorgaanbieder" select="."/>
							<xsl:with-param name="organization-id" select="$auteur-zorgverlener-za-id"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- informant / persoon in contained resource -->
				<xsl:variable name="informant-persoon" select="./informant/persoon"/>
				<xsl:variable name="informant-persoon-id" select="generate-id($informant-persoon)"/>
				<xsl:for-each select="$informant-persoon[.//@value]">
					<contained>
						<xsl:call-template name="nl-core-relatedperson-2.0">
							<xsl:with-param name="ada-persoon" select="."/>
							<xsl:with-param name="ada-patient" select="$patient"/>
							<xsl:with-param name="persoon-id" select="$informant-persoon-id"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- informant / zorgverlener in contained resource -->
				<xsl:variable name="informant-zorgverlener" select="./informant/informant_is_zorgverlener/zorgverlener"/>
				<xsl:variable name="informant-zorgverlener-id" select="generate-id($informant-zorgverlener)"/>
				<xsl:for-each select="$informant-zorgverlener[.//@value]">
					<contained>
						<xsl:call-template name="nl-core-practitioner-2.0">
							<xsl:with-param name="ada-zorgverlener" select="."/>
							<xsl:with-param name="practitioner-id" select="$informant-zorgverlener-id"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>

				<!-- volgens_afspraak_indicator -->
				<xsl:for-each select="./volgens_afspraak_indicator[@value]">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-AsAgreedIndicator">
						<valueBoolean value="{./@value}"/>
					</extension>
				</xsl:for-each>
				<!-- voorschrijver in extension -->
				<xsl:for-each select="$voorschrijver">
					<extension url="http://hl7.org/fhir/StructureDefinition/medicationstatement-Prescriber">
						<valueReference id="{$voorschrijver-id}">
							<display value="{normalize-space(string-join(.//naamgegevens//@value, ' '))}"/>
						</valueReference>
					</extension>
				</xsl:for-each>
				<!-- voorschrijver/zorgaanbieder in extension -->
				<xsl:for-each select="$voorschrijver-za">
					<extension url="http://hl7.org/fhir/StructureDefinition/medicationstatement-Onbehalfof">
						<valueReference id="{$voorschrijver-za-id}">
							<display value="{normalize-space(string-join(.//organisatie_naam//@value, ' '))}"/>
						</valueReference>
					</extension>
				</xsl:for-each>
				<!-- auteur -->
				<xsl:for-each select="./auteur[.//@value]">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Author">
						<xsl:choose>
							<xsl:when test="./auteur_is_zorgverlener[.//@value]">
								<valueReference id="{$auteur-is-zorgverlener-id}">
									<display value="{normalize-space(string-join(./auteur_is_zorgverlener//*/(@value|@displayName), ' '))}"/>
								</valueReference>
							</xsl:when>
							<xsl:when test="./auteur_is_patient[@value = 'true']">
								<valueReference>
									<xsl:call-template name="patient-reference">
										<xsl:with-param name="ada-patient" select="$patient"/>
									</xsl:call-template>
								</valueReference>
							</xsl:when>
						</xsl:choose>
					</extension>
				</xsl:for-each>
				<!-- relatie naar medicamenteuze behandeling -->
				<xsl:for-each select="./../identificatie">
					<xsl:call-template name="mbh-id-2-reference">
						<xsl:with-param name="in" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- kopie indicator -->
				<!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
				<xsl:for-each select="./kopie_indicator">
					<xsl:call-template name="zib-Medication-CopyIndicator">
						<xsl:with-param name="copyIndicator" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- herhaalperiode cyclisch schema -->
				<xsl:for-each select="./gebruiksinstructie/herhaalperiode_cyclisch_schema">
					<xsl:call-template name="zib-Medication-RepeatPeriodCyclicalSchedule">
						<xsl:with-param name="repeat-period" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- medicatiegebruik id -->
				<xsl:for-each select="./identificatie">
					<identifier>
						<xsl:call-template name="id-to-Identifier">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</identifier>
				</xsl:for-each>
				<!-- stoptype mapt bij medicatiegebruik op status -->
				<xsl:choose>
					<xsl:when test="./stoptype/@code = '1'">
						<status value="stopped"/>
					</xsl:when>
					<xsl:when test="./stoptype/@code = '2'">
						<status value="onhold"/>
					</xsl:when>
					<xsl:when test="./stoptype/@code">
						<status value="unknown-stoptype"/>
					</xsl:when>
					<xsl:otherwise>
						<status value="active"/>
					</xsl:otherwise>
				</xsl:choose>

				<!-- type bouwsteen, hier medicatiegebruik -->
				<category>
					<coding>
						<system value="urn:oid:2.16.840.1.113883.2.4.3.11.60.20.77.5.3"/>
						<code value="6"/>
						<display value="Medicatiegebruik"/>
					</coding>
				</category>
				<!-- geneesmiddel -->
				<xsl:for-each select="$product/product_code">
					<xsl:choose>
						<xsl:when test=".[@codeSystem = $oidNullFlavor]">
							<medicationReference>
								<reference value="{nf:getFullUrl('PRODUCT', nf:getGroupingKeyDefault(./..))}"/>
								<display value="{./@originalText}"/>
							</medicationReference>
						</xsl:when>
						<xsl:otherwise>
							<medicationCodeableConcept>
								<xsl:call-template name="code-to-CodeableConcept">
									<xsl:with-param name="in" select="."/>
								</xsl:call-template>
							</medicationCodeableConcept>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- gebruiksperiode -->
				<xsl:for-each select=".[(gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode)[@value]]">
					<effectivePeriod>
						<xsl:for-each select="./gebruiksperiode[@value]">
							<xsl:call-template name="zib-Medication-Use-Duration">
								<xsl:with-param name="duration" select="."/>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="gebruiksperiode_start[@value]">
							<start value="{./@value}"/>
						</xsl:for-each>
						<xsl:for-each select="gebruiksperiode_eind[@value]">
							<end value="{./@value}"/>
						</xsl:for-each>
					</effectivePeriod>
				</xsl:for-each>
				<!-- registratiedatum -->
				<xsl:for-each select="./registratiedatum[@value]">
					<dateAsserted value="{./@value}"/>
				</xsl:for-each>
				<xsl:for-each select="./registratiedatum[@nullFlavor]">
					<dateAsserted>
						<extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
							<valueCode value="{./@nullFlavor}"/>
						</extension>
					</dateAsserted>
				</xsl:for-each>
				<!-- informant -->
				<xsl:for-each select="informant[.//@value]">
					<informationSource>
						<xsl:choose>
							<xsl:when test="./persoon[.//@value]">
								<xsl:attribute name="id" select="concat('#', $informant-persoon-id)"/>
								<display value="{normalize-space(string-join(./persoon/naamgegevens[1]//*[not(name()='naamgebruik')]/@value,' '))}"/>
							</xsl:when>
							<xsl:when test="./informant_is_patient[@value = 'true']">
								<xsl:call-template name="patient-reference">
									<xsl:with-param name="ada-patient" select="$patient"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="./informant_is_zorgverlener[.//@value]">
								<xsl:attribute name="id" select="concat('#', $informant-zorgverlener-id)"/>
								<display value="{normalize-space(string-join($informant-zorgverlener//naamgegevens[1]//*[not(name()='naamgebruik')]/@value,' '))}"/>
							</xsl:when>
						</xsl:choose>
					</informationSource>
				</xsl:for-each>
				<!-- patiënt -->
				<xsl:call-template name="patient-subject-reference">
					<xsl:with-param name="patient" select="$patient"/>
				</xsl:call-template>
				<!-- gerelateerde_afspraak en gerelateerde_verstrekking-->
				<xsl:for-each select="./((gerelateerde_afspraak/(identificatie_medicatieafspraak | identificatie_toedieningsafspraak)) | (gerelateerde_verstrekking/identificatie))">
					<derivedFrom>
						<identifier>
							<xsl:call-template name="id-to-Identifier">
								<xsl:with-param name="in" select="."/>
							</xsl:call-template>
						</identifier>
						<display>
							<xsl:attribute name="value">
								<xsl:choose>
									<xsl:when test="./name() = 'identificatie_medicatieafspraak'">relatie naar medicatieafspraak</xsl:when>
									<xsl:when test="./name() = 'identificatie_toedieningsafspraak'">relatie naar toedieningsafspraak</xsl:when>
									<xsl:when test="./name() = 'identificatie'">relatie naar verstrekking</xsl:when>
								</xsl:choose>
							</xsl:attribute>
						</display>
					</derivedFrom>
				</xsl:for-each>

				<!-- gebruik_indicator -->
				<xsl:for-each select="./gebruik_indicator[@value | @nullFlavor]">
					<taken>
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="./@value = 'true'">y</xsl:when>
								<xsl:when test="./@value = 'false'">n</xsl:when>
								<xsl:when test="./@nullFlavor = 'NA'">na</xsl:when>
								<xsl:when test="./@nullFlavor">unk</xsl:when>
							</xsl:choose>
						</xsl:attribute>
					</taken>
				</xsl:for-each>
				<!-- reden_wijzigen_of_stoppen_gebruik -->
				<xsl:for-each select="./reden_wijzigen_of_stoppen_gebruik[@code]">
					<reasonNotTaken>
						<xsl:call-template name="code-to-CodeableConcept">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</reasonNotTaken>
				</xsl:for-each>
				<!-- reden gebruik -->
				<xsl:for-each select="./reden_gebruik[@value]">
					<reasonCode>
						<text value="{./@value}"/>
					</reasonCode>
				</xsl:for-each>
				<!-- toelichting -->
				<xsl:for-each select="./toelichting[@value]">
					<note>
						<text value="{./@value}"/>
					</note>
				</xsl:for-each>
				<!-- gebruiksinstructie/doseerinstructie/dosering -->
				<xsl:for-each select="./gebruiksinstructie/doseerinstructie/dosering">
					<dosage>
						<xsl:call-template name="zib-InstructionsForUse-2.0">
							<xsl:with-param name="ada-dosering" select="."/>
						</xsl:call-template>
					</dosage>
				</xsl:for-each>
			</MedicationStatement>
		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="duration"/>
	</xd:doc>
	<xsl:template name="zib-Medication-Use-Duration">
		<xsl:param name="duration" as="element()?"/>
		<xsl:for-each select="$duration">
			<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration">
				<valueDuration>
					<xsl:call-template name="hoeveelheid-to-Duration">
						<xsl:with-param name="in" select="."/>
					</xsl:call-template>
				</valueDuration>
			</extension>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="ada-probleem"/>
		<xd:param name="condition-id"/>


		<xd:param name="ada-patient"/>
		<xd:param name="patient-reference"/>
	</xd:doc>
	<xsl:template name="zib-problem-2.0">
		<xsl:param name="ada-probleem" as="element()?"/>
		<xsl:param name="condition-id" as="xs:string?"/>
		<xsl:param name="ada-patient" as="element()?"/>
		<xsl:param name="patient-reference" as="xs:string?"/>
		<xsl:for-each select="$ada-probleem">
			<Condition>
				<xsl:for-each select="$condition-id">
					<id value="{$condition-id}"/>
				</xsl:for-each>
				<!-- probleem status -->
				<xsl:choose>
					<xsl:when test="./probleem_status[@code]">
						<clinicalStatus>
							<xsl:attribute name="value">
								<xsl:choose>
									<xsl:when test="./@code = '73425007'">inactive</xsl:when>
									<xsl:when test="./@code = '55561003'">active</xsl:when>
									<xsl:otherwise>active</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</clinicalStatus>
					</xsl:when>
					<xsl:otherwise>
						<!-- 1..1, so let's assume active if  -->
						<clinicalStatus value="active"/>
					</xsl:otherwise>
				</xsl:choose>
				<!-- probleem naam -->
				<xsl:for-each select="./probleem_naam[@code]">
					<code>
						<xsl:call-template name="code-to-CodeableConcept">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</code>
				</xsl:for-each>
				<xsl:call-template name="patient-subject-reference">
					<xsl:with-param name="patient" select="$ada-patient"/>
					<xsl:with-param name="patient-reference" select="$patient-reference"/>
				</xsl:call-template>
			</Condition>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="product"/>
	</xd:doc>
	<xsl:template name="zib-Product">
		<xsl:param name="product" as="element()?"/>
		<xsl:for-each select="$product">
			<Medication xmlns="http://hl7.org/fhir">
				<meta>
					<profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Product"/>
				</meta>
				<xsl:for-each select="./product_specificatie/omschrijving[@value]">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Product-Description">
						<valueString value="{replace(string-join(./@value,''),'(^\s+)|(\s+$)','')}"/>
					</extension>
				</xsl:for-each>
				<xsl:for-each select="./product_specificatie/product_naam[@value]">
					<code>
						<text value="{./@value}"/>
					</code>
				</xsl:for-each>
				<xsl:for-each select="./product_specificatie/farmaceutische_vorm[@code]">
					<form>
						<xsl:call-template name="code-to-CodeableConcept">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</form>
				</xsl:for-each>
				<xsl:for-each select="./product_specificatie/ingredient">
					<ingredient>
						<xsl:for-each select="./ingredient_code[@code]">
							<itemCodeableConcept>
								<xsl:call-template name="code-to-CodeableConcept">
									<xsl:with-param name="in" select="."/>
								</xsl:call-template>
							</itemCodeableConcept>
						</xsl:for-each>
						<isActive value="true"/>
						<xsl:for-each select="./sterkte">
							<amount>
								<xsl:call-template name="hoeveelheid-complex-to-Ratio">
									<xsl:with-param name="numerator" select="./hoeveelheid_ingredient"/>
									<xsl:with-param name="denominator" select="./hoeveelheid_product"/>
								</xsl:call-template>
							</amount>
						</xsl:for-each>
					</ingredient>
				</xsl:for-each>
			</Medication>
		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc>Converts unit from G-Standaard to UCUM</xd:desc>
		<xd:param name="GstdBasiseenheid_code"/>
	</xd:doc>
	<xsl:function name="nf:convertGstdBasiseenheid2UCUM" as="xs:string">
		<xsl:param name="GstdBasiseenheid_code" as="xs:string"/>

		<xsl:choose>
			<xsl:when test="$GstdBasiseenheid_code castable as xs:integer">
				<xsl:choose>
					<xsl:when test="$GstdBasiseenheid_code = '205'">cm</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '208'">1</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '211'">1</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '215'">g</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '217'">[iU]</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '219'">kg</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '222'">l</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '229'">mg</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '233'">ml</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '234'">mm</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '245'">1</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '252'">ug</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '254'">ul</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '303'">[drp]</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '345'">1</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '490'">1</xsl:when>
					<xsl:when test="$GstdBasiseenheid_code = '500'">1</xsl:when>
					<xsl:otherwise>Not supported G-standaard basiseenheid: <xsl:value-of select="$GstdBasiseenheid_code"/></xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<!-- geen integer meegekregen --> G-standaard code is not an integer. Not supported G-standaard basiseenheid: "<xsl:value-of select="$GstdBasiseenheid_code"/>". </xsl:otherwise>
		</xsl:choose>
		<xsl:if test="$GstdBasiseenheid_code castable as xs:integer"> </xsl:if>
	</xsl:function>

	<xd:doc>
		<xd:desc/>
		<xd:param name="resourceType"/>
		<xd:param name="group-key"/>
	</xd:doc>
	<xsl:function name="nf:getFullUrl" as="xs:string?">
		<xsl:param name="resourceType" as="xs:string?"/>
		<xsl:param name="group-key" as="xs:string?"/>

		<xsl:variable name="var" select="
				if (normalize-space(upper-case($resourceType)) = 'ORGANIZATION') then
					($organizations)
				else
					(if (normalize-space(upper-case($resourceType)) = 'PRACTITIONER') then
						($practitioners)
					else
						(if (normalize-space(upper-case($resourceType)) = 'PRACTITIONERROLE') then
							($practitionerRoles)
						else
							(if (normalize-space(upper-case($resourceType)) = 'PRODUCT') then
								($products)
							else
								(if (normalize-space(upper-case($resourceType)) = 'LOCATION') then
									($locations)
								else
									()))))"/>

		<xsl:value-of select="$var[.//group-key/text() = $group-key]//f:entry/f:fullUrl/@value"/>
	</xsl:function>

	<xd:doc>
		<xd:desc/>
		<xd:param name="in"/>
	</xd:doc>
	<xsl:function name="nf:getGroupingKeyDefault" as="xs:string?">
		<xsl:param name="in" as="element()?"/>
		<xsl:value-of select="normalize-space(upper-case(string-join($in//(@value | @root | @code | @codeSystem | @nullFlavor))))"/>
	</xsl:function>

	<xd:doc>
		<xd:desc/>
		<xd:param name="zorgverlener"/>
	</xd:doc>
	<xsl:function name="nf:getGroupingKeyPractitioner" as="xs:string?">
		<xsl:param name="zorgverlener" as="element()?"/>
		<xsl:value-of select="normalize-space(upper-case(string-join($zorgverlener/(zorgverlener_identificatie_nummer | zorgverlener_naam | adres | telefoon_email)/(.//@value | .//@root | .//@code | .//@codeSystem | .//@nullFlavor))))"/>
	</xsl:function>

	<xd:doc>
		<xd:desc/>
		<xd:param name="zorgaanbieder-identificatie-nummer"/>
	</xd:doc>
	<xsl:function name="nf:ada-za-id" as="element()?">
		<xsl:param name="zorgaanbieder-identificatie-nummer" as="element()*"/>
		<xsl:sequence select="
				if ($zorgaanbieder-identificatie-nummer[@root = $oidURAOrganizations]) then
					($zorgaanbieder-identificatie-nummer[@root = $oidURAOrganizations])
				else
					(if ($zorgaanbieder-identificatie-nummer[@root = $oidAGB]) then
						($zorgaanbieder-identificatie-nummer[@root = $oidAGB])
					else
						$zorgaanbieder-identificatie-nummer[1])"/>
	</xsl:function>

	<xd:doc>
		<xd:desc>Takes input string. If it is a dateTime, a CET timezone will be set. If not, the input string is returned.</xd:desc>
		<xd:param name="valueIn">The input string to be handled.</xd:param>
	</xd:doc>
	<xsl:function name="nf:ada-2-dateTimeCET" as="xs:string?">
		<xsl:param name="valueIn" as="xs:string?"/>
		<xsl:value-of select="
				if ($valueIn castable as xs:dateTime) then
					nf:set-CET-timezone(xs:dateTime($valueIn))
				else
					$valueIn"/>
	</xsl:function>
	<xd:doc>
		<xd:desc/>
		<xd:param name="zorgverlener-identificatie-nummer"/>
	</xd:doc>
	<xsl:function name="nf:ada-zvl-id" as="element()?">
		<xsl:param name="zorgverlener-identificatie-nummer" as="element()*"/>
		<xsl:sequence select="
				if ($zorgverlener-identificatie-nummer[@root = $oidUZIPersons]) then
					($zorgverlener-identificatie-nummer[@root = $oidUZIPersons])
				else
					(if ($zorgverlener-identificatie-nummer[@root = $oidAGB]) then
						($zorgverlener-identificatie-nummer[@root = $oidAGB])
					else
						(if ($zorgverlener-identificatie-nummer[@root = $oidBIGregister]) then
							($zorgverlener-identificatie-nummer[@root = $oidBIGregister])
						else
							$zorgverlener-identificatie-nummer[1]))"/>
	</xsl:function>
	<xd:doc>
		<xd:desc/>
		<xd:param name="uuid"/>
	</xd:doc>
	<xsl:template name="organization-entry" match="zorgaanbieder[not(./zorgaanbieder)]" mode="doOrganization">
		<xsl:param name="uuid" as="xs:boolean"/>
		<xsl:variable name="ada-id" select="
				if ($uuid) then
					(nf:get-fhir-uuid())
				else
					(nf:getUriFromAdaId(nf:ada-za-id(./zorgaanbieder_identificatie_nummer)))"/>
		<entry>
			<fullUrl value="{$ada-id}"/>
			<resource>
				<xsl:call-template name="nl-core-organization-2.0">
					<xsl:with-param name="ada-zorgaanbieder" select="."/>
				</xsl:call-template>
			</resource>
		</entry>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="uuid"/>
	</xd:doc>
	<xsl:template name="practitioner-entry" match="zorgverlener" mode="doPractitioner">
		<xsl:param name="uuid" as="xs:boolean"/>
		<xsl:variable name="ada-id" select="
				if ($uuid) then
					(nf:get-fhir-uuid())
				else
					(nf:getUriFromAdaId(nf:ada-zvl-id(./zorgverlener_identificatie_nummer)))"/>
		<entry>
			<fullUrl value="{$ada-id}"/>
			<resource>
				<xsl:call-template name="nl-core-practitioner-2.0">
					<xsl:with-param name="ada-zorgverlener" select="."/>
				</xsl:call-template>
			</resource>
		</entry>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="practitioners"/>
		<xd:param name="organizations"/>
	</xd:doc>
	<xsl:template name="practitionerRole-entry" match="zorgverlener" mode="doPractitionerRole">
		<xsl:param name="organizations"/>
		<xsl:param name="practitioners"/>
		<xsl:variable name="practitioner-fullUrl" select="nf:getFullUrl('PRACTITIONER', nf:getGroupingKeyPractitioner(.))"/>
		<xsl:variable name="organization-fullUrl" select="nf:getFullUrl('ORGANIZATION', nf:getGroupingKeyDefault(.//zorgaanbieder[not(zorgaanbieder)]))"/>
		<entry>
			<fullUrl value="{nf:get-fhir-uuid()}"/>
			<resource>
				<xsl:call-template name="nl-core-practitionerrole-2.0">
					<xsl:with-param name="ada-zorgverlener" select="."/>
				</xsl:call-template>
			</resource>
		</entry>
	</xsl:template>

	<xd:doc>
		<xd:desc> copy an element with all of it's contents in comments </xd:desc>
		<xd:param name="element"/>
	</xd:doc>
	<xsl:template name="copyElementInComment">
		<xsl:param name="element"/>
		<xsl:text disable-output-escaping="yes">
                       &lt;!--</xsl:text>
		<xsl:for-each select="$element">
			<xsl:call-template name="copyWithoutComments"/>
		</xsl:for-each>
		<xsl:text disable-output-escaping="yes">--&gt;
</xsl:text>
	</xsl:template>

	<xd:doc>
		<xd:desc> copy without comments </xd:desc>
	</xd:doc>
	<xsl:template name="copyWithoutComments">
		<xsl:copy>
			<xsl:for-each select="@* | *">
				<xsl:call-template name="copyWithoutComments"/>
			</xsl:for-each>
		</xsl:copy>
	</xsl:template>



</xsl:stylesheet>
