<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>
    <xsl:import href="nl-core-humanname-2.0.xsl"/>
    <xsl:import href="nl-core-practitionerrole-2.0.xsl"/>
    <xsl:import href="nl-core-organization-2.0.xsl"/>-->
    
    <xsl:template match="f:Practitioner" mode="nl-core-practitioner-2.0">
        <xsl:param name="organizationReference"/>
        <xsl:param name="specialtyReference"/>
        <zorgverlener>
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <xsl:apply-templates select="f:name" mode="#current"/>
            <!--telecom
            address-->
            <xsl:if test="not($specialtyReference='')">
                <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$specialtyReference]/f:resource/f:PractitionerRole" mode="nl-core-practitionerrole-2.0"/>
            </xsl:if>
            <xsl:if test="not($organizationReference='')">
                <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$organizationReference]/f:resource/f:Organization" mode="nl-core-organization-2.0"/>
            </xsl:if>
        </zorgverlener>
    </xsl:template>
    
    <xsl:template match="f:identifier" mode="nl-core-practitioner-2.0">
        <xsl:param name="practitionerIdUnderscore" select="false()" tunnel="yes"/>
        <xsl:variable name="adaElementName">
            <xsl:choose>
                <xsl:when test="$practitionerIdUnderscore=true()">zorgverlener_identificatie_nummer</xsl:when>
                <xsl:otherwise>zorgverlener_identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="Identifier-to-identificatie">
            <xsl:with-param name="adaElementName" select="$adaElementName"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="f:name" mode="nl-core-practitioner-2.0">
        <naamgegevens>
            <xsl:apply-templates select="." mode="nl-core-humanname-2.0"/>
        </naamgegevens>
    </xsl:template>
    
</xsl:stylesheet>