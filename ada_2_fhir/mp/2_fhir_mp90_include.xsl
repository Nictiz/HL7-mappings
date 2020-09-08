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
    <xsl:import href="2_fhir_mp91_include.xsl"/>
    <xsl:output method="xml" indent="yes"/>

    <!-- all the stuff only relevant for 9.0 or before and no longer for 9.1 is in this xsl, goal is to eventually phase out this xsl  -->
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- whether or not to output kopie bouwstenen, defaults to true if not set -->
    <xsl:param name="outputKopieBouwstenen" as="xs:boolean?" select="true()"/>

    <xsl:variable name="bouwstenen-907" as="element(f:entry)*">
        <xsl:variable name="searchMode" as="xs:string">match</xsl:variable>

        <!-- medicatieafspraken -->
        <xsl:variable name="mas" as="element()*">
            <xsl:choose>
                <xsl:when test="not($outputKopieBouwstenen)">
                    <xsl:sequence select="//medicatieafspraak[not(kopie_indicator/@value = 'true')]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="//medicatieafspraak"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:for-each select="$mas">
            <!-- entry for MedicationRequest -->
            <xsl:call-template name="MedicationAgreementEntry-2.2">
                <xsl:with-param name="searchMode" select="$searchMode"/>
                <xsl:with-param name="dateT" select="$dateT"/>
            </xsl:call-template>
        </xsl:for-each>
        <xsl:variable name="vvs" as="element()*">
            <xsl:choose>
                <xsl:when test="not($outputKopieBouwstenen)">
                    <xsl:sequence select="//verstrekkingsverzoek[not(kopie_indicator/@value = 'true')]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="//verstrekkingsverzoek"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- verstrekkingsverzoeken -->
        <xsl:for-each select="$vvs">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
                <resource>
                    <xsl:call-template name="zib-DispenseRequest-2.2">
                        <xsl:with-param name="verstrekkingsverzoek" select="."/>
                    </xsl:call-template>
                </resource>
                <xsl:if test="string-length($searchMode) gt 0">
                    <search>
                        <mode value="{$searchMode}"/>
                    </search>
                </xsl:if>
            </entry>
        </xsl:for-each>
        <!-- toedieningsafspraken -->
        <xsl:variable name="tas" as="element()*">
            <xsl:choose>
                <xsl:when test="not($outputKopieBouwstenen)">
                    <xsl:sequence select="//toedieningsafspraak[not(kopie_indicator/@value = 'true')]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="//toedieningsafspraak"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:for-each select="$tas">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
                <resource>
                    <xsl:call-template name="zib-AdministrationAgreement-2.0">
                        <xsl:with-param name="toedieningsafspraak" select="."/>
                        <xsl:with-param name="medicationdispense-id" select="
                                if ($referById) then
                                    nf:removeSpecialCharacters(./identificatie/@value)
                                else
                                    ()"/>
                    </xsl:call-template>
                </resource>
                <xsl:if test="string-length($searchMode) gt 0">
                    <search>
                        <mode value="{$searchMode}"/>
                    </search>
                </xsl:if>
            </entry>
        </xsl:for-each>
        <!-- verstrekkingen -->
        <xsl:variable name="mves" as="element()*">
            <xsl:choose>
                <xsl:when test="not($outputKopieBouwstenen)">
                    <xsl:sequence select="//verstrekking[not(kopie_indicator/@value = 'true')]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="//verstrekking"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:for-each select="$mves">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(identificatie)}"/>
                <resource>
                    <xsl:call-template name="zib-Dispense-2.0">
                        <xsl:with-param name="verstrekking" select="."/>
                        <xsl:with-param name="medicationdispense-id" select="
                                if ($referById) then
                                    nf:removeSpecialCharacters(identificatie/@value)
                                else
                                    ()"/>
                    </xsl:call-template>
                </resource>
                <xsl:if test="string-length($searchMode) gt 0">
                    <search>
                        <mode value="{$searchMode}"/>
                    </search>
                </xsl:if>
            </entry>
        </xsl:for-each>
        <!-- medicatie_gebruik -->
        <xsl:variable name="mgbs" as="element()*">
            <xsl:choose>
                <xsl:when test="not($outputKopieBouwstenen)">
                    <xsl:sequence select="//medicatie_gebruik[not(kopie_indicator/@value = 'true')]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="//medicatie_gebruik"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:for-each select="$mgbs">
            <!-- entry for MedicationRequest -->
            <xsl:call-template name="MedicationUseEntry-2.2">
                <xsl:with-param name="searchMode" select="$searchMode"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>

    <xsl:variable name="bouwstenen" as="element(f:entry)*">
        <xsl:variable name="searchMode" as="xs:string">match</xsl:variable>

        <!-- medicatieafspraken -->
        <xsl:for-each select="//medicatieafspraak">
            <!-- entry for MedicationRequest -->
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
                <resource>
                    <xsl:call-template name="zib-MedicationAgreement-2.0">
                        <xsl:with-param name="medicatieafspraak" select="."/>
                    </xsl:call-template>
                </resource>
                <xsl:if test="string-length($searchMode) gt 0">
                    <search>
                        <mode value="{$searchMode}"/>
                    </search>
                </xsl:if>
            </entry>
        </xsl:for-each>
        <!-- verstrekkingsverzoeken -->
        <xsl:for-each select="//verstrekkingsverzoek">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
                <resource>
                    <xsl:call-template name="zib-DispenseRequest-2.0">
                        <xsl:with-param name="verstrekkingsverzoek" select="."/>
                    </xsl:call-template>
                </resource>
                <xsl:if test="string-length($searchMode) gt 0">
                    <search>
                        <mode value="{$searchMode}"/>
                    </search>
                </xsl:if>
            </entry>
        </xsl:for-each>
        <!-- toedieningsafspraken -->
        <xsl:for-each select="//toedieningsafspraak">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
                <resource>
                    <xsl:call-template name="zib-AdministrationAgreement-2.0">
                        <xsl:with-param name="toedieningsafspraak" select="."/>
                        <xsl:with-param name="medicationdispense-id" select="
                                if ($referById) then
                                    nf:removeSpecialCharacters(./identificatie/@value)
                                else
                                    ()"/>
                    </xsl:call-template>
                </resource>
                <xsl:if test="string-length($searchMode) gt 0">
                    <search>
                        <mode value="{$searchMode}"/>
                    </search>
                </xsl:if>
            </entry>
        </xsl:for-each>
        <!-- verstrekkingen -->
        <xsl:for-each select="//verstrekking">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
                <resource>
                    <xsl:call-template name="zib-Dispense-2.0">
                        <xsl:with-param name="verstrekking" select="."/>
                        <xsl:with-param name="medicationdispense-id" select="
                                if ($referById) then
                                    nf:removeSpecialCharacters(./identificatie/@value)
                                else
                                    ()"/>
                    </xsl:call-template>
                </resource>
                <xsl:if test="string-length($searchMode) gt 0">
                    <search>
                        <mode value="{$searchMode}"/>
                    </search>
                </xsl:if>
            </entry>
        </xsl:for-each>
        <!-- medicatie_gebruik -->
        <xsl:for-each select="//medicatie_gebruik">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
                <resource>
                    <xsl:call-template name="zib-MedicationUse-2.0">
                        <xsl:with-param name="medicatiegebruik" select="."/>
                        <xsl:with-param name="medicationstatement-id" select="
                                if ($referById) then
                                    nf:removeSpecialCharacters(./identificatie/@value)
                                else
                                    ()"/>
                    </xsl:call-template>
                </resource>
                <xsl:if test="string-length($searchMode) gt 0">
                    <search>
                        <mode value="{$searchMode}"/>
                    </search>
                </xsl:if>
            </entry>
        </xsl:for-each>
    </xsl:variable>



    <xd:doc>
        <xd:desc> Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-AdministrationAgreement/ </xd:desc>
        <xd:param name="medicatieafspraak"/>
        <xd:param name="medicationrequest-id"/>
    </xd:doc>
    <xsl:template name="MA-in-MedicationRequest-2.0">
        <xsl:param name="medicatieafspraak" as="element()?"/>
        <xsl:param name="medicationrequest-id" as="xs:string?"/>
        <xsl:for-each select="$medicatieafspraak">
            <xsl:variable name="resource">
                <MedicationRequest xsl:exclude-result-prefixes="#all">
                    <xsl:for-each select="$medicationrequest-id">
                        <id value="{$medicationrequest-id}"/>
                    </xsl:for-each>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement"/>
                    </meta>
                    <!-- gebruiksperiode_start /eind -->
                    <xsl:for-each select=".[(gebruiksperiode_start | gebruiksperiode_eind)//(@value)]">
                        <xsl:call-template name="ext-zib-Medication-PeriodOfUse-2.0">
                            <xsl:with-param name="start" select="./gebruiksperiode_start"/>
                            <xsl:with-param name="end" select="./gebruiksperiode_eind"/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <!-- gebruiksperiode - duur -->
                    <xsl:for-each select="./gebruiksperiode[@value]">
                        <xsl:call-template name="ext-zib-Medication-Use-Duration"/>
                    </xsl:for-each>
                    <!-- aanvullende_informatie -->
                    <xsl:for-each select="./aanvullende_informatie[@code]">
                        <xsl:call-template name="ext-zib-Medication-AdditionalInformation-2.0"/>
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
                    <!-- herhaalperiode cyclisch schema -->
                    <xsl:for-each select="./gebruiksinstructie/herhaalperiode_cyclisch_schema[.//(@value | @code)]">
                        <xsl:call-template name="ext-zib-Medication-RepeatPeriodCyclicalSchedule-2.0"/>
                    </xsl:for-each>
                    <!-- relatie naar medicatieafspraak of gebruik -->
                    <xsl:for-each select="relatie_naar_afspraak_of_gebruik/(identificatie | identificatie_23288 | identificatie_23289)[@value]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-BasedOnAgreementOrUse">
                            <valueReference>
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </identifier>
                                <display>
                                    <xsl:attribute name="value">
                                        <xsl:choose>
                                            <xsl:when test="./name() = 'identificatie'">relatie naar medicatieafspraak: </xsl:when>
                                            <xsl:when test="./name() = 'identificatie_23288'">relatie naar toedieningsafspraak: </xsl:when>
                                            <xsl:when test="./name() = 'identificatie_23289'">relatie naar medicatiegebruik: </xsl:when>
                                        </xsl:choose>
                                        <xsl:value-of select="./string-join((@value, @root), ' || ')"/>
                                    </xsl:attribute>
                                </display>
                            </valueReference>
                        </extension>
                    </xsl:for-each>
                    <!-- stoptype -->
                    <xsl:for-each select="stoptype[@code]">
                        <xsl:call-template name="ext-zib-Medication-StopType-2.0"/>
                    </xsl:for-each>
                    <!-- MA id -->
                    <xsl:for-each select="./identificatie[@value]">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    <!-- geannuleerd_indicator, in status -->
                    <xsl:for-each select="./geannuleerd_indicator[@value = 'true']">
                        <status value="entered-in-error"/>
                    </xsl:for-each>
                    <intent value="order"/>
                    <!-- type bouwsteen, hier een medicatieafspraak -->
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="16076005"/>
                            <display value="Prescription (procedure)"/>
                        </coding>
                        <text value="Medicatieafspraak"/>
                    </category>
                    <!-- geneesmiddel -->
                    <xsl:apply-templates select="./afgesproken_geneesmiddel/product[.//(@value | @code)]" mode="doMedicationReference"/>
                    <!-- patiënt -->
                    <subject>
                        <xsl:apply-templates select="./../../patient" mode="doPatientReference-2.1"/>
                    </subject>
                    <!-- lichaamslengte -->
                    <xsl:for-each select="./lichaamslengte[.//@value]">
                        <supportingInformation>
                            <reference value="{nf:getFullUrlOrId('LENGTE', nf:getGroupingKeyDefault(.), false())}"/>
                            <xsl:variable name="datum-string" select="
                                if (./lengte_datum_tijd/@value) then
                                format-dateTime(./lengte_datum_tijd/@value, '[D01] [MN,*-3], [Y0001] [H01]:[m01]')
                                else
                                'onbekend'"/>
                            <display value="{concat('Lengte: ', ./lengte_waarde/@value, ' ', ./lengte_waarde/@unit,'. Datum/tijd gemeten: ', $datum-string)}"/>
                        </supportingInformation>
                    </xsl:for-each>
                    <!-- lichaamsgewicht -->
                    <xsl:for-each select="./lichaamsgewicht[.//@value]">
                        <supportingInformation>
                            <reference value="{nf:getFullUrlOrId('GEWICHT', nf:getGroupingKeyDefault(.), false())}"/>
                            <xsl:variable name="datum-string" select="
                                if (./gewicht_datum_tijd/@value) then
                                format-dateTime(./gewicht_datum_tijd/@value, '[D01] [MN,*-3], [Y0001] [H01]:[m01]')
                                else
                                'onbekend'"/>
                            <display value="{concat('Gewicht: ',./gewicht_waarde/@value, ' ', ./gewicht_waarde/@unit,'. Datum/tijd gemeten: ', $datum-string)}"/>
                        </supportingInformation>
                    </xsl:for-each>
                    <!-- afspraakdatum -->
                    <xsl:for-each select="./afspraakdatum[@value]">
                        <authoredOn value="{nf:add-Amsterdam-timezone-to-dateTimeString(./@value)}"/>
                    </xsl:for-each>
                    <!-- voorschrijver -->
                    <xsl:apply-templates select="./voorschrijver[.//(@value | @code)]" mode="doRequesterExtension"/>
                    <!-- reden afspraak -->
                    <xsl:for-each select="./reden_afspraak[@code]">
                        <reasonCode>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="treatNullFlavorAsCoding" select="@code = 'OTH' and @codeSystem = $oidHL7NullFlavor"/>
                            </xsl:call-template>
                        </reasonCode>
                    </xsl:for-each>
                    <!-- reden van voorschrijven -->
                    <xsl:for-each select="./reden_van_voorschrijven/probleem[.//@code]">
                        <reasonReference>
                            <reference value="{nf:getFullUrlOrId('REDENVOORSCHRIJVEN', nf:getGroupingKeyDefault(.), false())}"/>
                            <display value="{normalize-space(string-join(.//(@displayName|@originalText), ' '))}"/>
                        </reasonReference>
                    </xsl:for-each>
                    <!-- toelichting -->
                    <xsl:for-each select="./toelichting[@value]">
                        <note>
                            <text value="{./@value}"/>
                        </note>
                    </xsl:for-each>
                    <!-- gebruiksinstructie -->
                    <xsl:apply-templates select="gebruiksinstructie" mode="handleGebruiksinstructie"/>
                </MedicationRequest>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template for FHIR profile 612-patient-1.0</xd:desc>
        <xd:param name="ada-patient">ada element patient</xd:param>
        <xd:param name="logicalId">optional technical FHIR logicalId to be used as resource.id</xd:param>
    </xd:doc>
    <xsl:template name="patient-612-1.0">
        <xsl:param name="ada-patient" as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:for-each select="$ada-patient">
            <Patient>
                <xsl:for-each select="$logicalId">
                    <id value="{.}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/mp612-DispenseToFHIRConversion-Patient"/>
                </meta>
                <xsl:call-template name="patient-payload"/>
            </Patient>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="uuid"/>
        <xd:param name="searchMode"/>
    </xd:doc>
    <xsl:template name="patient-entry-612" match="patient" mode="doPatientEntry612">
        <xsl:param name="uuid" as="xs:boolean"/>
        <xsl:param name="searchMode" as="xs:string">include</xsl:param>

        <!-- For privacy reasons always use UUID as fullUrl for patient -->
        <xsl:variable name="patient-fullUrl" select="nf:get-fhir-uuid(.)"/>
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$patient-fullUrl}"/>
            <resource>
                <xsl:choose>
                    <xsl:when test="$referById">
                        <xsl:variable name="fhirResourceId">
                            <xsl:choose>
                                <xsl:when test="$uuid">
                                    <xsl:value-of select="nf:removeSpecialCharacters($patient-fullUrl)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="upper-case(nf:removeSpecialCharacters(./naamgegevens/geslachtsnaam/achternaam/@value))"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:call-template name="patient-612-1.0">
                            <xsl:with-param name="ada-patient" select="."/>
                            <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="patient-612-1.0">
                            <xsl:with-param name="ada-patient" select="."/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </resource>
            <xsl:if test="string-length($searchMode) gt 0">
                <search>
                    <mode value="{$searchMode}"/>
                </search>
            </xsl:if>

        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates MedicationRequest resource based on input params</xd:desc>
        <xd:param name="verstrekkingsverzoek">ada element for dispense request</xd:param>
        <xd:param name="medicationrequest-id">the (optional) technical id for the resource</xd:param>
    </xd:doc>
    <xsl:template name="VV-in-MedicationRequest-2.0">
        <xsl:param name="verstrekkingsverzoek" as="element()?"/>
        <xsl:param name="medicationrequest-id" as="xs:string?"/>
        
        <xsl:for-each select="$verstrekkingsverzoek">
            <xsl:variable name="resource">
                <MedicationRequest>
                    <xsl:for-each select="$medicationrequest-id">
                        <id value="{.}"/>
                    </xsl:for-each>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-DispenseRequest"/>
                    </meta>
                    <!-- aanvullende_wensen in extensie -->
                    <xsl:for-each select="aanvullende_wensen[@code]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </xsl:for-each>
                    <!-- relatie naar medicatieafspraak -->
                    <xsl:for-each select="relatie_naar_medicatieafspraak/identificatie[not(@root = $oidHL7NullFlavor)][@value]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-DispenseRequest-RelatedMedicationAgreement">
                            <valueReference>
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </identifier>
                                <display>
                                    <xsl:attribute name="value">Relatie naar medicatieafspraak, id = <xsl:value-of select="./string-join((@value, @root), ' || ')"/></xsl:attribute>
                                </display>
                            </valueReference>
                        </extension>
                    </xsl:for-each>
                    <!-- relatie naar medicamenteuze behandeling -->
                    <xsl:for-each select="./../identificatie[@value]">
                        <xsl:call-template name="ext-zib-medication-medication-treatment-2.0">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <!-- Verstrekkingsverzoek id -->
                    <xsl:for-each select="./identificatie[@value]">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    <intent value="order"/>
                    <!-- type bouwsteen, hier een medicatieverstrekking -->
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="52711000146108"/>
                            <display value="Request to dispense medication to patient (situation)"/>
                        </coding>
                        <text value="Toedieningsafspraak"/>
                    </category>
                    <!-- geneesmiddel -->
                    <xsl:apply-templates select="./te_verstrekken_geneesmiddel/product[.//(@value | @code)]" mode="doMedicationReference"/>
                    <!-- patiënt -->
                    <subject>
                        <xsl:apply-templates select="./../../patient" mode="doPatientReference-2.1"/>
                    </subject>
                    <!-- verstrekkingsverzoek datum -->
                    <xsl:for-each select="./datum[@value]">
                        <authoredOn value="{nf:add-Amsterdam-timezone-to-dateTimeString(./@value)}"/>
                    </xsl:for-each>
                    <!-- auteur -->
                    <xsl:apply-templates select="./auteur[.//(@value | @code)]" mode="doRequesterExtension"/>
                    <!-- toelichting -->
                    <xsl:for-each select="./toelichting[@value]">
                        <note>
                            <text value="{./@value}"/>
                        </note>
                    </xsl:for-each>
                    <!-- verstrekkingsverzoek zelf in FHIR -->
                    <dispenseRequest>
                        <!-- afleverlocatie -->
                        <xsl:for-each select="./afleverlocatie[@value]">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-Location">
                                <valueReference>
                                    <xsl:apply-templates select="." mode="doLocationReference"/>
                                </valueReference>
                            </extension>
                        </xsl:for-each>
                        <!-- verbruiksperiode start/eind -->
                        <xsl:for-each select="./verbruiksperiode[(ingangsdatum | einddatum)/@value]">
                            <validityPeriod>
                                <xsl:for-each select="./ingangsdatum[@value]">
                                    <start value="{nf:add-Amsterdam-timezone-to-dateTimeString(./@value)}"/>
                                </xsl:for-each>
                                <xsl:for-each select="./einddatum[@value]">
                                    <end value="{nf:add-Amsterdam-timezone-to-dateTimeString(./@value)}"/>
                                </xsl:for-each>
                            </validityPeriod>
                        </xsl:for-each>
                        <!-- aantal_herhalingen -->
                        <xsl:for-each select="./aantal_herhalingen[@value]">
                            <numberOfRepeatsAllowed value="{./@value}"/>
                        </xsl:for-each>
                        <!-- te_verstrekken_hoeveelheid -->
                        <xsl:for-each select="./te_verstrekken_hoeveelheid[.//@value]">
                            <quantity>
                                <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                                    <xsl:with-param name="waarde" select="./aantal"/>
                                    <xsl:with-param name="eenheid" select="./eenheid"/>
                                </xsl:call-template>
                            </quantity>
                        </xsl:for-each>
                        <!-- verbruiksperiode -->
                        <xsl:for-each select="./verbruiksperiode/duur[@value]">
                            <expectedSupplyDuration>
                                <xsl:call-template name="hoeveelheid-to-Duration">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </expectedSupplyDuration>
                        </xsl:for-each>
                        <!-- beoogd verstrekker -->
                        <xsl:for-each select="./beoogd_verstrekker[.//(@value | @code)]">
                            <performer>
                                <xsl:apply-templates select="./zorgaanbieder" mode="doOrganizationReference-2.0"/>
                            </performer>
                        </xsl:for-each>
                    </dispenseRequest>
                </MedicationRequest>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template based on FHIR Profile http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement </xd:desc>
        <xd:param name="toedieningsafspraak"/>
        <xd:param name="medicationdispense-id"/>
    </xd:doc>
    <xsl:template name="zib-AdministrationAgreement-2.0">
        <xsl:param name="toedieningsafspraak" as="element()?"/>
        <xsl:param name="medicationdispense-id" as="xs:string?"/>

        <xsl:for-each select="$toedieningsafspraak">
            <xsl:variable name="resource">
                <MedicationDispense>
                    <xsl:for-each select="$medicationdispense-id">
                        <id value="{.}"/>
                    </xsl:for-each>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement"/>
                    </meta>
                    <!-- afspraakdatum -->
                    <xsl:apply-templates select="afspraakdatum[@value]" mode="TA-afspraakdatum"/>
                    <!-- reden afspraak -->
                    <xsl:for-each select="./reden_afspraak[@value]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-AgreementReason">
                            <valueString value="{./@value}"/>
                        </extension>
                    </xsl:for-each>
                    <!-- gebruiksperiode_start /eind -->
                    <xsl:for-each select=".[(gebruiksperiode_start | gebruiksperiode_eind)//(@value)]">
                        <xsl:call-template name="ext-zib-Medication-PeriodOfUse-2.0">
                            <xsl:with-param name="start" select="./gebruiksperiode_start"/>
                            <xsl:with-param name="end" select="./gebruiksperiode_eind"/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <!-- gebruiksperiode - duur -->
                    <xsl:for-each select="./gebruiksperiode[.//@value]">
                        <xsl:call-template name="ext-zib-Medication-Use-Duration"/>
                    </xsl:for-each>
                    <!-- aanvullende_informatie -->
                    <xsl:for-each select="./aanvullende_informatie[.//(@value | @code)]">
                        <xsl:call-template name="ext-zib-Medication-AdditionalInformation-2.0"/>
                    </xsl:for-each>
                    <!-- relatie naar medicamenteuze behandeling -->
                    <xsl:for-each select="./../identificatie[.//(@value)]">
                        <xsl:call-template name="ext-zib-medication-medication-treatment-2.0">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <!-- kopie indicator -->
                    <!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
                    <xsl:for-each select="./kopie_indicator[.//(@value | @code)]">
                        <xsl:call-template name="ext-zib-Medication-CopyIndicator-2.0"/>
                    </xsl:for-each>
                    <!-- herhaalperiode cyclisch schema -->
                    <xsl:for-each select="./gebruiksinstructie/herhaalperiode_cyclisch_schema[.//(@value | @code)]">
                        <xsl:call-template name="ext-zib-Medication-RepeatPeriodCyclicalSchedule-2.0"/>
                    </xsl:for-each>
                    <!-- stoptype -->
                    <xsl:for-each select="stoptype[.//(@value | @code)]">
                        <xsl:call-template name="ext-zib-Medication-StopType-2.0"/>
                    </xsl:for-each>
                    <!-- TA id -->
                    <xsl:for-each select="./identificatie[.//(@value | @code)]">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    <!-- geannuleerd_indicator, in status -->
                    <xsl:for-each select="./geannuleerd_indicator[@value = 'true']">
                        <status value="entered-in-error"/>
                    </xsl:for-each>
                    <!-- type bouwsteen, hier een toedieningsafspraak -->
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="422037009"/>
                            <display value="Provider medication administration instructions (procedure)"/>
                        </coding>
                        <text value="Toedieningsafspraak"/>
                    </category>
                    <!-- geneesmiddel -->
                    <xsl:apply-templates select="./geneesmiddel_bij_toedieningsafspraak/product[.//(@value | @code)]" mode="doMedicationReference"/>
                    <!-- patiënt -->
                    <subject>
                        <xsl:apply-templates select="./../../patient" mode="doPatientReference-2.1"/>
                    </subject>
                    <!-- verstrekker -->
                    <xsl:apply-templates select="./verstrekker[.//(@value | @code)]" mode="doPerformerActor"/>
                    <!-- relatie naar medicatieafspraak -->
                    <xsl:for-each select="relatie_naar_medicatieafspraak/identificatie[not(@root = $oidHL7NullFlavor)][.//@value]">
                        <authorizingPrescription>
                            <identifier>
                                <xsl:call-template name="id-to-Identifier">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </identifier>
                            <display>
                                <xsl:attribute name="value">relatie naar medicatieafspraak: <xsl:value-of select="./string-join((@value, @root), ' || ')"/></xsl:attribute>
                            </display>
                        </authorizingPrescription>
                    </xsl:for-each>
                    <!-- toelichting -->
                    <xsl:for-each select="./toelichting[@value]">
                        <note>
                            <text value="{./@value}"/>
                        </note>
                    </xsl:for-each>

                    <xsl:apply-templates select="gebruiksinstructie" mode="handleGebruiksinstructie"/>
                </MedicationDispense>
            </xsl:variable>

            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template based on FHIR Profile https://simplifier.net/nictizstu3-zib2017/zib-dispenserequest</xd:desc>
        <xd:param name="verstrekkingsverzoek">ada element for dispenserequest</xd:param>
        <xd:param name="searchMode"/>
    </xd:doc>
    <xsl:template name="zib-DispenseRequest-2.0">
        <xsl:param name="verstrekkingsverzoek" as="element()?"/>
        <xsl:param name="searchMode" as="xs:string">include</xsl:param>

        <xsl:for-each select="$verstrekkingsverzoek">
            <xsl:call-template name="VV-in-MedicationRequest-2.0">
                <xsl:with-param name="verstrekkingsverzoek" select="."/>
                <xsl:with-param name="medicationrequest-id" select="
                        if ($referById) then
                            nf:removeSpecialCharacters(identificatie/@value)
                        else
                            ()"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-MedicationAgreement/ </xd:desc>
        <xd:param name="medicatieafspraak"/>
        <xd:param name="searchMode"/>
    </xd:doc>
    <xsl:template name="zib-MedicationAgreement-2.0">
        <xsl:param name="medicatieafspraak" as="element()?"/>
        <xsl:param name="searchMode" as="xs:string">include</xsl:param>

        <xsl:for-each select="$medicatieafspraak">
            <xsl:call-template name="MA-in-MedicationRequest-2.0">
                <xsl:with-param name="medicatieafspraak" select="."/>
                <xsl:with-param name="medicationrequest-id" select="
                        if ($referById) then
                            nf:removeSpecialCharacters(./identificatie/@value)
                        else
                            ()"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="medicatiegebruik"/>
        <xd:param name="medicationstatement-id"/>
        <xd:param name="searchMode"/>
    </xd:doc>
    <xsl:template name="zib-MedicationUse-2.0">
        <xsl:param name="medicatiegebruik"/>
        <xsl:param name="medicationstatement-id" as="xs:string?"/>
        <xsl:param name="searchMode" as="xs:string">include</xsl:param>

        <xsl:for-each select="$medicatiegebruik">
            <!-- MedicationStatement entry -->
            <xsl:variable name="resource">
                <MedicationStatement>
                    <xsl:for-each select="$medicationstatement-id">
                        <id value="{.}"/>
                    </xsl:for-each>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse"/>
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
                            <extension url="agent">
                                <valueReference>
                                    <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                                </valueReference>
                            </extension>
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
                        <xsl:when test="./stoptype/@code = '1'">
                            <status value="on-hold"/>
                        </xsl:when>
                        <xsl:when test="./stoptype/@code = '2'">
                            <status value="stopped"/>
                        </xsl:when>
                        <xsl:when test="./stoptype/@code">
                            <status value="unknown-stoptype"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <status value="active"/>
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
                                <start value="{nf:add-Amsterdam-timezone-to-dateTimeString(./@value)}"/>
                            </xsl:for-each>
                            <xsl:for-each select="gebruiksperiode_eind[@value]">
                                <end value="{nf:add-Amsterdam-timezone-to-dateTimeString(./@value)}"/>
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
                                    <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference-2.1"/>
                                </xsl:when>
                                <xsl:when test="informant_is_zorgverlener[.//@value]">
                                    <xsl:apply-templates select="./informant_is_zorgverlener/zorgverlener" mode="doPractitionerRoleReference-2.0"/>
                                </xsl:when>
                            </xsl:choose>
                        </informationSource>
                    </xsl:for-each>
                    <!-- patiënt -->
                    <subject>
                        <xsl:apply-templates select="./../../patient" mode="doPatientReference-2.1"/>
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
                                    <xsl:when test="./@value = 'true'">y</xsl:when>
                                    <xsl:when test="./@value = 'false'">n</xsl:when>
                                    <xsl:when test="./@nullFlavor = 'NA'">na</xsl:when>
                                    <xsl:when test="./@nullFlavor">unk</xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                        </taken>
                    </xsl:for-each>
                    <!-- reden_wijzigen_of_stoppen_gebruik -->
                    <xsl:for-each select="./reden_wijzigen_of_stoppen_gebruik[@code]">
                        <reasonNotTaken>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </reasonNotTaken>
                    </xsl:for-each>
                    <!-- reden gebruik -->
                    <xsl:for-each select="./reden_gebruik[@value]">
                        <reasonCode>
                            <text value="{./@value}"/>
                        </reasonCode>
                    </xsl:for-each>
                    <!-- toelichting -->
                    <xsl:for-each select="./toelichting[@value]">
                        <note>
                            <text value="{./@value}"/>
                        </note>
                    </xsl:for-each>
                    <!-- gebruiksinstructie -->
                    <xsl:apply-templates select="gebruiksinstructie" mode="handleGebruiksinstructie"/>
                </MedicationStatement>
            </xsl:variable>

            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>



</xsl:stylesheet>
