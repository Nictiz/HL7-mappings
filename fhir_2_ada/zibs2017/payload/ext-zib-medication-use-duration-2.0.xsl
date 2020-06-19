<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:template match="f:extension[@url='http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration']" mode="ext-zib-MedicationUse-Duration-2.0">
        <xsl:call-template name="Duration-to-hoeveelheid">
            <xsl:with-param name="in" select="f:valueDuration"/>
            <xsl:with-param name="adaElementName">gebruiksperiode</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>