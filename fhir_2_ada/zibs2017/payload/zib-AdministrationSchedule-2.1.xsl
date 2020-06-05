<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:f="http://hl7.org/fhir"
    xmlns:nf="http://www.nictiz.nl/functions"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:template match="f:timing" mode="zib-AdministrationSchedule-2.1">
        <toedieningsschema>
            <xsl:apply-templates select="f:repeat" mode="#current"/>
            <xsl:apply-templates select="node() except f:repeat" mode="#current"/>
        </toedieningsschema>
    </xsl:template>
    
    <xsl:template match="f:repeat" mode="zib-AdministrationSchedule-2.1">
        <xsl:if test="f:frequency|f:frequencyMax|f:period|f:periodUnit">
            <frequentie>
                <xsl:if test="f:frequency|f:frequencyMax">
                    <aantal>
                        <xsl:apply-templates select="f:frequency" mode="#current"/>
                        <xsl:apply-templates select="f:frequencyMax" mode="#current"/>
                    </aantal>
                </xsl:if>
                <xsl:if test="f:period|f:periodUnit">
                    <tijdseenheid>
                        <xsl:apply-templates select="f:periodUnit" mode="#current"/>
                        <xsl:apply-templates select="f:period" mode="#current"/>
                    </tijdseenheid>
                </xsl:if>
            </frequentie>
        </xsl:if>
        <xsl:apply-templates select="node() except (f:frequency|f:frequencyMax|f:periodUnit|f:period)"/>
    </xsl:template>
    
    <xsl:template match="f:frequency" mode="zib-AdministrationSchedule-2.1">
        <xsl:choose>
            <xsl:when test="following-sibling::f:frequencyMax">
                <min value="{@value}"/>
            </xsl:when>
            <xsl:otherwise>
                <vaste_waarde value="{@value}"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="f:frequencyMax" mode="zib-AdministrationSchedule-2.1">
        <max value="{@value}"/>
    </xsl:template>
    
    <xsl:template match="f:periodUnit" mode="zib-AdministrationSchedule-2.1">
        <xsl:attribute name="unit" select="nf:convertTime_UCUM_FHIR2ADA_unit(@value)"/>
    </xsl:template>
    <xsl:template match="f:period" mode="zib-AdministrationSchedule-2.1">
        <xsl:attribute name="value" select="@value"/>
    </xsl:template>
    
    <!--<xsl:template match="f:boundsDuration" mode="zib-AdministrationSchedule-2.1">
        <doseerduur>
            
        </doseerduur>
    </xsl:template>-->
    
</xsl:stylesheet>