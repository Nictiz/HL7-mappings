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
<xsl:stylesheet xmlns:pharm="urn:ihe:pharm:medication" xmlns:nf="http://www.nictiz.nl/functions" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:import href="../../../2_hl7_cio_include.xsl"/>
	<!-- Generates a HL7 message based on ADA input -->
	<xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
	<!-- only give dateT a value if you want conversion of relative T dates -->
	<!--    <xsl:param name="dateT" as="xs:date?" select="current-date()"/>-->
	<xsl:param name="dateT" as="xs:date?" select="xs:date('2020-03-24')"/>
	<!-- whether to generate a user instruction description text from the structured information, 
    	typically only needed for test instances and not for production  -->
	<xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>
	<!-- param to influence whether to output schematron references, typically only needed for test instances -->
	<xsl:param name="schematronRef" as="xs:boolean" select="false()"/>

	<xsl:template match="/">
		<xsl:call-template name="Contraindicatie_20">
		    <xsl:with-param name="patient" select="//beschikbaarstellen_contraindicatie/patient"/>
		    <xsl:with-param name="mci" select="//beschikbaarstellen_contraindicatie/medicatie_contra_indicatie"/>
		</xsl:call-template>
	</xsl:template>
    <xsl:template name="Contraindicatie_20">
	    <xsl:param name="in" select="//beschikbaarstellen_contraindicatie"/>
		<xsl:param name="patient"/>
		<xsl:param name="mci"/>

		<xsl:if test="$schematronRef">
			<xsl:processing-instruction name="nictiz">status="example"</xsl:processing-instruction>
			<!-- phase="#ALL" achteraan de volgende regel zorgt dat oXygen niet met een phase chooser dialoog komt elke keer dat je de HL7 XML opent -->
			<xsl:processing-instruction name="xml-model">href="file:/C:/SVN/art_decor/branches/mp-qual-20181220T121121/schematron_closed_warnings/mp-MP90_vo.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>
			<!--	        <xsl:processing-instruction name="xml-model">href="file:/C:/SVN/art_decor/trunk/ada-data/ada_2_test-xslt/mp/9.0.7/sturen_medicatievoorschrift/test_xslt_instance/<xsl:value-of select="$in/@id"/>.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>-->
			<xsl:comment>Generated from ada instance with title: "<xsl:value-of select="$mci/../@title"/>" and id: "<xsl:value-of select="$mci/../@id"/>".</xsl:comment>
		</xsl:if>
		<organizer xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication" classCode="CLUSTER" moodCode="EVN">
			<xsl:if test="$schematronRef">
				<!--<xsl:attribute name="xsi:schemaLocation">urn:hl7-org:v3 file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schemas/organizer.xsd</xsl:attribute>-->
			</xsl:if>
		    <templateId root="2.16.840.1.113883.2.4.3.11.60.26.10.7"/>
		    <code code="TODO" displayName="..." codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.4" codeSystemName="ART DECOR transacties"/>
			<statusCode nullFlavor="NI"/>
			<!-- Patient -->
			<xsl:for-each select="$patient">
				<xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3_20170602000000">
					<xsl:with-param name="in" select="."/>
				</xsl:call-template>
			</xsl:for-each>
			<!-- MedicatieContraIndicatie -->
			<xsl:if test="$mci">
			    <component typeCode="COMP">
			        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.2_20200821165955">
			            <xsl:with-param name="mci" select="$mci"/>
			        </xsl:call-template>
			    </component>
			</xsl:if>
		</organizer>
	</xsl:template>
</xsl:stylesheet>
