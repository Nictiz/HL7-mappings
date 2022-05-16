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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!--<xsl:import href="_zib2017.xsl"/>
    <xsl:import href="ext-zib-medication-additional-information-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-copy-indicator-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-instructions-for-use-description-1.0.xsl"/>
    <xsl:import href="ext-zib-medication-medication-treatment-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-period-of-use-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-repeat-period-cyclical-schedule-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-stop-type-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-use-duration-2.0.xsl"/>
    <xsl:import href="nl-core-practitioner-2.0.xsl"/>
    <xsl:import href="nl-core-practitionerrole-2.0.xsl"/>
    <xsl:import href="zib-instructions-for-use-3.0.xsl"/>-->
   
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>

    <xd:doc>
        <xd:desc>Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-MedicationUse/ version 3.0 </xd:desc>
        <xd:param name="uuid">If true generate uuid from scratch. Defaults to false(). Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="adaPatient">Optional, but should be there. Patient this AllergyIntolerance is for.</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.xxx.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="MedicationUseEntry-3.0" match="medicatiegebruik[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | medication_use[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element()" mode="doMedicationUseEntry-3.0">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        <xsl:param name="entryFullUrl" select="nf:get-fhir-uuid(.)"/>
        <xsl:param name="fhirResourceId">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="not($uuid) and string-length(nf:removeSpecialCharacters((identificatie | zibroot/identificatienummer | hcimroot/identification_number)/@value)) gt 0">
                        <xsl:value-of select="nf:removeSpecialCharacters(string-join((identificatie | zibroot/identificatienummer | hcimroot/identification_number)/@value, ''))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>

        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="zib-MedicationUse-3.0">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                </xsl:call-template>
            </resource>
            <xsl:if test="string-length($searchMode) gt 0">
                <search>
                    <mode value="{$searchMode}"/>
                </search>
            </xsl:if>
        </entry>

    </xsl:template>

    <xd:doc>
        <xd:desc>Template based on FHIR Profile https://simplifier.net/nictizstu3-zib2017/zib-medicationuse</xd:desc>
    </xd:doc>
    <xd:doc>
        <xd:desc>Template based on FHIR Profile https://simplifier.net/nictizstu3-zib2017/zib-medicationuse</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of a resource</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-MedicationUse-3.0" match="medicatiegebruik[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | medication_use[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doZibMedicationUse-3.0" as="element()">
        <xsl:param name="in"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>

        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse</xsl:variable>
                <MedicationStatement>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                    </xsl:if>
                    <meta>
                        <profile value="{$profileValue}"/>
                    </meta>
                    
                    <!-- volgens_afspraak_indicator -->
                    <xsl:for-each select="./volgens_afspraak_indicator[@value]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-AsAgreedIndicator">
                            <valueBoolean value="{./@value}"/>
                        </extension>
                    </xsl:for-each>
                    
                    <!-- voorschrijver in extension -->
                    <xsl:for-each select="./voorschrijver/zorgverlener[.//(@value | @code)]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Prescriber">
                            <valueReference>
                                <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                            </valueReference>
                        </extension>
                    </xsl:for-each>
                    
                    <!-- auteur -->
                    <xsl:for-each select="./auteur[.//@value]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Author">
                            <xsl:choose>
                                <xsl:when test="./auteur_is_zorgverlener[.//@value]">
                                    <valueReference>
                                        <xsl:apply-templates select="./auteur_is_zorgverlener/zorgverlener" mode="doPractitionerRoleReference-2.0"/>
                                    </valueReference>
                                </xsl:when>
                                <xsl:when test="./auteur_is_patient[@value = 'true']">
                                    <valueReference>
                                        <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference-2.1"/>
                                    </valueReference>
                                </xsl:when>
                                <xsl:when test="./auteur_is_zorgaanbieder[.//@value]">
                                    <valueReference>
                                        <xsl:apply-templates select="./auteur_is_zorgaanbieder/zorgaanbieder" mode="doOrganizationReference-2.0"/>
                                    </valueReference>
                                </xsl:when>
                            </xsl:choose>
                        </extension>
                    </xsl:for-each>
                    
                    <!-- relatie naar medicamenteuze behandeling -->
                    <xsl:for-each select="./../identificatie[@value]">
                        <xsl:call-template name="ext-zib-medication-medication-treatment-2.0">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                    
                    <!-- kopie indicator -->
                    <!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
                    <xsl:for-each select="./kopie_indicator[@value]">
                        <xsl:call-template name="ext-zib-Medication-CopyIndicator-2.0"/>
                    </xsl:for-each>
                    
                    <!-- reden_wijzigen_of_stoppen_gebruik -->
                    <xsl:for-each select="./reden_wijzigen_of_stoppen_gebruik[@code]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-ReasonForChangeOrDiscontinuationOfUse">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="treatNullFlavorAsCoding" select="@code = 'OTH' and @codeSystem = $oidHL7NullFlavor"/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </xsl:for-each>
                    
                    <!-- instructionsForUseDescription -->
                    <xsl:call-template name="ext-zib-Medication-InstructionsForUseDescription-1.0">
                        <xsl:with-param name="in" select="gebruiksinstructie/omschrijving[@value | @nullFlavor]"/>
                    </xsl:call-template>
                    
                    <!-- herhaalperiode cyclisch schema -->
                    <xsl:for-each select="./gebruiksinstructie/herhaalperiode_cyclisch_schema[@value]">
                        <xsl:call-template name="ext-zib-Medication-RepeatPeriodCyclicalSchedule-2.0"/>
                    </xsl:for-each>
                    
                    <!-- medicatiegebruik id -->
                    <xsl:for-each select="./identificatie[@value]">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    
                    <!-- stoptype mapt bij medicatiegebruik op status -->
                    <xsl:choose>
                        <xsl:when test="stoptype/@code = ('1', '112171000146100')">
                            <status value="on-hold"/>
                        </xsl:when>
                        <xsl:when test="stoptype/@code = ('2', '112161000146106')">
                            <status value="stopped"/>
                        </xsl:when>
                        <xsl:when test="stoptype[@codeSystem = $oidHL7NullFlavor]">
                            <extension url="{$urlExtHL7NullFlavor}">
                                <valueCode value="{$in/@code}"/>
                            </extension>
                        </xsl:when>
                        <xsl:when test="stoptype/@code">
                            <xsl:message terminate="yes">An unknown stoptype has been encountered, @code: <xsl:value-of select="stoptype/@code"/>, @codeSystem: <xsl:value-of select="stoptype/@codeSystem"/></xsl:message>
                        </xsl:when>
                        <xsl:otherwise>
                            <status>
                                <extension url="{$urlExtHL7DataAbsentReason}">
                                    <valueCode value="unknown"/>
                                </extension>
                            </status>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <!-- type bouwsteen, hier medicatiegebruik -->
                    <category>
                        <coding>
                            <system value="urn:oid:2.16.840.1.113883.2.4.3.11.60.20.77.5.3"/>
                            <code value="6"/>
                            <display value="Medicatiegebruik"/>
                        </coding>
                        <text value="Medicatiegebruik"/>
                    </category>
                    
                    <!-- geneesmiddel -->
                    <xsl:apply-templates select="./gebruiks_product/product[.//(@value | @code)]" mode="doMedicationReference"/>
                    
                    <!-- gebruiksperiode -->
                    <xsl:for-each select=".[(gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode)[@value]]">
                        <effectivePeriod>
                            <xsl:for-each select="./gebruiksperiode[@value]">
                                <xsl:call-template name="ext-zib-Medication-Use-Duration"/>
                            </xsl:for-each>
                            <xsl:for-each select="gebruiksperiode_start[@value]">
                                <start>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </start>
                            </xsl:for-each>
                            <xsl:for-each select="gebruiksperiode_eind[@value]">
                                <end>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </end>
                            </xsl:for-each>
                        </effectivePeriod>
                    </xsl:for-each>
                    
                    <!-- registratiedatum -->
                    <xsl:for-each select="./registratiedatum[@value]">
                        <dateAsserted value="{nf:add-Amsterdam-timezone-to-dateTimeString(./@value)}"/>
                    </xsl:for-each>
                    <xsl:for-each select="./registratiedatum[@nullFlavor]">
                        <dateAsserted>
                            <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                                <valueCode value="{./@nullFlavor}"/>
                            </extension>
                        </dateAsserted>
                    </xsl:for-each>
                    
                    <!-- informant -->
                    <xsl:for-each select="informant[.//@value]">
                        <informationSource>
                            <xsl:choose>
                                <xsl:when test="persoon[.//@value]">
                                    <xsl:apply-templates select="persoon" mode="doRelatedPersonReference-2.0"/>
                                </xsl:when>
                                <xsl:when test="informant_is_patient[@value = 'true']">
                                    <xsl:apply-templates select="ancestor::*[ancestor::data]/patient" mode="doPatientReference-2.1"/>
                                </xsl:when>
                                <xsl:when test="informant_is_zorgverlener[.//@value]">
                                    <xsl:for-each select="informant_is_zorgverlener/zorgverlener">
                                        <xsl:call-template name="practitionerRoleReference">
                                            <xsl:with-param name="useExtension" select="true()"/>
                                            <xsl:with-param name="addDisplay" select="false()"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="practitionerReference"/>
                                    </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>
                        </informationSource>
                    </xsl:for-each>
                    
                    <!-- patiënt -->
                    <subject>
                        <xsl:apply-templates select="../../patient" mode="doPatientReference-2.1"/>
                    </subject>
                    
                    <!-- gerelateerde_afspraak en gerelateerde_verstrekking-->
                    <xsl:for-each select="./((gerelateerde_afspraak/(identificatie_medicatieafspraak | identificatie_toedieningsafspraak)) | (gerelateerde_verstrekking/identificatie))[@value]">
                        <derivedFrom>
                            <identifier>
                                <xsl:call-template name="id-to-Identifier">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </identifier>
                            <display>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <xsl:when test="./name() = 'identificatie_medicatieafspraak'">relatie naar medicatieafspraak</xsl:when>
                                        <xsl:when test="./name() = 'identificatie_toedieningsafspraak'">relatie naar toedieningsafspraak</xsl:when>
                                        <xsl:when test="./name() = 'identificatie'">relatie naar verstrekking</xsl:when>
                                    </xsl:choose>
                                </xsl:attribute>
                            </display>
                        </derivedFrom>
                    </xsl:for-each>
                    
                    <!-- gebruik_indicator -->
                    <xsl:for-each select="./gebruik_indicator[@value | @nullFlavor]">
                        <taken>
                            <xsl:attribute name="value">
                                <xsl:choose>
                                    <xsl:when test="@value = 'true'">y</xsl:when>
                                    <xsl:when test="@value = 'false'">n</xsl:when>
                                    <xsl:when test="@nullFlavor = 'NA'">na</xsl:when>
                                    <xsl:when test="@nullFlavor">unk</xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                        </taken>
                    </xsl:for-each>
                    <!-- reden gebruik -->
                    <xsl:for-each select="reden_gebruik[@value]">
                        <reasonCode>
                            <text value="{@value}"/>
                        </reasonCode>
                    </xsl:for-each>
                    <!-- toelichting -->
                    <xsl:for-each select="toelichting[@value]">
                        <note>
                            <text value="{@value}"/>
                        </note>
                    </xsl:for-each>
                     
                    <!-- gebruiksinstructie -->
                    <xsl:call-template name="handle-gebruiksinstructie-3.0">
                        <xsl:with-param name="in" select="gebruiksinstructie"/>
                        <!-- don't output text from MP 9.1 onwards -->
                        <xsl:with-param name="outputText" select="false()"/>
                    </xsl:call-template>
                    
                </MedicationStatement>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
