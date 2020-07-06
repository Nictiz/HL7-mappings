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
    <xsl:import href="ext-zib-medication-additional-information-2.0.xsl"/>
    <xsl:import href="nl-core-practitionerrole-2.0.xsl"/>
    <xsl:import href="nl-core-practitioner-2.0.xsl"/>
    <xsl:import href="nl-core-organization-2.0.xsl"/>
    <xsl:import href="zib-pharmaceuticalproduct-2.0.xsl"/>
    <xsl:import href="nl-core-address-2.0.xsl"/>
    <xsl:import href="nl-core-humanname-2.0.xsl"/>-->
    
    <xsl:variable name="practitionerrole-reference" select="'http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference'"/>
    <xsl:variable name="zib-Dispense-Location" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-Location'"/>
    <xsl:variable name="zib-DispenseRequest-RelatedMedicationAgreement" select="'http://nictiz.nl/fhir/StructureDefinition/zib-DispenseRequest-RelatedMedicationAgreement'"/>
        
    <xsl:template match="f:MedicationRequest" mode="zib-DispenseRequest-2.2"> 
        <verstrekkingsverzoek>
            <!--identificatie-->
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <!--datum-->
            <xsl:apply-templates select="f:authoredOn" mode="#current"/>
            <!--auteur-->
            <xsl:apply-templates select="f:requester/f:agent" mode="#current"/>
            <!--te_verstrekken_hoeveelheid-->
            <xsl:apply-templates select="f:dispenseRequest/f:quantity" mode="#current"/>
            <!--aantal_herhalingen-->
            <xsl:apply-templates select="f:dispenseRequest/f:numberOfRepeatsAllowed" mode="#current"/>
            <!--te_verstrekken_geneesmiddel-->
            <xsl:apply-templates select="f:medicationReference" mode="#current"/>
            <!--verbruiksperiode-->
            <xsl:apply-templates select="f:dispenseRequest/f:expectedSupplyDuration" mode="#current"/>
            <!--beoogd_verstrekker-->
            <xsl:apply-templates select="f:dispenseRequest/f:performer" mode="#current"/>
            <!--afleverlocatie-->
            <xsl:apply-templates select="f:dispenseRequest/f:extension[@url = $zib-Dispense-Location]" mode="#current"/>
            <!--aanvullende_wensen-->
            <xsl:apply-templates select="f:extension[@url='http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation']" mode="ext-zib-Medication-AdditionalInformation-2.0"/>
            <!--toelichting-->
            <xsl:apply-templates select="f:note" mode="#current"/>
            <!--relatie_naar_medicatieafspraak-->
            <xsl:apply-templates select="f:extension[@url = $zib-DispenseRequest-RelatedMedicationAgreement]" mode="#current"/>
        </verstrekkingsverzoek>
    </xsl:template>
    
    <xsl:template match="f:identifier" mode="zib-DispenseRequest-2.2">
        <xsl:call-template name="Identifier-to-identificatie"/>
    </xsl:template>
    
    <xsl:template match="f:authoredOn" mode="zib-DispenseRequest-2.2">
        <datum>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>               
            </xsl:attribute>
        </datum>        
    </xsl:template>
    
    <xsl:template match="f:agent" mode="zib-DispenseRequest-2.2">
        <auteur>
            <xsl:choose>
                <xsl:when test="f:extension[@url = $practitionerrole-reference]">
                    <xsl:variable name="referenceValue" select="f:extension[@url = $practitionerrole-reference]/f:valueReference/f:reference/@value"/>
                    <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:PractitionerRole" mode="resolve-practitionerRole">
                        <xsl:with-param name="practitionerIdUnderscore" select="true()" tunnel="yes"/>
                        <xsl:with-param name="organizationIdUnderscore" select="true()" tunnel="yes"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="referenceValue" select="f:reference/@value"/>
                    <xsl:variable name="resource" select="(ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:*)[1]"/>
                    <xsl:choose>
                        <xsl:when test="$resource/local-name()='Practitioner'">
                            <xsl:apply-templates select="$resource" mode="nl-core-practitioner-2.0"/>
                        </xsl:when>
                        <xsl:when test="$resource/local-name()='Organization'">
                            <xsl:apply-templates select="$resource" mode="nl-core-organization-2.0"/>
                        </xsl:when>
                    </xsl:choose>
                    <!-- nl-core-patient, nl-core-relatedperson -->
                </xsl:otherwise>
            </xsl:choose>
        </auteur>
    </xsl:template>
    
    <xsl:template match="f:quantity" mode="zib-DispenseRequest-2.2">
        <te_verstrekken_hoeveelheid>
            <xsl:call-template name="Quantity-to-hoeveelheid-complex">
                <xsl:with-param name="adaWaarde">aantal</xsl:with-param>
            </xsl:call-template>
        </te_verstrekken_hoeveelheid>
    </xsl:template>
    
    <xsl:template match="f:numberOfRepeatsAllowed" mode="zib-DispenseRequest-2.2">
        <aantal_herhalingen/>
    </xsl:template>
    
    <xsl:template match="f:medicationReference" mode="zib-DispenseRequest-2.2">
        <xsl:variable name="referenceValue" select="f:reference/@value"/>
        <te_verstrekken_geneesmiddel>
            <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:Medication" mode="zib-PharmaceuticalProduct-2.0"/>
        </te_verstrekken_geneesmiddel>        
    </xsl:template>
    
    <xsl:template match="f:expectedSupplyDuration" mode="zib-DispenseRequest-2.2">
        <verbruiksperiode/>
    </xsl:template>
    
    <xsl:template match="f:performer" mode="zib-DispenseRequest-2.2">
        <beoogd_verstrekker>
            <xsl:choose>
                <xsl:when test="f:extension[@url = $practitionerrole-reference]">
                    <xsl:apply-templates select="f:extension[@url = $practitionerrole-reference]/f:valueReference" mode="#current"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="referenceValue" select="f:reference/@value"/>
                    <xsl:variable name="resource" select="(ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:*)[1]"/>
                    <xsl:choose>
                        <xsl:when test="$resource/local-name()='Practitioner'">
                            <xsl:apply-templates select="$resource" mode="nl-core-practitioner-2.0"/>
                        </xsl:when>
                        <xsl:when test="$resource/local-name()='Organization'">
                            <xsl:apply-templates select="$resource" mode="nl-core-organization-2.0"/>
                        </xsl:when>
                    </xsl:choose>
                    <!-- f:onBehalfOf? -->
                    <!-- nl-core-patient, HCIM MedicalDevice Product, nl-core-relatedperson -->
                </xsl:otherwise>
            </xsl:choose>
        </beoogd_verstrekker>
    </xsl:template>
    
    <xsl:template match="f:extension[@url = $zib-Dispense-Location]" mode="zib-DispenseRequest-2.2">
        <afleverlocatie/>
    </xsl:template>
    
    <xsl:template match="f:note" mode="zib-DispenseRequest-2.2">
        <toelichting value="{f:text/@value}"></toelichting>
    </xsl:template>
    
    <xsl:template match="f:extension[@url = $zib-DispenseRequest-RelatedMedicationAgreement]" mode="zib-DispenseRequest-2.2">
        <relatie_naar_medicatieafspraak>
            <xsl:call-template name="Identifier-to-identificatie">
                <xsl:with-param name="in" select="f:valueReference/f:identifier"/>
            </xsl:call-template>
        </relatie_naar_medicatieafspraak>
    </xsl:template>
    
</xsl:stylesheet>