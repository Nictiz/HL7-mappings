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
	<xsl:output method="xml" indent="yes"/>
	<xsl:strip-space elements="*"/>


	<xsl:include href="../fhir/2_fhir_fhir_include.xsl"/>
	<xsl:variable name="patient-ada" select="/adaxml/data/*/patient"/>
	<xsl:variable name="patient-entry" as="element(f:entry)?">
		<!-- Patient, there may be only one in the input doc -->
		<xsl:for-each select="$patient-ada">
			<!-- For privacy reasons always use UUID as fullUrl for patient -->
			<xsl:variable name="patient-fullUrl" select="nf:get-fhir-uuid()"/>
			<entry>
				<fullUrl value="{$patient-fullUrl}"/>
				<resource>
					<xsl:call-template name="nl-core-patient-2.0">
						<xsl:with-param name="ada-patient" select="."/>
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
				<xsl:apply-templates select="current-group()[1]" mode="doPractitionerRoleEntry"/>
			</unieke-practitionerRole>
		</xsl:for-each-group>
	</xsl:variable>
	<xsl:variable name="products" as="element()*">
		<!-- Magistrale producten (niet-gecodeerd op hoogste niveau -->
		<xsl:for-each-group select="//product[product_code/@codeSystem = $oidNullFlavor] | //product[not(product_code/@code)]" group-by="nf:getGroupingKeyDefault(.)">
			<uniek-product xmlns="">
				<group-key xmlns="">
					<xsl:value-of select="current-grouping-key()"/>
				</group-key>
				<xsl:for-each select="current-group()[1]">
					<entry xmlns="http://hl7.org/fhir">
						<fullUrl value="{nf:get-fhir-uuid()}"/>
						<resource>
							<xsl:apply-templates select="." mode="doMedication"/>
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
		<xd:param name="medicatieafspraak"/>
		<xd:param name="lengte"/>
		<xd:param name="gewicht"/>
		<xd:param name="reden-voorschrijven"/>
		<xd:param name="lengte-reference"/>
		<xd:param name="gewicht-reference"/>
		<xd:param name="reden-voorschrijven-reference"/>
	</xd:doc>
	<xsl:template name="MA-in-MedicationRequest-2.0">
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
									<xsl:value-of select="./string-join((@value, @root), ' || ')"/>
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
				<xsl:apply-templates select="./afgesproken_geneesmiddel/product[.//(@value | @code)]" mode="doMedicationReferenceOrCodeableConcept"/>
				<!-- patiënt -->
				<subject>
					<xsl:apply-templates select="$patient-ada" mode="doPatientReference"/>
				</subject>
				<!-- lichaamslengte -->
				<xsl:for-each select="./lichaamslengte[.//@value]">
					<supportingInformation>
						<reference value="{$lengte-reference}"/>
						<display value="{concat('Lengte: ', ./lengte_waarde/@value, ' ', ./lengte_waarde/@unit,'. Datum/tijd gemeten: ', format-dateTime(./lengte_datum_tijd/@value, '[D01] [MN,*-3], [Y0001] [H01]:[m01]'))}"/>
					</supportingInformation>
				</xsl:for-each>
				<!-- lichaamsgewicht -->
				<xsl:for-each select="./lichaamsgewicht[.//@value]">
					<supportingInformation>
						<reference value="{$gewicht-reference}"/>
						<display value="{concat('Gewicht: ',./gewicht_waarde/@value, ' ', ./gewicht_waarde/@unit,'. Datum/tijd gemeten: ', format-dateTime(./gewicht_datum_tijd/@value, '[D01] [MN,*-3], [Y0001] [H01]:[m01]'))}"/>
					</supportingInformation>
				</xsl:for-each>
				<!-- afspraakdatum -->
				<xsl:for-each select="./afspraakdatum[@value]">
					<authoredOn value="{nf:ada-2-dateTimeCET(./@value)}"/>
				</xsl:for-each>
				<!-- voorschrijver -->
				<xsl:apply-templates select="./voorschrijver[.//(@value | @code)]" mode="doRequesterExtension"/>
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
						<xsl:apply-templates select="." mode="doDosageContents"/>
					</dosageInstruction>
				</xsl:for-each>
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
	</xd:doc>
	<xsl:template name="nl-core-organization-2.0">
		<xsl:param name="ada-zorgaanbieder" as="element()?"/>
		<xsl:for-each select="$ada-zorgaanbieder">
			<Organization>
				<meta>
					<profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-organization"/>
				</meta>
				<xsl:for-each select="./zorgaanbieder_identificatie_nummer[@value]">
					<identifier>
						<xsl:call-template name="id-to-Identifier">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</identifier>
				</xsl:for-each>
				<!-- todo organisatietype / afdelingspecialisme, is not part of an MP transaction up until now -->
				<xsl:for-each select="./organisatie_naam[.//(@value | @code)]">
					<name value="{./@value}"/>
				</xsl:for-each>
				<xsl:for-each select="./telefoon_email/contactgegevens[.//(@value | @code)]">
					<xsl:for-each select="./telefoonnummers[.//(@value | @code)]">
						<telecom>
							<system value="phone"/>
							<value value="{./telefoonnummer/@value}"/>
							<!-- todo telecomtype, is not part of an MP transaction up until now -->
							<use>
								<xsl:attribute name="value">
									<xsl:choose>
										<xsl:when test="./nummer_soort/@code = 'WP'">work</xsl:when>
										<xsl:when test="./nummer_soort/@code = 'HP'">home</xsl:when>
										<xsl:when test="./nummer_soort/@code = 'TMP'">temp</xsl:when>
										<xsl:otherwise>unsupported nummer_soort/@code: '<xsl:value-of select="./nummer_soort/@code"/>'.</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</use>
						</telecom>
					</xsl:for-each>
					<xsl:for-each select="./email_adressen[.//(@value | @code)]">
						<telecom>
							<system value="email"/>
							<value value="{./email_adres/@value}"/>
							<!-- todo telecomtype, is not part of an MP transaction up until now -->
							<use>
								<xsl:attribute name="value">
									<xsl:choose>
										<xsl:when test="./email_soort/@code = 'WP'">work</xsl:when>
										<xsl:when test="./email_soort/@code = 'HP'">home</xsl:when>
										<xsl:otherwise>unsupported nummer_soort/@code: '<xsl:value-of select="./nummer_soort/@code"/>'.</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</use>
						</telecom>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:apply-templates select="./adres/adresgegevens" mode="doAddress"/>
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
	</xd:doc>
	<xsl:template name="nl-core-practitioner-2.0">
		<xsl:param name="ada-zorgverlener" as="element()?"/>
		<!-- zorgverlener -->
		<xsl:for-each select="$ada-zorgverlener">
			<Practitioner>
				<meta>
					<profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-practitioner"/>
				</meta>
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
				<meta>
					<profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-practitionerrole"/>
				</meta>
				<xsl:for-each select=".[.//@value]">
					<practitioner>
						<xsl:apply-templates select="." mode="doPractitionerReference"/>
					</practitioner>
				</xsl:for-each>
				<xsl:for-each select=".//zorgaanbieder[not(zorgaanbieder)][.//@value]">
					<organization>
						<xsl:apply-templates select="." mode="doOrganizationReference"/>
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
	</xd:doc>
	<xsl:template name="nl-core-relatedperson-2.0" match="persoon" mode="doRelatedPerson">
		<RelatedPerson>
			<meta>
				<profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-relatedperson"/>
			</meta>
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
				<xsl:apply-templates select="$patient-ada" mode="doPatientReference"/>
			</patient>
			<xsl:for-each select="./naamgegevens">
				<xsl:call-template name="nl-core-humanname">
					<xsl:with-param name="ada-naamgegevens" select="."/>
				</xsl:call-template>
			</xsl:for-each>
		</RelatedPerson>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template name="afleverlocatie-reference" match="afleverlocatie" mode="doLocationReference">
		<reference value="{nf:getFullUrl('LOCATION', nf:getGroupingKeyDefault(.))}"/>
		<xsl:if test="./@value">
			<display value="{./@value}"/>
		</xsl:if>
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
		<xd:desc/>
	</xd:doc>
	<xsl:template name="patient-reference" match="patient" mode="doPatientReference">
		<reference value="{$patient-entry/f:fullUrl/@value}"/>
		<xsl:for-each select="./naamgegevens[1][.//@value]">
			<display value="{normalize-space(string-join(.//*[not(name()='naamgebruik')]/@value,' '))}"/>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template name="practitioner-reference" match="zorgverlener" mode="doPractitionerReference">
		<reference value="{nf:getFullUrl('PRACTITIONER',nf:getGroupingKeyPractitioner(.))}"/>
		<xsl:for-each select=".//naamgegevens[.//@value]">
			<display value="{normalize-space(string-join(.//@value, ' '))}"/>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template name="practitioner-role-reference" match="zorgverlener" mode="doPractitionerRoleReference">
		<reference value="{nf:getFullUrl('PRACTITIONERROLE', nf:getGroupingKeyDefault(.))}"/>
		<display value="{normalize-space(concat(string-join((.//naamgegevens[1]//*[not(name()='naamgebruik')]/@value), ' '), ' || ', string-join(.//organisatie_naam/@value |.//specialisme/@displayName,' || ')))}"/>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template name="verstrekker-performer-actor" match="verstrekker" mode="doPerformerActor">
		<!-- verstrekker -->
		<performer>
			<!-- in dataset toedieningsafspraak staat zorgaanbieder (onnodig) een keer extra genest -->
			<xsl:for-each select=".//zorgaanbieder[not(zorgaanbieder)]">
				<actor>
					<xsl:apply-templates select="." mode="doOrganizationReference"/>
				</actor>
			</xsl:for-each>
		</performer>
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
					<xsl:apply-templates select="." mode="doPractitionerReference"/>
				</agent>
				<xsl:for-each select=".//zorgaanbieder[not(zorgaanbieder)][.//@value]">
					<onBehalfOf>
						<xsl:apply-templates select="." mode="doOrganizationReference"/>
					</onBehalfOf>
				</xsl:for-each>
			</xsl:for-each>
		</requester>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template name="zorgverlener-requester-ext" match="voorschrijver | auteur" mode="doRequesterExtension">
		<xsl:for-each select="./zorgverlener[.//(@value | @code)]">
			<requester>
				<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-RequesterRole">
					<valueReference>
						<xsl:apply-templates select="." mode="doPractitionerRoleReference"/>
					</valueReference>
				</extension>
				<!-- agent is verplicht in FHIR, dit is eigenlijk dubbelop omdat de practitionerRole hier ook al naar verwijst -->
				<agent>
					<xsl:apply-templates select="." mode="doPractitionerReference"/>
				</agent>
			</requester>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template name="nl-core-address-2.0" match="adresgegevens" mode="doAddress">
		<xsl:for-each select=".[.//(@value | @code)]">
			<address>
				<line>
					<xsl:for-each select="./straat/@value">
						<extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName">
							<valueString value="{.}"/>
						</extension>
					</xsl:for-each>
					<xsl:for-each select="./huisnummer/@value">
						<extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber">
							<valueString value="{.}"/>
						</extension>
					</xsl:for-each>
					<xsl:for-each select="./huisnummerletter/@value | ./huisnummertoevoeging/@value">
						<extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-buildingNumberSuffix">
							<valueString value="{.}"/>
						</extension>
					</xsl:for-each>
					<xsl:for-each select="./additionele_informatie/@value">
						<extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-unitID">
							<valueString value="{.}"/>
						</extension>
					</xsl:for-each>
					<xsl:for-each select="./aanduiding_bij_nummer/@value">
						<extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator">
							<valueString value="{.}"/>
						</extension>
					</xsl:for-each>
				</line>
				<xsl:for-each select="./woonplaats/@value">
					<city value="{.}"/>
				</xsl:for-each>
				<xsl:for-each select="./gemeente/@value">
					<district value="{.}"/>
				</xsl:for-each>
				<xsl:for-each select="./postcode/@value">
					<postalCode value="{.}"/>
				</xsl:for-each>
				<xsl:for-each select="./land/@value">
					<country value="{.}"/>
				</xsl:for-each>
			</address>
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
		<xd:param name="verstrekkingsverzoek"/>
	</xd:doc>
	<xsl:template name="VV-in-MedicationRequest-2.0">
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
								<xsl:attribute name="value">Relatie naar medicatieafspraak, id = <xsl:value-of select="./string-join((@value, @root), ' || ')"/></xsl:attribute>
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
				<xsl:apply-templates select="./te_verstrekken_geneesmiddel/product[.//(@value | @code)]" mode="doMedicationReferenceOrCodeableConcept"/>
				<!-- patiënt -->
				<subject>
					<xsl:apply-templates select="$patient-ada" mode="doPatientReference"/>
				</subject>
				<!-- verstrekkingsverzoek datum -->
				<xsl:for-each select="./datum[@value]">
					<authoredOn value="{nf:ada-2-dateTimeCET(./@value)}"/>
				</xsl:for-each>
				<!-- auteur -->
				<xsl:apply-templates select="./auteur[.//(@value | @code)]" mode="doRequesterExtension"/>
				<!-- toelichting -->
				<xsl:for-each select="./toelichting[@value]">
					<note>
						<text value="{./@value}"/>
					</note>
				</xsl:for-each>
				<!-- verstrekkingsverzoek zelf in FHIR -->
				<dispenseRequest>
					<!-- afleverlocatie -->
					<xsl:for-each select="./afleverlocatie[@value]">
						<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-Location">
							<valueReference>
								<xsl:apply-templates select="." mode="doLocationReference"/>
							</valueReference>
						</extension>
					</xsl:for-each>
					<!-- verbruiksperiode start/eind -->
					<xsl:for-each select="./verbruiksperiode[(ingangsdatum | einddatum)/@value]">
						<validityPeriod>
							<xsl:for-each select="./ingangsdatum[@value]">
								<start value="{nf:ada-2-dateTimeCET(./@value)}"/>
							</xsl:for-each>
							<xsl:for-each select="./einddatum[@value]">
								<end value="{nf:ada-2-dateTimeCET(./@value)}"/>
							</xsl:for-each>
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
					<!-- beoogd verstrekker -->
					<xsl:for-each select="./beoogd_verstrekker">
						<performer>
							<xsl:apply-templates select="./zorgaanbieder" mode="doOrganizationReference"/>
						</performer>
					</xsl:for-each>
				</dispenseRequest>
			</MedicationRequest>
		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc> Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-AdministrationAgreement/ </xd:desc>
		<xd:param name="toedieningsafspraak"/>
	</xd:doc>
	<xsl:template name="zib-AdministrationAgreement-2.0">
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
				<xsl:for-each select="./reden_afspraak[@value]">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-AgreementReason">
						<valueString value="{./@value}"/>
					</extension>
				</xsl:for-each>
				<!-- gebruiksperiode_start /eind -->
				<xsl:for-each select=".[(gebruiksperiode_start | gebruiksperiode_eind)//(@value)]">
					<xsl:call-template name="zib-Medication-Period-Of-Use-2.0">
						<xsl:with-param name="start" select="./gebruiksperiode_start"/>
						<xsl:with-param name="end" select="./gebruiksperiode_eind"/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- gebruiksperiode - duur -->
				<xsl:for-each select="./gebruiksperiode[.//@value]">
					<xsl:call-template name="zib-Medication-Use-Duration">
						<xsl:with-param name="duration" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- aanvullende_informatie -->
				<xsl:for-each select="./aanvullende_informatie[.//(@value | @code)]">
					<xsl:call-template name="zib-Medication-AdditionalInformation">
						<xsl:with-param name="additionalInfo" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- relatie naar medicamenteuze behandeling -->
				<xsl:for-each select="./../identificatie[.//(@value)]">
					<xsl:call-template name="mbh-id-2-reference">
						<xsl:with-param name="in" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- kopie indicator -->
				<!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
				<xsl:for-each select="./kopie_indicator[.//(@value | @code)]">
					<xsl:call-template name="zib-Medication-CopyIndicator">
						<xsl:with-param name="copyIndicator" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- herhaalperiode cyclisch schema -->
				<xsl:for-each select="./gebruiksinstructie/herhaalperiode_cyclisch_schema[.//(@value | @code)]">
					<xsl:call-template name="zib-Medication-RepeatPeriodCyclicalSchedule">
						<xsl:with-param name="repeat-period" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- stoptype -->
				<xsl:for-each select="stoptype[.//(@value | @code)]">
					<xsl:call-template name="zib-Medication-StopType">
						<xsl:with-param name="stopType" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- TA id -->
				<xsl:for-each select="./identificatie[.//(@value | @code)]">
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
				<xsl:apply-templates select="./geneesmiddel_bij_toedieningsafspraak/product[.//(@value | @code)]" mode="doMedicationReferenceOrCodeableConcept"/>
				<!-- patiënt -->
				<subject>
					<xsl:apply-templates select="$patient-ada" mode="doPatientReference"/>
				</subject>
				<!-- verstrekker -->
				<xsl:apply-templates select="./verstrekker[.//(@value | @code)]" mode="doPerformerActor"/>
				<!-- relatie naar medicatieafspraak -->
				<xsl:for-each select="relatie_naar_medicatieafspraak/identificatie[not(@root = $oidNullFlavor)][.//(@value)]">
					<authorizingPrescription>
						<identifier>
							<xsl:call-template name="id-to-Identifier">
								<xsl:with-param name="in" select="."/>
							</xsl:call-template>
						</identifier>
						<display>
							<xsl:attribute name="value">relatie naar medicatieafspraak: <xsl:value-of select="./string-join((@value, @root), ' || ')"/></xsl:attribute>
						</display>
					</authorizingPrescription>
				</xsl:for-each>
				<!-- toelichting -->
				<xsl:for-each select="./toelichting[@value]">
					<note>
						<text value="{./@value}"/>
					</note>
				</xsl:for-each>

				<xsl:for-each select="./gebruiksinstructie/doseerinstructie/dosering">
					<dosageInstruction>
						<xsl:apply-templates select="." mode="doDosageContents"/>
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
						<xsl:for-each select="./../../doseerduur[@value]">
							<boundsDuration>
								<xsl:call-template name="hoeveelheid-to-Duration">
									<xsl:with-param name="in" select="."/>
								</xsl:call-template>
							</boundsDuration>
						</xsl:for-each>
						<!-- toedieningsduur -->
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
							<period value="{./@value}"/>
							<periodUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(./@unit)}"/>
						</xsl:for-each>
						<!-- interval -->
						<xsl:for-each select="./interval">
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
							<timeOfDay value="{format-dateTime(./@value, '[H01]:[m01]:[s01]')}"/>
						</xsl:for-each>
						<!-- dagdeel -->
						<xsl:for-each select="./dagdeel[@code][not(@codeSystem = $oidNullFlavor)]">
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
	</xd:doc>
	<xsl:template name="zib-BodyHeight-2.0" match="lichaamslengte" mode="doBodyHeightObservation">
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
			<subject>
				<xsl:apply-templates select="$patient-ada" mode="doPatientReference"/>
			</subject>
			<xsl:for-each select="./lengte_datum_tijd">
				<effectiveDateTime value="{./@value}"/>
			</xsl:for-each>
			<xsl:for-each select="./lengte_waarde">
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
	</xsl:template>
	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template name="zib-BodyWeight-2.0" match="lichaamsgewicht" mode="doBodyWeightObservation">
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
			<subject>
				<xsl:apply-templates select="$patient-ada" mode="doPatientReference"/>
			</subject>
			<xsl:for-each select="./gewicht_datum_tijd">
				<effectiveDateTime value="{./@value}"/>
			</xsl:for-each>
			<xsl:for-each select="./gewicht_waarde">
				<valueQuantity>
					<value value="{./@value}"/>
					<unit value="{./@unit}"/>
					<code value="{nf:convert_ADA_unit2UCUM_FHIR(./@unit)}"/>
				</valueQuantity>
			</xsl:for-each>
		</Observation>
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
						<valueDateTime value="{nf:ada-2-dateTimeCET(./@value)}"/>
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
				<xsl:apply-templates select="./verstrekt_geneesmiddel/product[.//(@value | @code)]" mode="doMedicationReferenceOrCodeableConcept"/>
				<!-- patiënt -->
				<subject>
					<xsl:apply-templates select="$patient-ada" mode="doPatientReference"/>
				</subject>
				<!-- verstrekker -->
				<xsl:apply-templates select="./verstrekker" mode="doPerformerActor"/>
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
				<!-- verbruiksduur -->
				<xsl:for-each select="./verbruiksduur[@value]">
					<daysSupply>
						<xsl:call-template name="hoeveelheid-to-Duration">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</daysSupply>
				</xsl:for-each>
				<!-- datum -->
				<xsl:for-each select="./datum[@value]">
					<whenHandedOver value="{nf:ada-2-dateTimeCET(./@value)}"/>
				</xsl:for-each>
				<!-- afleverlocatie -->
				<xsl:for-each select="./afleverlocatie">
					<destination>
						<xsl:apply-templates select="." mode="doLocationReference"/>
					</destination>
				</xsl:for-each>
				<!-- toelichting  -->
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
				<meta>
					<profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-location"/>
				</meta>
				<name value="{./@value}"/>
			</Location>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="verstrekkingsverzoek"/>
	</xd:doc>
	<xsl:template name="zib-DispenseRequest-2.0">
		<xsl:param name="verstrekkingsverzoek" as="element()?"/>
		<xsl:for-each select="$verstrekkingsverzoek">
			<entry>
				<fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
				<resource>
					<xsl:call-template name="VV-in-MedicationRequest-2.0">
						<xsl:with-param name="verstrekkingsverzoek" select="."/>
					</xsl:call-template>
				</resource>
			</entry>
		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template for 'dosering'. Without the dosage / dosageInstruction.
			The name of that element differs between MedicationStatement and MedicationRequest</xd:desc>
	</xd:doc>
	<xsl:template name="zib-InstructionsForUse-2.0" match="dosering" mode="doDosageContents">
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
		<xd:param name="medicatieafspraak"/>
	</xd:doc>
	<xsl:template name="zib-MedicationAgreement-2.0">
		<xsl:param name="medicatieafspraak" as="element()?"/>
		<xsl:for-each select="$medicatieafspraak">
			<!-- lengte in eigen resource -->
			<xsl:variable name="lengte" select="./lichaamslengte"/>
			<xsl:variable name="lengte-fullUrl" select="nf:get-fhir-uuid()"/>
			<xsl:for-each select="$lengte[.//@value]">
				<entry xmlns="http://hl7.org/fhir">
					<fullUrl value="{$lengte-fullUrl}"/>
					<resource>
						<xsl:apply-templates select="." mode="doBodyHeightObservation"/>
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
						<xsl:apply-templates select="." mode="doBodyWeightObservation"/>
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
						<xsl:apply-templates select="." mode="doConditionForProbleem"/>
					</resource>
				</entry>
			</xsl:for-each>
			<!-- entry for MedicationRequest -->
			<entry xmlns="http://hl7.org/fhir">
				<fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
				<resource>
					<xsl:call-template name="MA-in-MedicationRequest-2.0">
						<xsl:with-param name="medicatieafspraak" select="."/>
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
				<xsl:for-each select="$start[@value]">
					<start value="{nf:ada-2-dateTimeCET(./@value)}"/>
				</xsl:for-each>
				<xsl:for-each select="$end[@value]">
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
		<xd:param name="medicatiegebruik"/>
	</xd:doc>
	<xsl:template name="zib-MedicationUse-2.0">
		<xsl:param name="medicatiegebruik"/>
		<xsl:for-each select="$medicatiegebruik">
			<!-- informant / persoon in eigen resource -->
			<xsl:variable name="informant-persoon-fullUrl" select="nf:get-fhir-uuid()"/>
			<xsl:for-each select="./informant/persoon[.//@value]">
				<entry>
					<fullUrl value="{$informant-persoon-fullUrl}"/>
					<resource>
						<xsl:apply-templates select="." mode="doRelatedPerson"/>
					</resource>
				</entry>
			</xsl:for-each>
			<!-- MedicationStatement entry -->
			<entry>
				<fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
				<resource>
					<MedicationStatement>
						<meta>
							<profile value="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse"/>
						</meta>
						<!-- volgens_afspraak_indicator -->
						<xsl:for-each select="./volgens_afspraak_indicator[@value]">
							<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-AsAgreedIndicator">
								<valueBoolean value="{./@value}"/>
							</extension>
						</xsl:for-each>
						<!-- voorschrijver in extension -->
						<xsl:for-each select="./voorschrijver/zorgverlener[.//(@value | @code)]">
							<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Prescriber">
								<extension url="agent">
									<valueReference>
										<xsl:apply-templates select="." mode="doPractitionerRoleReference"/>
									</valueReference>
								</extension>
							</extension>
						</xsl:for-each>
						<!-- auteur -->
						<xsl:for-each select="./auteur[.//@value]">
							<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Author">
								<xsl:choose>
									<xsl:when test="./auteur_is_zorgverlener[.//@value]">
										<valueReference>
											<xsl:apply-templates select="./auteur_is_zorgverlener/zorgverlener" mode="doPractitionerRoleReference"/>
										</valueReference>
									</xsl:when>
									<xsl:when test="./auteur_is_patient[@value = 'true']">
										<valueReference>
											<xsl:apply-templates select="$patient-ada" mode="doPatientReference"/>
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
								<status value="on-hold"/>
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
						<xsl:apply-templates select="./gebruiks_product/product[.//(@value | @code)]" mode="doMedicationReferenceOrCodeableConcept"/>
						<!-- gebruiksperiode -->
						<xsl:for-each select=".[(gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode)[@value]]">
							<effectivePeriod>
								<xsl:for-each select="./gebruiksperiode[@value]">
									<xsl:call-template name="zib-Medication-Use-Duration">
										<xsl:with-param name="duration" select="."/>
									</xsl:call-template>
								</xsl:for-each>
								<xsl:for-each select="gebruiksperiode_start[@value]">
									<start value="{nf:ada-2-dateTimeCET(./@value)}"/>
								</xsl:for-each>
								<xsl:for-each select="gebruiksperiode_eind[@value]">
									<end value="{nf:ada-2-dateTimeCET(./@value)}"/>
								</xsl:for-each>
							</effectivePeriod>
						</xsl:for-each>
						<!-- registratiedatum -->
						<xsl:for-each select="./registratiedatum[@value]">
							<dateAsserted value="{nf:ada-2-dateTimeCET(./@value)}"/>
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
										<reference value="{$informant-persoon-fullUrl}"/>
										<display value="{normalize-space(string-join(./persoon/naamgegevens[1]//*[not(name()='naamgebruik')]/@value,' '))}"/>
									</xsl:when>
									<xsl:when test="./informant_is_patient[@value = 'true']">
										<xsl:apply-templates select="$patient-ada" mode="doPatientReference"/>
									</xsl:when>
									<xsl:when test="./informant_is_zorgverlener[.//@value]">
										<xsl:apply-templates select="./informant_is_zorgverlener/zorgverlener" mode="doPractitionerRoleReference"/>
									</xsl:when>
								</xsl:choose>
							</informationSource>
						</xsl:for-each>
						<!-- patiënt -->
						<subject>
							<xsl:apply-templates select="$patient-ada" mode="doPatientReference"/>
						</subject>
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
								<xsl:apply-templates select="." mode="doDosageContents"/>
							</dosage>
						</xsl:for-each>
					</MedicationStatement>
				</resource>
			</entry>
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
	</xd:doc>
	<xsl:template name="zib-problem-2.0" match="probleem" mode="doConditionForProbleem">
		<Condition>
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
			<subject>
				<xsl:apply-templates select="$patient-ada" mode="doPatientReference"/>
			</subject>
		</Condition>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template name="zib-Product" match="product" mode="doMedication">
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
		<xd:desc>Takes input string. If it is a dateTime, it checks if it has a timezone. If it is a dateTime without timezone a CET timezone will be set. 
			In all other cases, the input string is returned.</xd:desc>
		<xd:param name="valueIn">The input string to be handled.</xd:param>
	</xd:doc>
	<xsl:function name="nf:ada-2-dateTimeCET" as="xs:string?">
		<xsl:param name="valueIn" as="xs:string?"/>
		<xsl:value-of select="
				if (not($valueIn castable as xs:dateTime)) then
					$valueIn
				else
					if (timezone-from-dateTime(xs:dateTime($valueIn))) then
						$valueIn
					else
						nf:set-CET-timezone(xs:dateTime($valueIn))
				"/>
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
		<xd:param name="documentgegevens"/>
		<xd:param name="entries"/>
	</xd:doc>
	<xsl:template name="medicatieoverzicht-9.0.6">
		<xsl:param name="documentgegevens" select="." as="element()?"/>
		<xsl:param name="entries" as="element(f:entry)*"/>
		<xsl:for-each select="$documentgegevens">
			<entry>
				<fullUrl value="{nf:get-fhir-uuid()}"/>
				<resource>
					<List>
						<xsl:if test="verificatie_patient[.//(@value | @code)] | verificatie_zorgverlener[.//(@value | @code)]">
							<extension url="http://nictiz.nl/fhir/StructureDefinition/MedicationOverview-Verification">
								<xsl:for-each select="./verificatie_patient/geverifieerd_met_patientq/@value">
									<extension url="VerificationPatient">
										<valueBoolean value="{.}"/>
									</extension>
								</xsl:for-each>
								<xsl:for-each select="./verificatie_patient/verificatie_datum/@value">
									<extension url="VerificationPatientDate">
										<valueDateTime value="{nf:ada-2-dateTimeCET(.)}"/>
									</extension>
								</xsl:for-each>
								<xsl:for-each select="./verificatie_zorgverlener/geverifieerd_met_zorgverlenerq/@value">
									<extension url="VerificationHealthProfessional">
										<valueBoolean value="{.}"/>
									</extension>
								</xsl:for-each>
								<xsl:for-each select="./verificatie_zorgverlener/verificatie_datum/@value">
									<extension url="VerificationHealthProfessionalDate">
										<valueDateTime value="{nf:ada-2-dateTimeCET(.)}"/>
									</extension>
								</xsl:for-each>
							</extension>
						</xsl:if>
						<status value="current"/>
						<mode value="snapshot"/>
						<code>
							<coding>
								<system value="http://snomed.info/sct"/>
								<code value="11181000146103"/>
								<display value="Actual medication overview (record artifact)"/>
							</coding>
							<text value="Medicatieoverzicht"/>
						</code>
						<subject>
							<xsl:apply-templates select="$patient-ada" mode="doPatientReference"/>
						</subject>
						<date value="{nf:ada-2-dateTimeCET(./document_datum/@value)}"/>
						<xsl:for-each select="./auteur">
							<xsl:for-each select="./auteur_is_zorgaanbieder/zorgaanbieder[.//(@value | @code)]">
								<source>
									<extension url="http://nictiz.nl/fhir/StructureDefinition/MedicationOverview-SourceOrganization">
										<valueReference>
											<xsl:apply-templates select="." mode="doOrganizationReference"/>
										</valueReference>
									</extension>
								</source>
							</xsl:for-each>
							<xsl:for-each select="./auteur_is_patient[@value = 'true']">
								<source>
									<xsl:apply-templates select="$patient-ada" mode="doPatientReference"/>
								</source>
							</xsl:for-each>
						</xsl:for-each>
						<!-- the entries with references to medicatieafspraak/toedieningsafspraak/medicatiegebruik -->
						<!-- MA's -->
						<xsl:for-each select="$entries[f:resource/*/f:category/f:coding[f:system/@value = 'http://snomed.info/sct'][f:code/@value = '16076005']]">
							<entry>
								<item>
									<reference value="{./fullUrl/@value}"/>
									<display value="bbb"/>
								</item>
							</entry>
						</xsl:for-each>
						<!-- TA's -->
						<!-- TODO -->
						<!-- MGB's -->
						<xsl:for-each select="$entries[f:resource/*/f:category/f:coding[f:system/@value = 'urn:oid:2.16.840.1.113883.2.4.3.11.60.20.77.5.3'][f:code/@value = '6']]">
							<entry>
								<item>
									<reference value="{./f:fullUrl/@value}"/>
									<display value="bbb"/>
								</item>
							</entry>
						</xsl:for-each>
					</List>
				</resource>
			</entry>
		</xsl:for-each>

	</xsl:template>
	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template name="medication-referenceOrCodeableConcept" match="product" mode="doMedicationReferenceOrCodeableConcept">
		<xsl:choose>
			<xsl:when test="./product_code[@codeSystem = $oidNullFlavor] or not(./product_code[@code])">
				<medicationReference>
					<reference value="{nf:getFullUrl('PRODUCT', nf:getGroupingKeyDefault(.))}"/>
					<display value="{./product_specificatie/product_naam/@value}"/>
				</medicationReference>
			</xsl:when>
			<xsl:otherwise>
				<medicationCodeableConcept>
					<xsl:call-template name="code-to-CodeableConcept">
						<xsl:with-param name="in" select="./product_code"/>
					</xsl:call-template>
				</medicationCodeableConcept>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

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
	</xd:doc>
	<xsl:template name="organization-reference" match="zorgaanbieder" mode="doOrganizationReference">
		<reference value="{nf:getFullUrl('ORGANIZATION',nf:getGroupingKeyDefault(.))}"/>
		<xsl:for-each select="./organisatie_naam[@value]">
			<display value="{./@value}"/>
		</xsl:for-each>
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
	</xd:doc>
	<xsl:template name="practitionerRole-entry" match="zorgverlener" mode="doPractitionerRoleEntry">
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
