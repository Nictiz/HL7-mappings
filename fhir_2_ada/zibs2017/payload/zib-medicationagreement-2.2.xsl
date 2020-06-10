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
    <xsl:import href="ext-zib-medication-stop-type-2.0.xsl"/>
    <xsl:import href="zib-instructions-for-use-2.0.xsl"/>
    <xsl:import href="nl-core-practitionerrole-2.0.xsl"/>
    <xsl:import href="nl-core-practitioner-2.0.xsl"/>
    <xsl:import href="nl-core-organization-2.0.xsl"/>
    
    <xsl:variable name="zib-MedicationAgreement" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement'"/>
    <xsl:variable name="practitionerrole-reference" select="'http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference'"/>
    <xsl:variable name="stoptype-url" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-StopType'"/>
    <xsl:variable name="periodofuse-url" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse'"/>
    <xsl:variable name="basedonagreementoruse-url" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-BasedOnAgreementOrUse'"/>
            
    <xd:doc>
        <xd:desc>Template for converting f:MedicationRequest to medicatieafspraak</xd:desc>
    </xd:doc>
    <xsl:template match="f:MedicationRequest" mode="zib-MedicationAgreement-2.2"> 
        <medicatieafspraak>
            <xsl:apply-templates select="f:extension[@url=$periodofuse-url]" mode="ext-zib-Medication-PeriodOfUse-2.0"/>
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <xsl:apply-templates select="f:authoredOn" mode="#current"/>
            <xsl:apply-templates select="f:modifierExtension[@url=$stoptype-url]" mode="ext-zib-Medication-Stop-Type-2.0"/>
            <xsl:apply-templates select="f:extension[@url=$basedonagreementoruse-url]" mode="#current"/>
            <xsl:apply-templates select="f:requester" mode="#current"/>
            <xsl:apply-templates select="f:reasonCode" mode="#current"/>
            <xsl:apply-templates select="f:medicationReference" mode="#current"/>
            <xsl:apply-templates select="f:dosageInstruction" mode="zib-instructions-for-use-2.0"/>
        </medicatieafspraak>
    </xsl:template>
    
    <xsl:template match="f:identifier" mode="zib-MedicationAgreement-2.2">
        <xsl:call-template name="Identifier-to-identificatie"/>
    </xsl:template>
    
    <xsl:template match="f:medicationReference" mode="zib-MedicationAgreement-2.2">
        <xsl:variable name="referenceValue" select="f:reference/@value"/>
        <afgesproken_geneesmiddel>
            <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:Medication" mode="zib-PharmaceuticalProduct-2.0"/>
        </afgesproken_geneesmiddel>        
    </xsl:template>
    
    <xsl:template match="f:authoredOn" mode="zib-MedicationAgreement-2.2">
        <afspraakdatum>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>               
            </xsl:attribute>
            <xsl:attribute name="datatype">datetime</xsl:attribute>
        </afspraakdatum>        
    </xsl:template>
    
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
                    <xsl:variable name="referenceValue" select="f:agent/f:reference/@value"/>
                    <xsl:variable name="resource" select="(ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:*)[1]"/>
                    <xsl:choose>
                        <xsl:when test="$resource/local-name()='Practitioner'">
                            <xsl:apply-templates select="$resource" mode="nl-core-practitioner-2.0"/>
                        </xsl:when>
                        <xsl:when test="$resource/local-name()='Organization'">
                            <xsl:apply-templates select="$resource" mode="nl-core-organization-2.0"/>
                        </xsl:when>
                    </xsl:choose>
                    <!-- f:onBehalfOf? -->
                    <!-- nl-core-patient, nl-core-relatedperson -->
                </xsl:otherwise>
            </xsl:choose>
        </voorschrijver>
    </xsl:template>
    
    <xsl:template match="f:extension[@url=$practitionerrole-reference]/f:valueReference" mode="zib-MedicationAgreement-2.2">
        <xsl:variable name="referenceValue" select="f:reference/@value"/>
        <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:PractitionerRole" mode="resolve-practitionerRole"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:reasonCode to reden_wijzigen_of_staken</xd:desc>
    </xd:doc>
    <xsl:template match="f:reasonCode" mode="zib-MedicationAgreement-2.2">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'reden_wijzigen_of_staken'"/>
        </xsl:call-template>    
    </xsl:template>
        
    
    <xsl:template match="f:extension[@url=$basedonagreementoruse-url]" mode="zib-MedicationAgreement-2.2">
        <relatie_naar_afspraak_of_gebruik>
            <xsl:choose>
                <xsl:when test="f:valueReference/f:identifier">
                    <xsl:apply-templates select="f:valueReference/f:identifier" mode="#current"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="referenceValue" select="f:valueReference/f:reference/@value"/>
                    <xsl:variable name="resource" select="(ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:*)[1]"/>
                    <xsl:choose>
                        <xsl:when test="$resource[local-name()=('MedicationRequest','MedicationDispense','MedicationUse')]/f:identifier">
                            <xsl:apply-templates select="$resource[local-name()=('MedicationRequest','MedicationDispense','MedicationUse')]/f:identifier" mode="resolveBasedOnReference"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </relatie_naar_afspraak_of_gebruik>
    </xsl:template>
    
    <xsl:template match="f:MedicationRequest/f:identifier | f:MedicationDispense/f:identifier | f:MedicationUse/f:identifier" mode="resolveBasedOnReference">
        <xsl:call-template name="Identifier-to-identificatie"/>
    </xsl:template>
    
<!--        
        <relatie_naar_afspraak_of_gebruik conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23238" comment="">
                  <identificatie value="MBH_907_aanvullendeinstructie_MA"
                                 root="2.16.840.1.113883.2.4.3.11.999.77.16076005.1"
                                 conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23239"/>
               </relatie_naar_afspraak_of_gebruik>
               
               <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-BasedOnAgreementOrUse">
               <valueReference>
                  <identifier>
                     <system value="urn:oid:2.16.840.1.113883.2.4.3.11.999.77.16076005.1"/>
                     <value value="MBH_907_aanvullendeinstructie_MA"/>
                  </identifier>
                  <display value="relatie naar medicatieafspraak: MBH_907_aanvullendeinstructie_MA || 2.16.840.1.113883.2.4.3.11.999.77.16076005.1"/>
               </valueReference>
            </extension>
            
            
            
               
               
        
    
    -->
    
   
    
    
</xsl:stylesheet>