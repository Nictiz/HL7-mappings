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
	<xsl:output indent="yes" omit-xml-declaration="yes"/>

	<xd:doc>
		<xd:desc>Base template for the main interaction.</xd:desc>
		<xd:param name="adaAntwoordElementName">The ada element name for the coded answer. Is different in ada, depending on transaction. Defaults to antwoord_medicatieafspraak</xd:param>
	</xd:doc>
	<xsl:template match="f:Communication" mode="mp-antwoord">
		<xsl:param name="adaAntwoordElementName" as="xs:string">antwoord_medicatieafspraak</xsl:param>
		<antwoord>
			<!-- identificatie -->
			<xsl:for-each select="f:identifier">
				<xsl:call-template name="Identifier-to-identificatie"/>
			</xsl:for-each>
			
			<!-- antwoord_datum -->
			<xsl:for-each select="f:sent">
				<xsl:call-template name="datetime-to-datetime">
					<xsl:with-param name="adaElementName">antwoord_datum</xsl:with-param>
					<xsl:with-param name="adaDatatype">datetime</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
			
			<!-- auteur -->
			<xsl:for-each select="f:sender">
				<xsl:variable name="resolvedElement" select="nf:resolveRefInBundle(.)"/>
				<auteur>
					<xsl:choose>
						<xsl:when test="$resolvedElement/(f:PractitionerRole | f:Practitioner) or f:type/@value = ('PractitionerRole', 'Practitioner')">
							<zorgverlener value="{nf:convert2NCName(f:reference/@value)}" datatype="reference"/>
						</xsl:when>
						<xsl:when test="$resolvedElement/(f:Organization | f:Location) or f:type/@value = ('Organization', 'Location')">
							<xsl:call-template name="util:logMessage">
								<xsl:with-param name="level" select="$logERROR"/>
								<xsl:with-param name="msg">Voorstel_gegevens/antwoord/auteur moet zorgverlener zijn, maar zorgaanbieder aangetroffen.</xsl:with-param>
								<xsl:with-param name="terminate" select="false()"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$resolvedElement/f:Patient or f:type/@value = 'Patient'">
							<xsl:call-template name="util:logMessage">
								<xsl:with-param name="level" select="$logERROR"/>
								<xsl:with-param name="msg">Voorstel_gegevens/antwoord/auteur moet zorgverlener zijn, maar patiënt aangetroffen.</xsl:with-param>
								<xsl:with-param name="terminate" select="false()"/>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</auteur>
			</xsl:for-each>

			<!-- relatie_voorstel_gegevens -->
			<xsl:for-each select="f:basedOn">				
				<relatie_voorstel_gegevens>
					<xsl:choose>
						<xsl:when test="f:identifier">
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="f:identifier"/>
							</xsl:call-template>							
						</xsl:when>
						<xsl:when test="nf:resolveRefInBundle(.)/*/f:identifier">
							<xsl:call-template name="Identifier-to-identificatie">
								<xsl:with-param name="in" select="nf:resolveRefInBundle(.)/*/f:identifier"/>								
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</relatie_voorstel_gegevens>
			</xsl:for-each>
			
			<!-- antwoord_medicatieafspraak or antwoord_verstrekkingsverzoek -->
			<xsl:for-each select="f:payload/f:contentString/f:extension[@url=$urlExtCommunicationPayloadContentCodeableConcept]/f:valueCodeableConcept">
				<xsl:call-template name="CodeableConcept-to-code">
					<xsl:with-param name="adaElementName" select="$adaAntwoordElementName"/>
				</xsl:call-template>
				
			</xsl:for-each>
				

		</antwoord>

	</xsl:template>


</xsl:stylesheet>
