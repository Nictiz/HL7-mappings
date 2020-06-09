<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>-->
    
    <xsl:template match="f:PractitionerRole" mode="resolve-practitionerRole">
        <xsl:variable name="practionerReference" select="f:practitioner/f:reference/@value"/>
        <xsl:variable name="organizationReference" select="f:organization/f:reference/@value"/>
        <xsl:variable name="specialtyReference" select="ancestor::f:entry/f:fullUrl/@value"/>
        <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$practionerReference]/f:resource/f:Practitioner" mode="nl-core-practitioner-2.0">
            <xsl:with-param name="organizationReference" select="$organizationReference"/>
            <xsl:with-param name="specialtyReference" select="$specialtyReference"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="f:PractitionerRole" mode="nl-core-practitionerrole-2.0">
        <xsl:apply-templates select="f:specialty"/>
    </xsl:template>
    
    <xsl:template match="f:specialty">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="adaElementName" select="'specialisme'"/>
            <xsl:with-param name="in" select="."/>
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>