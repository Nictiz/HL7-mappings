<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    xmlns:local="urn:fhir:stu3:functions"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:variable name="nl-core-patient" select="'http://fhir.nl/fhir/StructureDefinition/nl-core-patient'"/>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:Patient" mode="nl-core-patient-2.1">
        <patient>
            <!-- Additional narrative as @comment? -->
            <!-- FHIR spec: meta, text, extension, identifier, active, name, telecom, gender, birthDate, deceased, address, maritalStatus, multipleBirth, contact, communication, generalPractitioner -->
            <xsl:apply-templates select="node() except (f:meta|f:text|f:identifier|f:name|f:birthDate|f:gender)" mode="#current"/>
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
                    <xsl:attribute name="nullVlue" select="'MSK'"/>
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
        <geboortedatum></geboortedatum>
    </xsl:template>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    <xsl:template match="f:gender" mode="nl-core-patient-2.1">
        <gender></gender>
    </xsl:template>
    
</xsl:stylesheet>