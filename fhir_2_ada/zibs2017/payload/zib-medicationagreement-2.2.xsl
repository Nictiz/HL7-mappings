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
            <xsl:apply-templates select="node() except (f:meta|f:text|f:identifier|intent|f:category)" mode="#current"/>
            
            <xsl:apply-templates select="f:extension" mode="#current"/>
            <!-- <xsl:apply-templates select="f:identifier"/>
            
              
            <xsl:apply-templates select="f:intent"/>
            <xsl:apply-templates select="f:category"/>-->
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
        <xsl:for-each select="f:valueIdentifier">
            <identificatie>
                <xsl:attribute name="value">
                    <xsl:value-of select="f:value/@value"/>
                </xsl:attribute>
                <xsl:attribute name="root">
                    <xsl:value-of select="f:system/@value"/>
                </xsl:attribute>
            </identificatie>
        </xsl:for-each>
    </xsl:template>
 
 
</xsl:stylesheet>