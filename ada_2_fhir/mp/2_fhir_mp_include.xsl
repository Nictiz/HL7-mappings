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
		<xsl:param name="ada-zorgaanbieder"/>
		<xsl:param name="organization-id"/>
		<xsl:for-each select="$ada-zorgaanbieder">
			<Organization>
				<id value="{$organization-id}"/>
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
		<xd:param name="ada-persoon"/>
		<xd:param name="persoon-id"/>
		<xd:param name="patient"/>
	</xd:doc>
	<xsl:template name="nl-core-relatedperson-2.0">
		<xsl:param name="ada-persoon"/>
		<xsl:param name="patient"/>
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
						<xsl:with-param name="patient" select="$patient"/>
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
		<xd:desc>Helper template for patient as subject reference</xd:desc>
		<xd:param name="patient"/>
	</xd:doc>
	<xsl:template name="patient-reference">
		<xsl:param name="patient" as="element()?"/>
		<xsl:for-each select="$patient">
			<xsl:for-each select="$patient/patient_identificatienummer">
				<identifier>
					<xsl:call-template name="id-to-Identifier">
						<xsl:with-param name="in" select="."/>
					</xsl:call-template>
				</identifier>
				<!--         <xsl:for-each select="./naamgegevens">
                     <name>
                        <xsl:for-each select="./naamgebruik[not(@codeSystem = $oidNullFlavor)]">
                           <extension url="http://hl7.org/fhir/StructureDefinition/humanname-assembly-order">
                           <valueCode>
                              <xsl:call-template name="code-to-CodeableConcept">
                                 <xsl:with-param name="in" select="."/>
                              </xsl:call-template>
                           </valueCode>
                           </extension>
                        </xsl:for-each>
                     </name>
                  </xsl:for-each>
         -->
			</xsl:for-each>
			<xsl:if test="./naamgegevens">
				<display value="{normalize-space(string-join(./naamgegevens[1]//*[not(name()='naamgebruik')]/@value,' '))}"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc>Helper template for patient as subject reference</xd:desc>
		<xd:param name="patient"/>
	</xd:doc>
	<xsl:template name="patient-subject-reference">
		<xsl:param name="patient" as="element()?"/>
		<!-- <xsl:comment> Patient </xsl:comment>
      <xsl:comment> Possibly not to be included for MedMij related interactions, because patient should be known in infra-context </xsl:comment>
     -->
		<xsl:for-each select="$patient">
			<subject>
				<xsl:call-template name="patient-reference">
					<xsl:with-param name="patient" select="."/>
				</xsl:call-template>
			</subject>
		</xsl:for-each>
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
		<xd:param name="zorgverlener-id"/>
		<xd:param name="zorgverlener-za-id"/>
	</xd:doc>
	<xsl:template name="zorgverlener-requester">
		<xsl:param name="zorgverlener"/>
		<xsl:param name="zorgverlener-id"/>
		<xsl:param name="zorgverlener-za-id"/>
		<requester>
			<xsl:for-each select="$zorgverlener">
				<agent>
					<reference value="#{$zorgverlener-id}"/>
					<display value="{normalize-space(string-join(.//(naamgegevens)//@value, ' '))}"/>
				</agent>
				<xsl:for-each select="./zorgaanbieder/zorgaanbieder">
					<onBehalfOf>
						<reference value="#{$zorgverlener-za-id}"/>
						<display value="{./organisatie_naam/@value}"/>
					</onBehalfOf>
				</xsl:for-each>
			</xsl:for-each>
		</requester>
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
				<xsl:for-each select="$unstructured-name">
					<text>
						<xsl:value-of select="."/>
					</text>
				</xsl:for-each>
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
				<xsl:for-each select="./voornamen">
					<given value="{normalize-space(./@value)}">
						<extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
							<valueCode value="BR"/>
						</extension>
					</given>
				</xsl:for-each>
				<xsl:for-each select="./initialen">
					<given value="{normalize-space(./@value)}">
						<extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
							<valueCode value="IN"/>
						</extension>
					</given>
				</xsl:for-each>
				<xsl:for-each select="./roepnaam">
					<given value="{normalize-space(./@value)}">
						<extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
							<valueCode value="CL"/>
						</extension>
					</given>
				</xsl:for-each>
				<xsl:for-each select="prefix[not(tokenize(@qualifier, '\s') = 'VV')]">
					<prefix value="{.}"/>
				</xsl:for-each>
				<xsl:for-each select="suffix">
					<suffix value="{.}"/>
				</xsl:for-each>
				<xsl:if test="validTime">
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
		<xd:param name="ada-zorgverlener">The practitioner in ada format</xd:param>
		<xd:param name="practioner-id">The FHIR resource id.</xd:param>
		<xd:param name="patient"/>
	</xd:doc>
	<xsl:template name="nl-core-practitioner-2.0">
		<xsl:param name="ada-zorgverlener" as="element()?"/>
		<xsl:param name="practioner-id" as="xs:string?"/>
		<xsl:param name="patient"/>
		<!-- zorgverlener -->
		<xsl:for-each select="$ada-zorgverlener">
			<Practitioner>
				<id value="{$practioner-id}"/>
				<!-- zorgverlener_identificatie_nummer -->
				<xsl:for-each select="./zorgverlener_identificatie_nummer">
					<xsl:comment>zorgverlener_identificatie_nummer</xsl:comment>
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
				<!-- TODO specialisme -->
			</Practitioner>
		</xsl:for-each>

	</xsl:template>
	<xd:doc>
		<xd:desc> Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-AdministrationAgreement/ </xd:desc>
		<xd:param name="patient"/>
		<xd:param name="toedieningsafspraak"/>
	</xd:doc>
	<xsl:template name="zib-AdministrationAgreement-2.0">
		<xsl:param name="patient" as="element()?"/>
		<xsl:param name="toedieningsafspraak" as="element()?"/>
		<xsl:for-each select="$toedieningsafspraak">
			<MedicationDispense>
				<meta>
					<profile value="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement"/>
				</meta>
				<!-- product met ingrediënten, niet gecodeerd product -->
				<!-- store the contained_id to later refer to -->
				<xsl:variable name="product" select="./geneesmiddel_bij_toedieningsafspraak/product"/>
				<xsl:variable name="product-id" select="generate-id($product)"/>
				<!-- 'magistraal' geneesmiddel in een contained resource -->
				<xsl:for-each select="$product[product_code/@codeSystem = $oidNullFlavor]">
					<contained>
						<xsl:call-template name="zib-Product">
							<xsl:with-param name="product" select="."/>
							<xsl:with-param name="product-id" select="$product-id"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- afspraakdatum -->
				<xsl:for-each select="./afspraakdatum[@value]">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-AuthoredOn">
						<valueDateTime value="{./@value}"/>
					</extension>
				</xsl:for-each>
				<!-- reden afspraak -->
				<xsl:for-each select="./reden_afspraak">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-ReasonForDispense">
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
				<xsl:for-each select="$product/product_code">
					<xsl:choose>
						<xsl:when test=".[@codeSystem = $oidNullFlavor]">
							<medicationReference>
								<reference value="#{$product-id}"/>
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
				<!-- relatie naar medicatieafspraak -->
				<xsl:for-each select="relatie_naar_medicatieafspraak/identificatie[not(@root = $oidNullFlavor)]">
					<supportingInformation>
						<identifier>
							<xsl:call-template name="id-to-Identifier">
								<xsl:with-param name="in" select="."/>
							</xsl:call-template>
						</identifier>
					</supportingInformation>
				</xsl:for-each>
				<!-- verstrekker -->
				<xsl:call-template name="verstrekker-performer">
					<xsl:with-param name="verstrekker" select="./verstrekker"/>
				</xsl:call-template>
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
		<xd:param name="lengte-id"/>
		<xd:param name="patient"/>
	</xd:doc>
	<xsl:template name="zib-BodyHeight-2.0">
		<xsl:param name="lengte"/>
		<xsl:param name="lengte-id"/>
		<xsl:param name="patient"/>
		<xsl:for-each select="$lengte">
			<Observation>
				<id value="{$lengte-id}"/>
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
	</xd:doc>
	<xsl:template name="zib-BodyWeight-2.0">
		<xsl:param name="gewicht" as="element()?"/>
		<xsl:param name="gewicht-id" as="xs:string?"/>
		<xsl:param name="patient" as="element()?"/>
		<xsl:for-each select="$gewicht">
			<Observation>
				<id value="{$gewicht-id}"/>
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
							<xsl:with-param name="product-id" select="$product-id"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- afleverlocatie in een contained resource -->
				<xsl:for-each select="./afleverlocatie[@value]">
					<contained>
						<Location>
							<id value="{$afleverlocatie-id}"/>
							<description value="{./@value}"/>
						</Location>
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
								<reference value="#{$product-id}"/>
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
				<xsl:for-each select="./afleverlocatie">
					<destination>
						<reference value="#{$afleverlocatie-id}"/>
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
		<xd:param name="patient"/>
		<xd:param name="verstrekkingsverzoek"/>
	</xd:doc>
	<xsl:template name="zib-DispenseRequest-2.0">
		<xsl:param name="patient" as="element()?"/>
		<xsl:param name="verstrekkingsverzoek" as="element()?"/>

		<xsl:for-each select="$verstrekkingsverzoek">
			<MedicationRequest>
				<meta>
					<profile value="http://nictiz.nl/fhir/StructureDefinition/zib-DispenseRequest"/>
				</meta>
				<!-- 'magistraal' geneesmiddel in een contained resource -->
				<xsl:variable name="product" select="./te_verstrekken_geneesmiddel/product"/>
				<xsl:variable name="product-id" select="generate-id($product)"/>
				<xsl:for-each select="$product[product_code/@codeSystem = $oidNullFlavor]">
					<contained>
						<xsl:call-template name="zib-Product">
							<xsl:with-param name="product" select="."/>
							<xsl:with-param name="product-id" select="$product-id"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- auteur/zorgverlener in contained resource -->
				<xsl:variable name="auteur" select="./auteur/zorgverlener"/>
				<xsl:variable name="auteur-id" select="generate-id($auteur)"/>
				<xsl:for-each select="$auteur[.//@value]">
					<contained>
						<xsl:call-template name="nl-core-practitioner-2.0">
							<xsl:with-param name="ada-zorgverlener" select="."/>
							<xsl:with-param name="practioner-id" select="$auteur-id"/>
							<xsl:with-param name="patient" select="$patient"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- auteur/zorgaanbieder in contained resource -->
				<xsl:variable name="auteur-za" select="$auteur/zorgaanbieder/zorgaanbieder"/>
				<xsl:variable name="auteur-za-id" select="generate-id($auteur-za)"/>
				<xsl:for-each select="$auteur-za[.//@value]">
					<contained>
						<xsl:call-template name="nl-core-organization-2.0">
							<xsl:with-param name="ada-zorgaanbieder" select="."/>
							<xsl:with-param name="organization-id" select="$auteur-za-id"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- beoogd verstrekker in contained resource -->
				<xsl:variable name="beoogd_verstrekker-za" select="./beoogd_verstrekker/zorgaanbieder"/>
				<xsl:variable name="beoogd_verstrekker-za-id" select="generate-id($beoogd_verstrekker-za)"/>
				<xsl:for-each select="$beoogd_verstrekker-za[.//@value]">
					<contained>
						<xsl:call-template name="nl-core-organization-2.0">
							<xsl:with-param name="ada-zorgaanbieder" select="."/>
							<xsl:with-param name="organization-id" select="$beoogd_verstrekker-za-id"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- afleverlocatie in een contained resource -->
				<xsl:variable name="afleverlocatie-id" select="generate-id(./afleverlocatie)"/>
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
								<xsl:attribute name="value">Relatie naar medicatieafspraak, id = <xsl:value-of select="./string-join((@value, @root), '--')"/></xsl:attribute>
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
				<xsl:for-each select="$product/product_code[@code]">
					<xsl:choose>
						<xsl:when test=".[@codeSystem = $oidNullFlavor]">
							<medicationReference>
								<reference value="#{$product-id}"/>
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
				<!-- verstrekkingsverzoek datum -->
				<xsl:for-each select="./datum[@value]">
					<authoredOn value="{./@value}"/>
				</xsl:for-each>
				<!-- auteur -->
				<xsl:call-template name="zorgverlener-requester">
					<xsl:with-param name="zorgverlener" select="$auteur"/>
					<xsl:with-param name="zorgverlener-id" select="$auteur-id"/>
					<xsl:with-param name="zorgverlener-za-id" select="$auteur-za-id"/>
				</xsl:call-template>
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
							<valueString value="{./@value}"/>
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
								<reference value="#{$beoogd_verstrekker-za-id}"/>
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
				<xsl:for-each select=".[waarde/(min | max)]">
					<rateRange>
						<xsl:call-template name="minmax-to-Range">
							<xsl:with-param name="in" select="./waarde"/>
						</xsl:call-template>
					</rateRange>
					<rateQuantity>
						<xsl:call-template name="hoeveelheid-to-Duration">
							<xsl:with-param name="in" select="./tijdseenheid"/>
						</xsl:call-template>
					</rateQuantity>
				</xsl:for-each>

			</xsl:for-each>
			<!--<xsl:if test="rateQuantity">
                     <rateRatio>
                        <xsl:call-template name="RTO_QTY_QTY-to-Ratio">
                           <xsl:with-param name="in" select="rateQuantity"/>
                        </xsl:call-template>
                     </rateRatio>
                  </xsl:if>
               -->
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
		<xd:desc> Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-AdministrationAgreement/ </xd:desc>
		<xd:param name="patient"/>
		<xd:param name="medicatieafspraak"/>
	</xd:doc>
	<xsl:template name="zib-MedicationAgreement-2.0">
		<xsl:param name="patient" as="element()?"/>
		<xsl:param name="medicatieafspraak" as="element()?"/>
		<xsl:for-each select="$medicatieafspraak">
			<MedicationRequest xsl:exclude-result-prefixes="#all">
				<meta>
					<profile value="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement"/>
				</meta>
				<!-- product met ingrediënten, niet gecodeerd product -->
				<!-- store the contained_id to later refer to -->
				<xsl:variable name="product" select="./afgesproken_geneesmiddel/product"/>
				<xsl:variable name="product-id" select="generate-id($product)"/>
				<!-- 'magistraal' geneesmiddel in een contained resource -->
				<xsl:for-each select="$product[product_code/@codeSystem = $oidNullFlavor]">
					<xsl:comment>'magistraal' geneesmiddel</xsl:comment>
					<contained>
						<xsl:call-template name="zib-Product">
							<xsl:with-param name="product" select="."/>
							<xsl:with-param name="product-id" select="$product-id"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- lengte in contained resource -->
				<xsl:variable name="lengte" select="./lichaamslengte"/>
				<xsl:variable name="lengte-id" select="generate-id($lengte)"/>
				<xsl:for-each select="$lengte[.//@value]">
					<xsl:comment>lichaamslengte</xsl:comment>
					<contained>
						<xsl:call-template name="zib-BodyHeight-2.0">
							<xsl:with-param name="lengte" select="."/>
							<xsl:with-param name="lengte-id" select="$lengte-id"/>
							<xsl:with-param name="patient" select="$patient"/>
						</xsl:call-template>
					</contained>
				</xsl:for-each>
				<!-- gewicht in contained resource -->
				<xsl:variable name="gewicht" select="./lichaamsgewicht"/>
				<xsl:variable name="gewicht-id" select="generate-id($gewicht)"/>
				<xsl:for-each select="$gewicht[.//@value]">
					<xsl:comment>lichaamsgewicht</xsl:comment>
					<contained>
						<xsl:call-template name="zib-BodyWeight-2.0">
							<xsl:with-param name="gewicht" select="."/>
							<xsl:with-param name="gewicht-id" select="$gewicht-id"/>
							<xsl:with-param name="patient" select="$patient"/>
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
							<xsl:with-param name="practioner-id" select="$voorschrijver-id"/>
							<xsl:with-param name="patient" select="$patient"/>
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
				<!-- reden van voorschrijven in contained resource -->
				<xsl:variable name="reden-voorschrijven" select="./reden_van_voorschrijven/probleem"/>
				<xsl:variable name="reden-voorschrijven-id" select="generate-id($reden-voorschrijven)"/>
				<xsl:for-each select="$reden-voorschrijven[.//@code]">
					<xsl:comment>reden van voorschrijven</xsl:comment>
					<contained>
						<xsl:call-template name="zib-problem-2.0">
							<xsl:with-param name="ada-probleem" select="."/>
							<xsl:with-param name="condition-id" select="$reden-voorschrijven-id"/>
							<xsl:with-param name="patient" select="$patient"/>
						</xsl:call-template>
					</contained>
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
					<xsl:comment>medicatieafspraak</xsl:comment>
					<coding>
						<system value="http://snomed.info/sct"/>
						<code value="16076005"/>
						<display value="Prescription (procedure)"/>
					</coding>
				</category>
				<!-- geneesmiddel -->
				<xsl:for-each select="$product/product_code">
					<xsl:comment>geneesmiddel</xsl:comment>
					<xsl:choose>
						<xsl:when test=".[@codeSystem = $oidNullFlavor]">
							<medicationReference>
								<reference value="#{$product-id}"/>
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
				<!-- lichaamslengte -->
				<xsl:for-each select="./lichaamslengte[.//@value]">
					<xsl:comment>lichaamslengte</xsl:comment>
					<supportingInformation>
						<reference value="#{$gewicht-id}"/>
						<display value="{concat('Lengte. ',./lengte_waarde/@value, ' ', ./lengte_waarde/@unit,'. Gemeten: ', format-dateTime(./lengte_datum_tijd/@value, '[D01] [MN,*-3], [Y0001] [H01]:[m01]'))}"/>
					</supportingInformation>
				</xsl:for-each>
				<!-- lichaamsgewicht -->
				<xsl:for-each select="./lichaamsgewicht[.//@value]">
					<xsl:comment>lichaamsgewicht</xsl:comment>
					<supportingInformation>
						<reference value="#{$lengte-id}"/>
						<display value="{concat('Gewicht. ',./gewicht_waarde/@value, ' ', ./gewicht_waarde/@unit,'. Gemeten: ', format-dateTime(./gewicht_datum_tijd/@value, '[D01] [MN,*-3], [Y0001] [H01]:[m01]'))}"/>
					</supportingInformation>
				</xsl:for-each>
				<!-- TODO  -->
				<!-- relatie naar medicatieafspraak of gebruik -->
				<xsl:for-each select="relatie_naar_afspraak_of_gebruik/(identificatie | identificatie_23288 | identificatie_23289)">
					<supportingInformation>
						<identifier>
							<xsl:call-template name="id-to-Identifier">
								<xsl:with-param name="in" select="."/>
							</xsl:call-template>
						</identifier>
						<display>
							<xsl:attribute name="value">
								<xsl:choose>
									<xsl:when test="./name() = 'identificatie'">relatie naar medicatieafspraak</xsl:when>
									<xsl:when test="./name() = 'identificatie_23288'">relatie naar toedieningsafspraak</xsl:when>
									<xsl:when test="./name() = 'identificatie_23289'">relatie naar medicatiegebruik</xsl:when>
								</xsl:choose>
							</xsl:attribute>
						</display>
					</supportingInformation>
				</xsl:for-each>
				<!-- afspraakdatum -->
				<xsl:for-each select="./afspraakdatum[@value]">
					<xsl:comment>afspraakdatum</xsl:comment>
					<authoredOn value="{./@value}"/>
				</xsl:for-each>
				<!-- voorschrijver -->
				<xsl:for-each select="./voorschrijver">
					<xsl:call-template name="zorgverlener-requester">
						<xsl:with-param name="zorgverlener" select="$voorschrijver"/>
						<xsl:with-param name="zorgverlener-id" select="$voorschrijver-id"/>
						<xsl:with-param name="zorgverlener-za-id" select="$voorschrijver-za-id"/>
					</xsl:call-template>
				</xsl:for-each>
				<!-- reden afspraak -->
				<xsl:for-each select="./reden_afspraak">
					<xsl:comment>reden afspraak</xsl:comment>
					<reasonCode>
						<xsl:call-template name="code-to-CodeableConcept">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</reasonCode>
				</xsl:for-each>
				<!-- reden van voorschrijven -->
				<xsl:for-each select="./reden_van_voorschrijven/probleem">
					<xsl:comment>reden van voorschrijven</xsl:comment>
					<reasonReference>
						<reference value="{$reden-voorschrijven-id}"/>
						<display value="{normalize-space(string-join(.//(@displayName|@originalText), ' '))}"/>
					</reasonReference>
				</xsl:for-each>
				<!-- toelichting -->
				<xsl:for-each select="./toelichting[@value]">
					<xsl:comment>toelichting</xsl:comment>
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
					<start value="{./@value}"/>
				</xsl:for-each>
				<xsl:for-each select="$end">
					<end value="{./@value}"/>
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
							<xsl:with-param name="product-id" select="$product-id"/>
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
							<xsl:with-param name="practioner-id" select="$voorschrijver-id"/>
							<xsl:with-param name="patient" select="$patient"/>
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
				<xsl:variable name="auteur-zorgverlener" select="./auteur/auteur_is_zorgverlener/zorgverlener"/>
				<xsl:variable name="auteur-zorgverlener-id" select="generate-id($auteur-zorgverlener)"/>
				<xsl:for-each select="$auteur-zorgverlener[.//@value]">
					<xsl:comment>auteur-zorgverlener</xsl:comment>
					<contained>
						<xsl:call-template name="nl-core-practitioner-2.0">
							<xsl:with-param name="ada-zorgverlener" select="."/>
							<xsl:with-param name="practioner-id" select="$auteur-zorgverlener-id"/>
							<xsl:with-param name="patient" select="$patient"/>
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
							<xsl:with-param name="patient" select="$patient"/>
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
							<xsl:with-param name="patient" select="$patient"/>
							<xsl:with-param name="practioner-id" select="$informant-zorgverlener-id"/>
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
						<valueReference id="#{$voorschrijver-id}">
							<display value="{normalize-space(string-join(.//naamgegevens//@value, ' '))}"/>
						</valueReference>
					</extension>
				</xsl:for-each>
				<!-- voorschrijver/zorgaanbieder in extension -->
				<xsl:for-each select="$voorschrijver-za">
					<extension url="http://hl7.org/fhir/StructureDefinition/medicationstatement-Onbehalfof">
						<valueReference id="#{$voorschrijver-za-id}">
							<display value="{normalize-space(string-join(.//organisatie_naam//@value, ' '))}"/>
						</valueReference>
					</extension>
				</xsl:for-each>
				<!-- auteur -->
				<!-- TODO specialisme en organisatie, nu aanname gedaan met onbehalfof voor organisatie -->
				<xsl:for-each select="./auteur[.//@value]">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Author">
						<xsl:choose>
							<xsl:when test="./auteur_is_zorgverlener[.//@value]">
								<valueReference id="#{$auteur-zorgverlener-id}">
									<display value="{normalize-space(string-join(./auteur_is_zorgverlener//*[not(ancestor-or-self::zorgaanbieder)]/@value, ' '))}"/>
								</valueReference>
							</xsl:when>
							<xsl:when test="./auteur_is_patient[@value = 'true']">
								<valueReference>
									<xsl:call-template name="patient-reference">
										<xsl:with-param name="patient" select="$patient"/>
									</xsl:call-template>
								</valueReference>
							</xsl:when>
						</xsl:choose>
					</extension>
				</xsl:for-each>
				<!-- auteur - zorgaanbieder -->
				<xsl:for-each select="$auteur-zorgverlener-za[.//@value]">
					<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Author-Onbehalfof">
						<valueReference id="#{$auteur-zorgverlener-za-id}">
							<display value="{normalize-space(string-join(.//@value, ' '))}"/>
						</valueReference>
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

				<!--      <!-\- stoptype -\->
            <xsl:for-each select="stoptype">
               <xsl:call-template name="zib-Medication-StopType">
                  <xsl:with-param name="stopType" select="."/>
               </xsl:call-template>
            </xsl:for-each>-->
				<!-- medicatiegebruik id -->
				<xsl:for-each select="./identificatie">
					<identifier>
						<xsl:call-template name="id-to-Identifier">
							<xsl:with-param name="in" select="."/>
						</xsl:call-template>
					</identifier>
				</xsl:for-each>
				<status value="active"/>
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
								<reference value="#{$product-id}"/>
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
									<xsl:with-param name="patient" select="$patient"/>
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
		<xd:param name="patient"/>
	</xd:doc>
	<xsl:template name="zib-problem-2.0">
		<xsl:param name="ada-probleem"/>
		<xsl:param name="condition-id"/>
		<xsl:param name="patient"/>
		<xsl:for-each select="$ada-probleem">
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
				<xsl:call-template name="patient-subject-reference">
					<xsl:with-param name="patient" select="$patient"/>
				</xsl:call-template>
			</Condition>
		</xsl:for-each>
	</xsl:template>
	<xd:doc>
		<xd:desc/>
		<xd:param name="product"/>
		<xd:param name="product-id"/>
	</xd:doc>
	<xsl:template name="zib-Product">
		<xsl:param name="product" as="element()?"/>
		<xsl:param name="product-id" as="xs:string?"/>
		<xsl:for-each select="$product">
			<Medication xmlns="http://hl7.org/fhir">
				<id value="{$product-id}"/>
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
