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
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:pharm="urn:ihe:pharm:medication" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xd:doc>
		<xd:desc>Dit is een conversie van MP 9.0.5 naar ADA 9.0 beschikbaarstellen medicatiegegevens
  		vooralsnog alleen ondersteuning voor MA's, gemaakt voor ketenzorg
  	</xd:desc>
	</xd:doc>
	<xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
	<xsl:include href="../../../hl7_2_ada_mp_include.xsl"/>
	<!-- de xsd variabelen worden gebruikt om de juiste conceptId's te vinden voor de ADA xml -->

	<xsl:param name="xsd-ada" select="document('../ada_schemas/beschikbaarstellen_medicatiegegevens.xsd')"/>
	<xsl:variable name="mbh-complexType" select="$xsd-ada//xs:schema/xs:complexType[@name = 'beschikbaarstellen_medicatiegegevens_type']//xs:element[@name = 'medicamenteuze_behandeling']/@type"/>
	<xsl:variable name="xsd-mbh" select="$xsd-ada/xs:schema/xs:complexType[@name = $mbh-complexType]"/>

	
    <xd:doc>
        <xd:desc> if this xslt is used stand alone the template below could be used. </xd:desc>
    </xd:doc>
    <xsl:template match="/">
		<xsl:variable name="patient-recordTarget" select="//hl7:recordTarget/hl7:patientRole"/>
		<xsl:call-template name="Voorschrift-90-ADA">
			<xsl:with-param name="patient" select="$patient-recordTarget"/>
			<xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
		</xsl:call-template>
	</xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="patient"/>
        <xd:param name="xsd-mbh"/>
    </xd:doc>
    <xsl:template name="Voorschrift-90-ADA">
		<xsl:param name="patient" select="//hl7:recordTarget/hl7:patientRole"/>
		<xsl:param name="xsd-mbh" select="$xsd-mbh"/>
		<xsl:comment>Generated from HL7v3 xml with id <xsl:value-of select="'TODO'"/>.</xsl:comment>
		<adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_beschikbaarstellen_medicatiegegevens.xsd">
			<meta status="new" created-by="generated" last-update-by="generated">
				<xsl:attribute name="creation-date" select="current-dateTime()"/>
				<xsl:attribute name="last-update-date" select="current-dateTime()"/>
			</meta>
			<data>
				<beschikbaarstellen_medicatiegegevens app="mp-mp9" shortName="beschikbaarstellen_medicatiegegevens" formName="uitwisselen_medicatiegegevens" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.102" transactionEffectiveDate="2016-03-23T16:32:43" versionDate="" prefix="mp-" language="nl-NL" title="Testbericht ADA conversie 2" id="d63106cd-2ebb-43c3-addd-71e768ac7b78">
					<xsl:for-each select="$patient">
						<xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3_20170602000000">
							<xsl:with-param name="current-patient" select="."/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:variable name="component" select="//*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9148']"/>
					<xsl:for-each-group select="$component" group-by="concat(hl7:entryRelationship/hl7:procedure[hl7:templateId = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9084']/hl7:id/@root, hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9084']/hl7:id/@extension)">
						<!-- medicamenteuze_behandeling -->
						<medicamenteuze_behandeling conceptId="{$xsd-mbh/xs:attribute[@name='conceptId']/@fixed}">
							<xsl:variable name="identificatie-complexType" select="$xsd-mbh//xs:element[@name = 'identificatie']/@type"/>
							<xsl:for-each select="./hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9084']/hl7:id">
								<identificatie value="{./@extension}" root="{./@root}" conceptId="{$xsd-ada//xs:complexType[@name=$identificatie-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
							</xsl:for-each>
							<!-- medicatieafspraak -->
							<xsl:for-each select="current-group()[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9148']">
								<xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9148_20160725130413">
									<xsl:with-param name="ma_hl7_905" select="."/>
									<xsl:with-param name="xsd-ada" select="$xsd-ada"/>
									<xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
								</xsl:call-template>
							</xsl:for-each>
						</medicamenteuze_behandeling>
					</xsl:for-each-group>
				</beschikbaarstellen_medicatiegegevens>
			</data>
		</adaxml>
		<!--<xsl:comment>Input HL7 xml below</xsl:comment>
		<xsl:call-template name="copyElementInComment">
			<xsl:with-param name="in" select="./*"/>
		</xsl:call-template>-->
	</xsl:template>
</xsl:stylesheet>
