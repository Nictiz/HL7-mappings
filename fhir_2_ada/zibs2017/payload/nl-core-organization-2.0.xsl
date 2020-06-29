<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>
    <xsl:import href="nl-core-address-2.0.xsl"/>-->
    
    <xsl:template match="f:Organization" mode="nl-core-organization-2.0">
        <zorgaanbieder>
            <!--<xsl:apply-templates select="f:identifier"/>
            <xsl:apply-templates select="f:name" mode="nl-core-humanname-2.0"/>
            <!-\-telecom
            address-\->
            <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$specialtyReference]/f:resource/f:PractitionerRole" mode="nl-core-practitionerrole-2.0"/>
            <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$organizationReference]/f:resource/f:Organization" mode="nl-core-organization-2.0"/>-->
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <xsl:apply-templates select="f:name" mode="#current"/>
            <xsl:apply-templates select="f:address" mode="nl-core-address-2.0"/>
        </zorgaanbieder>
    </xsl:template>
    
    <xsl:template match="f:identifier" mode="nl-core-organization-2.0">
        <xsl:param name="organizationIdUnderscore" select="false()" tunnel="yes"/>
        <xsl:variable name="adaElementName">
            <xsl:choose>
                <xsl:when test="$organizationIdUnderscore=true()">zorgaanbieder_identificatie_nummer</xsl:when>
                <xsl:otherwise>zorgaanbieder_identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="Identifier-to-identificatie">
            <xsl:with-param name="adaElementName" select="$adaElementName"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="f:name" mode="nl-core-organization-2.0">
        <organisatie_naam value="{@value}"/>
    </xsl:template>
    
</xsl:stylesheet>