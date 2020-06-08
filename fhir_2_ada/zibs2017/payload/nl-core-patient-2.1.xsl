<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    xmlns:local="urn:fhir:stu3:functions"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>
    <xsl:import href="nl-core-humanname-2.0.xsl"/>
        
    <xsl:variable name="nl-core-patient" select="'http://fhir.nl/fhir/StructureDefinition/nl-core-patient'"/>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:Patient" mode="nl-core-patient-2.1">
        <patient>
            <!-- Additional narrative as @comment? -->
            <xsl:apply-templates select="f:name" mode="nl-core-humanname-2.0"/>
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <xsl:apply-templates select="f:birthDate" mode="#current"/>
            <xsl:apply-templates select="f:gender" mode="#current"/>
        </patient>
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:identifier" mode="nl-core-patient-2.1">
        <identificatienummer>
            <xsl:choose>
                <xsl:when test="f:value/f:extension/@url='http://hl7.org/fhir/StructureDefinition/data-absent-reason'">
                    <xsl:attribute name="nullValue" select="'MSK'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="value" select="f:value/@value"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:attribute name="root" select="local:getOid(f:system/@value)"/>
        </identificatienummer>
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:birthDate" mode="nl-core-patient-2.1">
        <geboortedatum>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                    <xsl:with-param name="precision" select="'DAY'"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="datatype">datetime</xsl:attribute>
        </geboortedatum>
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:gender" mode="nl-core-patient-2.1">
        <geslacht>
            <xsl:call-template name="code-to-code">
                <xsl:with-param name="value" select="@value"/>
                <xsl:with-param name="codeMap" as="element()*">
                    <map code="M" codeSystem="2.16.840.1.113883.5.1" inValue="male" displayName="Man"/>
                    <map code="F" codeSystem="2.16.840.1.113883.5.1" inValue="female" displayName="Vrouw"/>
                    <map code="UN" codeSystem="2.16.840.1.113883.5.1" inValue="other" displayName="Ongedifferentieerd"/>
                    <map code="UNK" codeSystem="2.16.840.1.113883.5.1008" inValue="unknown" displayName="Onbekend"/>
                </xsl:with-param>
            </xsl:call-template>
            <!-- displayName attribute? -->
        </geslacht>
    </xsl:template>
    
</xsl:stylesheet>