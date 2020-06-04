<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    xmlns:local="urn:fhir:stu3:functions"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:variable name="zib-MedicationAgreement" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement'"/>
    
    <xd:doc>
        <xd:desc></xd:desc>
    </xd:doc>
    
    <xsl:template match="f:MedicationRequest" mode="zib-MedicationAgreement-2.2"> 
        <medicatieafspraak>
            <xd:doc>
                <xd:desc>meta, text, intent, category are elements in FHIR that are not mapped to concepts in MP9</xd:desc>
            </xd:doc>
            <xsl:apply-templates select="node() except (f:meta|f:text|f:intent|f:category)" mode="#current"/>
            <xsl:apply-templates select="f:extension" mode="#current"/>
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <xsl:apply-templates select="f:intent" mode="#current"/>              
            <xsl:apply-templates select="f:medicationReference" mode="#current"/> 
        </medicatieafspraak>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc>All MedicationAgreement extentions templates to ADA</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url ='http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse']" mode="zib-MedicationAgreement-2.2">
        <xsl:for-each select="f:valuePeriod">
            <xsl:call-template name="ext-zib-Medication-PeriodOfUse-2.0">
                <xsl:with-param name="start" select="f:start/@value"/>
                <xsl:with-param name="end" select="f:end/@value"/>
            </xsl:call-template>
        </xsl:for-each>       
    </xsl:template>
    
    <xsl:template match="f:extension[@url ='http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']" mode="zib-MedicationAgreement-2.2">
        <!-- do nothing - MedicationTreatment identifier is used at a higher level -->
    </xsl:template>
    
    <xsl:template match="f:identifier" mode="zib-MedicationAgreement-2.2">
        <identificatie>
            <xsl:attribute name="value" select="f:value/@value"/>
            <xsl:attribute name="root" select="local:getOid(f:system/@value)"/>
        </identificatie>   
    </xsl:template>
    
    <xsl:template match="f:medicationReference" mode="zib-MedicationAgreement-2.2">
        <xsl:variable name="referenceValue" select="f:reference/@value"/>
        <afgesproken_geneesmiddel>
            <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:Medication" mode="zib-PharmaceuticalProduct-2.0"/>
        </afgesproken_geneesmiddel>        
    </xsl:template>
    
</xsl:stylesheet>