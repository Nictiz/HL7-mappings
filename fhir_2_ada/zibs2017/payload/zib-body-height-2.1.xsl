<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>-->
    
    <xsl:template match="f:supportingInformation" mode="resolve-bodyHeight">
        <xsl:variable name="reference" select="f:reference/@value"/>
        <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$reference]/f:resource/f:Observation[f:meta/f:profile/@value='http://nictiz.nl/fhir/StructureDefinition/zib-BodyHeight']" mode="zib-body-height-2.1"/>
    </xsl:template>
    
    <xsl:template match="f:Observation" mode="zib-body-height-2.1">
        <lichaamslengte>
            <!-- lengte_waarde -->
            <xsl:apply-templates select="f:valueQuantity" mode="#current"/>
            <!-- lenge_datum_tijd -->
            <xsl:apply-templates select="f:effectiveDateTime" mode="#current"/>
        </lichaamslengte>
    </xsl:template>
    
    <xsl:template match="f:valueQuantity" mode="zib-body-height-2.1">
        <lengte_waarde value="{f:value/@value}" unit="{f:unit/@value}"/>
    </xsl:template>
    
    <xsl:template match="f:effectiveDateTime" mode="zib-body-height-2.1">
        <lengte_datum_tijd>
            <xsl:choose>
                <xsl:when test="f:extension/@url=$urlExtHL7DataAbsentReason">
                    <xsl:attribute name="nullFlavor" select="f:extension/f:valueCode/@value"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2ADADate">
                            <xsl:with-param name="dateTime" select="@value"/>
                        </xsl:call-template>
                    </xsl:attribute>
                    <xsl:attribute name="datatype">datetime</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
        </lengte_datum_tijd>
    </xsl:template>
    
</xsl:stylesheet>