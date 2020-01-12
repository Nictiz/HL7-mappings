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
<xsl:stylesheet xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="../../../2_hl7_mp_include.xsl"/>
	
	<!-- variables for template ids -->
	<!-- Note that there is also a MA template 9185, but that is only used for proposal messages, which is not supported yet -->
<!--	<xsl:variable name="ma_templateId" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9148', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9202', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9216'"/>-->
	<xsl:variable name="ma_templateId" as="xs:string" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9216'"/>
	<xsl:variable name="ta_templateId" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9152', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9205', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9223'"/>
<!--	<xsl:variable name="gb_templateId" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9154', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9190', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9209', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9224'"/>-->
	<xsl:variable name="gb_templateId" as="xs:string" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9224'"/>
	<xsl:variable name="mbh_templateId" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9084'"/>
	
	<xsl:template name="make-schematron">
		<xsl:param name="pattern-id"/>
		<xsl:param name="data-string-medication-code"/>
		<xsl:param name="data-int-medication-code"/>
		<xsl:param name="medication-name"/>
		<xsl:param name="ada-instance-filename"/>
		<xsl:param name="checkpatient" as="xs:boolean" select="true()"/>
		<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
			<ns uri="urn:hl7-org:v3" prefix="hl7"/>
			<ns uri="urn:hl7-nl:v3" prefix="hl7nl"/>
			<ns uri="http://purl.oclc.org/dsdl/schematron" prefix="sch"/>
			<ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
			<ns uri="http://www.w3.org/XML/1998/namespace" prefix="xml"/>
			<pattern>
				<xsl:attribute name="id" select="$pattern-id"/>
				<let name="medicationCode">
					<xsl:attribute name="value" select="$data-string-medication-code"/>
				</let>
				<let name="medCodeNr">
					<xsl:attribute name="value" select="$data-int-medication-code"/>
				</let>
				<let name="naam" value="{$medication-name}"/>
				<xsl:if test="$checkpatient">
					<xsl:apply-templates select="doc($ada-instance-filename)//patient"/>
				</xsl:if>
				<xsl:for-each select="doc($ada-instance-filename)//data">
					<xsl:call-template name="data">
						<xsl:with-param name="data-int-medication-code" select="$data-int-medication-code"/>
					</xsl:call-template>
				</xsl:for-each>
			</pattern>
		</schema>
	</xsl:template>

	<xsl:template name="data">
		<xsl:param name="data-int-medication-code"/>
		<xsl:variable name="all-mas" select=".//medicatieafspraak"/>
		<xsl:variable name="all-gbs" select=".//medicatie_gebruik"/>
		<xsl:variable name="all-vvs" select=".//verstrekkingsverzoek"/>
		<!-- check the number of expected components -->
		<rule context="/">
			<!-- aantal medicatieafspraken -->
			<xsl:text>
</xsl:text>
			<xsl:comment>Aantal medicatieafspraken</xsl:comment>
			<let name="aantal-mas">
				<xsl:attribute name="value" select="count(.//medicatieafspraak)"/>
			</let>
			<let name="hl7-aantal-mas" value="count(.//hl7:substanceAdministration[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9216'])"/>
			<assert test="$aantal-mas = $hl7-aantal-mas">Het aantal verwachte medicatieafspraken in dit bericht is: <value-of select="$aantal-mas"/>. Aangetroffen zijn <value-of select="$hl7-aantal-mas"/> medicatieafspra(a)k(en).</assert>
			<let name="aantal-mas-pc">
				<xsl:attribute name="value" select="count(.//medicatieafspraak[.//product[product_code/@code]])"/>
			</let>
			<let name="hl7-aantal-mas-pc" value="count(.//hl7:substanceAdministration[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9216'][hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial//*[@code = $medCodeNr]])"/>
			<assert test="$aantal-mas-pc = $hl7-aantal-mas-pc">Het aantal verwachte medicatieafspraken met medicatie code in dit bericht is: <value-of select="$aantal-mas-pc"/>. Aangetroffen zijn <value-of select="$hl7-aantal-mas-pc"/> medicatieafspra(a)k(en) voor medicatie coderingen: <value-of select="$medCodeNr"/>.</assert>
			<xsl:comment>Aantal medicatiegebruik</xsl:comment>
			<let name="aantal-gbs">
				<xsl:attribute name="value" select="count(.//medicatie_gebruik)"/>
			</let>
			<let name="hl7-aantal-gbs" value="count(.//hl7:substanceAdministration[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9224'])"/>
			<assert test="$aantal-gbs = $hl7-aantal-gbs">Het aantal verwachte componenten medicatiegebruik in dit bericht is: <value-of select="$aantal-gbs"/>. Aangetroffen zijn <value-of select="$hl7-aantal-gbs"/> component(en) medicatiegebruik.</assert>
			<let name="aantal-gbs-pc">
				<xsl:attribute name="value" select="count(.//medicatie_gebruik[.//product[product_code/@code]])"/>
			</let>
			<let name="hl7-aantal-gbs-pc" value="count(.//hl7:substanceAdministration[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9224'][hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial//*[@code = $medCodeNr]])"/>
			<assert test="$aantal-gbs-pc = $hl7-aantal-gbs-pc">Het aantal verwachte componenten medicatiegebruik met een medicatie code in dit bericht is: <value-of select="$aantal-gbs-pc"/>. Aangetroffen zijn <value-of select="$hl7-aantal-gbs-pc"/> component(en) medicatiegebruik voor medicatie coderingen: <value-of select="$medCodeNr"/>.</assert>
			<xsl:comment>Aantal verstrekkingsverzoeken</xsl:comment>
			<let name="aantal-vvs">
				<xsl:attribute name="value" select="count(.//verstrekkingsverzoek)"/>
			</let>
			<let name="hl7-aantal-vvs" value="count(.//hl7:supply[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9231'])"/>
			<assert test="$aantal-vvs = $hl7-aantal-vvs">Het aantal verwachte verstrekkingsverzoeken in dit bericht is: <value-of select="$aantal-vvs"/>. Aangetroffen aantal: <value-of select="$hl7-aantal-vvs"/>.</assert>
			<xsl:for-each select="$all-mas">
				<xsl:variable name="current-ma" select="."/>
				<!-- call function to determine context -->
				<xsl:variable name="context" select="nf:bouwsteen-context($current-ma, $all-mas, $ma_templateId)"/>
				<assert>
					<xsl:attribute name="test" select="concat('count(', $context, ')=1')"/>
					<xsl:value-of select="concat('Er is precies 1 medicatieafspraak verwacht', ' die voldoet aan de volgende xpath: ', $context, '.')"/>
				</assert>
			</xsl:for-each>
			<xsl:for-each select="$all-gbs">
				<xsl:variable name="current-gb" select="."/>
				<!-- call function to determine context -->
				<xsl:variable name="context" select="nf:bouwsteen-context($current-gb, $all-gbs, $gb_templateId)"/>
				<assert>
					<xsl:attribute name="test" select="concat('count(', $context, ')=1')"/>
					<xsl:value-of select="concat('Er is precies 1 medicatiegebruik verwacht', ' die voldoet aan de volgende xpath: ', $context, '.')"/>
				</assert>
			</xsl:for-each>
			<xsl:for-each select="$all-vvs">
				<xsl:variable name="current-vv" select="."/>
				<!-- call function to determine context -->
				<xsl:variable name="context" select="nf:vv-context($current-vv, $all-vvs)"/>
				<assert>
					<xsl:attribute name="test" select="concat('count(', $context, ')=1')"/>
					<xsl:value-of select="concat('Er is precies 1 verstrekkingsverzoek verwacht', ' die voldoet aan de volgende xpath: ', $context, '.')"/>
				</assert>
			</xsl:for-each>
		</rule>
		<xsl:for-each select="$all-mas">
			<xsl:variable name="current-ma" select="."/>
			<xsl:variable name="context" select="nf:bouwsteen-context($current-ma, $all-mas, $ma_templateId)"/>
			<xsl:call-template name="medicatieafspraak">
				<xsl:with-param name="context-ma" select="$context"/>
				<xsl:with-param name="data-int-medication-code" select="$data-int-medication-code"/>
			</xsl:call-template>
		</xsl:for-each>
		<xsl:for-each select="$all-vvs">
			<xsl:variable name="current-vv" select="."/>
			<xsl:variable name="context" select="nf:vv-context($current-vv, $all-vvs)"/>
			<xsl:call-template name="verstrekkingsverzoek">
				<xsl:with-param name="context-vv" select="$context"/>
				<xsl:with-param name="data-int-medication-code" select="$data-int-medication-code"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="patient">
		<xsl:variable name="include-patient-sch" select="concat('include/mp9-patient-', ./patient_identificatienummer[@root = '2.16.840.1.113883.2.4.6.3']/@value, '.sch')"/>
		<include href="{$include-patient-sch}"/>
	</xsl:template>
	<!-- medicatieafspraak -->
	<xsl:template name="medicatieafspraak">
		<xsl:param name="context-ma"/>
		<xsl:param name="data-int-medication-code"/>

		<xsl:variable name="all-doseringen" select=".//dosering"/>
		<xsl:variable name="naam" select=".//product/product_code/@displayName"/>
		<xsl:element name="rule">
			<xsl:attribute name="context" select="$context-ma"/>
			<let name="displayName" value="(./hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial//*[@code = $medCodeNr]/@displayName)[1]"/>
			<assert xmlns:sch="http://purl.oclc.org/dsdl/schematron" role="warning" test="contains(upper-case($displayName), upper-case('{$naam}'))">
				<xsl:value-of disable-output-escaping="yes" select="concat('Verwacht is dat de naam (displayName) ', $naam, ' bevat. Gevonden: ''&lt;value-of select=&quot;$displayName&quot;/&gt;''.')"/>
			</assert>
			<xsl:comment>De waarden in voor 'normale' voorschriften: hoeveelheid, codes, dosering, dosering frequentie
             medicatieafspraak 2 maal daags 1 stuk, oraal, start T voor 5 dagen</xsl:comment>
			<xsl:comment>Aantal doseerinstructies</xsl:comment>
			<let name="aantal-toedieningsinstr">
				<xsl:attribute name="value" select="count(.//doseerinstructie/dosering)"/>
			</let>
			<let name="doseerinstructie-subsAdm" value=".//hl7:substanceAdministration[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9149']"/>
			<assert role="error" test="count($doseerinstructie-subsAdm) = $aantal-toedieningsinstr">Verwacht zijn <value-of select="$aantal-toedieningsinstr"/> doseerinstructies (substanceAdministration voor doseerinformatie) voor <value-of select="$naam"/>. Gevonden: <value-of select="count($doseerinstructie-subsAdm)"/></assert>
			<xsl:comment>Gebruiksperiode</xsl:comment>
			<let name="IVL_TS" value="./hl7:effectiveTime[local-name-from-QName(resolve-QName(@xsi:type, .)) = 'IVL_TS']"/>

			<!-- TODO determine logic for test cases with fixed start date -->
			<xsl:if test="boolean(false())">
				<xsl:for-each select="./gebruiksperiode_start[@value]">
					<xsl:variable name="gebruiksperiode-start-hl7date-temp">
						<xsl:call-template name="format2HL7Date">
							<xsl:with-param name="dateTime" select="./@value"/>
						</xsl:call-template>
					</xsl:variable>
					<let name="gebruiksperiode-start-hl7date">
						<xsl:attribute name="value" select="nf:concat2string(substring($gebruiksperiode-start-hl7date-temp, 1, 8))"/>
					</let>
					<assert role="error" test="substring($IVL_TS/hl7:low/@value, 1, 8) = $gebruiksperiode-start-hl7date">De startdatum gebruiksperiode bij <value-of select="$naam"/> is onjuist. Verwacht is: <value-of select="$gebruiksperiode-start-hl7date"/>, aangetroffen: <value-of select="substring($IVL_TS/hl7:low/@value, 1, 8)"/>.</assert>
				</xsl:for-each>
			</xsl:if>
			<xsl:for-each select="./gebruiksperiode_start[@value]">
				<assert role="error" test="$IVL_TS/hl7:low/@value">De startdatum gebruiksperiode bij <value-of select="$naam"/> ontbreekt. Er is wel een startdatum verwacht.</assert>
			</xsl:for-each>
			<xsl:if test="not(./gebruiksperiode_start[@value])">
				<!-- geen startdatum gebruik in ada, dan ook - in principe - geen low in hl7 -->
				<assert role="warning" test="not($IVL_TS/hl7:low/@value)">Er is een startdatum gebruik (low/@value: <value-of select="$IVL_TS/hl7:low/@value"/>) aangetroffen bij <value-of select="$naam"/>. Dit is niet verwacht. Als het opgeven van een startdatum echter verplicht is in de zendende applicatie, dan is het wel toegestaan tóch een startdatum mee te geven.</assert>
			</xsl:if>
			<xsl:for-each select="./gebruiksperiode[@value]">
				<!-- TODO, gebruiksperiode kan op twee manieren: met low/high of met low/width -->
				<let name="gebruiksduur">
					<xsl:attribute name="value" select="./@value"/>
				</let>
				<let name="gebruiksduur-eenheid">
					<xsl:attribute name="value" select="nf:concat2string(nf:convertTime_ADA_unit2UCUM(./@unit))"/>
				</let>
				<let name="gebruiksduur-in-dagen">
					<xsl:attribute name="value" select="nf:calculate_Duur_In_Dagen(./@value, nf:convertTime_ADA_unit2UCUM(./@unit))"/>
				</let>
				<assert role="error" test="$IVL_TS/hl7:width[(@value = $gebruiksduur and @unit = $gebruiksduur-eenheid) or (@value = $gebruiksduur-in-dagen and @unit = 'd')]">Bij <value-of select="$naam"/> is de juiste gebruiksperiode <value-of select="$gebruiksduur"/>
					<value-of select="$gebruiksduur-eenheid"/> (aangetroffen: <value-of select="$IVL_TS/hl7:width/@value"/>
					<value-of select="$IVL_TS/hl7:width/@unit"/> ).</assert>
			</xsl:for-each>
			<xsl:if test="not(./gebruiksperiode[@value]) and not(./gebruiksperiode_eind[@value])">
				<!-- geen gebruiksperiode in ada, dan ook geen width/high in hl7 -->
				<assert role="error" test="not($IVL_TS/hl7:width/@value)">Er is een gebruiksperiode (width/@value) aangetroffen bij <value-of select="$naam"/>. Dit is niet verwacht (doorlopende medicatie).</assert>
				<assert role="error" test="not($IVL_TS/hl7:high/@value)">Er is een einddatum gebruik (high/@value) aangetroffen bij <value-of select="$naam"/>. Dit is niet verwacht (doorlopende medicatie).</assert>
			</xsl:if>
			<!-- TODO determine logic for test cases with fixed end date -->
			<xsl:if test="boolean(false())">
				<xsl:for-each select="./gebruiksperiode_eind[@value]">
					<xsl:variable name="gebruiksperiode-einde-hl7date-temp">
						<xsl:call-template name="format2HL7Date">
							<xsl:with-param name="dateTime" select="./@value"/>
						</xsl:call-template>
					</xsl:variable>
					<let name="gebruiksperiode-einde-hl7date">
						<xsl:attribute name="value" select="nf:concat2string(substring($gebruiksperiode-einde-hl7date-temp, 1, 12))"/>
					</let>
					<assert role="error" test="substring($IVL_TS/hl7:high/@value, 1, 12) = $gebruiksperiode-einde-hl7date">De startdatum gebruiksperiode bij <value-of select="$naam"/> is onjuist. Verwacht is: <value-of select="$gebruiksperiode-einde-hl7date"/>, aangetroffen: <value-of select="substring($IVL_TS/hl7:high/@value, 1, 12)"/>.</assert>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="not(./gebruiksperiode_eind[@value])">
				<!-- geen einddatum gebruik in ada, dan ook geen high in hl7 -->
				<assert role="warning" test="not($IVL_TS/hl7:high/@value)">Er is een einddatum gebruik (high/@value: <value-of select="$IVL_TS/hl7:high/@value"/>) aangetroffen bij <value-of select="$naam"/>. Dit is niet verwacht.</assert>
			</xsl:if>
			<xsl:comment>Toedieningsweg</xsl:comment>
			<let name="hl7-coded-element" value="./hl7:routeCode"/>
			<xsl:for-each select="./gebruiksinstructie/toedieningsweg[@code]">
				<xsl:call-template name="coded-element"/>
				<assert role="error" test="count($hl7-coded-element[@codeSystem = $element-codeSystem and @code = $element-code]) >= 1">Bij <value-of select="$naam"/> is verwacht een toedieningsweg met code: <value-of select="concat($element-code, ', en codeSystem: ', $element-codeSystem)"/>. Aangetroffen is <value-of select="concat('code: ', $hl7-coded-element/@code, ', en codeSystem: ', $hl7-coded-element/@codeSystem, '.')"/></assert>
				<assert role="warning" test="contains(upper-case($hl7-coded-element/@displayName), upper-case($element-displayName))">Verwacht is dat de naam (displayName) van de toedieningsweg '<value-of select="$element-displayName"/>' bevat. Gevonden: '<value-of select="$hl7-coded-element/@displayName"/>'.</assert>
			</xsl:for-each>
			<xsl:comment>Stoptype</xsl:comment>
			<let name="hl7-stoptype" value="./hl7:entryRelationship/hl7:observation[hl7:code/(@code='1' and @codeSystem='2.16.840.1.113883.2.4.3.11.60.20.77.5.2')]/hl7:value "/>
			<xsl:for-each select="./stoptype[@code]">
				<!-- TODO add support for nullFlavor -->
				<let name="stoptype-code">
					<xsl:attribute name="value" select="nf:concat2string(./@code)"/>
				</let>
				<let name="stoptype-codeSystem">
					<xsl:attribute name="value" select="nf:concat2string(./@codeSystem)"/>
				</let>
				<assert role="error" test="count($hl7-stoptype[@codeSystem = $stoptype-codeSystem and @code = $stoptype-code]) >= 1">Bij <value-of select="$naam"/> is verwacht een stoptype met code: <value-of select="concat($stoptype-code, ', en codeSystem: ', $stoptype-codeSystem)"/>. Aangetroffen is <value-of select="concat('code: ', $hl7-stoptype/@code, ', en codeSystem: ', $hl7-stoptype/@codeSystem, '.')"/></assert>
			</xsl:for-each>
			<xsl:comment>Reden afspraak</xsl:comment>
			<let name="hl7-coded-element" value="./hl7:entryRelationship/hl7:observation[hl7:code/(@code='2' and @codeSystem='2.16.840.1.113883.2.4.3.11.60.20.77.5.2')]/hl7:value"/>
			<!-- geen controle op reden 'starten medicamenteuze behandeling' code 266709005 -->
			<xsl:for-each select="./reden_afspraak[@code and not(@code = '266709005')]">
				<xsl:call-template name="coded-element"/>
				<assert role="error" test="count($hl7-coded-element[@codeSystem = $element-codeSystem and @code = $element-code]) >= 1">Bij <value-of select="$naam"/> is verwacht een reden afspraak met code: <value-of select="concat($element-code, ', en codeSystem: ', $element-codeSystem)"/>. Aangetroffen is <value-of select="concat('code: ', $hl7-coded-element/@code, ', en codeSystem: ', $hl7-coded-element/@codeSystem, '.')"/></assert>
				<assert role="warning" test="contains(upper-case($hl7-coded-element/@displayName), upper-case($element-displayName))">Verwacht is dat de naam (displayName) van de reden afspraak '<value-of select="$element-displayName"/>' bevat. Gevonden: '<value-of select="$hl7-coded-element/@displayName"/>'.</assert>
			</xsl:for-each>
			<!-- gebruiksinstructie -->
			<xsl:comment>Checks for numbers of gebruiksinstructie in the right context</xsl:comment>
			<xsl:for-each select="$all-doseringen">
				<xsl:variable name="current-dosering" select="."/>
				<!-- call function to determine context -->
				<xsl:variable name="context" select="concat($context-ma, nf:dosering-context($current-dosering, $all-doseringen))"/>
				<assert>
					<xsl:attribute name="test" select="concat('count(', $context, ')=1')"/>
					<xsl:value-of select="concat('Er is precies 1 doseerinstructie verwacht', ' die voldoet aan de volgende xpath: ', $context, '. Daarbij geldt $medCodeNr = ', $data-int-medication-code)"/>
				</assert>
			</xsl:for-each>
		</xsl:element>

		<xsl:for-each select="$all-doseringen">
			<xsl:variable name="current-dosering" select="."/>
			<!-- call function to determine context -->
			<xsl:variable name="context" select="concat($context-ma, nf:dosering-context($current-dosering, $all-doseringen))"/>
			<xsl:call-template name="dosering">
				<xsl:with-param name="context" select="$context"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<!-- doseerinstructie -->
	<xsl:template name="dosering">
		<xsl:param name="context"/>

		<xsl:variable name="current-dosering" select="."/>

		<rule>
			<xsl:attribute name="context" select="$context"/>
			<!-- todo juiste hl7 mappen bij meerdere doseerinstructies / doseringen -->
			<xsl:text>
</xsl:text>
			<xsl:comment>Keerdosis</xsl:comment>
			<xsl:for-each select="$current-dosering/keerdosis">
				<let name="dosering-eenheid">
					<xsl:attribute name="value" select="nf:concat2string(nf:convertGstdBasiseenheid2UCUM(./eenheid/@code))"/>
				</let>
				<!-- TODO: support for min/max -->
				<let name="dosering">
					<xsl:attribute name="value" select="./aantal/vaste_waarde/@value"/>
				</let>
				<let name="dosering-vertaling-code">
					<xsl:attribute name="value" select="nf:concat2string(./eenheid/@code)"/>
				</let>
				<let name="dosering-vertaling-value" value="$dosering"/>
				<let name="doseQuantity" value="./hl7:doseQuantity/hl7:center"/>
				<assert xmlns:sch="http://purl.oclc.org/dsdl/schematron" role="error" test="count($doseQuantity[@value = $dosering][(($dosering-eenheid = '1' and (not(exists($doseQuantity/@unit)) or $doseQuantity/@unit = '1')) or @unit = $dosering-eenheid)]) >= 1">Bij <value-of select="$naam"/> moet er (bij xml element <value-of select="$doseQuantity/parent::node()/local-name()"/>/<value-of select="$doseQuantity/local-name()"/>) minimaal één value van '<value-of select="$dosering"/>' met unit '<value-of select="$dosering-eenheid"/>' zijn. Gevonden: '<value-of select="$doseQuantity/@value"/>' met unit '<value-of select="$doseQuantity/@unit"/>'.</assert>
				<assert xmlns:sch="http://purl.oclc.org/dsdl/schematron" role="error" test="count($doseQuantity/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2'][@value = $dosering and @code = $dosering-vertaling-code]) >= 1">Bij <value-of select="$naam"/> moet er bij (bij xml element <value-of select="$doseQuantity/parent::node()/local-name()"/>/<value-of select="$doseQuantity/local-name()"/>) die waarde <value-of select="$dosering"/> met unit <value-of select="$dosering-eenheid"/> heeft, minimaal één doseringsvertaling met waarde <value-of select="$dosering"/> en code <value-of select="$dosering-vertaling-code"/> zijn (gevonden: waarde '<value-of select="$doseQuantity/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']/@value"/>' met code '<value-of select="$doseQuantity/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']/@code"/>')</assert>
			</xsl:for-each>

			<xsl:for-each select="$current-dosering/toedieningsschema[not(dagdeel[@code])]/frequentie[.//@value]">
				<xsl:comment>Frequentie zonder dagdeel</xsl:comment>
				<!-- TODO: ondersteuning voor variabele frequentie -->
				<let name="dosering-frequentie-eenheid-value">
					<xsl:attribute name="value" select="./tijdseenheid/@value"/>
				</let>
				<let name="dosering-frequentie-eenheid">
					<xsl:attribute name="value" select="nf:concat2string(nf:convertTime_ADA_unit2UCUM(./tijdseenheid/@unit))"/>
				</let>
				<let name="frequency" value="./hl7:effectiveTime/hl7nl:frequency"/>
				<xsl:for-each select="./aantal/vaste_waarde[@value]">
					<let name="dosering-frequentie-aantal-vast">
						<xsl:attribute name="value" select="nf:concat2string(./@value)"/>
					</let>
					<assert role="error" test="$frequency/hl7nl:numerator/@value = $dosering-frequentie-aantal-vast">Vaste doseer frequentie van <value-of select="$naam"/> moet <value-of select="$dosering-frequentie-aantal-vast"/> zijn (gevonden: '<value-of select="$frequency/hl7nl:numerator/@value"/>').</assert>
					<assert xmlns:sch="http://purl.oclc.org/dsdl/schematron" role="error" test="$frequency/hl7nl:denominator/@value = $dosering-frequentie-eenheid-value and $frequency/hl7nl:denominator/@unit = $dosering-frequentie-eenheid">Frequentie eenheid van <value-of select="$naam"/> moet '<value-of select="$dosering-frequentie-eenheid-value"/>
						<value-of select="$dosering-frequentie-eenheid"/>' zijn (gevonden: '<value-of select="concat($frequency/hl7nl:denominator/@value, ' ', $frequency/hl7nl:denominator/@unit)"/>').</assert>

				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$current-dosering/toedieningsschema/dagdeel[@code]">
				<xsl:comment>Dagdeel</xsl:comment>
				<!-- 's nachts -->
				<xsl:choose>
					<xsl:when test="./@code = '2546009'">
						<xsl:variable name="context-nacht" select="'./*[@alignment=''HD''][hl7nl:phase/hl7nl:low[substring(@value, 1, 10)=''1970010100'']]'"/>
						<xsl:comment>'s nachts</xsl:comment>
						<assert>
							<xsl:attribute name="test" select="concat('count(', $context-nacht, ')=1')"/> Bij de doseerinstructie(s) van <value-of select="$naam"/> is 1 dagdeel 's nachts verwacht</assert>
						<xsl:choose>
							<xsl:when test="./../frequentie[tijdseenheid[@value and @unit]]/aantal/vaste_waarde[@value]">
								<xsl:variable name="period-value" select="format-number(xs:integer(./../frequentie/tijdseenheid/@value) div xs:integer(./../frequentie/aantal/vaste_waarde/@value), '0.####')"/>
								<xsl:variable name="period-unit" select="nf:convertTime_ADA_unit2UCUM(./../frequentie/tijdseenheid/@unit)"/>
								<assert>
									<xsl:attribute name="test" select="concat('count(', $context-nacht, ')!=1', ' or (', concat('count(', $context-nacht, ')=1'), ' and ', concat('count(', $context-nacht, '/hl7nl:period[@value=''', $period-value, '''][@unit=''', $period-unit, '''])=1)'))"/> Bij de doseerinstructie(s) van <value-of select="$naam"/> met dagdeel 's nachts is een verkeerd doseerinterval aangetroffen (period).</assert>
							</xsl:when>
							<xsl:otherwise>
								<assert>
									<xsl:attribute name="test" select="concat('count(', $context-nacht, ')!=1', ' or (', concat('count(', $context-nacht, ')=1'), ' and ', concat('count(', $context-nacht, '/hl7nl:period[@value=''1''][@unit=''d''])=1)'))"/> Bij de doseerinstructie(s) van <value-of select="$naam"/> met dagdeel 's nachts is een doseerinterval van 1 dag verwacht (period).</assert>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<assert>
							<xsl:attribute name="test" select="'false()'"/> Andere dagdelen dan 's nachts nog niet ondersteund door de schematron generatie </assert>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:comment>Zo nodig</xsl:comment>
			<let name="precondition-code" value="./hl7:precondition/hl7:criterion/hl7:code"/>
			<xsl:for-each select="$current-dosering/zo_nodig/criterium/code[@value]">
				<let name="preconditie-code">
					<xsl:attribute name="value" select="nf:concat2string(./@code)"/>
				</let>
				<let name="preconditie-codesystem">
					<xsl:attribute name="value" select="nf:concat2string(./@codeSystem)"/>
				</let>
				<xsl:choose>
					<xsl:when test="./@codeSystem = '2.16.840.1.113883.5.1008'">
						<assert role="error" test="$precondition-code/(@nullFlavor = $preconditie-code)">Preconditie nullFlavor van <value-of select="$naam"/> moet <value-of select="$preconditie-code"/> zijn (gevonden: '<value-of select="$precondition-code/@nullFlavor"/>'.</assert>
						<let name="originalText">
							<xsl:attribute name="value" select="nf:concat2string(./@originalText)"/>
						</let>
						<assert role="warning" test="contains(upper-case($precondition-code/hl7:originalText/text()), upper-case($originalText))">Verwacht is dat de omschrijving (originalText) van de preconditie '<value-of select="$originalText"/>' bevat. Gevonden: '<value-of select="$precondition-code/hl7:originalText/text()"/>'.</assert>
					</xsl:when>
					<xsl:otherwise>
						<assert role="error" test="$precondition-code/((@code = $preconditie-code and @codeSystem = $preconditie-codesystem) or @nullFlavor)">Preconditie code van <value-of select="$naam"/> moet <value-of select="$preconditie-code"/> met codeSystem '<value-of select="$preconditie-codesystem"/>' zijn (gevonden: '<value-of select="$precondition-code/@code"/>' met code systeem: '<value-of select="$precondition-code/@codeSystem"/>').</assert>
						<let name="displayName" value="'bij een aanval'">
							<xsl:attribute name="value" select="nf:concat2string(./@displayName)"/>
						</let>
						<assert role="warning" test="contains(upper-case($precondition-code/@displayName), upper-case($displayName))">Verwacht is dat de naam (displayName) van de preconditie '<value-of select="$displayName"/>' bevat. Gevonden: '<value-of select="$precondition-code/@displayName"/>'.</assert>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</rule>
	</xsl:template>

	<!-- verstrekkingsverzoek -->
	<xsl:template name="verstrekkingsverzoek">
		<xsl:param name="data-int-medication-code"/>
		<xsl:param name="context-vv"/>
		<rule>
			<xsl:attribute name="context" select="$context-vv"/>
			<xsl:text>
</xsl:text>
			<xsl:comment>Te verstrekken hoeveelheid</xsl:comment>
			<let name="hl7-verstrekkingsverzoek" value="."/>
			<let name="quantity" value="$hl7-verstrekkingsverzoek/hl7:quantity"/>
			<xsl:for-each select="./te_verstrekken_hoeveelheid[aantal/@value]">
				<let name="hoeveelheid">
					<xsl:attribute name="value" select="./aantal/@value"/>
				</let>
				<let name="hoeveelheid-eenheid">
					<xsl:attribute name="value" select="nf:concat2string(nf:convertGstdBasiseenheid2UCUM(./eenheid/@code))"/>
				</let>
				<let name="hoeveelheid-vertaling-code">
					<xsl:attribute name="value" select="nf:concat2string(./eenheid/@code)"/>
				</let>
				<let name="hoeveelheid-vertaling-value" value="$hoeveelheid"/>
				<assert xmlns:sch="http://purl.oclc.org/dsdl/schematron" role="error" test="number($quantity/@value) = $hoeveelheid">De te verstrekken hoeveelheid <value-of select="$naam"/> moet <value-of select="$hoeveelheid"/> zijn. Gevonden: '<value-of select="$quantity/@value"/>'.</assert>
				<assert xmlns:sch="http://purl.oclc.org/dsdl/schematron" role="error" test="($hoeveelheid-eenheid = '1' and (not(exists($quantity/@unit)) or $quantity/@unit = '1')) or $quantity/@unit = $hoeveelheid-eenheid">De te verstrekken hoeveelheid <value-of select="$naam"/> moet eenheid <value-of select="$hoeveelheid-eenheid"/> hebben. Gevonden: '<value-of select="$quantity/@unit"/>'.</assert>
				<assert xmlns:sch="http://purl.oclc.org/dsdl/schematron" role="error" test="$quantity/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']/@code = $hoeveelheid-vertaling-code">Vertaling van de te verstrekken hoeveelheid van <value-of select="$naam"/> moet code <value-of select="$hoeveelheid-vertaling-code"/> zijn. Gevonden: '<value-of select="$quantity/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']/@code"/>'.</assert>
				<include href="include/hoeveelheid-vertaling-value.sch"/>
				<assert xmlns:sch="http://purl.oclc.org/dsdl/schematron" role="error" test="number($quantity/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']/@value) = $hoeveelheid-vertaling-value">Vertaling van de te verstrekken hoeveelheid van <value-of select="$naam"/> moet waarde <value-of select="$hoeveelheid-vertaling-value"/> zijn. Gevonden: '<value-of select="$quantity/hl7:translation[@codeSystem = '2.16.840.1.113883.2.4.4.1.900.2']/@value"/>'.</assert>
			</xsl:for-each>
			<xsl:comment>Geneesmiddel displayName</xsl:comment>
			<let name="displayName" value="($hl7-verstrekkingsverzoek/hl7:product/hl7:manufacturedProduct/hl7:manufacturedMaterial//*[@code = $medCodeNr]/@displayName)[1]"/>
			<assert xmlns:sch="http://purl.oclc.org/dsdl/schematron" role="warning" test="contains(upper-case($displayName), upper-case($naam))">Verwacht is dat de naam (displayName) '<value-of select="$naam"/>' bevat. Gevonden: '<value-of select="$displayName"/>'.</assert>
		</rule>
	</xsl:template>

	<!-- helper templates -->
	<xsl:template name="coded-element">
		<!-- TODO add support for nullFlavor -->
		<let name="element-code">
			<xsl:attribute name="value" select="nf:concat2string(./@code)"/>
		</let>
		<let name="element-codeSystem">
			<xsl:attribute name="value" select="nf:concat2string(./@codeSystem)"/>
		</let>
		<let name="element-displayName">
			<xsl:attribute name="value" select="nf:concat2string(./@displayName)"/>
		</let>
	</xsl:template>
	<!-- helper functions -->
	<xsl:function name="nf:concat2string" as="xs:string?">
		<xsl:param name="value" as="xs:string?"/>
		<xsl:value-of select="concat('''', $value, '''')"/>
	</xsl:function>
	<xsl:function name="nf:dosering-context">
		<xsl:param name="current-dosering"/>
		<xsl:param name="all-doseringen-in-ma"/>

		<xsl:variable name="base-append-context" select="'/hl7:entryRelationship/hl7:substanceAdministration[hl7:templateId/@root=''2.16.840.1.113883.2.4.3.11.60.20.77.10.9149'']'"/>

		<xsl:variable name="current-keerdosis" select="$current-dosering/keerdosis/aantal"/>
		<xsl:variable name="append-vaste-keerdosis" select="concat('[hl7:doseQuantity/hl7:center[@value=', $current-keerdosis/vaste_waarde/@value, ']]')"/>
		<xsl:variable name="current-frequentie" select="$current-dosering/toedieningsschema/frequentie/aantal"/>
		<xsl:variable name="append-vaste-frequentie" select="concat('[hl7:effectiveTime/hl7nl:frequency/hl7nl:numerator[@value=''', $current-frequentie/vaste_waarde/@value, ''']]')"/>
		<xsl:variable name="append-dagdeel" select="'[.//*[@alignment=''HD'']]'"/>


		<xsl:variable name="append-2-context">
			<!-- TODO uitbreiden met mogelijkheden -->
			<xsl:choose>
				<!-- is er één doseerinstructie ? -->
				<xsl:when test="count($all-doseringen-in-ma) = 1">
					<!-- alleen de basis context naar deze ene doseerinstructie nodig -->
				</xsl:when>
				<!-- is het bestaan van een dagdeel in dosering uniek? -->
				<xsl:when test="count($all-doseringen-in-ma[toedieningsschema/dagdeel[@code]]) = 1 and $current-dosering/toedieningsschema/dagdeel[@code]">
					<xsl:value-of select="$append-dagdeel"/>
				</xsl:when>
				<!-- is vaste doseerhoeveelheid uniek ? -->
				<xsl:when test="count($all-doseringen-in-ma[keerdosis/aantal/vaste_waarde[@value = $current-keerdosis/vaste_waarde/@value]]) = 1">
					<xsl:value-of select="$append-vaste-keerdosis"/>
				</xsl:when>
				<!-- is vaste frequentie uniek? -->
				<!-- tricky, 7d mogen ook als 1 wk in de instance... -->
				<xsl:when test="count($all-doseringen-in-ma[toedieningsschema/frequentie/aantal/vaste_waarde[@value = $current-dosering/toedieningsschema/frequentie/aantal/vaste_waarde/@value]]) = 1">
					<xsl:value-of select="$append-vaste-frequentie"/>
				</xsl:when>
				<xsl:otherwise>['ERROR: could not determine appropriate context for a dosering in doseerinstructie with sequence number <xsl:value-of select="$current-dosering/../volgnummer/@value"/> in MA with id <xsl:value-of select="$current-dosering/../../../identificatie/@value"/>']</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:value-of select="concat($base-append-context, $append-2-context)"/>
	</xsl:function>
	<xsl:function name="nf:bouwsteen-context" as="xs:string?">
		<xsl:param name="current_bouwsteen"/>
		<xsl:param name="all_bouwstenen"/>
		<xsl:param name="bouwsteen_templateId" as="xs:string+"/>
		<xsl:variable name="current_medCode" select="$current_bouwsteen/*/product/product_code/@code" as="xs:string*"/>
		<xsl:variable name="current_medName" select="$current_bouwsteen/*/product/product_specificatie/product_naam/@value"/>

		<xsl:variable name="all-bouwstenen-4-basecontext">
			<xsl:choose>
				<xsl:when test="$current_medCode">
					<xsl:sequence  select="$all_bouwstenen[*/product/product_code/@code = $current_medCode]"/>
				</xsl:when>
				<xsl:when test="not($current_medCode) and count($all_bouwstenen[not(*/product/product_code/@code)]) = 1">
					<xsl:sequence select="$all_bouwstenen[not(*/product/product_code/@code)]"/>
				</xsl:when>
				<xsl:when test="$current_medName">
					<xsl:sequence select="$all_bouwstenen[*/product/product_specificatie/product_naam/@value = $current_medName]"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="base-context">
			<xsl:choose>
				<xsl:when test="$current_medCode">
					<xsl:sequence select="concat('//hl7:substanceAdministration[hl7:templateId/@root=''', $bouwsteen_templateId,'''][hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial//*/@code = ''', string-join($current_medCode, ''','''), ''']')"/>
				</xsl:when>
				<xsl:when test="not($current_medCode) and count($all_bouwstenen[not(*/product/product_code/@code)]) = 1">
					<xsl:value-of select="concat('//hl7:substanceAdministration[hl7:templateId/@root=''', $bouwsteen_templateId,'''][not(hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code/@code)]')"/>
				</xsl:when>
				<xsl:when test="$current_medName">
					<xsl:value-of select="concat('//hl7:substanceAdministration[hl7:templateId/@root=''', $bouwsteen_templateId,'''][hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/name/text() = ', $current_medName, ']')"/>
					</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="append-stoptype" select="'hl7:entryRelationship/hl7:observation/hl7:code[@code=''1''][@codeSystem=''2.16.840.1.113883.2.4.3.11.60.20.77.5.2'']'"/>
		<xsl:variable name="current-vaste-keerdosis" select="$current_bouwsteen//keerdosis/aantal/vaste_waarde[@value]"/>
		<xsl:variable name="append-vaste-keerdosis" select="concat('hl7:entryRelationship/hl7:substanceAdministration[hl7:templateId/@root=''2.16.840.1.113883.2.4.3.11.60.20.77.10.9149''][hl7:doseQuantity/hl7:center[@value= ''', $current-vaste-keerdosis[1]/@value, ''']]')"/>
		<xsl:variable name="current-vaste-frequentie" select="$current_bouwsteen//frequentie/aantal/vaste_waarde[@value]"/>
		<xsl:variable name="append-vaste-frequentie" select="concat('hl7:entryRelationship/hl7:substanceAdministration[hl7:templateId/@root=''2.16.840.1.113883.2.4.3.11.60.20.77.10.9149''][hl7:effectiveTime/hl7nl:frequency/hl7nl:numerator[@value= ''', $current-vaste-frequentie[1]/@value, ''']]')"/>
		<xsl:variable name="current-stoptype" select="$current_bouwsteen/stoptype"/>
		<xsl:variable name="append-stoptype" select="'hl7:entryRelationship/hl7:observation[hl7:code[@code=''1''][@codeSystem=''2.16.840.1.113883.2.4.3.11.60.20.77.5.2'']]'"/>
		<xsl:variable name="current-reden-afspraak" select="$current_bouwsteen/reden_afspraak"/>
		<xsl:variable name="append-reden-afspraak" select="'hl7:entryRelationship/hl7:observation[hl7:code[@code=''2''][@codeSystem=''2.16.840.1.113883.2.4.3.11.60.20.77.5.2'']]'"/>
		<xsl:variable name="append-2-context">
			<xsl:choose>
				<!-- is er één MA met de base context? dan hoeven we niets toe te voegen-->
				<xsl:when test="count($all-bouwstenen-4-basecontext/*) = 1"/>
				<!-- aanwezigheid stoptype uniek? -->
				<xsl:when test="$current-stoptype/@code and count($all-bouwstenen-4-basecontext/*[stoptype/@code]) = 1">
					<xsl:value-of select="concat('[', $append-stoptype, ']')"/>
				</xsl:when>
				<!-- afwezigheid stoptype uniek? -->
				<xsl:when test="not($current-stoptype/@code) and count($all-bouwstenen-4-basecontext/*[not(stoptype/@code)]) = 1">
					<xsl:value-of select="concat('[not(', $append-stoptype, ')]')"/>
				</xsl:when>
				<!-- is het stoptype uniek? -->
				<xsl:when test="exists($current-stoptype/@code) and count($all-bouwstenen-4-basecontext/*[stoptype/@code = $current-stoptype/@code]) = 1">
					<xsl:value-of select="concat('[', $append-stoptype, '/hl7:value/@code = ''', $current-stoptype/@code, ''']')"/>
				</xsl:when>
				<!-- is de vaste keerdosis uniek? -->
				<xsl:when test="count($all-bouwstenen-4-basecontext/*[.//keerdosis/aantal/vaste_waarde/@value = $current-vaste-keerdosis/@value]) = 1">
					<xsl:value-of select="concat('[', $append-vaste-keerdosis, ']')"/>
				</xsl:when>
				<!-- afwezigheid stoptype in combinatie met vaste keerdosis? -->
				<xsl:when test="not($current_bouwsteen/stoptype/@code) and count($all-bouwstenen-4-basecontext/*[not(stoptype/@code)][.//keerdosis/aantal/vaste_waarde[@value = $current-vaste-keerdosis/@value]]) = 1">
					<xsl:value-of select="concat('[not(', $append-stoptype, ')]', '[', $append-vaste-keerdosis, ']')"/>
				</xsl:when>
				<!-- frequentie uniek? -->
				<xsl:when test="count($all-bouwstenen-4-basecontext/*[.//frequentie/aantal/vaste_waarde/@value = $current-vaste-frequentie/@value]) = 1">
					<xsl:value-of select="concat('[', $append-vaste-frequentie, ']')"/>
				</xsl:when>
				<!-- afwezigheid reden afspraak uniek? -->
				<xsl:when test="not($current-reden-afspraak/@code) and count($all-bouwstenen-4-basecontext/*[not(current-afspraak/@code)]) = 1">
					<xsl:value-of select="concat('[not(', $append-reden-afspraak, ')]')"/>
				</xsl:when>
				<!-- afwezigheid reden afspraak in combinatie met afwezigheid stoptype uniek? -->
				<xsl:when test="not($current-reden-afspraak/@code) and not($current_bouwsteen/stoptype/@code) and count($all-bouwstenen-4-basecontext/*[not(stoptype/@code)][not(reden_afspraak/@code)]) = 1">
					<xsl:value-of select="concat('[not(', $append-reden-afspraak, ')]', '[not(', $append-stoptype, ')]')"/>
				</xsl:when>
				<!-- reden afspraak uniek? -->
				<xsl:when test="exists($current-reden-afspraak/@code) and count($all-bouwstenen-4-basecontext/*[(current-afspraak/@code) = $current-reden-afspraak/@code]) = 1">
					<xsl:value-of select="concat('[not(', $append-reden-afspraak, ')]')"/>
				</xsl:when>

				<xsl:otherwise>['ERROR: could not determine appropriate context for the MA with id <xsl:value-of select="$current_bouwsteen/identificatie/@value"/>']</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="concat($base-context, $append-2-context)"/>
	</xsl:function>
	<xsl:function name="nf:vv-context">
		<xsl:param name="current_vv"/>
		<xsl:param name="all_vvs"/>
		<!-- determine the correct context -->
		<xsl:variable name="base-context" select="'//hl7:supply[hl7:templateId/@root = ''2.16.840.1.113883.2.4.3.11.60.20.77.10.9231''][hl7:product/hl7:manufacturedProduct/hl7:manufacturedMaterial//*[@code = $medCodeNr]]'"/>
		<xsl:variable name="current-hoeveelheid" select="$current_vv/te_verstrekken_hoeveelheid/aantal[1][@value]"/>
		<xsl:variable name="append-hoeveelheid" select="concat('hl7:quantity[@value= ''', $current-hoeveelheid/@value, ''']')"/>
		<xsl:variable name="append-2-context">
			<xsl:choose>
				<!-- is er één VV ? dan hoeven we niets toe te voegen-->
				<xsl:when test="count($all_vvs) = 1"/>
				<!-- is de te verstrekken hoeveelheid uniek? -->
				<xsl:when test="count($all_vvs[./te_verstrekken_hoeveelheid/aantal/@value = $current-hoeveelheid/@value]) = 1">
					<xsl:value-of select="concat('[', $append-hoeveelheid, ']')"/>
				</xsl:when>
				<xsl:otherwise>['ERROR: could not determine appropriate context for the VV with id <xsl:value-of select="$current_vv/identificatie/@value"/>']</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="concat($base-context, $append-2-context)"/>
	</xsl:function>
</xsl:stylesheet>
