<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>-->
    
    <xsl:template match="f:extension[@url='http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation']" mode="ext-zib-Medication-AdditionalInformation-2.0">
        <!--<aanvullende_informatie>-->
            <xsl:call-template name="CodeableConcept-to-code">
                <xsl:with-param name="in" select="f:valueCodeableConcept"/>
                <xsl:with-param name="adaElementName">aanvullende_informatie</xsl:with-param>
            </xsl:call-template>
        <!--</aanvullende_informatie>-->
    </xsl:template>
    
</xsl:stylesheet>