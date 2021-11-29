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
    xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:util="urn:hl7:utilities"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:variable name="zib-MedicationAgreement" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement'"/>
    <xsl:variable name="practitionerrole-reference" select="'http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference'"/>
    <xsl:variable name="zib-Medication-StopType" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-StopType'"/>
    <xsl:variable name="zib-Medication-PeriodOfUse" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse'"/>
    <xsl:variable name="zib-MedicationAgreement-BasedOnAgreementOrUse" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-BasedOnAgreementOrUse'"/>
    <xsl:variable name="zib-MedicationUse-Duration" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration'"/>
    <xsl:variable name="zib-Medication-CopyIndicator" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-CopyIndicator'"/>
    <xsl:variable name="zib-Medication-AdditionalInformation" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation'"/>
            
    <xd:doc>
        <xd:desc>Template to convert f:MedicationRequest to ADA medicatieafspraak</xd:desc>
    </xd:doc>
    <xsl:template match="f:MedicationRequest" mode="nl-core-MedicationAgreement"> 
        <medicatieafspraak>
            <!-- gebruiksperiode_start -->
            <!-- gebruiksperiode_eind -->
            <xsl:apply-templates select="f:extension[@url = $zib-Medication-PeriodOfUse]" mode="ext-zib-Medication-PeriodOfUse-2.0"/>
            <!-- identificatie -->
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <!-- afspraakdatum -->
            <xsl:apply-templates select="f:authoredOn" mode="#current"/>
            <!-- gebruiksperiode -->   
            <xsl:apply-templates select="f:extension[@url = $zib-MedicationUse-Duration]" mode="ext-zib-medication-use-duration-2.0"/>
            <!-- geannuleerd_indicator  -->
            <xsl:apply-templates select="f:status" mode="#current"/>
            <!-- stoptype -->
            <xsl:apply-templates select="f:modifierExtension[@url = $zib-Medication-StopType]" mode="ext-zib-Medication-Stop-Type-2.0"/>
            <!-- relatie_naar_afspraak_of_gebruik -->
            <xsl:apply-templates select="f:extension[@url = $zib-MedicationAgreement-BasedOnAgreementOrUse]" mode="#current"/>
            <!-- relaties_ketenzorg -->
            <xsl:apply-templates select="f:context" mode="#current"/>
            <!-- voorschrijver -->
            <xsl:apply-templates select="f:requester" mode="#current"/>
            <!-- reden_wijzigen_of_staken -->
            <xsl:apply-templates select="f:reasonCode" mode="#current"/>
            <!-- reden_van_voorschrijven -->
            <xsl:apply-templates select="f:reasonReference" mode="#current"/>
            <!-- afgesproken_geneesmiddel -->
            <xsl:apply-templates select="f:medicationReference" mode="#current"/>
            <!-- gebruiksinstructie -->
            <xsl:apply-templates select="f:dosageInstruction" mode="zib-instructions-for-use-2.0"/>
            <!-- lichaamslengte -->
            <xsl:apply-templates select="f:supportingInformation" mode="resolve-bodyHeight"/>
            <!-- lichaamsgewicht -->
            <xsl:apply-templates select="f:supportingInformation" mode="resolve-bodyWeight"/>
            <!-- aanvullende_informatie -->
            <xsl:apply-templates select="f:extension[@url = $zib-Medication-AdditionalInformation]" mode="ext-zib-Medication-AdditionalInformation-2.0"/>
            <!-- kopie indicator -->
            <xsl:apply-templates select="f:extension[@url = $zib-Medication-CopyIndicator]" mode="ext-zib-Medication-CopyIndicator-2.0"/>
            <!-- toelichting -->
            <xsl:apply-templates select="f:note" mode="#current"/>
        </medicatieafspraak>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:identifier to identificatie</xd:desc>
    </xd:doc>
    <xsl:template match="f:identifier" mode="nl-core-MedicationAgreement">
        <xsl:call-template name="Identifier-to-identificatie"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:medicationReference to afgesproken_geneesmiddel</xd:desc>
    </xd:doc>
    <xsl:template match="f:medicationReference" mode="nl-core-MedicationAgreement">
        <xsl:variable name="referenceValue" select="f:reference/@value"/>
        <afgesproken_geneesmiddel>
            <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:Medication" mode="zib-PharmaceuticalProduct-2.0"/>
        </afgesproken_geneesmiddel>        
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:authoredOn to afspraakdatum</xd:desc>
    </xd:doc>
    <xsl:template match="f:authoredOn" mode="nl-core-MedicationAgreement">
        <afspraakdatum>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>               
            </xsl:attribute>
            <!--<xsl:attribute name="datatype">datetime</xsl:attribute>-->
        </afspraakdatum>        
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:status to geannuleerd_indicator. Only the FHIR status value 'entered-in-error' is used in this mapping.</xd:desc>
    </xd:doc>
    <xsl:template match="f:status" mode="nl-core-MedicationAgreement">
        <xsl:if test="@value='entered-in-error'">
            <geannuleerd_indicator value="true"/>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:requester to voorschrijver</xd:desc>
    </xd:doc>
    <xsl:template match="f:requester" mode="nl-core-MedicationAgreement">
        <voorschrijver>
            <xsl:choose>
                <xsl:when test="f:agent/f:extension[@url = $practitionerrole-reference]">
                    <xsl:variable name="referenceValue" select="f:agent/f:extension[@url = $practitionerrole-reference]/f:valueReference/f:reference/@value"/>
                    <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:PractitionerRole" mode="resolve-practitionerRole"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="referenceValue" select="f:agent/f:reference/@value"/>
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
                    <!-- nl-core-patient, nl-core-relatedperson -->
                </xsl:otherwise>
            </xsl:choose>
        </voorschrijver>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:reasonCode to reden_wijzigen_of_staken</xd:desc>
    </xd:doc>
    <xsl:template match="f:reasonCode" mode="nl-core-MedicationAgreement">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'reden_wijzigen_of_staken'"/>
        </xsl:call-template>    
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:reasonReference to reden_van_voorschrijven</xd:desc>
    </xd:doc>
    <xsl:template match="f:reasonReference" mode="nl-core-MedicationAgreement">
        <xsl:variable name="reference" select="f:reference/@value"/>
        <reden_van_voorschrijven>
            <!--<xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $reference]/f:Observation" mode="general-observation"/>-->
            <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $reference]/f:resource/f:Condition[f:meta/f:profile/@value='http://nictiz.nl/fhir/StructureDefinition/zib-Problem']" mode="zib-problem-2.1"/>
        </reden_van_voorschrijven>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:extension with extension url "$zib-MedicationAgreement-BasedOnAgreementOrUse" to relatie_naar_afspraak_of_gebruik</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url = $zib-MedicationAgreement-BasedOnAgreementOrUse]" mode="nl-core-MedicationAgreement">
        <relatie_naar_afspraak_of_gebruik>
            <xsl:choose>
                <xsl:when test="f:valueReference/f:reference">
                    <xsl:variable name="referenceValue" select="f:valueReference/f:reference/@value"/>
                    <xsl:variable name="resource" select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource"/>
                    <xsl:variable name="resourceCategoryCode" select="$resource/f:*/f:category/f:coding/f:code/@value"/>
                    <xsl:choose>
                        <xsl:when test="$resourceCategoryCode = '16076005'">
                            <!-- medicatieafspraak -->
                            <xsl:call-template name="Identifier-to-identificatie">
                                <xsl:with-param name="in" select="$resource/f:MedicationRequest/f:identifier"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$resourceCategoryCode = '422037009'">
                            <!-- toedieningsafspraak -->
                            <xsl:call-template name="Identifier-to-identificatie">
                                <xsl:with-param name="in" select="$resource/f:MedicationDispense/f:identifier"/>
                                <xsl:with-param name="adaElementName">identificatie_23288</xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$resourceCategoryCode = '6'">
                            <!-- medicatiegebruik -->
                            <xsl:call-template name="Identifier-to-identificatie">
                                <xsl:with-param name="in" select="$resource/f:MedicationStatement/f:identifier"/>
                                <xsl:with-param name="adaElementName">identificatie_23289</xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="f:valueReference/f:identifier">
                    <xsl:variable name="identifier_type" select="f:valueReference/f:identifier/f:type/f:coding/f:value/@value"/>
                    <xsl:variable name="referenceValue" select="f:valueReference/f:identifier/concat(f:system/@value,f:value/@value)"/>
                    <xsl:variable name="medicationagreement_resource" select="ancestor::f:Bundle/f:entry/f:resource/f:MedicationRequest[f:category/f:coding/f:code/@value = '16076005']/f:identifier[concat(f:system/@value,f:value/@value) = $referenceValue]"/>
                    <xsl:variable name="administrationagreement_resource" select="ancestor::f:Bundle/f:entry/f:resource/f:MedicationDispense[f:category/f:coding/f:code/@value = '422037009']/f:identifier[concat(f:system/@value,f:value/@value) = $referenceValue]"/>
                    <xsl:variable name="medicationuse_resource" select="ancestor::f:Bundle/f:entry/f:resource/f:MedicationStatement[f:category/f:coding/f:code/@value = '6']/f:identifier[concat(f:system/@value,f:value/@value) = $referenceValue]"/>
                    <xsl:choose> 
                        <!-- First try to use the f:derivedFrom/f:identifier based on the f:identifier/f:type -->
                        <xsl:when test="$identifier_type = '16076005'">
                            <xsl:call-template name="Identifier-to-identificatie">
                                <xsl:with-param name="in" select="f:valueReference/f:identifier"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$identifier_type = '422037009'">
                            <xsl:call-template name="Identifier-to-identificatie">
                                <xsl:with-param name="in" select="f:valueReference/f:identifier"/>
                                <xsl:with-param name="adaElementName">identificatie_23288</xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$identifier_type = '6'">
                            <xsl:call-template name="Identifier-to-identificatie">
                                <xsl:with-param name="in" select="f:valueReference/f:identifier"/>
                                <xsl:with-param name="adaElementName">identificatie_23289</xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <!-- Try to resolve f:derivedFrom/f:identifier within Bundle -->
                        <xsl:when test="$medicationagreement_resource">
                            <xsl:call-template name="Identifier-to-identificatie">
                                <xsl:with-param name="in" select="$medicationagreement_resource"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$administrationagreement_resource">
                            <xsl:call-template name="Identifier-to-identificatie">
                                <xsl:with-param name="in" select="$administrationagreement_resource"/>
                                <xsl:with-param name="adaElementName">identificatie_23288</xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$medicationuse_resource">
                            <xsl:call-template name="Identifier-to-identificatie">
                                <xsl:with-param name="in" select="$medicationuse_resource"/>
                                <xsl:with-param name="adaElementName">identificatie_23289</xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="level" select="$logERROR"/>
                        <xsl:with-param name="msg">
                            <xsl:text>MedicationRequest with fullUrl '</xsl:text>
                            <xsl:value-of select="parent::f:MedicationRequest/parent::f:resource/preceding-sibling::f:fullUrl/@value"/>
                            <xsl:text>' .extension BasedOnAgreementOrUse reference cannot be resolved within the Bundle nor can the type of reference be determined by the identifier.type. Therefore information (relatie_naar_afspraak_of_gebruik/identificatie, identificatie_23288 or identificatie_23289) will be lost.</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </relatie_naar_afspraak_of_gebruik>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:context to relaties_ketenzorg with identificatie_contactmoment of identificatie_episode based on identifier or reference.</xd:desc>
    </xd:doc>
    <xsl:template match="f:context" mode="nl-core-MedicationAgreement">
        <relaties_ketenzorg>
            <!-- identificatie_contactmoment - zib-Encounter - resource: Encounter -->
            <!-- identificatie_episode - nl-core-episodeofcare - resource: EpisodeOfCare -->
            <xsl:choose>
                <xsl:when test="f:reference">
                    <xsl:variable name="referenceValue" select="f:reference/@value"/>
                    <xsl:variable name="resource" select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource"/>
                    <xsl:choose>
                        <xsl:when test="$resource/f:Encounter">
                            <xsl:call-template name="Identifier-to-identificatie">
                                <xsl:with-param name="in" select="$resource/f:Encounter/f:identifier"/>
                                <xsl:with-param name="adaElementName">identificatie_contactmoment</xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$resource/f:EpisodeOfCare">
                            <xsl:call-template name="Identifier-to-identificatie">
                                <xsl:with-param name="in" select="$resource/f:EpisodeOfCare/f:identifier"/>
                                <xsl:with-param name="adaElementName">identificatie_episode</xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="f:identifier">
                    <xsl:variable name="referenceValue" select="f:identifier/concat(f:system/@value,f:value/@value)"/>
                    <xsl:variable name="encounter_resource" select="ancestor::f:Bundle/f:entry/f:resource/f:Encounter/f:identifier[concat(f:system/@value,f:value/@value) = $referenceValue]"/>
                    <xsl:variable name="episodeofcare_resource" select="ancestor::f:Bundle/f:entry/f:resource/f:EpisodeOfCare/f:identifier[concat(f:system/@value,f:value/@value) = $referenceValue]"/>
                    <xsl:choose> 
                        <!-- Try to resolve f:identifier within Bundle -->
                        <xsl:when test="$encounter_resource">
                            <xsl:call-template name="Identifier-to-identificatie">
                                <xsl:with-param name="in" select="$encounter_resource"/>
                                <xsl:with-param name="adaElementName">identificatie_contactmoment</xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$episodeofcare_resource">
                            <xsl:call-template name="Identifier-to-identificatie">
                                <xsl:with-param name="in" select="$episodeofcare_resource"/>
                                <xsl:with-param name="adaElementName">identificatie_episode</xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="level" select="$logERROR"/>
                        <xsl:with-param name="msg">
                            <xsl:text>MedicationRequest with fullUrl '</xsl:text>
                            <xsl:value-of select="parent::f:MedicationRequest/parent::f:resource/preceding-sibling::f:fullUrl/@value"/>
                            <xsl:text>' .context reference cannot be resolved within the Bundle nor can the type of reference be determined by the identifier. Therefore information (identificatie_contactmoment or identificatie_episode) will be lost.</xsl:text>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </relaties_ketenzorg>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:note to toelichting</xd:desc>
    </xd:doc>
    <xsl:template match="f:note" mode="nl-core-MedicationAgreement">
        <toelichting value="{f:text/@value}"></toelichting>
    </xsl:template>
    
</xsl:stylesheet>
