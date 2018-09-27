<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="beschikbaarstellen_medicatiegegevens/ada_test_suite/mp9-medicatiegegevens-ada2test_xslt.xsl"/>
	
	<xsl:template match="/">
		<!-- currently only support for xxx, but the predicate should not be necessary -->
		<xsl:for-each select=".//transactie[@name = 'uitwisselen_medicatiegegevens']/test">
			<xsl:variable name="output-filename" select="concat(./../output-dir/@value, '/', ./pattern-id/@value, '.sch')"/>
			<xsl:result-document href="{$output-filename}" indent="yes">
				<xsl:call-template name="make-schematron">
					<xsl:with-param name="ada-instance-filename" select="concat('file:///C:/SVN/art_decor/trunk/ada-data/mappings/ada_2_hl7/mp/9.0.6/beschikbaarstellen_medicatiegegevens/poc/ada_instance/' ,./ada-instance-filename/@value)"/>
					<xsl:with-param name="data-int-medication-code" select="./data-int-medication-code/@value"/>
					<xsl:with-param name="data-string-medication-code" select="./data-string-medication-code/@value"/>
					<xsl:with-param name="medication-name" select="./medication-name/@value"/>
					<xsl:with-param name="pattern-id" select="./pattern-id/@value"/>
					<xsl:with-param name="checkpatient" select="false()"></xsl:with-param>
				</xsl:call-template>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
