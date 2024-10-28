<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <!-- this import is to avoid compilation errors when running outside of oXygen with the super cool main files functionality -->
    <xsl:import href="../../../../../../HL7-mappings/ada_2_fhir-r4/mp/9.3.0/beschikbaarstellen_medicatiegegevens/payload/beschikbaarstellen_medicatiegegevens_2_fhir.xsl"/>
    <!-- these imports are for the format date templates that we really need to test -->
    <xsl:import href="../../../../../../YATC-internal/ada-2-hl7/env/hl7/2_hl7_hl7_include.xsl"/>
    <xsl:import href="../../../../../../HL7-mappings/ada_2_fhir-r4/fhir/2_fhir_fhir_include.xsl"/>
    <xsl:import href="../../../../../../HL7-mappings/hl7_2_ada/hl7/hl7_2_ada_hl7_include.xsl"/>
    <xsl:import href="../../../../../../HL7-mappings/fhir_2_ada-r4/fhir/fhir_2_ada_fhir_include.xsl"/>

    <xsl:output omit-xml-declaration="yes" indent="yes"/>

    <!-- this stylesheet aims to test ada_2_hl7, hl7_2_ada, ada_2_fhir, fhir_2_ada for handling dates (with or without timezone) -->

    <xsl:template match="/">
        <xsl:apply-templates select="@* | node()" mode="testTimeZone"/>
    </xsl:template>

    <xsl:template match="timezones_test/ada_vaguedate" mode="testTimeZone">
        <xsl:element name="date">

            <xsl:element name="input_date">
                <xsl:apply-templates select="@* | node()" mode="#current"/>
            </xsl:element>

            <xsl:variable name="hl7v3Date">
                <xsl:call-template name="format2HL7Date">
                    <xsl:with-param name="dateTime">
                        <xsl:value-of select="text()"/>
                    </xsl:with-param>
                    <xsl:with-param name="precision"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:element name="hl7v3_date">
                <xsl:value-of select="$hl7v3Date"/>
            </xsl:element>

            <xsl:element name="h2ada_date">
                <xsl:value-of select="nf:formatHL72VagueAdaDate($hl7v3Date, nf:determine_date_precision($hl7v3Date))"/>
            </xsl:element>

            <xsl:variable name="fhirDate" as="xs:string?">
                <xsl:call-template name="format2FHIRDate">
                    <xsl:with-param name="dateTime">
                        <xsl:value-of select="text()"/>
                    </xsl:with-param>
                    <xsl:with-param name="precision"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:element name="fhir__date">
                <xsl:value-of select="$fhirDate"/>
            </xsl:element>

            <xsl:element name="f2ada_date">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="$fhirDate"/>
                </xsl:call-template>
            </xsl:element>

        </xsl:element>

    </xsl:template>

    <xsl:template match="@* | node()" mode="testTimeZone">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
