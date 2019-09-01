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
    <!-- import because we want to be able to override the param for macAddress for UUID generation
         and the param for referById -->
    <xsl:import href="../../../2_fhir_mp_include.xsl"/>
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
			<xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA MP9-transaction, to HL7 FHIR instances, based on agreed profiles.</xd:p>
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
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- parameter to determine whether to refer by resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <xsl:param name="referById" as="xs:boolean" select="true()"/>
    
	<xsl:variable name="usecase">mp9</xsl:variable>
	<xsl:variable name="commonEntries" as="element(f:entry)*">
		<xsl:copy-of select="$patients/f:entry | $practitioners/f:entry | $organizations/f:entry | $practitionerRoles/f:entry | $products/f:entry | $related-persons/f:entry | $locations/f:entry | $body-observations/f:entry | $prescribe-reasons/f:entry"/>
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

		<xsl:variable name="entries" as="element(f:entry)*">
			<!-- common entries (patient, practitioners, organizations, practitionerroles, relatedpersons, products, locations, gewichten, lengtes, reden van voorschrijven,  bouwstenen -->
			<xsl:copy-of select="$commonEntries"/>
			<xsl:copy-of select="$bouwstenen-907"/>
		</xsl:variable>

		<xsl:apply-templates select="($entries)//f:resource/*" mode="doResourceInResultdoc"/>
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
