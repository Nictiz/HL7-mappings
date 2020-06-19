<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>-->
    
    <xsl:template match="f:Condition" mode="zib-problem-2.1">
        <probleem>
            <!-- Voor MedicationAgreement alleen probleem_naam -->
            <xsl:apply-templates select="f:code" mode="#current"/>
        </probleem>
    </xsl:template>
    
    <xsl:template match="f:code" mode="zib-problem-2.1">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="adaElementName">probleem_naam</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>