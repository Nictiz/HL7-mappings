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
    <xsl:import href="ext-zib-medication-additional-information-2.0.xsl"/>
    <xsl:import href="zib-pharmaceuticalproduct-2.0.xsl"/>
    <xsl:import href="zib-instructions-for-use-2.0.xsl"/>
    <xsl:import href="nl-core-practitionerrole-2.0.xsl"/>
    <xsl:import href="nl-core-practitioner-2.0.xsl"/>
    <xsl:import href="nl-core-organization-2.0.xsl"/>
    <xsl:import href="nl-core-humanname-2.0.xsl"/>
    <xsl:import href="zib-body-height-2.1.xsl"/>
    <xsl:import href="zib-body-weight-2.1.xsl"/>
    <xsl:import href="zib-problem-2.1.xsl"/>-->

    <xsl:variable name="zib-MedicationUse" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse'"/>
    <xsl:variable name="prescriber-url" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Prescriber'"/>
    <xsl:variable name="author-url" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Author'"/>
    <xsl:variable name="asAgreedIndicator-url" select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-AsAgreedIndicator'"/>
    <xsl:variable name="copyIndicator-url" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-CopyIndicator'"/>
    <xsl:variable name="reasonForChangeOrDiscontinuationOfUse-url"  select="'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-ReasonForChangeOrDiscontinuationOfUse'"/>
    
    <xd:doc>
        <xd:desc>Template for converting f:MedicationStatement to MedicationUse</xd:desc>
    </xd:doc>
    <xsl:template match="f:MedicationStatement" mode="zib-MedicationUse-2.2">
        <medicatie_gebruik>
            <!-- Gebruiksperiode -->
            <xsl:apply-templates select="f:effectivePeriod" mode="#current"/>
            <!-- Identificatie  -->
            <xsl:apply-templates select="f:identifier" mode="#current"/>
            <!-- Registratiedatum -->
            <xsl:apply-templates select="f:dateAsserted" mode="#current"/>
            <!-- GebruiksIndicator -->
            <xsl:apply-templates select="f:taken" mode="#current"/>
            <!-- Volgens afspraak indicator -->
            <xsl:apply-templates select="f:extension[@url=$asAgreedIndicator-url]" mode="#current"/>
            <!-- Stoptype -->
            <xsl:apply-templates select="f:status" mode="#current"/>
            <!-- GebruiksProduct -->
            <xsl:apply-templates select="f:medicationReference" mode="#current"/>
            <!-- gebruiksinstructie -->
            <xsl:apply-templates select="f:dosage" mode="zib-instructions-for-use-2.0"/>
            <!-- Gerelateerde afspraak en Gerelateerde verstrekking -->
            <xsl:apply-templates select="f:derivedFrom" mode="#current"/>
            <!-- Voorschrijver -->
            <xsl:apply-templates select="f:extension[@url=$prescriber-url]" mode="#current"/>
            <!-- Informant -->
            <xsl:apply-templates select="f:informationSource" mode="#current"/>
            <!-- Auteur -->
            <xsl:apply-templates select="f:extension[@url=$author-url]" mode="#current"/>
            <!-- Reden gebruik --> 
            <xsl:apply-templates select="f:reasonCode" mode="#current"/>
            <!-- Reden wijzigen of stoppen gebruik -->
            <xsl:apply-templates select="f:extension[@url=$reasonForChangeOrDiscontinuationOfUse-url]" mode="#current"/>
            <!-- Kopie indicator -->
            <xsl:apply-templates select="f:extension[@url=$copyIndicator-url]" mode="ext-zib-Medication-CopyIndicator-2.0"/>
            <!-- Toelichting -->
            <xsl:apply-templates select="f:note" mode="#current"/>
        </medicatie_gebruik>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:identifier to identificatie</xd:desc>
    </xd:doc>
    <xsl:template match="f:identifier" mode="zib-MedicationUse-2.2">
        <xsl:call-template name="Identifier-to-identificatie"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Templates to convert f:effectivePeriod to gebruiksperiode</xd:desc>
    </xd:doc>
    <xsl:template match="f:effectivePeriod" mode="zib-MedicationUse-2.2">
        <xsl:apply-templates select="f:start" mode="#current"/>
        <xsl:apply-templates select="f:end" mode="#current"/>
    </xsl:template>
    <xsl:template match="f:start" mode="zib-MedicationUse-2.2">
        <gebruiksperiode_start>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="datatype">datetime</xsl:attribute>
        </gebruiksperiode_start>
    </xsl:template>
    <xsl:template match="f:end" mode="zib-MedicationUse-2.2">
        <gebruiksperiode_eind>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="datatype">datetime</xsl:attribute>
        </gebruiksperiode_eind>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:dateAsserted to registratiedatum</xd:desc>
    </xd:doc>
    <xsl:template match="f:dateAsserted" mode="zib-MedicationUse-2.2">
        <registratiedatum>
            <xsl:attribute name="value">
                <xsl:call-template name="format2ADADate">
                    <xsl:with-param name="dateTime" select="@value"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="datatype">datetime</xsl:attribute>
        </registratiedatum>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:taken to gebruik_indicator</xd:desc>
    </xd:doc>
    <xsl:template match="f:taken" mode="zib-MedicationUse-2.2">
        <gebruik_indicator>
            <xsl:choose>
                <xsl:when test="@value = 'y'">
                    <xsl:attribute name="value" select="'true'"/>
                </xsl:when>
                <xsl:when test="@value = 'n'">
                    <xsl:attribute name="value" select="'false'"/>
                </xsl:when>
                <xsl:when test="@value = 'na'">
                    <xsl:attribute name="nullFlavor" select="'NA'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="nullFlavor" select="'UNK'"/>
                </xsl:otherwise>
            </xsl:choose>
        </gebruik_indicator>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:medicationReference to gebruiks_product</xd:desc>
    </xd:doc>
    <xsl:template match="f:medicationReference" mode="zib-MedicationUse-2.2">
        <xsl:variable name="referenceValue" select="f:reference/@value"/>
        <gebruiks_product>
            <xsl:apply-templates
                select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:Medication"
                mode="zib-PharmaceuticalProduct-2.0"/>
        </gebruiks_product>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:informationSource to informant</xd:desc>
    </xd:doc>
    <xsl:template match="f:informationSource" mode="zib-MedicationUse-2.2">
        <xsl:variable name="referenceValue" select="f:reference/@value"/>
        <xsl:variable name="referenceValuePractitionerRole"
            select="f:extension/f:valueReference/f:reference/@value"/>
        <informant>
            <xsl:choose>
                <xsl:when
                    test="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:Patient">
                    <informant_is_patient>
                        <xsl:attribute name="value" select="'true'"/>
                    </informant_is_patient>
                </xsl:when>
                <xsl:when
                    test="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:Practitioner or ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValuePractitionerRole]/f:resource/f:PractitionerRole">
                    <informant_is_zorgverlener>
                        <xsl:attribute name="value" select="'true'"/>
                    </informant_is_zorgverlener>
                </xsl:when>
                <xsl:when
                    test="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource/f:RelatedPerson">
                    <persoon>
                        <xsl:attribute name="value" select="'true'"/>
                    </persoon>
                </xsl:when>
            </xsl:choose>
        </informant>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:derivedFrom to gerelateerde_afspraak and gerelateerde_verstrekking</xd:desc>
    </xd:doc>
    <xsl:template match="f:derivedFrom" mode="zib-MedicationUse-2.2">
        <xsl:choose>
            <xsl:when test="f:reference">
                <xsl:variable name="referenceValue" select="f:reference/@value"/>
                <xsl:variable name="resource" select="ancestor::f:Bundle/f:entry[f:fullUrl/@value = $referenceValue]/f:resource"/>
                <xsl:choose>
                    <xsl:when
                        test="$resource/f:MedicationRequest/f:category/f:coding/f:code/@value='16076005' or $resource/f:MedicationDispense/f:category/f:coding/f:code/@value='422037009' ">
                        <gerelateerde_afspraak>
                            <xsl:choose>
                                <xsl:when test="$resource/f:MedicationRequest/f:category/f:coding/f:code/@value='16076005'">
                                    <xsl:call-template name="Identifier-to-identificatie">
                                        <xsl:with-param name="in" select="$resource/f:MedicationRequest/f:identifier"/>
                                        <xsl:with-param name="adaElementName">identificatie_medicatieafspraak</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:when test="$resource/f:MedicationDispense/f:category/f:coding/f:code/@value='422037009'">
                                    <xsl:call-template name="Identifier-to-identificatie">
                                        <xsl:with-param name="in" select="$resource/f:MedicationRequest/f:identifier"/>
                                        <xsl:with-param name="adaElementName">identificatie_toedieningsafspraak</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:when>
                            </xsl:choose>    
                        </gerelateerde_afspraak>
                    </xsl:when>
                    <xsl:when
                        test="$resource/f:MedicationDispense/f:category/f:coding/f:code/@value='373784005'">
                        <gerelateerde_verstrekking>
                            <xsl:call-template name="Identifier-to-identificatie">
                                <xsl:with-param name="in" select="$resource/f:MedicationDispense/f:identifier"/>
                                <xsl:with-param name="adaElementName">identificatie</xsl:with-param>
                            </xsl:call-template>
                        </gerelateerde_verstrekking>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
          <!-- WRONG! NEED TO CHECK THIS. -->
          <!--  <xsl:when test="f:identifier">
                <gerelateerde_afspraak>
                    <xsl:call-template name="Identifier-to-identificatie">
                    <xsl:with-param name="adaElementName">identificatie_medicatieafspraak</xsl:with-param>
                    </xsl:call-template>
                </gerelateerde_afspraak>
            </xsl:when>-->
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:extension with extension url "$author-url" to auteur</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url=$author-url]" mode="zib-MedicationUse-2.2">
        <xsl:variable name="referenceValue" select="f:valueReference/f:reference/@value"/>
        <xsl:variable name="resource" select="(ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:*)[1]"/>
        <auteur>
            <xsl:choose>
                <xsl:when test="$resource/local-name()='Patient'">        
                    <auteur_is_patient>
                        <xsl:attribute name="value" select="'true'"/>
                    </auteur_is_patient>
                </xsl:when>
                <xsl:when test="$resource/local-name()='Practitioner'">
                    <auteur_is_zorgverlener>
                        <xsl:apply-templates select="$resource" mode="nl-core-practitioner-2.0">
                            <xsl:with-param name="practitionerIdUnderscore" select="true()" tunnel="yes"/>
                        </xsl:apply-templates>
                    </auteur_is_zorgverlener>    
                </xsl:when>
                <xsl:when test="$resource/local-name()='PractitionerRole'">
                    <auteur_is_zorgverlener>
                        <xsl:apply-templates select="$resource" mode="resolve-practitionerRole">
                            <xsl:with-param name="practitionerIdUnderscore" select="true()" tunnel="yes"/>
                            <xsl:with-param name="organizationIdUnderscore" select="true()" tunnel="yes"/>
                        </xsl:apply-templates>
                    </auteur_is_zorgverlener>    
                </xsl:when>
                <xsl:when test="$resource/local-name()='Organization'">
                    <auteur_is_zorgverlener>
                        <xsl:apply-templates select="$resource" mode="nl-core-organization-2.0">
                            <xsl:with-param name="organizationIdUnderscore" select="true()" tunnel="yes"/>
                        </xsl:apply-templates>
                    </auteur_is_zorgverlener>   
                </xsl:when>
            </xsl:choose>            
        </auteur>   
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:extension with extension url "$prescriber-url" to voorschrijver</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url=$prescriber-url]" mode="zib-MedicationUse-2.2">
        <xsl:variable name="referenceValue" select="f:valueReference/f:reference/@value"/>
        <xsl:variable name="resource" select="(ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:*)[1]"/>
        <voorschrijver>
            <xsl:choose>
                <xsl:when test="$resource/local-name()='PractitionerRole'">
                    <xsl:apply-templates select="ancestor::f:Bundle/f:entry[f:fullUrl/@value=$referenceValue]/f:resource/f:PractitionerRole" mode="resolve-practitionerRole">
                        <xsl:with-param name="organizationIdUnderscore" select="true()" tunnel="yes"/>
                        <xsl:with-param name="practitionerIdUnderscore" select="true()" tunnel="yes"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="$resource/local-name()='Practitioner'">
                    <xsl:apply-templates select="$resource" mode="nl-core-practitioner-2.0">
                        <xsl:with-param name="practitionerIdUnderscore" select="true()" tunnel="yes"/>
                    </xsl:apply-templates>
                </xsl:when>
            </xsl:choose>
        </voorschrijver>
    </xsl:template> 
    
    <xd:doc>
        <xd:desc>Template to convert f:extension with extension url "$asAgreedIndicator-url" to volgens_afspraak_indicator</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url=$asAgreedIndicator-url]" mode="zib-MedicationUse-2.2">
        <volgens_afspraak_indicator>
            <xsl:attribute name="value" select="f:valueBoolean/@value"/>
        </volgens_afspraak_indicator>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:reasonCode to reden_gebruik</xd:desc>
    </xd:doc>
    <xsl:template match="f:reasonCode" mode="zib-MedicationUse-2.2">
        <reden_gebruik value="{f:text/@value}"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:extension with extension url "$reasonForChangeOrDiscontinuationOfUse-url" to reden_wijzigen_of_stoppen_gebruik</xd:desc>
        <xd:param name="in">Input which is a FHIR CodeableConcept</xd:param>
        <xd:param name="adaElementName">The desired output ADA element name</xd:param>
    </xd:doc>
    <xsl:template match="f:extension[@url=$reasonForChangeOrDiscontinuationOfUse-url]" mode="zib-MedicationUse-2.2">         
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="f:valueCodeableConcept"/>
            <xsl:with-param name="adaElementName" select="'reden_wijzigen_of_stoppen_gebruik'"/>
        </xsl:call-template>    
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:status to stoptype. Only the FHIR status values that map to a ADA stoptype value are mapped.</xd:desc>
    </xd:doc>
    <xsl:template match="f:status" mode="zib-MedicationUse-2.2">
        <xsl:choose>
            <xsl:when test="@value='on-hold'">
                <stoptype
                    code="1"
                    codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1"
                    displayName="Onderbreking"/>
            </xsl:when>
            <xsl:when test="@value='stopped'">
                <stoptype
                    code="2"
                    codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1"
                    displayName="Definitief"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:note to toelichting.</xd:desc>
    </xd:doc>
    <xsl:template match="f:note" mode="zib-MedicationUse-2.2">
        <toelichting value="{f:text/@value}"/>
    </xsl:template>

</xsl:stylesheet>
