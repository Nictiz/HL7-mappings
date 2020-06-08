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
    <xsl:import href="ext-zib-medication-period-of-use-2.0.xsl"/>
    <xsl:import href="zib-pharmaceuticalproduct-2.0.xsl"/>
    <xsl:import href="zib-instructions-for-use-2.0.xsl"/>
    <xsl:import href="nl-core-practitionerrole-2.0.xsl"/>
    
    <xsl:variable name="zib-MedicationAgreement" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement'"/>
    <xsl:variable name="zib-Medication-PeriodOfUse" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse'"/>
        
    <xd:doc>
        <xd:desc>Template for converting f:MedicationRequest to medicatieafspraak</xd:desc>
    </xd:doc>
    <xsl:template match="f:MedicationRequest" mode="zib-MedicationAgreement-2.2"> 
        <medicatieafspraak>
            <xsl:apply-templates select="f:extension[@url=$zib-Medication-PeriodOfUse]" mode="#current"/>
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <xsl:apply-templates select="f:medicationReference" mode="#current"/>
            <xsl:apply-templates select="f:requester" mode="#current"/>
            <xsl:apply-templates select="f:dosageInstruction" mode="zib-instructions-for-use-2.0"/>
        </medicatieafspraak>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>All MedicationAgreement extentions templates to ADA</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url =$zib-Medication-PeriodOfUse]" mode="zib-MedicationAgreement-2.2">
        <xsl:apply-templates select="f:valuePeriod" mode="ext-zib-Medication-PeriodOfUse-2.0"/>
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
            <!--<xsl:call-template name="resolve-Reference">
                <xsl:with-param name="fhirResource" select="'Medication'"/>
                <xsl:with-param name="mode" select="'zib-PharmaceuticalProduct-2.0'"/>
            </xsl:call-template>
        </afgesproken_geneesmiddel>-->
    </xsl:template>
    
    <xsl:variable name="practitionerrole-reference" select="'http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference'"/>
    
    <xd:doc>
        <xd:desc>Template to convert f:requester to voorschrijver</xd:desc>
    </xd:doc>
    <xsl:template match="f:requester" mode="zib-MedicationAgreement-2.2">
        <voorschrijver>
            <xsl:choose>
                <xsl:when test="f:agent/f:extension[@url=$practitionerrole-reference]">
                    <xsl:apply-templates select="f:agent/f:extension[@url=$practitionerrole-reference]/f:valueReference" mode="#current"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- f:onBehalfOf? -->
                    <!-- nl-core-practitioner, nl-core-organization, nl-core-patient, nl-core-relatedperson -->
                </xsl:otherwise>
            </xsl:choose>
        </voorschrijver>
    </xsl:template>
    
    <xsl:template match="f:extension[@url=$practitionerrole-reference]/f:valueReference" mode="zib-MedicationAgreement-2.2">
        <xsl:variable name="referenceValue" select="f:reference/@value"/>
        <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:PractitionerRole" mode="nl-core-practitionerrole-2.0"/>
    </xsl:template>
    
</xsl:stylesheet>