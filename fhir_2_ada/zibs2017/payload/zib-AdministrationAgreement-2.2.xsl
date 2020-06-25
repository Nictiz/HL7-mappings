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
    <xsl:import href="ext-zib-medication-use-duration-2.0.xsl"/>
    <xsl:import href="ext-zib-Medication-AdditionalInformation-2.0.xsl"/>
    <xsl:import href="zib-instructions-for-use-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-stop-type-2.0.xsl"/>
    <xsl:import href="nl-core-practitionerrole-2.0.xsl"/>
    <xsl:import href="nl-core-practitioner-2.0.xsl"/>
    <xsl:import href="nl-core-organization-2.0.xsl"/>
    <xsl:import href="zib-pharmaceuticalproduct-2.0.xsl"/>
    
    <xsl:variable name="zib-Medication-PeriodOfUse" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse'"/>
    <xsl:variable name="zib-AdministrationAgreement-AuthoredOn" select="'http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-AuthoredOn'"/>
    <xsl:variable name="zib-MedicationUse-Duration" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration'"/>
    <xsl:variable name="zib-Medication-StopType" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-StopType'"/>
    <xsl:variable name="practitionerrole-reference" select="'http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference'"/>
    
    <xsl:template match="f:MedicationDispense" mode="zib-AdministrationAgreement-2.2">
        <toedieningsafspraak>
            <!--gebruiksperiode_start-->
            <!--gebruiksperiode_eind-->
            <xsl:apply-templates select="f:extension[@url=$zib-Medication-PeriodOfUse]" mode="ext-zib-Medication-PeriodOfUse-2.0"/>
            <!--identificatie-->
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <!--afspraakdatum-->
            <xsl:apply-templates select="f:extension[@url=$zib-AdministrationAgreement-AuthoredOn]" mode="#current"/>
            <!--gebruiksperiode-->
            <xsl:apply-templates select="f:extension[@url=$zib-MedicationUse-Duration]" mode="ext-zib-medication-use-duration-2.0"/>
            <!--geannuleerd_indicator-->
            <xsl:apply-templates select="f:status" mode="#current"/>
            <!--stoptype-->
            <xsl:apply-templates select="f:modifierExtension[@url=$zib-Medication-StopType]" mode="ext-zib-Medication-Stop-Type-2.0"/>
            <!--verstrekker-->
            <xsl:apply-templates select="f:performer" mode="#current"/>
            <!--reden_afspraak-->
            <xsl:apply-templates select="f:agreementReason" mode="#current"/>
            <!--geneesmiddel_bij_toedieningsafspraak-->
            <xsl:apply-templates select="f:medicationReference" mode="#current"/>
            <!--gebruiksinstructie-->
            <xsl:apply-templates select="f:dosageInstruction" mode="zib-instructions-for-use-2.0"/>
            <!--aanvullende_informatie-->
            <xsl:apply-templates select="f:extension[@url='http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation']" mode="ext-zib-Medication-AdditionalInformation-2.0"/>
            <!--toelichting-->
            <xsl:apply-templates select="f:note" mode="#current"/>
            <!--relatie_naar_medicatieafspraak-->
            <xsl:apply-templates select="f:authorizingPrescription" mode="#current"/>
        </toedieningsafspraak>
    </xsl:template>
    
    <xsl:template match="f:identifier" mode="zib-AdministrationAgreement-2.2">
        <xsl:call-template name="Identifier-to-identificatie"/>
    </xsl:template>
    
    <xsl:template match="f:extension[@url=$zib-AdministrationAgreement-AuthoredOn]" mode="zib-AdministrationAgreement-2.2">
        <afspraakdatum>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="f:valueDateTime/@value"/>
                </xsl:call-template>
            </xsl:attribute>
        </afspraakdatum>
    </xsl:template>
    
    <xsl:template match="f:status" mode="zib-AdministrationAgreement-2.2">
        <xsl:if test="@value='entered-in-error'">
            <geannuleerd_indicator value="true"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="f:performer" mode="zib-AdministrationAgreement-2.2">
        <verstrekker>
            <xsl:choose>
                <xsl:when test="f:actor/f:extension[@url=$practitionerrole-reference]">
                    <xsl:apply-templates select="f:actor/f:extension[@url=$practitionerrole-reference]/f:valueReference" mode="#current">
                        <xsl:with-param name="idUnderscore" select="true()" tunnel="yes"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="referenceValue" select="f:actor/f:reference/@value"/>
                    <xsl:variable name="resource" select="(ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:*)[1]"/>
                    <xsl:choose>
                        <xsl:when test="$resource/local-name()='Practitioner'">
                            <xsl:apply-templates select="$resource" mode="nl-core-practitioner-2.0"/>
                        </xsl:when>
                        <xsl:when test="$resource/local-name()='Organization'">
                            <xsl:apply-templates select="$resource" mode="nl-core-organization-2.0">
                                <xsl:with-param name="idUnderscore" select="true()" tunnel="yes"/>
                            </xsl:apply-templates>
                        </xsl:when>
                    </xsl:choose>
                    <!-- f:onBehalfOf? -->
                    <!-- nl-core-patient, HCIM MedicalDevice Product, nl-core-relatedperson -->
                </xsl:otherwise>
            </xsl:choose>
        </verstrekker>
    </xsl:template>
    
    <xsl:template match="f:medicationReference" mode="zib-AdministrationAgreement-2.2">
        <xsl:variable name="referenceValue" select="f:reference/@value"/>
        <geneesmiddel_bij_toedieningsafspraak>
            <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:Medication" mode="zib-PharmaceuticalProduct-2.0"/>
        </geneesmiddel_bij_toedieningsafspraak>        
    </xsl:template>
    
    <xsl:template match="f:note" mode="zib-AdministrationAgreement-2.2">
        <toelichting value="{f:text/@value}"></toelichting>
    </xsl:template>
    
    <xsl:template match="f:authorizingPrescription" mode="zib-AdministrationAgreement-2.2">
        <relatie_naar_medicatieafspraak>
            <xsl:call-template name="Identifier-to-identificatie">
                <xsl:with-param name="in" select="f:identifier"/>
            </xsl:call-template>
        </relatie_naar_medicatieafspraak>
    </xsl:template>
    
</xsl:stylesheet>