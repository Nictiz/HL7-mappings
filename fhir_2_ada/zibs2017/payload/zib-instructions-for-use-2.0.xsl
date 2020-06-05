<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:f="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xd:doc>
        <xd:desc>Uncomment imports for standalone use and testing.</xd:desc>
    </xd:doc>
    <xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>
    <xsl:import href="./zib-AdministrationSchedule-2.1.xsl"/>
    
    <xsl:template match="f:dosageInstruction" mode="zib-instructions-for-use-2.0">
        <gebruiksinstructie>
            <xsl:apply-templates select="f:text" mode="#current"/>
            <!--additionalInstruction-->
            <xsl:apply-templates select="f:route" mode="#current"/>
            <xsl:if test="f:sequence|f:doseQuantity|f:timing">
                <doseerinstructie>
                    <xsl:apply-templates select="f:sequence" mode="#current"/>
                    <dosering>
                        <xsl:apply-templates select="f:doseQuantity" mode="#current"/>
                        <xsl:apply-templates select="f:timing" mode="zib-AdministrationSchedule-2.1"/>
                    </dosering>
                </doseerinstructie>
            </xsl:if>
        </gebruiksinstructie>
    </xsl:template>
    
    <xsl:template match="f:text" mode="zib-instructions-for-use-2.0">
        <omschrijving>
            <xsl:attribute name="value" select="@value"/>
            <xsl:apply-templates mode="#current"/>
        </omschrijving>
    </xsl:template>
    
    <xsl:template match="f:route" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'toedieningsweg'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="f:sequence" mode="zib-instructions-for-use-2.0">
        
    </xsl:template>
    
    <xsl:template match="f:doseQuantity" mode="zib-instructions-for-use-2.0">
        <keerdosis>
            <xsl:call-template name="hoeveelheid-Quantity-to-complex">
                <xsl:with-param name="quantity" select="."/>
            </xsl:call-template>
        </keerdosis>
    </xsl:template>
    
</xsl:stylesheet>