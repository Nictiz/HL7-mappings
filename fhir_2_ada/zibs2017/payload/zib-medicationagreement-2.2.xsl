<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    xmlns:local="urn:fhir:stu3:functions"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>
    <xsl:import href="ext-zib-medication-period-of-use-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-stop-type-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-use-duration-2.0.xsl"/>
    <xsl:import href="ext-zib-Medication-AdditionalInformation-2.0.xsl"/>
    <xsl:import href="zib-instructions-for-use-2.0.xsl"/>
    <xsl:import href="nl-core-practitionerrole-2.0.xsl"/>
    <xsl:import href="nl-core-practitioner-2.0.xsl"/>
    <xsl:import href="nl-core-organization-2.0.xsl"/>
    <xsl:import href="zib-body-height-2.1.xsl"/>
    <xsl:import href="zib-body-weight-2.1.xsl"/>
    <xsl:import href="zib-problem-2.1.xsl"/>-->
    
    <xsl:variable name="zib-MedicationAgreement" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement'"/>
    <xsl:variable name="practitionerrole-reference" select="'http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference'"/>
    <xsl:variable name="zib-Medication-StopType" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-StopType'"/>
    <xsl:variable name="zib-Medication-PeriodOfUse" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse'"/>
    <xsl:variable name="zib-MedicationAgreement-BasedOnAgreementOrUse" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-BasedOnAgreementOrUse'"/>
    <xsl:variable name="zib-MedicationUse-Duration" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration'"/>
            
    <xd:doc>
        <xd:desc>Template for converting f:MedicationRequest to medicatieafspraak</xd:desc>
    </xd:doc>
    <xsl:template match="f:MedicationRequest" mode="zib-MedicationAgreement-2.2"> 
        <medicatieafspraak>
            <xsl:apply-templates select="f:extension[@url=$zib-Medication-PeriodOfUse]" mode="ext-zib-Medication-PeriodOfUse-2.0"/>
            <!-- identificatie -->
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <!-- afspraakdatum -->
            <xsl:apply-templates select="f:authoredOn" mode="#current"/>
            <xsl:apply-templates select="f:extension[@url=$zib-MedicationUse-Duration]" mode="ext-zib-medication-use-duration-2.0"/>
            <xsl:apply-templates select="f:status" mode="#current"/>
            <xsl:apply-templates select="f:modifierExtension[@url=$zib-Medication-StopType]" mode="ext-zib-Medication-Stop-Type-2.0"/>
            <xsl:apply-templates select="f:extension[@url=$zib-MedicationAgreement-BasedOnAgreementOrUse]" mode="#current"/>
            <xsl:apply-templates select="f:context" mode="#current"/>
            <xsl:apply-templates select="f:requester" mode="#current"/>
            <!-- reden afspraak -->
            <xsl:apply-templates select="f:reasonCode" mode="#current"/>
            <!-- reden van voorschrijven -->
            <xsl:apply-templates select="f:reasonReference" mode="#current"/>
            <xsl:apply-templates select="f:medicationReference" mode="#current"/>
            <xsl:apply-templates select="f:dosageInstruction" mode="zib-instructions-for-use-2.0"/>
            <!-- lichaamslengte -->
            <xsl:apply-templates select="f:supportingInformation" mode="resolve-bodyHeight"/>
            <!-- lichaamsgewicht -->
            <xsl:apply-templates select="f:supportingInformation" mode="resolve-bodyWeight"/>
            <!-- aanvullende_informatie -->
            <xsl:apply-templates select="f:extension[@url='http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation']" mode="ext-zib-Medication-AdditionalInformation-2.0"/>
            <!-- toelichting -->
            <xsl:apply-templates select="f:note" mode="#current"/>
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
            <!--<xsl:attribute name="datatype">datetime</xsl:attribute>-->
        </afspraakdatum>        
    </xsl:template>
    
    <xsl:template match="f:status" mode="zib-MedicationAgreement-2.2">
        <xsl:if test="@value='entered-in-error'">
            <geannuleerd_indicator value="true"/>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:requester to voorschrijver</xd:desc>
    </xd:doc>
    <xsl:template match="f:requester" mode="zib-MedicationAgreement-2.2">
        <voorschrijver>
            <xsl:choose>
                <xsl:when test="f:agent/f:extension[@url=$practitionerrole-reference]">
                    <xsl:variable name="referenceValue" select="f:agent/f:extension[@url = $practitionerrole-reference]/f:valueReference/f:reference/@value"/>
                    <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:PractitionerRole" mode="resolve-practitionerRole"/>
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
    
    <xd:doc>
        <xd:desc>Template to convert f:reasonCode to reden_wijzigen_of_staken</xd:desc>
    </xd:doc>
    <xsl:template match="f:reasonCode" mode="zib-MedicationAgreement-2.2">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'reden_wijzigen_of_staken'"/>
        </xsl:call-template>    
    </xsl:template>
    
    <xsl:template match="f:reasonReference" mode="zib-MedicationAgreement-2.2">
        <xsl:variable name="reference" select="f:reference/@value"/>
        <reden_van_voorschrijven>
            <!--<xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$reference]/f:Observation" mode="general-observation"/>-->
            <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$reference]/f:resource/f:Condition[f:meta/f:profile/@value='http://nictiz.nl/fhir/StructureDefinition/zib-Problem']" mode="zib-problem-2.1"/>
        </reden_van_voorschrijven>
    </xsl:template>
    
    <xsl:template match="f:extension[@url=$zib-MedicationAgreement-BasedOnAgreementOrUse]" mode="zib-MedicationAgreement-2.2">
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
    
    <xsl:template match="f:context" mode="zib-MedicationAgreement-2.2">
        <relaties_ketenzorg>
            <xsl:for-each select="f:identifier">
                <xsl:call-template name="Identifier-to-identificatie">
                    <xsl:with-param name="adaElementName">identificatie_contactmoment</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </relaties_ketenzorg>
    </xsl:template>
    
    <xsl:template match="f:MedicationRequest/f:identifier | f:MedicationDispense/f:identifier | f:MedicationUse/f:identifier" mode="resolveBasedOnReference">
        <xsl:call-template name="Identifier-to-identificatie"/>
    </xsl:template>
    
    <xsl:template match="f:note" mode="zib-MedicationAgreement-2.2">
        <toelichting value="{f:text/@value}"></toelichting>
    </xsl:template>
    
</xsl:stylesheet>