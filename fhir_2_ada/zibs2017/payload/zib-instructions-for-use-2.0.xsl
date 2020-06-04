<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:f="http://hl7.org/fhir"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xd:doc>
        <xd:desc>Uncomment imports for standalone use and testing.</xd:desc>
    </xd:doc>
    <xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>
    
    <xsl:template match="f:dosageInstruction" mode="zib-instructions-for-use-2.0">
        <gebruiksinstructie>
            <xsl:apply-templates select="f:text" mode="#current"/>
            <!--additionalInstruction-->
            <xsl:apply-templates select="f:route" mode="#current"/>
            <xsl:apply-templates select="f:additionalInstruction" mode="#current"/>
            <xsl:apply-templates select="node() except (f:text|f:route|f:additionalInstruction)" mode="#current"/>
        </gebruiksinstructie>
    </xsl:template>
    
    <xsl:template match="f:text" mode="zib-instructions-for-use-2.0">
        <omschrijving>
            <xsl:attribute name="value" select="@value"/>
            <xsl:apply-templates mode="#current"/>
        </omschrijving>
    </xsl:template>
    
    <xsl:template match="f:route" mode="zib-instructions-for-use-2.0">
        <toedieningsweg>
            <xsl:call-template name="CodeableConcept-to-code">
                <xsl:with-param name="in" select="."/>
            </xsl:call-template>
        </toedieningsweg>
    </xsl:template>
    
</xsl:stylesheet>