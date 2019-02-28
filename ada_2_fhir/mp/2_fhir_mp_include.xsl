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
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:import href="../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    
    <xsl:variable name="gstd-coderingen">
        <code rootoid="{$oidGStandaardGPK}"/>
        <code rootoid="{$oidGStandaardHPK}"/>
        <code rootoid="{$oidGStandaardPRK}"/>
        <code rootoid="{$oidGStandaardZInummer}"/>
    </xsl:variable>
    <xsl:variable name="patients" as="element()*">
        <!-- Patients -->
        <xsl:for-each-group select="//patient" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <unieke-patient xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:for-each select="current-group()[1]">
                    <xsl:call-template name="patient-entry">
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:call-template>
                </xsl:for-each>
            </unieke-patient>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="practitioners" as="element()*">
        <!-- Zorgverleners in Practitioners -->
        <xsl:for-each-group select="//zorgverlener" group-by="concat(nf:ada-zvl-id(./(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer))/@root, nf:ada-zvl-id(./(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer))/@value)">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPractitioner(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-zorgverlener xmlns="">
                    <group-key xmlns="">
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <xsl:for-each select="current-group()[1]">
                        <xsl:call-template name="practitioner-entry">
                            <xsl:with-param name="uuid" select="$uuid"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </unieke-zorgverlener>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="organizations" as="element()*">
        <!-- Zorgaanbieders -->
        <xsl:for-each-group select="//zorgaanbieder[not(zorgaanbieder)]" group-by="concat(nf:ada-za-id(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)/@root, nf:ada-za-id(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)/@value)">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-zorgaanbieder xmlns="">
                    <group-key xmlns="">
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <xsl:for-each select="current-group()[1]">
                        <xsl:call-template name="organization-entry">
                            <xsl:with-param name="uuid" select="$uuid"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </unieke-zorgaanbieder>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="practitionerRoles" as="element()*">
        <!-- Zorgverleners in PractitionerRoles -->
        <xsl:for-each-group select="//zorgverlener" group-by="nf:getGroupingKeyDefault(.)">
            <unieke-practitionerRole xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:apply-templates select="current-group()[1]" mode="doPractitionerRoleEntry"/>
            </unieke-practitionerRole>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="products" as="element()*">
        <xsl:for-each-group select="//product" group-by="nf:getProductGroupingKey(./product_code)">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <xsl:variable name="most-specific-product-code" select="nf:get-specific-productcode(product_code)"/>
                <uniek-product xmlns="">
                    <group-key xmlns="">
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <xsl:for-each select="current-group()[1]">
                        <xsl:variable name="ada-id" select="
                                if ($uuid) then
                                    nf:get-fhir-uuid(.)
                                else
                                if ($most-specific-product-code) then
                                nf:getUriFromAdaCode(nf:get-specific-productcode($most-specific-product-code))
                                    else
                                        nf:get-fhir-uuid(.)"/>
                        <entry xmlns="http://hl7.org/fhir">
                            <fullUrl value="{$ada-id}"/>
                            <resource>
                                <xsl:choose>
                                    <xsl:when test="$referById">
                                        <xsl:variable name="fhir-resource-id">
                                            <xsl:choose>
                                                <xsl:when test="$uuid">
                                                    <xsl:value-of select="generate-id(.)"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:choose>
                                                        <xsl:when test="$most-specific-product-code[(@code)][not(@codeSystem = $oidHL7NullFlavor)]">
                                                            <xsl:value-of select="nf:removeSpecialCharacters(string-join($most-specific-product-code/(@code | @codeSystem), '-'))"/>
                                                        </xsl:when>
                                                        <xsl:when test="./product_specificatie/product_naam/@value">
                                                            <xsl:value-of select="upper-case(nf:removeSpecialCharacters(./product_specificatie/product_naam/@value))"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <!-- should not happen, but let's fall back on the grouping-key() -->
                                                            <xsl:value-of select="nf:removeSpecialCharacters(current-grouping-key())"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:call-template name="zib-Product">
                                            <xsl:with-param name="medication-id" select="$fhir-resource-id"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="." mode="doMedication"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </resource>
                        </entry>
                    </xsl:for-each>
                </uniek-product>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="locations" as="element()*">
        <!-- Locaties -->
        <xsl:for-each-group select="//afleverlocatie" group-by="nf:getGroupingKeyDefault(.)">
            <unieke-locatie xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:for-each select="current-group()[1]">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                        <resource>
                            <xsl:choose>
                                <xsl:when test="$referById">
                                    <xsl:call-template name="zib-Dispense-Location-2.0">
                                        <xsl:with-param name="ada-locatie" select="."/>
                                        <xsl:with-param name="location-id" select="nf:removeSpecialCharacters(current-grouping-key())"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="zib-Dispense-Location-2.0">
                                        <xsl:with-param name="ada-locatie" select="."/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </resource>
                    </entry>
                </xsl:for-each>
            </unieke-locatie>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="body-observations" as="element()*">
        <!-- lichaamsgewicht | lichaamslengte -->
        <xsl:for-each-group select="//(lichaamsgewicht | lichaamslengte)" group-by="nf:getGroupingKeyDefault(.)">
            <unieke-observatie xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:for-each select="current-group()[1]">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                        <resource>
                            <xsl:apply-templates select="." mode="doBodyObservation">
                                <xsl:with-param name="observation-id">
                                    <xsl:choose>
                                        <xsl:when test="$referById">
                                            <xsl:variable name="ada-patient" select="./ancestor::*[ancestor::data]/patient"/>
                                            <xsl:variable name="patient-ref" select="nf:getFullUrlOrId('Patient', nf:getGroupingKeyDefault($ada-patient), true())"/>
                                            <xsl:value-of select="concat(./local-name(), $patient-ref, (upper-case(nf:removeSpecialCharacters(string-join(./*/(@value | @unit), '')))))"/>
                                        </xsl:when>
                                        <xsl:otherwise/>
                                    </xsl:choose>
                                </xsl:with-param>
                            </xsl:apply-templates>
                        </resource>
                    </entry>
                </xsl:for-each>
            </unieke-observatie>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="prescribe-reasons" as="element()*">
        <!-- redenen -->
        <xsl:for-each-group select="//reden_van_voorschrijven/probleem[.//@code]" group-by="nf:getGroupingKeyDefault(.)">
            <unieke-reden xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:for-each select="current-group()[1]">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                        <resource>
                            <xsl:apply-templates select="." mode="doConditionForProbleem">
                                <xsl:with-param name="condition-id">
                                    <xsl:choose>
                                        <xsl:when test="$referById">
                                            <xsl:variable name="ada-patient" select="./ancestor::*[ancestor::data]/patient"/>
                                            <xsl:variable name="patient-reference" select="nf:getFullUrlOrId('Patient', nf:getGroupingKeyDefault($ada-patient), true())"/>
                                            <xsl:value-of select="concat('redenvanvoorschrijven', $patient-reference, (upper-case(nf:removeSpecialCharacters(string-join(.//(@value | @code), '')))))"/>
                                        </xsl:when>
                                        <xsl:otherwise/>
                                    </xsl:choose>
                                </xsl:with-param>
                            </xsl:apply-templates>
                        </resource>
                    </entry>
                </xsl:for-each>
            </unieke-reden>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="related-persons" as="element()*">
        <!-- related-persons -->
        <xsl:for-each-group select="//informant/persoon[.//@value]" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <unieke-persoon xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:for-each select="current-group()[1]">
                    <xsl:call-template name="relatedperson-entry">
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:call-template>
                </xsl:for-each>
            </unieke-persoon>
        </xsl:for-each-group>
    </xsl:variable>

    <xsl:variable name="bouwstenen" as="element(f:entry)*">
        <!-- medicatieafspraken -->
        <xsl:for-each select="//medicatieafspraak">
            <xsl:call-template name="zib-MedicationAgreement-2.0">
                <xsl:with-param name="medicatieafspraak" select="."/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- verstrekkingsverzoeken -->
        <xsl:for-each select="//verstrekkingsverzoek">
            <xsl:call-template name="zib-DispenseRequest-2.0">
                <xsl:with-param name="verstrekkingsverzoek" select="."/>
            </xsl:call-template>
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
            </entry>
        </xsl:for-each>
        <!-- medicatie_gebruik -->
        <xsl:for-each select="//medicatie_gebruik">
            <xsl:call-template name="zib-MedicationUse-2.0">
                <xsl:with-param name="medicatiegebruik" select="."/>
                <xsl:with-param name="medicationstatement-id" select="
                        if ($referById) then
                            nf:removeSpecialCharacters(./identificatie/@value)
                        else
                            ()"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>

    <xsl:variable name="bouwstenen-907" as="element(f:entry)*">
        <!-- medicatieafspraken -->
        <xsl:for-each select="//medicatieafspraak">
            <xsl:call-template name="zib-MedicationAgreement-2.2">
                <xsl:with-param name="medicatieafspraak" select="."/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- verstrekkingsverzoeken -->
        <xsl:for-each select="//verstrekkingsverzoek">
            <xsl:call-template name="zib-DispenseRequest-2.0">
                <xsl:with-param name="verstrekkingsverzoek" select="."/>
            </xsl:call-template>
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
            </entry>
        </xsl:for-each>
        <!-- medicatie_gebruik -->
        <xsl:for-each select="//medicatie_gebruik">
            <xsl:call-template name="zib-MedicationUse-2.2">
                <xsl:with-param name="medicatiegebruik" select="."/>
                <xsl:with-param name="medicationstatement-id" select="
                        if ($referById) then
                            nf:removeSpecialCharacters(./identificatie/@value)
                        else
                            ()"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>

    <xsl:variable name="bouwstenen-verstrekkingenvertaling" as="element(f:entry)*">
        <!-- toedieningsafspraken -->
        <xsl:for-each select="//toedieningsafspraak">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                <resource>
                    <xsl:call-template name="mp612dispensetofhirconversionadministrationagreement-1.0.0">
                        <xsl:with-param name="toedieningsafspraak" select="."/>
                        <xsl:with-param name="medicationdispense-id">
                            <xsl:choose>
                                <xsl:when test="$referById">
                                    <xsl:choose>
                                        <xsl:when test="string-length(nf:removeSpecialCharacters(./identificatie/@value)) gt 0"><xsl:value-of select="nf:removeSpecialCharacters(./identificatie/@value)"/></xsl:when>
                                        <xsl:otherwise><xsl:value-of select="uuid:get-uuid(.)"/></xsl:otherwise>
                                    </xsl:choose>
                                    
                                </xsl:when>
                            </xsl:choose>
                        </xsl:with-param>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>
        <!-- verstrekkingen -->
        <xsl:for-each select="//verstrekking">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
                <resource>
                    <xsl:call-template name="mp612dispensetofhirconversiondispense-1.0.0">
                        <xsl:with-param name="verstrekking" select="."/>
                        <xsl:with-param name="medicationdispense-id" select="
                                if ($referById) then
                                    nf:removeSpecialCharacters(./identificatie/@value)
                                else
                                    ()"/>
                    </xsl:call-template>
                </resource>
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
            <MedicationRequest xsl:exclude-result-prefixes="#all">
                <xsl:for-each select="$medicationrequest-id">
                    <id value="{$medicationrequest-id}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement"/>
                </meta>
                <!-- gebruiksperiode_start /eind -->
                <xsl:for-each select=".[(gebruiksperiode_start | gebruiksperiode_eind)//(@value)]">
                    <xsl:call-template name="zib-Medication-Period-Of-Use-2.0">
                        <xsl:with-param name="start" select="./gebruiksperiode_start"/>
                        <xsl:with-param name="end" select="./gebruiksperiode_eind"/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- gebruiksperiode - duur -->
                <xsl:for-each select="./gebruiksperiode[@value]">
                    <xsl:call-template name="zib-Medication-Use-Duration">
                        <xsl:with-param name="duration" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- aanvullende_informatie -->
                <xsl:for-each select="./aanvullende_informatie[@code]">
                    <xsl:call-template name="zib-Medication-AdditionalInformation">
                        <xsl:with-param name="additionalInfo" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- relatie naar medicamenteuze behandeling -->
                <xsl:for-each select="./../identificatie[@value]">
                    <xsl:call-template name="mbh-id-2-reference">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- kopie indicator -->
                <!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
                <xsl:for-each select="./kopie_indicator[@value]">
                    <xsl:call-template name="zib-Medication-CopyIndicator">
                        <xsl:with-param name="copyIndicator" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- herhaalperiode cyclisch schema -->
                <xsl:for-each select="./gebruiksinstructie/herhaalperiode_cyclisch_schema[.//(@value | @code)]">
                    <xsl:call-template name="zib-Medication-RepeatPeriodCyclicalSchedule">
                        <xsl:with-param name="repeat-period" select="."/>
                    </xsl:call-template>
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
                    <xsl:call-template name="zib-Medication-StopType">
                        <xsl:with-param name="stopType" select="."/>
                    </xsl:call-template>
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
                    <xsl:apply-templates select="./../../patient" mode="doPatientReference"/>
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
                    <authoredOn value="{nf:ada-2-dateTimeCET(./@value)}"/>
                </xsl:for-each>
                <!-- voorschrijver -->
                <xsl:apply-templates select="./voorschrijver[.//(@value | @code)]" mode="doRequesterExtension"/>
                <!-- reden afspraak -->
                <xsl:for-each select="./reden_afspraak[@code]">
                    <reasonCode>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
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
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-AdministrationAgreement/ </xd:desc>
        <xd:param name="medicatieafspraak"/>
        <xd:param name="medicationrequest-id"/>
    </xd:doc>
    <xsl:template name="MA-in-MedicationRequest-2.2">
        <xsl:param name="medicatieafspraak" as="element()?"/>
        <xsl:param name="medicationrequest-id" as="xs:string?"/>
        <xsl:for-each select="$medicatieafspraak">
            <MedicationRequest xsl:exclude-result-prefixes="#all">
                <xsl:for-each select="$medicationrequest-id">
                    <id value="{$medicationrequest-id}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement"/>
                </meta>
                <!-- gebruiksperiode_start /eind -->
                <xsl:for-each select=".[(gebruiksperiode_start | gebruiksperiode_eind)//(@value)]">
                    <xsl:call-template name="zib-Medication-Period-Of-Use-2.0">
                        <xsl:with-param name="start" select="./gebruiksperiode_start"/>
                        <xsl:with-param name="end" select="./gebruiksperiode_eind"/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- gebruiksperiode - duur -->
                <xsl:for-each select="./gebruiksperiode[@value]">
                    <xsl:call-template name="zib-Medication-Use-Duration">
                        <xsl:with-param name="duration" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- aanvullende_informatie -->
                <xsl:for-each select="./aanvullende_informatie[@code]">
                    <xsl:call-template name="zib-Medication-AdditionalInformation">
                        <xsl:with-param name="additionalInfo" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- relatie naar medicamenteuze behandeling -->
                <xsl:for-each select="./../identificatie[@value]">
                    <xsl:call-template name="mbh-id-2-reference">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- kopie indicator -->
                <!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
                <xsl:for-each select="./kopie_indicator[@value]">
                    <xsl:call-template name="zib-Medication-CopyIndicator">
                        <xsl:with-param name="copyIndicator" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- herhaalperiode cyclisch schema -->
                <xsl:for-each select="./gebruiksinstructie/herhaalperiode_cyclisch_schema[.//(@value | @code)]">
                    <xsl:call-template name="zib-Medication-RepeatPeriodCyclicalSchedule">
                        <xsl:with-param name="repeat-period" select="."/>
                    </xsl:call-template>
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
                    <xsl:call-template name="zib-Medication-StopType">
                        <xsl:with-param name="stopType" select="."/>
                    </xsl:call-template>
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
                    <xsl:apply-templates select="./../../patient" mode="doPatientReference"/>
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
                    <authoredOn value="{nf:ada-2-dateTimeCET(./@value)}"/>
                </xsl:for-each>
                <!-- voorschrijver -->
                <xsl:apply-templates select="./voorschrijver[.//(@value | @code)]" mode="doRequesterExtension-907"/>
                <!-- reden afspraak -->
                <xsl:for-each select="./reden_afspraak[@code]">
                    <reasonCode>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
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
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="mbh-id-2-reference">
        <xsl:param name="in" as="element()?"/>
        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment">
            <valueIdentifier>
                <xsl:call-template name="id-to-Identifier">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </valueIdentifier>
        </extension>
    </xsl:template>
    <xd:doc>
        <xd:desc>Template for FHIR profile nl-core-organization-2.0</xd:desc>
        <xd:param name="ada-zorgaanbieder">ada element zorgaanbieder</xd:param>
        <xd:param name="organization-id">optional technical FHIR organization-id to be used as resource.id</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-organization-2.0">
        <xsl:param name="ada-zorgaanbieder" as="element()?"/>
        <xsl:param name="organization-id" as="xs:string?"/>
        <xsl:for-each select="$ada-zorgaanbieder">
            <Organization>
                <xsl:for-each select="$organization-id">
                    <id value="{.}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-organization"/>
                </meta>
                <!-- There was a name change to zorgaanbieder_identificatienummer in the zib which was adopted by MP 9.0.7, 
                     zorgaanbieder_identificatie_nummer is still here for backwards compatibility with 9.0.6 and before -->
                <xsl:for-each select="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)[@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- todo organisatietype / afdelingspecialisme, is not part of an MP transaction up until now -->
                <xsl:for-each select="./organisatie_naam[.//(@value | @code)]">
                    <name value="{./@value}"/>
                </xsl:for-each>
                <xsl:for-each select="./telefoon_email/contactgegevens[.//(@value | @code)]">
                    <xsl:for-each select="./telefoonnummers[.//(@value | @code)]">
                        <telecom>
                            <system value="phone"/>
                            <value value="{./telefoonnummer/@value}"/>
                            <!-- todo telecomtype, is not part of an MP transaction up until now -->
                            <use>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <xsl:when test="./nummer_soort/@code = 'WP'">work</xsl:when>
                                        <xsl:when test="./nummer_soort/@code = 'HP'">home</xsl:when>
                                        <xsl:when test="./nummer_soort/@code = 'TMP'">temp</xsl:when>
                                        <xsl:otherwise>unsupported nummer_soort/@code: '<xsl:value-of select="./nummer_soort/@code"/>'.</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                            </use>
                        </telecom>
                    </xsl:for-each>
                    <xsl:for-each select="./email_adressen[.//(@value | @code)]">
                        <telecom>
                            <system value="email"/>
                            <value value="{./email_adres/@value}"/>
                            <!-- todo telecomtype, is not part of an MP transaction up until now -->
                            <use>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <xsl:when test="./email_soort/@code = 'WP'">work</xsl:when>
                                        <xsl:when test="./email_soort/@code = 'HP'">home</xsl:when>
                                        <xsl:otherwise>unsupported nummer_soort/@code: '<xsl:value-of select="./nummer_soort/@code"/>'.</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                            </use>
                        </telecom>
                    </xsl:for-each>
                </xsl:for-each>
                <!-- There was a dataset change to remove the obsolete group 'adres' which was adopted by MP 9.0.7, 
                     adres/adresgegevens is still here for backwards compatibility with 9.0.6 and before -->
                <xsl:apply-templates select="(adres/adresgegevens | adresgegevens)" mode="doAddress"/>
            </Organization>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Template for FHIR profile nl-core-patient-2.0</xd:desc>
        <xd:param name="ada-patient">ada element patient</xd:param>
        <xd:param name="patient-id">optional technical FHIR organization-id to be used as resource.id</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-patient-2.0">
        <xsl:param name="ada-patient" as="element()?"/>
        <xsl:param name="patient-id" as="xs:string?"/>
        <xsl:for-each select="$ada-patient">
            <Patient>
                <xsl:for-each select="$patient-id">
                    <id value="{.}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-patient"/>
                </meta>
                <!-- patient_identificatienummer  -->
                <xsl:for-each select="./patient_identificatienummer[.//(@value)]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- naamgegevens -->
                <xsl:for-each select="./naamgegevens[.//(@value | @code)]">
                    <xsl:call-template name="nl-core-humanname">
                        <xsl:with-param name="ada-naamgegevens" select="."/>
                        <xsl:with-param name="unstructured-name" select="./ongestructureerde_naam/@value"/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- geslacht -->
                <xsl:for-each select="./geslacht[.//(@value | @code)]">
                    <xsl:call-template name="patient-gender">
                        <xsl:with-param name="ada-geslacht" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- geboortedatum -->
                <xsl:for-each select="./geboortedatum[./@value]">
                    <birthDate value="{./@value}"/>
                </xsl:for-each>
            </Patient>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Template for FHIR profile nl-core-practitioner-2.0</xd:desc>
        <xd:param name="ada-zorgverlener">The practitioner in ada format</xd:param>
        <xd:param name="practitioner-id">optional technical FHIR organization-id to be used as resource.id</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-practitioner-2.0">
        <xsl:param name="ada-zorgverlener" as="element()?"/>
        <xsl:param name="practitioner-id" as="xs:string?"/>
        <!-- zorgverlener -->
        <xsl:for-each select="$ada-zorgverlener">
            <Practitioner>
                <xsl:for-each select="$practitioner-id">
                    <id value="{.}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-practitioner"/>
                </meta>
                <!-- zorgverlener_identificatie_nummer -->
                <xsl:for-each select="./(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer)[.//@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- naamgegevens -->
                <xsl:for-each select="./(zorgverlener_naam/naamgegevens | .//naamgegevens[not(naamgegevens)])">
                    <xsl:call-template name="nl-core-humanname">
                        <xsl:with-param name="ada-naamgegevens" select="."/>
                        <xsl:with-param name="unstructured-name" select="./ongestructureerde_naam/@value"/>
                    </xsl:call-template>
                </xsl:for-each>
            </Practitioner>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Template for FHIR profile nl-core-practitionerrole-2.0</xd:desc>
        <xd:param name="ada-zorgverlener">ada element zorgverlener</xd:param>
        <xd:param name="practitionerrole-id">optional technical FHIR organization-id to be used as resource.id</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-practitionerrole-2.0">
        <xsl:param name="ada-zorgverlener" as="element()?"/>
        <xsl:param name="practitionerrole-id" as="xs:string?"/>

        <xsl:for-each select="$ada-zorgverlener">
            <PractitionerRole>
                <xsl:if test="string-length($practitionerrole-id) gt 0">
                    <id value="{$practitionerrole-id}"/>
                </xsl:if>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-practitionerrole"/>
                </meta>
                <xsl:for-each select=".[.//@value]">
                    <practitioner>
                        <xsl:apply-templates select="." mode="doPractitionerReference"/>
                    </practitioner>
                </xsl:for-each>
                <xsl:for-each select=".//zorgaanbieder[not(zorgaanbieder)][.//@value]">
                    <organization>
                        <xsl:apply-templates select="." mode="doOrganizationReference"/>
                    </organization>
                </xsl:for-each>
                <xsl:for-each select="./zorgverlener_rol">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>
                <xsl:for-each select="./specialisme">
                    <specialty>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </specialty>
                </xsl:for-each>
            </PractitionerRole>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Template for FHIR profile nl-core-relatedperson-2.0</xd:desc>
        <xd:param name="relatedperson-id">optional technical FHIR organization-id to be used as resource.id</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-relatedperson-2.0" match="persoon" mode="doRelatedPerson">
        <xsl:param name="relatedperson-id" as="xs:string?"/>
        <RelatedPerson>
            <xsl:for-each select="$relatedperson-id">
                <id value="{.}"/>
            </xsl:for-each>
            <meta>
                <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-relatedperson"/>
            </meta>
            <xsl:for-each select="./rol_of_functie">
                <extension url="http://fhir.nl/fhir/StructureDefinition/nl-core-relatedperson-role">
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCodeableConcept>
                </extension>
            </xsl:for-each>
            <patient>
                <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference"/>
            </patient>
            <xsl:for-each select="./naamgegevens">
                <xsl:call-template name="nl-core-humanname">
                    <xsl:with-param name="ada-naamgegevens" select="."/>
                    <xsl:with-param name="unstructured-name" select="./ongestructureerde_naam/@value"/>
                </xsl:call-template>
            </xsl:for-each>
        </RelatedPerson>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to create a FHIR reference to a Location resource for afleverlocatie</xd:desc>
    </xd:doc>
    <xsl:template name="afleverlocatie-reference" match="afleverlocatie" mode="doLocationReference">
        <reference value="{nf:getFullUrlOrId('LOCATION', nf:getGroupingKeyDefault(.), false())}"/>
        <xsl:if test="./@value">
            <display value="{./@value}"/>
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to map ada geslacht to FHIR gender</xd:desc>
        <xd:param name="ada-geslacht">ada element which contains geslacht, should be of datatype code</xd:param>
    </xd:doc>
    <xsl:template name="patient-gender">
        <xsl:param name="ada-geslacht" as="element()*"/>
        <xsl:for-each select="$ada-geslacht">
            <gender>
                <xsl:attribute name="value">
                    <xsl:choose>
                        <xsl:when test="./@code = 'M'">male</xsl:when>
                        <xsl:when test="./@code = 'F'">female</xsl:when>
                        <xsl:when test="./@code = 'UN'">other</xsl:when>
                        <xsl:when test="./@code = 'UNK'">unknown</xsl:when>
                        <xsl:otherwise>unknown</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </gender>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to create FHIR patient reference, context should be ada patient element</xd:desc>
    </xd:doc>
    <xsl:template name="patient-reference" match="patient" mode="doPatientReference">
        <reference value="{nf:getFullUrlOrId('Patient',nf:getGroupingKeyDefault(.), false())}"/>
        <xsl:for-each select="./naamgegevens[1][.//@value]">
            <display value="{normalize-space(string-join(.//*[not(name()='naamgebruik')]/@value,' '))}"/>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to create FHIR RelatedPerson reference, context should be ada persoon element</xd:desc>
    </xd:doc>
    <xsl:template name="relatedperson-reference" match="persoon" mode="doRelatedPersonReference">
        <reference value="{nf:getFullUrlOrId('RelatedPerson',nf:getGroupingKeyDefault(.), false())}"/>
        <xsl:for-each select="./naamgegevens[1][.//@value]">
            <display value="{normalize-space(string-join(.//*[not(name()='naamgebruik')]/@value,' '))}"/>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to create FHIR Practitioner reference, context should be ada zorgverlener element</xd:desc>
    </xd:doc>
    <xsl:template name="practitioner-reference" match="zorgverlener" mode="doPractitionerReference">
        <reference value="{nf:getFullUrlOrId('Practitioner',nf:getGroupingKeyPractitioner(.), false())}"/>
        <xsl:for-each select=".//naamgegevens[not(naamgegevens)][.//@value]">
            <display value="{normalize-space(string-join(.//@value, ' '))}"/>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template to create missing type extension with FHIR PractitionerRole reference, context should be ada zorgverlener element</xd:desc>
    </xd:doc>
    <xsl:template name="missing-type-reference-practitionerrole" match="zorgverlener" mode="doMissingTypeReferencePractitionerRole">
        <xsl:variable name="display" as="xs:string?" select="normalize-space(concat(string-join((.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value), ' '), ' || ', string-join(.//organisatie_naam/@value | .//specialisme/@displayName, ' || ')))"/>
        <extension url="http://nictiz.nl/fhir/StructureDefinition/missing-type-reference">
            <valueReference>
                <xsl:apply-templates select="." mode="doPractitionerRoleReference"/>
            </valueReference>
        </extension>
        <display value="{nf:get-practitioner-role-display(.)}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template to create FHIR PractitionerRole reference, context should be ada zorgverlener element</xd:desc>
    </xd:doc>
    <xsl:template name="practitioner-role-reference" match="zorgverlener" mode="doPractitionerRoleReference">
        <reference value="{nf:getFullUrlOrId('PRACTITIONERROLE', nf:getGroupingKeyDefault(.), false())}"/>
        <display value="{nf:get-practitioner-role-display(.)}"/>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to create FHIR performer.actor, context should be ada verstrekker element</xd:desc>
    </xd:doc>
    <xsl:template name="verstrekker-performer-actor" match="verstrekker" mode="doPerformerActor">
        <!-- verstrekker -->
        <performer>
            <!-- in dataset toedieningsafspraak 9.0.6 staat zorgaanbieder (onnodig) een keer extra genest -->
            <xsl:for-each select=".//zorgaanbieder[not(zorgaanbieder)]">
                <actor>
                    <xsl:apply-templates select="." mode="doOrganizationReference"/>
                </actor>
            </xsl:for-each>
        </performer>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to create FHIR requestor.agent, input or context should be ada zorgverlener element</xd:desc>
        <xd:param name="zorgverlener">ada element zorgverlener, is derived from context when not set</xd:param>
    </xd:doc>
    <xsl:template name="zorgverlener-requester" match="zorgverlener" mode="doRequesterAgent">
        <xsl:param name="zorgverlener" select="."/>
        <requester>
            <xsl:for-each select="$zorgverlener">
                <agent>
                    <xsl:apply-templates select="." mode="doPractitionerReference"/>
                </agent>
                <xsl:for-each select=".//zorgaanbieder[not(zorgaanbieder)][.//@value]">
                    <onBehalfOf>
                        <xsl:apply-templates select="." mode="doOrganizationReference"/>
                    </onBehalfOf>
                </xsl:for-each>
            </xsl:for-each>
        </requester>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to create FHIR requester.extension (with PractitionerRoleReference) and .agent, context should be ada voorschrijver or auteur element</xd:desc>
    </xd:doc>
    <xsl:template name="zorgverlener-requester-ext" match="voorschrijver | auteur" mode="doRequesterExtension">
        <xsl:for-each select="./zorgverlener[.//(@value | @code)]">
            <requester>
                <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-RequesterRole">
                    <valueReference>
                        <xsl:apply-templates select="." mode="doPractitionerRoleReference"/>
                    </valueReference>
                </extension>
                <!-- agent is verplicht in FHIR, dit is eigenlijk dubbelop omdat de practitionerRole hier ook al naar verwijst -->
                <agent>
                    <xsl:apply-templates select="." mode="doPractitionerReference"/>
                </agent>
            </requester>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template to create FHIR requester.agent (with missing type extension), context should be ada voorschrijver element</xd:desc>
    </xd:doc>
    <xsl:template name="zorgverlener-requester-ext-907" match="voorschrijver" mode="doRequesterExtension-907">
        <xsl:for-each select="./zorgverlener[.//(@value | @code)]">
            <requester>
                <agent>
                    <xsl:apply-templates select="." mode="doMissingTypeReferencePractitionerRole"/>
                </agent>
            </requester>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template for FHIR profile nl-core-address-2.0, context should be ada adresgegevens element</xd:desc>
    </xd:doc>
    <xsl:template name="nl-core-address-2.0" match="adresgegevens" mode="doAddress">
        <xsl:for-each select=".[.//(@value | @code)]">
            <xsl:variable name="lineItems" as="element()*">
                <xsl:for-each select="./straat/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="./huisnummer/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="./huisnummerletter/@value | ./huisnummertoevoeging/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-buildingNumberSuffix">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="./additionele_informatie/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-unitID">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="./aanduiding_bij_nummer/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
            </xsl:variable>
            <address>
                <!-- adres_soort -->
                <xsl:for-each select="adres_soort[@codeSystem='2.16.840.1.113883.5.1119'][@code]">
                    <xsl:choose>
                        <!-- Postadres -->
                        <xsl:when test="./@code='PST'">
                            <use>
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="PST"/>
                                </extension>
                            </use>
                            <type value="postal"/>
                        </xsl:when>
                        <!-- Officieel adres -->
                        <xsl:when test="./@code='HP'">
                            <extension url="http://fhir.nl/fhir/StructureDefinition/nl-core-address-official">
                                <valueCode value="true"/>
                            </extension>
                            <use value="home">
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="HP"/>
                                </extension>
                            </use>
                            <type value="physical"/>     
                        </xsl:when>
                        <!-- Woon-/verblijfadres -->
                        <xsl:when test="./@code='PHYS'">
                            <use value="home">
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="HP"/>
                                </extension>
                            </use>
                            <type value="physical"/>     
                        </xsl:when>
                        <!-- Tijdelijk adres -->
                        <xsl:when test="./@code='TMP'">
                            <use value="temp"/>
                        </xsl:when>
                        <!-- Werkadres -->
                        <xsl:when test="./@code='WP'">
                            <use value="work"/>
                        </xsl:when>
                        <!-- Vakantie adres -->
                        <xsl:when test="./@code='HV'">
                            <use value="temp">
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="HV"/>
                                </extension>                                
                            </use>
                        </xsl:when>
                    </xsl:choose>                    
                </xsl:for-each>
                <line>
                    <xsl:if test="$lineItems">
                        <xsl:attribute name="value" select="string-join($lineItems//*:valueString/@value, ' ')"/>
                    </xsl:if>
                    <xsl:copy-of select="$lineItems"/>
                </line>
                <xsl:for-each select="./woonplaats/@value">
                    <city value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="./gemeente/@value">
                    <district value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="./postcode/@value">
                    <postalCode value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="./land/@value">
                    <country value="{.}"/>
                </xsl:for-each>
            </address>
        </xsl:for-each>

    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="ada-naamgegevens"/>
        <xd:param name="unstructured-name"/>
    </xd:doc>
    <xsl:template name="nl-core-humanname" as="element()*">
        <xsl:param name="ada-naamgegevens" as="element()*"/>
        <xsl:param name="unstructured-name" as="xs:string?"/>
        <xsl:if test="$ada-naamgegevens[.//@value] or string-length($unstructured-name) gt 0">
            <xsl:choose>
                <xsl:when test="$ada-naamgegevens[.//@value]">
                    <xsl:for-each select="$ada-naamgegevens[.//@value]">
                        <name>
                            <xsl:for-each select="./naamgebruik[@code]">
                                <extension url="http://hl7.org/fhir/StructureDefinition/humanname-assembly-order">
                                    <valueCode value="{./@code}"/>
                                </extension>
                            </xsl:for-each>
                            <!-- unstructured-name, not supported in zib datamodel, may be customized per transaction, therefore parameterized in this template -->
                            <xsl:if test="string-length($unstructured-name) gt 0">
                                <text value="{$unstructured-name}"/>
                            </xsl:if>
                            <xsl:if test="./(geslachtsnaam | geslachtsnaam_partner)[.//@value]">
                                <family>
                                    <xsl:attribute name="value">
                                        <xsl:choose>
                                            <!-- Eigen geslachtsnaam -->
                                            <xsl:when test="./naamgebruik/@code = 'NL1'">
                                                <xsl:value-of select="normalize-space(string-join((./geslachtsnaam/voorvoegsels/@value, ././geslachtsnaam/achternaam/@value), ' '))"/>
                                            </xsl:when>
                                            <!-- 	Geslachtsnaam partner -->
                                            <xsl:when test="./naamgebruik/@code = 'NL2'">
                                                <xsl:value-of select="normalize-space(string-join((./geslachtsnaam_partner/voorvoegsels_partner/@value, ././geslachtsnaam_partner/achternaam_partner/@value), ' '))"/>
                                            </xsl:when>
                                            <!-- Geslachtsnaam partner gevolgd door eigen geslachtsnaam -->
                                            <xsl:when test="./naamgebruik/@code = 'NL3'">
                                                <xsl:value-of select="normalize-space(string-join((./geslachtsnaam_partner/voorvoegsels_partner/@value, ././geslachtsnaam_partner/achternaam_partner/@value, ./geslachtsnaam/voorvoegsels/@value, ././geslachtsnaam/achternaam/@value), ' '))"/>
                                            </xsl:when>
                                            <!-- Eigen geslachtsnaam gevolgd door geslachtsnaam partner -->
                                            <xsl:when test="./naamgebruik/@code = 'NL4'">
                                                <xsl:value-of select="normalize-space(string-join((./geslachtsnaam/voorvoegsels/@value, ././geslachtsnaam/achternaam/@value, ./geslachtsnaam_partner/voorvoegsels_partner/@value, ././geslachtsnaam_partner/achternaam_partner/@value), ' '))"/>
                                            </xsl:when>
                                            <!-- otherwise: we nemen aan NL4 - Eigen geslachtsnaam gevolgd door geslachtsnaam partner zodat iig geen informatie 'verdwijnt' -->
                                            <xsl:otherwise>
                                                <xsl:value-of select="normalize-space(string-join((./geslachtsnaam/voorvoegsels/@value, ././geslachtsnaam/achternaam/@value, ./geslachtsnaam_partner/voorvoegsels_partner/@value, ././geslachtsnaam_partner/achternaam_partner/@value), ' '))"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:for-each select="./geslachtsnaam/voorvoegsels[@value]">
                                        <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-prefix">
                                            <valueString value="{normalize-space(./@value)}"/>
                                        </extension>
                                    </xsl:for-each>
                                    <xsl:for-each select="./geslachtsnaam/achternaam[@value]">
                                        <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-name">
                                            <valueString value="{normalize-space(./@value)}"/>
                                        </extension>
                                    </xsl:for-each>
                                    <xsl:for-each select="./geslachtsnaam_partner/voorvoegsels[@value]">
                                        <extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-prefix">
                                            <valueString value="{normalize-space(./@value)}"/>
                                        </extension>
                                    </xsl:for-each>
                                    <xsl:for-each select="./geslachtsnaam_partner/achternaam[@value]">
                                        <extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-name">
                                            <valueString value="{normalize-space(./@value)}"/>
                                        </extension>
                                    </xsl:for-each>
                                </family>
                            </xsl:if>
                            <xsl:for-each select="./voornamen[.//@value]">
                                <given value="{normalize-space(./@value)}">
                                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                                        <valueCode value="BR"/>
                                    </extension>
                                </given>
                            </xsl:for-each>
                            <xsl:for-each select="./initialen[.//@value]">
                                <given value="{normalize-space(./@value)}">
                                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                                        <valueCode value="IN"/>
                                    </extension>
                                </given>
                            </xsl:for-each>
                            <xsl:for-each select="./roepnaam[.//@value]">
                                <given value="{normalize-space(./@value)}">
                                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                                        <valueCode value="CL"/>
                                    </extension>
                                </given>
                            </xsl:for-each>
                            <xsl:for-each select="prefix[not(tokenize(@qualifier, '\s') = 'VV')]">
                                <prefix value="{.}"/>
                            </xsl:for-each>
                            <xsl:for-each select="suffix[.//@value]">
                                <suffix value="{.}"/>
                            </xsl:for-each>
                            <xsl:if test="validTime[.//@value]">
                                <period>
                                    <!-- <xsl:call-template name="IVL_TS-to-Period">
                     <xsl:with-param name="in" select="validTime"/>
                  </xsl:call-template>
            -->
                                </period>
                            </xsl:if>
                        </name>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <!-- only unstructured name -->
                    <name>
                        <text>
                            <xsl:value-of select="$unstructured-name"/>
                        </text>
                    </name>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="verstrekkingsverzoek"/>
        <xd:param name="medicationrequest-id"/>
    </xd:doc>
    <xsl:template name="VV-in-MedicationRequest-2.0">
        <xsl:param name="verstrekkingsverzoek" as="element()?"/>
        <xsl:param name="medicationrequest-id" as="xs:string?"/>

        <xsl:for-each select="$verstrekkingsverzoek">
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
                    <xsl:call-template name="mbh-id-2-reference">
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
                    <xsl:apply-templates select="./../../patient" mode="doPatientReference"/>
                </subject>
                <!-- verstrekkingsverzoek datum -->
                <xsl:for-each select="./datum[@value]">
                    <authoredOn value="{nf:ada-2-dateTimeCET(./@value)}"/>
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
                                <start value="{nf:ada-2-dateTimeCET(./@value)}"/>
                            </xsl:for-each>
                            <xsl:for-each select="./einddatum[@value]">
                                <end value="{nf:ada-2-dateTimeCET(./@value)}"/>
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
                            <xsl:apply-templates select="./zorgaanbieder" mode="doOrganizationReference"/>
                        </performer>
                    </xsl:for-each>
                </dispenseRequest>
            </MedicationRequest>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-AdministrationAgreement/ </xd:desc>
        <xd:param name="toedieningsafspraak"/>
        <xd:param name="medicationdispense-id"/>
    </xd:doc>
    <xsl:template name="zib-AdministrationAgreement-2.0">
        <xsl:param name="toedieningsafspraak" as="element()?"/>
        <xsl:param name="medicationdispense-id" as="xs:string?"/>
        <xsl:for-each select="$toedieningsafspraak">
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
                    <xsl:call-template name="zib-Medication-Period-Of-Use-2.0">
                        <xsl:with-param name="start" select="./gebruiksperiode_start"/>
                        <xsl:with-param name="end" select="./gebruiksperiode_eind"/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- gebruiksperiode - duur -->
                <xsl:for-each select="./gebruiksperiode[.//@value]">
                    <xsl:call-template name="zib-Medication-Use-Duration">
                        <xsl:with-param name="duration" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- aanvullende_informatie -->
                <xsl:for-each select="./aanvullende_informatie[.//(@value | @code)]">
                    <xsl:call-template name="zib-Medication-AdditionalInformation">
                        <xsl:with-param name="additionalInfo" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- relatie naar medicamenteuze behandeling -->
                <xsl:for-each select="./../identificatie[.//(@value)]">
                    <xsl:call-template name="mbh-id-2-reference">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- kopie indicator -->
                <!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
                <xsl:for-each select="./kopie_indicator[.//(@value | @code)]">
                    <xsl:call-template name="zib-Medication-CopyIndicator">
                        <xsl:with-param name="copyIndicator" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- herhaalperiode cyclisch schema -->
                <xsl:for-each select="./gebruiksinstructie/herhaalperiode_cyclisch_schema[.//(@value | @code)]">
                    <xsl:call-template name="zib-Medication-RepeatPeriodCyclicalSchedule">
                        <xsl:with-param name="repeat-period" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- stoptype -->
                <xsl:for-each select="stoptype[.//(@value | @code)]">
                    <xsl:call-template name="zib-Medication-StopType">
                        <xsl:with-param name="stopType" select="."/>
                    </xsl:call-template>
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
                    <xsl:apply-templates select="./../../patient" mode="doPatientReference"/>
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
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>does some processing for ada element 'gebruiksinstructie' based on whether it lands in FHIR MedicationRequest (MA), MedicationDispense (TA) or MedicationStatement (MGB)</xd:desc>
    </xd:doc>
    <xsl:template name="handle-gebruiksinstructie" match="gebruiksinstructie" mode="handleGebruiksinstructie">
        <!-- Determine FHIR element name based on type of building block -->
        <xsl:variable name="fhir-dosage-name">
            <xsl:choose>
                <xsl:when test="ancestor::medicatie_gebruik">dosage</xsl:when>
                <xsl:otherwise>dosageInstruction</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="doseerinstructie/dosering[.//(@value | @code)]">
                <xsl:for-each select="doseerinstructie/dosering[.//(@value | @code)]">
                    <xsl:element name="{$fhir-dosage-name}">
                        <xsl:apply-templates select="." mode="doDosageContents"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test=".[.//(@value | @code)]">
                <xsl:for-each select=".[.//(@value | @code)]">
                    <xsl:element name="{$fhir-dosage-name}">
                        <xsl:apply-templates select="." mode="doDosageContents"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>


    </xsl:template>

    <xd:doc>
        <xd:desc>does some processing for ada element 'toedieningsweg' based on whether it is in transaction for verstrekkingenvertaling (toedieningsweg 0..1 R) or other transactions (toedieningsweg 1..1 R)</xd:desc>
    </xd:doc>
    <xsl:template name="handle-toedieningsweg" match="toedieningsweg" mode="handleToedieningsweg">
        <xsl:choose>
            <!-- bij verstrekkingenvertaling is toedieningsweg niet verplicht -->
            <!-- weglaten met nullFlavor NI  -->
            <xsl:when test="ancestor::beschikbaarstellen_verstrekkingenvertaling and .[@codeSystem = $oidHL7NullFlavor and @code = 'NI']"/>
            <xsl:otherwise>
                <route>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </route>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc> Template based on FHIR Profile https://simplifier.net/nictizstu3-zib2017/mp612dispensetofhirconversionadministrationagreement </xd:desc>
        <xd:param name="toedieningsafspraak">ada xml element toedieningsafspraak</xd:param>
        <xd:param name="medicationdispense-id">optional technical id for the FHIR MedicationDispense resource</xd:param>
    </xd:doc>
    <xsl:template name="mp612dispensetofhirconversionadministrationagreement-1.0.0">
        <xsl:param name="toedieningsafspraak" as="element()?"/>
        <xsl:param name="medicationdispense-id" as="xs:string?"/>
        <xsl:for-each select="$toedieningsafspraak">
            <MedicationDispense>
                <xsl:for-each select="$medicationdispense-id">
                    <id value="{.}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/mp612-DispenseToFHIRConversion-AdministrationAgreement"/>
                </meta>
                <!-- afspraakdatum -->
                <xsl:apply-templates select="afspraakdatum[@value]" mode="TA-afspraakdatum"/>
                <!-- gebruiksperiode_start /eind -->
                <xsl:for-each select=".[(gebruiksperiode_start | gebruiksperiode_eind)//(@value)]">
                    <xsl:call-template name="zib-Medication-Period-Of-Use-2.0">
                        <xsl:with-param name="start" select="./gebruiksperiode_start"/>
                        <xsl:with-param name="end" select="./gebruiksperiode_eind"/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- gebruiksperiode - duur -->
                <xsl:for-each select="./gebruiksperiode[.//@value]">
                    <xsl:call-template name="zib-Medication-Use-Duration">
                        <xsl:with-param name="duration" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- relatie naar medicamenteuze behandeling -->
                <xsl:for-each select="./../identificatie[.//(@value)]">
                    <xsl:call-template name="mbh-id-2-reference">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- herhaalperiode cyclisch schema -->
                <xsl:for-each select="./gebruiksinstructie/herhaalperiode_cyclisch_schema[.//(@value | @code)]">
                    <xsl:call-template name="zib-Medication-RepeatPeriodCyclicalSchedule">
                        <xsl:with-param name="repeat-period" select="."/>
                    </xsl:call-template>
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
                <xsl:apply-templates select="geneesmiddel_bij_toedieningsafspraak/product[.//(@value | @code)]" mode="doMedicationReference"/>
                <!-- patiënt -->
                <subject>
                    <xsl:apply-templates select="./../../patient" mode="doPatientReference"/>
                </subject>
                <!-- verstrekker -->
                <xsl:apply-templates select="./verstrekker[.//(@value | @code)]" mode="doPerformerActor"/>
                <!-- gebruiksinstructie -->
                <xsl:apply-templates select="gebruiksinstructie" mode="handleGebruiksinstructie"/>
            </MedicationDispense>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates the FHIR element for TA afspraakdatum, context should be ada afspraakdatum</xd:desc>
    </xd:doc>
    <xsl:template name="TA-afspraakdatum" match="afspraakdatum" mode="TA-afspraakdatum">
        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-AuthoredOn">
            <valueDateTime value="{nf:ada-2-dateTimeCET(./@value)}"/>
        </extension>
    </xsl:template>

    <xd:doc>
        <xd:desc> &lt;xsl:include href="../zib1bbr/zib1bbr_include.xsl"/&gt; &lt;xsl:include href="../naw/naw_include.xsl"/&gt; </xd:desc>
        <xd:param name="toedieningsschema"/>
    </xd:doc>
    <xsl:template name="zib-Administration-Schedule-2.0">
        <xsl:param name="toedieningsschema" as="element()?"/>
        <xsl:for-each select="$toedieningsschema">
            <timing>
                <xsl:if test="./../../doseerduur or ./../toedieningsduur or .//*[@value or @code]">
                    <repeat>
                        <!-- doseerduur -->
                        <xsl:for-each select="./../../doseerduur[@value]">
                            <boundsDuration>
                                <xsl:call-template name="hoeveelheid-to-Duration">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </boundsDuration>
                        </xsl:for-each>
                        <!-- toedieningsduur -->
                        <xsl:for-each select="./../toedieningsduur[@value]">
                            <duration value="{./@value}"/>
                            <durationUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(./@unit)}"/>
                        </xsl:for-each>
                        <!-- frequentie -->
                        <xsl:for-each select="./frequentie/aantal/(vaste_waarde | min)[@value]">
                            <frequency value="{./@value}"/>
                        </xsl:for-each>
                        <xsl:for-each select="./frequentie/aantal/(max)[@value]">
                            <frequencyMax value="{./@value}"/>
                        </xsl:for-each>
                        <!-- ./frequentie/tijdseenheid -->
                        <xsl:for-each select="./frequentie/tijdseenheid">
                            <period value="{./@value}"/>
                            <periodUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(./@unit)}"/>
                        </xsl:for-each>
                        <!-- interval -->
                        <xsl:for-each select="./interval">
                            <period value="{./@value}"/>
                            <periodUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(./@unit)}"/>
                        </xsl:for-each>
                        <xsl:for-each select="./weekdag">
                            <dayOfWeek>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <xsl:when test="./@code = '307145004'">mon</xsl:when>
                                        <xsl:when test="./@code = '307147007'">tue</xsl:when>
                                        <xsl:when test="./@code = '307148002'">wed</xsl:when>
                                        <xsl:when test="./@code = '307149005'">thu</xsl:when>
                                        <xsl:when test="./@code = '307150005'">fri</xsl:when>
                                        <xsl:when test="./@code = '307151009'">sat</xsl:when>
                                        <xsl:when test="./@code = '307146003'">sun</xsl:when>
                                    </xsl:choose>
                                </xsl:attribute>
                            </dayOfWeek>
                        </xsl:for-each>
                        <!-- toedientijd -->
                        <xsl:for-each select="./toedientijd[@value]">
                            <timeOfDay value="{format-dateTime(./@value, '[H01]:[m01]:[s01]')}"/>
                        </xsl:for-each>
                        <!-- dagdeel -->
                        <xsl:for-each select="./dagdeel[@code][not(@codeSystem = $oidHL7NullFlavor)]">
                            <when>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <xsl:when test="./@code = '73775008'">MORN</xsl:when>
                                        <xsl:when test="./@code = '255213009'">AFT</xsl:when>
                                        <xsl:when test="./@code = '3157002'">EVE</xsl:when>
                                        <xsl:when test="./@code = '2546009'">NIGHT</xsl:when>
                                    </xsl:choose>
                                </xsl:attribute>
                            </when>
                        </xsl:for-each>
                    </repeat>
                </xsl:if>
            </timing>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="observation-id"/>
    </xd:doc>
    <xsl:template name="zib-BodyHeight-2.0" match="lichaamslengte" mode="doBodyObservation">
        <xsl:param name="observation-id" as="xs:string?"/>
        <Observation>
            <xsl:if test="string-length($observation-id) gt 0">
                <id value="{$observation-id}"/>
            </xsl:if>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-BodyHeight"/>
            </meta>
            <status value="final"/>
            <category>
                <coding>
                    <system value="http://hl7.org/fhir/observation-category"/>
                    <code value="vital-signs"/>
                </coding>
            </category>
            <code>
                <coding>
                    <system value="http://loinc.org"/>
                    <code value="8302-2"/>
                    <display value="lichaamslengte"/>
                </coding>
            </code>
            <!-- patient reference -->
            <subject>
                <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference"/>
            </subject>
            <xsl:for-each select="./lengte_datum_tijd">
                <effectiveDateTime value="{nf:ada-2-dateTimeCET(./@value)}"/>
            </xsl:for-each>
            <xsl:for-each select="./lengte_waarde">
                <valueQuantity>
                    <!-- ada has cm or m, FHIR only allows cm -->
                    <xsl:choose>
                        <xsl:when test="./@unit = 'm'">
                            <value value="{xs:double(./@value)*100}"/>
                            <unit value="cm"/>
                            <code value="cm"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <value value="{./@value}"/>
                            <unit value="{./@unit}"/>
                            <code value="{nf:convert_ADA_unit2UCUM_FHIR(./@unit)}"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </valueQuantity>
            </xsl:for-each>
        </Observation>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="observation-id"/>
    </xd:doc>
    <xsl:template name="zib-BodyWeight-2.0" match="lichaamsgewicht" mode="doBodyObservation">
        <xsl:param name="observation-id" as="xs:string?"/>
        <Observation>
            <xsl:if test="string-length($observation-id) gt 0">
                <id value="{$observation-id}"/>
            </xsl:if>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-BodyWeight"/>
            </meta>
            <status value="final"/>
            <category>
                <coding>
                    <system value="http://hl7.org/fhir/observation-category"/>
                    <code value="vital-signs"/>
                </coding>
            </category>
            <code>
                <coding>
                    <system value="http://loinc.org"/>
                    <code value="29463-7"/>
                    <display value="lichaamsgewicht"/>
                </coding>
            </code>
            <!-- patient reference -->
            <subject>
                <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference"/>
            </subject>
            <xsl:for-each select="./gewicht_datum_tijd">
                <effectiveDateTime value="{nf:ada-2-dateTimeCET(./@value)}"/>
            </xsl:for-each>
            <xsl:for-each select="./gewicht_waarde">
                <valueQuantity>
                    <value value="{./@value}"/>
                    <unit value="{./@unit}"/>
                    <code value="{nf:convert_ADA_unit2UCUM_FHIR(./@unit)}"/>
                </valueQuantity>
            </xsl:for-each>
        </Observation>
    </xsl:template>
    <xd:doc>
        <xd:desc>Creates a FHIR MedicationDispense resource based on ada verstrekking</xd:desc>
        <xd:param name="verstrekking">ada verstrekking</xd:param>
        <xd:param name="medicationdispense-id">optional technical FHIR resource id</xd:param>
    </xd:doc>
    <xsl:template name="zib-Dispense-2.0">
        <xsl:param name="verstrekking" as="element()?"/>
        <xsl:param name="medicationdispense-id" as="xs:string?"/>

        <xsl:for-each select="$verstrekking">
            <MedicationDispense>
                <xsl:for-each select="$medicationdispense-id">
                    <id value="{.}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Dispense"/>
                </meta>
                <!-- distributievorm -->
                <xsl:for-each select="./distributievorm[@code]">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-DistributionForm">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>
                <!-- aanschrijfdatum -->
                <xsl:for-each select="./aanschrijfdatum[@value]">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-RequestDate">
                        <valueDateTime value="{nf:ada-2-dateTimeCET(./@value)}"/>
                    </extension>
                </xsl:for-each>
                <!-- aanvullende_informatie -->
                <xsl:for-each select="aanvullende_informatie[@code]">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>
                <!-- relatie naar medicamenteuze behandeling -->
                <xsl:for-each select="./../identificatie[@value]">
                    <xsl:call-template name="mbh-id-2-reference">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- MVE id -->
                <xsl:for-each select="./identificatie[@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- type bouwsteen, hier een medicatieverstrekking -->
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="373784005"/>
                        <display value="Dispensing medication (procedure)"/>
                    </coding>
                    <text value="Medicatieverstrekking"/>
                </category>
                <!-- geneesmiddel -->
                <xsl:apply-templates select="./verstrekt_geneesmiddel/product[.//(@value | @code)]" mode="doMedicationReference"/>
                <!-- patiënt -->
                <subject>
                    <xsl:apply-templates select="./../../patient" mode="doPatientReference"/>
                </subject>
                <!-- verstrekker -->
                <xsl:apply-templates select="./verstrekker[.//(@value | @code)]" mode="doPerformerActor"/>
                <!-- relatie naar verstrekkingsverzoek -->
                <xsl:for-each select="./relatie_naar_verstrekkingsverzoek/identificatie[@value]">
                    <authorizingPrescription>
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                        <display value="Verstrekkingsverzoek met identificatie {./@value} in identificerend systeem {./@root}."/>
                    </authorizingPrescription>
                </xsl:for-each>
                <xsl:for-each select="./verstrekte_hoeveelheid[.//*[@value]]">
                    <quantity>
                        <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                            <xsl:with-param name="eenheid" select="./eenheid"/>
                            <xsl:with-param name="waarde" select="./aantal"/>
                        </xsl:call-template>
                    </quantity>
                </xsl:for-each>
                <!-- verbruiksduur -->
                <xsl:for-each select="./verbruiksduur[@value]">
                    <daysSupply>
                        <xsl:call-template name="hoeveelheid-to-Duration">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </daysSupply>
                </xsl:for-each>
                <!-- datum -->
                <xsl:for-each select="./datum[@value]">
                    <whenHandedOver value="{nf:ada-2-dateTimeCET(./@value)}"/>
                </xsl:for-each>
                <!-- afleverlocatie -->
                <xsl:for-each select="./afleverlocatie[@value]">
                    <destination>
                        <xsl:apply-templates select="." mode="doLocationReference"/>
                    </destination>
                </xsl:for-each>
                <!-- toelichting  -->
                <xsl:for-each select="./toelichting[@value]">
                    <note>
                        <text value="{./@value}"/>
                    </note>
                </xsl:for-each>
            </MedicationDispense>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Creates a FHIR MedicationDispense resource based on ada verstrekking in the verstrekkingenvertaling transaction</xd:desc>
        <xd:param name="verstrekking">ada verstrekking</xd:param>
        <xd:param name="medicationdispense-id">optional technical FHIR resource id</xd:param>
    </xd:doc>
    <xsl:template name="mp612dispensetofhirconversiondispense-1.0.0">
        <xsl:param name="verstrekking" as="element()?"/>
        <xsl:param name="medicationdispense-id" as="xs:string?"/>

        <xsl:for-each select="$verstrekking">
            <MedicationDispense>
                <xsl:for-each select="$medicationdispense-id">
                    <id value="{.}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/mp612-DispenseToFHIRConversion-Dispense"/>
                </meta>
                <!-- aanschrijfdatum -->
                <xsl:for-each select="./aanschrijfdatum[@value]">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-RequestDate">
                        <valueDateTime value="{nf:ada-2-dateTimeCET(./@value)}"/>
                    </extension>
                </xsl:for-each>
                <!-- relatie naar medicamenteuze behandeling -->
                <xsl:for-each select="./../identificatie[@value]">
                    <xsl:call-template name="mbh-id-2-reference">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- MVE id -->
                <xsl:for-each select="./identificatie[@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- type bouwsteen, hier een medicatieverstrekking -->
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="373784005"/>
                        <display value="Dispensing medication (procedure)"/>
                    </coding>
                    <text value="Medicatieverstrekking"/>
                </category>
                <!-- geneesmiddel -->
                <xsl:apply-templates select="./verstrekt_geneesmiddel/product[.//(@value | @code)]" mode="doMedicationReference"/>
                <!-- patiënt -->
                <subject>
                    <xsl:apply-templates select="./../../patient" mode="doPatientReference"/>
                </subject>
                <!-- verstrekker -->
                <xsl:apply-templates select="./verstrekker[.//(@value | @code)]" mode="doPerformerActor"/>
                <!-- relatie naar verstrekkingsverzoek -->
                <xsl:for-each select="./relatie_naar_verstrekkingsverzoek/identificatie[@value]">
                    <authorizingPrescription>
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                        <display value="Verstrekkingsverzoek met identificatie {./@value} in identificerend systeem {./@root}."/>
                    </authorizingPrescription>
                </xsl:for-each>
                <xsl:for-each select="./verstrekte_hoeveelheid[.//*[@value]]">
                    <quantity>
                        <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                            <xsl:with-param name="eenheid" select="./eenheid"/>
                            <xsl:with-param name="waarde" select="./aantal"/>
                        </xsl:call-template>
                    </quantity>
                </xsl:for-each>
                <!-- verbruiksduur -->
                <xsl:for-each select="./verbruiksduur[@value]">
                    <daysSupply>
                        <xsl:call-template name="hoeveelheid-to-Duration">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </daysSupply>
                </xsl:for-each>
                <!-- datum -->
                <xsl:for-each select="./datum[@value]">
                    <whenHandedOver value="{nf:ada-2-dateTimeCET(./@value)}"/>
                </xsl:for-each>
                <xsl:for-each select="./datum[@nullFlavor]">
                    <whenHandedOver>
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                            <valueCode value="{./@nullFlavor}"/>
                        </extension>
                    </whenHandedOver>
                </xsl:for-each>
                <!-- afleverlocatie -->
                <xsl:for-each select="./afleverlocatie[@value]">
                    <destination>
                        <xsl:apply-templates select="." mode="doLocationReference"/>
                    </destination>
                </xsl:for-each>
            </MedicationDispense>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="ada-locatie"/>
        <xd:param name="location-id"/>
    </xd:doc>
    <xsl:template name="zib-Dispense-Location-2.0">
        <xsl:param name="ada-locatie" as="element()?" select="."/>
        <xsl:param name="location-id" as="xs:string?"/>
        <xsl:for-each select="$ada-locatie">
            <Location>
                <xsl:for-each select="$location-id">
                    <id value="{.}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-location"/>
                </meta>
                <name value="{./@value}"/>
            </Location>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="verstrekkingsverzoek"/>
    </xd:doc>
    <xsl:template name="zib-DispenseRequest-2.0">
        <xsl:param name="verstrekkingsverzoek" as="element()?"/>
        <xsl:for-each select="$verstrekkingsverzoek">
            <entry>
                <fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
                <resource>
                    <xsl:call-template name="VV-in-MedicationRequest-2.0">
                        <xsl:with-param name="verstrekkingsverzoek" select="."/>
                        <xsl:with-param name="medicationrequest-id" select="
                                if ($referById) then
                                    nf:removeSpecialCharacters(./identificatie/@value)
                                else
                                    ()"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template for 'dosering'. 
            Without the FHIR element dosage / dosageInstruction, 
            the name of that FHIR-element differs between MedicationStatement and MedicationRequest
        </xd:desc>
    </xd:doc>
    <xsl:template name="zib-InstructionsForUse-2.0" match="dosering" mode="doDosageContents">
        <xsl:for-each select="./../volgnummer[@value]">
            <sequence value="{./@value}"/>
        </xsl:for-each>
        <!-- gebruiksinstructie/omschrijving  -->
        <xsl:for-each select="./../../omschrijving[@value]">
            <text value="{./@value}"/>
        </xsl:for-each>
        <!-- gebruiksinstructie/aanvullende_instructie  -->
        <xsl:for-each select="./../../aanvullende_instructie[@code]">
            <additionalInstruction>
                <xsl:call-template name="code-to-CodeableConcept">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </additionalInstruction>
        </xsl:for-each>
        <!-- dosering/toedieningsschema -->
        <xsl:for-each select="./toedieningsschema[.//(@code | @value)]">
            <xsl:call-template name="zib-Administration-Schedule-2.0">
                <xsl:with-param name="toedieningsschema" select="."/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- dosering/zo_nodig/criterium/code -->
        <xsl:for-each select="zo_nodig/criterium/code">
            <asNeededCodeableConcept>
                <xsl:variable name="in" select="."/>
                <!-- roep hier niet het standaard template aan omdat criterium/omschrijving ook nog omschrijving zou kunnen bevatten... -->
                <xsl:choose>
                    <xsl:when test="$in[@codeSystem = $oidHL7NullFlavor]">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                            <valueCode value="{$in/@code}"/>
                        </extension>
                    </xsl:when>
                    <xsl:when test="$in[not(@codeSystem = $oidHL7NullFlavor)]">
                        <coding>
                            <system value="{local:getUri($in/@codeSystem)}"/>
                            <code value="{$in/@code}"/>
                            <xsl:if test="$in/@displayName">
                                <display value="{$in/@displayName}"/>
                            </xsl:if>
                            <!--<userSelected value="true"/>-->
                        </coding>
                        <!-- ADA heeft nog geen ondersteuning voor vertalingen, dus onderstaande is theoretisch -->
                        <xsl:for-each select="$in/translation">
                            <coding>
                                <system value="{local:getUri(@codeSystem)}"/>
                                <code value="{@code}"/>
                                <xsl:if test="@displayName">
                                    <display value="{@displayName}"/>
                                </xsl:if>
                            </coding>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="./../omschrijving[@value]">
                        <text value="{./../omschrijving/@value}"/>
                    </xsl:when>
                    <xsl:when test="$in[@originalText]">
                        <text value="{$in/@originalText}"/>
                    </xsl:when>
                </xsl:choose>
            </asNeededCodeableConcept>
        </xsl:for-each>
        <!-- gebruiksinstructie/toedieningsweg -->
        <xsl:apply-templates select="./../../toedieningsweg" mode="handleToedieningsweg"/>
        <!-- dosering/keerdosis/aantal -->
        <xsl:for-each select="./keerdosis/aantal[vaste_waarde]">
            <doseQuantity>
                <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                    <xsl:with-param name="eenheid" select="./../eenheid"/>
                    <xsl:with-param name="waarde" select="./vaste_waarde"/>
                </xsl:call-template>
            </doseQuantity>
        </xsl:for-each>
        <xsl:for-each select="./keerdosis/aantal[min | max]">
            <doseRange>
                <xsl:call-template name="minmax-to-Range">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </doseRange>
        </xsl:for-each>
        <!-- maximale_dosering -->
        <xsl:for-each select="./zo_nodig/maximale_dosering[.//*[@value]]">
            <maxDosePerPeriod>
                <xsl:call-template name="quotient-to-Ratio">
                    <xsl:with-param name="denominator" select="./tijdseenheid"/>
                    <xsl:with-param name="numerator-aantal" select="./aantal"/>
                    <xsl:with-param name="numerator-eenheid" select="./eenheid"/>
                </xsl:call-template>
            </maxDosePerPeriod>
        </xsl:for-each>
        <!-- toedieningssnelheid -->
        <xsl:for-each select="./toedieningssnelheid[.//*[@value]]">
            <xsl:for-each select=".[waarde/vaste_waarde]">
                <rateRatio>
                    <xsl:call-template name="quotient-to-Ratio">
                        <xsl:with-param name="denominator" select="./tijdseenheid"/>
                        <xsl:with-param name="numerator-aantal" select="./waarde/vaste_waarde"/>
                        <xsl:with-param name="numerator-eenheid" select="./eenheid"/>
                    </xsl:call-template>
                </rateRatio>
            </xsl:for-each>
            <!-- variable toedieningssnelheid, alleen ondersteund voor hele tijdseenheden -->
            <xsl:for-each select=".[waarde/(min | max)][tijdseenheid/@value castable as xs:integer]">
                <xsl:variable name="ucum-tijdseenheid-value">
                    <xsl:if test="xs:integer(tijdseenheid/@value) ne 1">
                        <xsl:value-of select="concat(tijdseenheid/@value, '.')"/>
                    </xsl:if>
                </xsl:variable>
                <!-- we cannot use the G-standaard unit in this case, can only be communicated in FHIR using UCUM -->
                <!-- let's determine the right UCUM for the rate (toedieningssnelheid) -->
                <xsl:variable name="UCUM-rate" select="concat(nf:convertGstdBasiseenheid2UCUM(./eenheid/@code), '/', $ucum-tijdseenheid-value, nf:convertTime_ADA_unit2UCUM_FHIR(./tijdseenheid/@unit))"/>
                <rateRange>
                    <low>
                        <value value="{./waarde/min/@value}"/>
                        <unit value="{$UCUM-rate}"/>
                        <system value="http://unitsofmeasure.org"/>
                        <code value="{$UCUM-rate}"/>
                    </low>
                    <high>
                        <value value="{./waarde/max/@value}"/>
                        <unit value="{$UCUM-rate}"/>
                        <system value="http://unitsofmeasure.org"/>
                        <code value="{$UCUM-rate}"/>
                    </high>
                </rateRange>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template for 'gebruiksinstructie' in case there is no doseerinstructie/dosering. 
            Without the FHIR element dosage / dosageInstruction, 
            the name of that FHIR-element differs between MedicationStatement and MedicationRequest
        </xd:desc>
    </xd:doc>
    <xsl:template name="zib-InstructionsForUse-2.0-gi" match="gebruiksinstructie" mode="doDosageContents">
        <!-- gebruiksinstructie/omschrijving  -->
        <xsl:for-each select="omschrijving[@value]">
            <text value="{./@value}"/>
        </xsl:for-each>
        <!-- gebruiksinstructie/aanvullende_instructie  -->
        <xsl:for-each select="aanvullende_instructie[@code]">
            <additionalInstruction>
                <xsl:call-template name="code-to-CodeableConcept">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </additionalInstruction>
        </xsl:for-each>
        <!-- gebruiksinstructie/toedieningsweg -->
        <xsl:apply-templates select="toedieningsweg" mode="handleToedieningsweg"/>
    </xsl:template>


    <xd:doc>
        <xd:desc/>
        <xd:param name="additionalInfo"/>
    </xd:doc>
    <xsl:template name="zib-Medication-AdditionalInformation">
        <xsl:param name="additionalInfo" as="element()?"/>
        <!-- aanvullende_informatie -->
        <xsl:for-each select="$additionalInfo">
            <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation">
                <valueCodeableConcept>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueCodeableConcept>
            </extension>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc> Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-MedicationAgreement/ </xd:desc>
        <xd:param name="medicatieafspraak"/>
    </xd:doc>
    <xsl:template name="zib-MedicationAgreement-2.0">
        <xsl:param name="medicatieafspraak" as="element()?"/>
        <xsl:for-each select="$medicatieafspraak">
            <!-- entry for MedicationRequest -->
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
                <resource>
                    <xsl:call-template name="MA-in-MedicationRequest-2.0">
                        <xsl:with-param name="medicatieafspraak" select="."/>
                        <xsl:with-param name="medicationrequest-id" select="
                                if ($referById) then
                                    nf:removeSpecialCharacters(./identificatie/@value)
                                else
                                    ()"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/ZIB-MedicationAgreement/ version 2.2 </xd:desc>
        <xd:param name="medicatieafspraak"/>
    </xd:doc>
    <xsl:template name="zib-MedicationAgreement-2.2">
        <xsl:param name="medicatieafspraak" as="element()?"/>
        <xsl:for-each select="$medicatieafspraak">
            <!-- entry for MedicationRequest -->
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
                <resource>
                    <xsl:call-template name="MA-in-MedicationRequest-2.2">
                        <xsl:with-param name="medicatieafspraak" select="."/>
                        <xsl:with-param name="medicationrequest-id" select="
                                if ($referById) then
                                    nf:removeSpecialCharacters(./identificatie/@value)
                                else
                                    ()"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="copyIndicator"/>
    </xd:doc>
    <xsl:template name="zib-Medication-CopyIndicator">
        <xsl:param name="copyIndicator" as="element()?"/>
        <!-- kopie indicator -->
        <!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
        <xsl:for-each select="$copyIndicator">
            <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-CopyIndicator">
                <valueBoolean value="{(./@value='true')}"/>
            </extension>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="start"/>
        <xd:param name="end"/>
    </xd:doc>
    <xsl:template name="zib-Medication-Period-Of-Use-2.0">
        <xsl:param name="start" as="element()?"/>
        <xsl:param name="end" as="element()?"/>
        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse">
            <valuePeriod>
                <xsl:for-each select="$start[@value]">
                    <start value="{nf:ada-2-dateTimeCET(./@value)}"/>
                </xsl:for-each>
                <xsl:for-each select="$end[@value]">
                    <end value="{nf:ada-2-dateTimeCET(./@value)}"/>
                </xsl:for-each>
            </valuePeriod>
        </extension>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="repeat-period"/>
    </xd:doc>
    <xsl:template name="zib-Medication-RepeatPeriodCyclicalSchedule">
        <xsl:param name="repeat-period" as="element()?"/>
        <!-- herhaalperiode cyclisch schema -->
        <xsl:for-each select="$repeat-period">
            <modifierExtension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule">
                <valueDuration>
                    <xsl:call-template name="hoeveelheid-to-Duration">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueDuration>
            </modifierExtension>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="stopType"/>
    </xd:doc>
    <xsl:template name="zib-Medication-StopType">
        <xsl:param name="stopType" as="element()?"/>
        <xsl:for-each select="$stopType">
            <modifierExtension url="http://nictiz.nl/fhir/StructureDefinition/zib-Medication-StopType">
                <valueCodeableConcept>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueCodeableConcept>
            </modifierExtension>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="medicatiegebruik"/>
        <xd:param name="medicationstatement-id"/>
    </xd:doc>
    <xsl:template name="zib-MedicationUse-2.0">
        <xsl:param name="medicatiegebruik"/>
        <xsl:param name="medicationstatement-id" as="xs:string?"/>
        <xsl:for-each select="$medicatiegebruik">
            <!-- MedicationStatement entry -->
            <entry>
                <fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
                <resource>
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
                                        <xsl:apply-templates select="." mode="doPractitionerRoleReference"/>
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
                                            <xsl:apply-templates select="./auteur_is_zorgverlener/zorgverlener" mode="doPractitionerRoleReference"/>
                                        </valueReference>
                                    </xsl:when>
                                    <xsl:when test="./auteur_is_patient[@value = 'true']">
                                        <valueReference>
                                            <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference"/>
                                        </valueReference>
                                    </xsl:when>
                                </xsl:choose>
                            </extension>
                        </xsl:for-each>
                        <!-- relatie naar medicamenteuze behandeling -->
                        <xsl:for-each select="./../identificatie[@value]">
                            <xsl:call-template name="mbh-id-2-reference">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <!-- kopie indicator -->
                        <!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
                        <xsl:for-each select="./kopie_indicator[@value]">
                            <xsl:call-template name="zib-Medication-CopyIndicator">
                                <xsl:with-param name="copyIndicator" select="."/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <!-- herhaalperiode cyclisch schema -->
                        <xsl:for-each select="./gebruiksinstructie/herhaalperiode_cyclisch_schema[@value]">
                            <xsl:call-template name="zib-Medication-RepeatPeriodCyclicalSchedule">
                                <xsl:with-param name="repeat-period" select="."/>
                            </xsl:call-template>
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
                                <status value="stopped"/>
                            </xsl:when>
                            <xsl:when test="./stoptype/@code = '2'">
                                <status value="on-hold"/>
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
                                    <xsl:call-template name="zib-Medication-Use-Duration">
                                        <xsl:with-param name="duration" select="."/>
                                    </xsl:call-template>
                                </xsl:for-each>
                                <xsl:for-each select="gebruiksperiode_start[@value]">
                                    <start value="{nf:ada-2-dateTimeCET(./@value)}"/>
                                </xsl:for-each>
                                <xsl:for-each select="gebruiksperiode_eind[@value]">
                                    <end value="{nf:ada-2-dateTimeCET(./@value)}"/>
                                </xsl:for-each>
                            </effectivePeriod>
                        </xsl:for-each>
                        <!-- registratiedatum -->
                        <xsl:for-each select="./registratiedatum[@value]">
                            <dateAsserted value="{nf:ada-2-dateTimeCET(./@value)}"/>
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
                                        <xsl:apply-templates select="persoon" mode="doRelatedPersonReference"/>
                                    </xsl:when>
                                    <xsl:when test="informant_is_patient[@value = 'true']">
                                        <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference"/>
                                    </xsl:when>
                                    <xsl:when test="informant_is_zorgverlener[.//@value]">
                                        <xsl:apply-templates select="./informant_is_zorgverlener/zorgverlener" mode="doPractitionerRoleReference"/>
                                    </xsl:when>
                                </xsl:choose>
                            </informationSource>
                        </xsl:for-each>
                        <!-- patiënt -->
                        <subject>
                            <xsl:apply-templates select="./../../patient" mode="doPatientReference"/>
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
                </resource>
            </entry>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Profile MedicationUse 2.2.x, which is part of MP 9.0.7</xd:desc>
        <xd:param name="medicatiegebruik"/>
        <xd:param name="medicationstatement-id"/>
    </xd:doc>
    <xsl:template name="zib-MedicationUse-2.2">
        <xsl:param name="medicatiegebruik"/>
        <xsl:param name="medicationstatement-id" as="xs:string?"/>
        <xsl:for-each select="$medicatiegebruik">
            <!-- informant / persoon in eigen resource -->
            <xsl:variable name="informant-persoon-fullUrl" select="nf:get-fhir-uuid(.)"/>
            <xsl:for-each select="./informant/persoon[.//@value]">
                <entry>
                    <fullUrl value="{$informant-persoon-fullUrl}"/>
                    <resource>
                        <xsl:call-template name="nl-core-relatedperson-2.0">
                            <xsl:with-param name="relatedperson-id" select="
                                    if ($referById) then
                                        upper-case(nf:removeSpecialCharacters(string-join(.//(@value | @displayName), '')))
                                    else
                                        ()"/>
                        </xsl:call-template>
                    </resource>
                </entry>
            </xsl:for-each>
            <!-- MedicationStatement entry -->
            <entry>
                <fullUrl value="{nf:getUriFromAdaId(./identificatie)}"/>
                <resource>
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
                                <valueReference>
                                    <xsl:apply-templates select="." mode="doPractitionerRoleReference"/>
                                </valueReference>
                            </extension>
                        </xsl:for-each>
                        <!-- auteur -->
                        <xsl:for-each select="./auteur[.//@value]">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Author">
                                <xsl:choose>
                                    <xsl:when test="./auteur_is_zorgverlener[.//@value]">
                                        <valueReference>
                                            <xsl:apply-templates select="./auteur_is_zorgverlener/zorgverlener" mode="doPractitionerRoleReference"/>
                                        </valueReference>
                                    </xsl:when>
                                    <xsl:when test="./auteur_is_patient[@value = 'true']">
                                        <valueReference>
                                            <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference"/>
                                        </valueReference>
                                    </xsl:when>
                                    <xsl:when test="./auteur_is_zorgaanbieder[.//@value]">
                                        <valueReference>
                                            <xsl:apply-templates select="./auteur_is_zorgaanbieder/zorgaanbieder" mode="doOrganizationReference"/>
                                        </valueReference>
                                    </xsl:when>
                                </xsl:choose>
                            </extension>
                        </xsl:for-each>
                        <!-- relatie naar medicamenteuze behandeling -->
                        <xsl:for-each select="./../identificatie[@value]">
                            <xsl:call-template name="mbh-id-2-reference">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <!-- kopie indicator -->
                        <!-- zit niet in alle transacties, eigenlijk alleen in medicatieoverzicht -->
                        <xsl:for-each select="./kopie_indicator[@value]">
                            <xsl:call-template name="zib-Medication-CopyIndicator">
                                <xsl:with-param name="copyIndicator" select="."/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <!-- herhaalperiode cyclisch schema -->
                        <xsl:for-each select="./gebruiksinstructie/herhaalperiode_cyclisch_schema[@value]">
                            <xsl:call-template name="zib-Medication-RepeatPeriodCyclicalSchedule">
                                <xsl:with-param name="repeat-period" select="."/>
                            </xsl:call-template>
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
                                <status value="stopped"/>
                            </xsl:when>
                            <xsl:when test="./stoptype/@code = '2'">
                                <status value="on-hold"/>
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
                                    <xsl:call-template name="zib-Medication-Use-Duration">
                                        <xsl:with-param name="duration" select="."/>
                                    </xsl:call-template>
                                </xsl:for-each>
                                <xsl:for-each select="gebruiksperiode_start[@value]">
                                    <start value="{nf:ada-2-dateTimeCET(./@value)}"/>
                                </xsl:for-each>
                                <xsl:for-each select="gebruiksperiode_eind[@value]">
                                    <end value="{nf:ada-2-dateTimeCET(./@value)}"/>
                                </xsl:for-each>
                            </effectivePeriod>
                        </xsl:for-each>
                        <!-- registratiedatum -->
                        <xsl:for-each select="./registratiedatum[@value]">
                            <dateAsserted value="{nf:ada-2-dateTimeCET(./@value)}"/>
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
                                    <xsl:when test="./persoon[.//@value]">
                                        <reference value="{$informant-persoon-fullUrl}"/>
                                        <display value="{normalize-space(string-join(./persoon/naamgegevens[1]//*[not(name()='naamgebruik')]/@value,' '))}"/>
                                    </xsl:when>
                                    <xsl:when test="./informant_is_patient[@value = 'true']">
                                        <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference"/>
                                    </xsl:when>
                                    <xsl:when test="./informant_is_zorgverlener[.//@value]">
                                        <xsl:apply-templates select="./informant_is_zorgverlener/zorgverlener" mode="doMissingTypeReferencePractitionerRole"/>
                                    </xsl:when>
                                </xsl:choose>
                            </informationSource>
                        </xsl:for-each>
                        <!-- patiënt -->
                        <subject>
                            <xsl:apply-templates select="./../../patient" mode="doPatientReference"/>
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
                </resource>
            </entry>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc/>
        <xd:param name="duration"/>
    </xd:doc>
    <xsl:template name="zib-Medication-Use-Duration">
        <xsl:param name="duration" as="element()?"/>
        <xsl:for-each select="$duration">
            <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration">
                <valueDuration>
                    <xsl:call-template name="hoeveelheid-to-Duration">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueDuration>
            </extension>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="condition-id"/>
    </xd:doc>
    <xsl:template name="zib-problem-2.0" match="probleem" mode="doConditionForProbleem">
        <xsl:param name="condition-id" as="xs:string?"/>
        <Condition>
            <xsl:if test="string-length($condition-id) gt 0">
                <id value="{$condition-id}"/>
            </xsl:if>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Problem"/>
            </meta>
            <!-- probleem status -->
            <xsl:choose>
                <xsl:when test="./probleem_status[@code]">
                    <clinicalStatus>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <xsl:when test="./@code = '73425007'">inactive</xsl:when>
                                <xsl:when test="./@code = '55561003'">active</xsl:when>
                                <xsl:otherwise>active</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </clinicalStatus>
                </xsl:when>
                <xsl:otherwise>
                    <!-- 1..1, so let's assume active if  -->
                    <clinicalStatus value="active"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- probleem naam -->
            <xsl:for-each select="./probleem_naam[@code]">
                <code>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </code>
            </xsl:for-each>
            <subject>
                <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference"/>
            </subject>
        </Condition>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="medication-id"/>
    </xd:doc>
    <xsl:template name="zib-Product" match="product" mode="doMedication">
        <xsl:param name="medication-id" as="xs:string?"/>
        <Medication xmlns="http://hl7.org/fhir">
            <xsl:for-each select="$medication-id">
                <id value="{.}"/>
            </xsl:for-each>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Product"/>
            </meta>
            <xsl:for-each select="./product_specificatie/omschrijving[@value]">
                <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Product-Description">
                    <valueString value="{replace(string-join(./@value, ''),'(^\s+)|(\s+$)','')}"/>
                </extension>
            </xsl:for-each>
            <xsl:choose>
                <xsl:when test="./product_code[not(@codeSystem = $oidHL7NullFlavor)]">
                    <code>
                        <xsl:for-each select="./product_code[not(@codeSystem = $oidHL7NullFlavor)]">
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </xsl:for-each>
                    </code>
                </xsl:when>
                <xsl:when test="./product_specificatie/product_naam[@value]">
                    <code>
                        <text value="{./product_specificatie/product_naam/@value}"/>
                    </code>
                </xsl:when>
            </xsl:choose>
            <xsl:for-each select="./product_specificatie/farmaceutische_vorm[@code]">
                <form>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </form>
            </xsl:for-each>
            <xsl:for-each select="./product_specificatie/ingredient[.//(@value | @code)]">
                <ingredient>
                    <xsl:for-each select="./ingredient_code[@code]">
                        <itemCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </itemCodeableConcept>
                    </xsl:for-each>
                    <isActive value="true"/>
                    <xsl:for-each select="./sterkte">
                        <amount>
                            <xsl:call-template name="hoeveelheid-complex-to-Ratio">
                                <xsl:with-param name="numerator" select="./hoeveelheid_ingredient"/>
                                <xsl:with-param name="denominator" select="./hoeveelheid_product"/>
                            </xsl:call-template>
                        </amount>
                    </xsl:for-each>
                </ingredient>
            </xsl:for-each>
        </Medication>
    </xsl:template>

    <xd:doc>
        <xd:desc>Converts unit from G-Standaard to UCUM</xd:desc>
        <xd:param name="GstdBasiseenheid_code"/>
    </xd:doc>
    <xsl:function name="nf:convertGstdBasiseenheid2UCUM" as="xs:string">
        <xsl:param name="GstdBasiseenheid_code" as="xs:string"/>

        <xsl:choose>
            <xsl:when test="$GstdBasiseenheid_code castable as xs:integer">
                <xsl:choose>
                    <xsl:when test="$GstdBasiseenheid_code = '205'">cm</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '208'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '211'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '215'">g</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '217'">[iU]</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '219'">kg</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '222'">l</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '229'">mg</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '233'">ml</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '234'">mm</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '245'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '252'">ug</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '254'">ul</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '303'">[drp]</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '345'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '490'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '500'">1</xsl:when>
                    <xsl:otherwise>Not supported G-standaard basiseenheid: <xsl:value-of select="$GstdBasiseenheid_code"/></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!-- geen integer meegekregen --> G-standaard code is not an integer. Not supported G-standaard basiseenheid: "<xsl:value-of select="$GstdBasiseenheid_code"/>". </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$GstdBasiseenheid_code castable as xs:integer"> </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="resourceType">The type of resource to find, using hte variable with common entries</xd:param>
        <xd:param name="group-key">The group key to find the correct instance in the variables with common entries</xd:param>
        <xd:param name="bln-id">In case of $referById determine whether you get the id of or reference to the resource. If false() you get the reference (Patient/XXX_Amaya), if true() you get the id (XXX_Amaya).</xd:param>
    </xd:doc>
    <xsl:function name="nf:getFullUrlOrId" as="xs:string?">
        <xsl:param name="resourceType" as="xs:string?"/>
        <xsl:param name="group-key" as="xs:string?"/>
        <xsl:param name="bln-id" as="xs:boolean"/>

        <xsl:variable name="RESOURCETYPE" select="normalize-space(upper-case($resourceType))"/>
        <xsl:variable name="var">
            <xsl:choose>
                <xsl:when test="$RESOURCETYPE = 'PATIENT'">
                    <xsl:copy-of select="$patients"/>
                </xsl:when>
                <xsl:when test="$RESOURCETYPE = 'ORGANIZATION'">
                    <xsl:copy-of select="$organizations"/>
                </xsl:when>
                <xsl:when test="$RESOURCETYPE = 'PRACTITIONER'">
                    <xsl:copy-of select="$practitioners"/>
                </xsl:when>
                <xsl:when test="$RESOURCETYPE = 'PRACTITIONERROLE'">
                    <xsl:copy-of select="$practitionerRoles"/>
                </xsl:when>
                <xsl:when test="$RESOURCETYPE = 'PRODUCT'">
                    <xsl:copy-of select="$products"/>
                </xsl:when>
                <xsl:when test="$RESOURCETYPE = 'LOCATION'">
                    <xsl:copy-of select="$locations"/>
                </xsl:when>
                <xsl:when test="$RESOURCETYPE = ('GEWICHT', 'LENGTE', 'BODYOBSERVATION', 'BODY-OBSERVATION')">
                    <xsl:copy-of select="$body-observations"/>
                </xsl:when>
                <xsl:when test="$RESOURCETYPE = 'REDENVOORSCHRIJVEN'">
                    <xsl:copy-of select="$prescribe-reasons"/>
                </xsl:when>
                <xsl:when test="$RESOURCETYPE = 'RELATEDPERSON'">
                    <xsl:copy-of select="$related-persons"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="$referById = true()">
                <xsl:variable name="resource" select="$var/*[.//group-key/text() = $group-key]//*[f:id]"/>
                <xsl:choose>
                    <xsl:when test="$bln-id">
                        <xsl:value-of select="$resource/f:id/@value"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat($resource/local-name(), '/', $resource/f:id/@value)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$var/*[.//group-key/text() = $group-key]//f:entry/f:fullUrl/@value"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:getGroupingKeyDefault" as="xs:string?">
        <xsl:param name="in" as="element()?"/>
        <xsl:value-of select="normalize-space(upper-case(concat(string-join($in//@value, ''), string-join($in//@root, ''), string-join($in//@code, ''), string-join($in//@codeSystem, ''), string-join($in//@nullFlavor, ''))))"/>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="zorgverlener"/>
    </xd:doc>
    <xsl:function name="nf:getGroupingKeyPractitioner" as="xs:string?">
        <xsl:param name="zorgverlener" as="element()?"/>
        <xsl:value-of select="concat(nf:getGroupingKeyDefault($zorgverlener/(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer)), nf:getGroupingKeyDefault($zorgverlener/(zorgverlener_naam | naamgegevens)), nf:getGroupingKeyDefault($zorgverlener/adres), nf:getGroupingKeyDefault($zorgverlener/telefoon_email))"/>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="zorgaanbieder-identificatie-nummer"/>
    </xd:doc>
    <xsl:function name="nf:ada-za-id" as="element()?">
        <xsl:param name="zorgaanbieder-identificatie-nummer" as="element()*"/>
        <xsl:sequence select="
                if ($zorgaanbieder-identificatie-nummer[@root = $oidURAOrganizations]) then
                    ($zorgaanbieder-identificatie-nummer[@root = $oidURAOrganizations])
                else
                    (if ($zorgaanbieder-identificatie-nummer[@root = $oidAGB]) then
                        ($zorgaanbieder-identificatie-nummer[@root = $oidAGB])
                    else
                        $zorgaanbieder-identificatie-nummer[1])"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Takes input string. If it is a dateTime, it checks if it has a timezone. If it is a dateTime without timezone a CET timezone will be set. 
			In all other cases, the input string is returned.</xd:desc>
        <xd:param name="valueIn">The input string to be handled.</xd:param>
    </xd:doc>
    <xsl:function name="nf:ada-2-dateTimeCET" as="xs:string?">
        <xsl:param name="valueIn" as="xs:string?"/>
        <xsl:value-of select="
                if (not($valueIn castable as xs:dateTime)) then
                    $valueIn
                else
                    if (timezone-from-dateTime(xs:dateTime($valueIn))) then
                        $valueIn
                    else
                        nf:set-CET-timezone(xs:dateTime($valueIn))
                "/>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="zorgverlener-identificatie-nummer"/>
    </xd:doc>
    <xsl:function name="nf:ada-zvl-id" as="element()?">
        <xsl:param name="zorgverlener-identificatie-nummer" as="element()*"/>
        <xsl:sequence select="
                if ($zorgverlener-identificatie-nummer[@root = $oidUZIPersons]) then
                    ($zorgverlener-identificatie-nummer[@root = $oidUZIPersons])
                else
                    (if ($zorgverlener-identificatie-nummer[@root = $oidAGB]) then
                        ($zorgverlener-identificatie-nummer[@root = $oidAGB])
                    else
                        (if ($zorgverlener-identificatie-nummer[@root = $oidBIGregister]) then
                            ($zorgverlener-identificatie-nummer[@root = $oidBIGregister])
                        else
                            $zorgverlener-identificatie-nummer[1]))"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Creates a grouping key for product, taking account of products which don't have a product-code</xd:desc>
        <xd:param name="ada-product-code"/>
    </xd:doc>
    <xsl:function name="nf:getProductGroupingKey" as="xs:string">
        <xsl:param name="ada-product-code" as="element()*"/>

        <xsl:variable name="specific-productcode" select="nf:get-specific-productcode($ada-product-code)"/>
        <xsl:choose>
            <xsl:when test="$specific-productcode">
                <xsl:value-of select="$specific-productcode/concat(@code, @codeSystem)"/>
            </xsl:when>
            <xsl:otherwise>MAGISTRAAL</xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="ada-zorgverlener"/>
    </xd:doc>
    <xsl:function name="nf:get-practitioner-role-display" as="xs:string?">
        <xsl:param name="ada-zorgverlener" as="element()?"/>
        <xsl:for-each select="$ada-zorgverlener">
            <xsl:value-of select="normalize-space(concat(string-join((.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value), ' '), ' || ', string-join(.//organisatie_naam/@value | .//specialisme/@displayName, ' || ')))"/>
        </xsl:for-each>
    </xsl:function>

    <xd:doc>
        <xd:desc>Takes a collection of product_codes as input and returns the most specific one according to G-std, otherwise just the first one</xd:desc>
        <xd:param name="ada-product-code">Collection of ada product codes to select the most specific one from</xd:param>
    </xd:doc>
    <xsl:function name="nf:get-specific-productcode" as="element()?">
        <xsl:param name="ada-product-code" as="element()*"/>
        <xsl:sequence select="
                if ($ada-product-code[@codeSystem = $oidGStandaardZInummer]) then
                    ($ada-product-code[@codeSystem = $oidGStandaardZInummer])
                else
                    (if ($ada-product-code[@codeSystem = $oidGStandaardHPK]) then
                        ($ada-product-code[@codeSystem = $oidGStandaardHPK])
                    else
                        (if ($ada-product-code[@codeSystem = $oidGStandaardPRK]) then
                            ($ada-product-code[@codeSystem = $oidGStandaardPRK])
                        else
                            (if ($ada-product-code[@codeSystem = $oidGStandaardGPK]) then
                                ($ada-product-code[@codeSystem = $oidGStandaardGPK])
                            else
                                $ada-product-code[1]
                            )
                        )
                    )"/>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:removeSpecialCharacters" as="xs:string?">
        <xsl:param name="in" as="xs:string?"/>
        <xsl:value-of select="replace(translate($in, '_.', '--'), '[^a-zA-Z0-9-]', '')"/>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="documentgegevens"/>
        <xd:param name="entries"/>
    </xd:doc>
    <xsl:template name="medicatieoverzicht-9.0.6">
        <xsl:param name="documentgegevens" select="." as="element()?"/>
        <xsl:param name="entries" as="element(f:entry)*"/>
        <xsl:for-each select="$documentgegevens">
            <entry>
                <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                <resource>
                    <List>
                        <xsl:if test="$referById">
                            <id value="{generate-id(.)}"/>
                        </xsl:if>
                        <meta>
                            <profile value="http://nictiz.nl/fhir/StructureDefinition/MedicationOverview"/>
                        </meta>
                        <xsl:if test="verificatie_patient[.//(@value | @code)] | verificatie_zorgverlener[.//(@value | @code)]">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/MedicationOverview-Verification">
                                <xsl:for-each select="./verificatie_patient/geverifieerd_met_patientq/@value">
                                    <extension url="VerificationPatient">
                                        <valueBoolean value="{.}"/>
                                    </extension>
                                </xsl:for-each>
                                <xsl:for-each select="./verificatie_patient/verificatie_datum/@value">
                                    <extension url="VerificationPatientDate">
                                        <valueDateTime value="{nf:ada-2-dateTimeCET(.)}"/>
                                    </extension>
                                </xsl:for-each>
                                <xsl:for-each select="./verificatie_zorgverlener/geverifieerd_met_zorgverlenerq/@value">
                                    <extension url="VerificationHealthProfessional">
                                        <valueBoolean value="{.}"/>
                                    </extension>
                                </xsl:for-each>
                                <xsl:for-each select="./verificatie_zorgverlener/verificatie_datum/@value">
                                    <extension url="VerificationHealthProfessionalDate">
                                        <valueDateTime value="{nf:ada-2-dateTimeCET(.)}"/>
                                    </extension>
                                </xsl:for-each>
                            </extension>
                        </xsl:if>
                        <status value="current"/>
                        <mode value="snapshot"/>
                        <code>
                            <coding>
                                <system value="http://snomed.info/sct"/>
                                <code value="11181000146103"/>
                                <display value="Actual medication overview (record artifact)"/>
                            </coding>
                            <text value="Medicatieoverzicht"/>
                        </code>
                        <subject>
                            <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference"/>
                        </subject>
                        <date value="{nf:ada-2-dateTimeCET(./document_datum/@value)}"/>
                        <xsl:for-each select="./auteur">
                            <xsl:for-each select="./auteur_is_zorgaanbieder/zorgaanbieder[.//(@value | @code)]">
                                <source>
                                    <extension url="http://nictiz.nl/fhir/StructureDefinition/MedicationOverview-SourceOrganization">
                                        <valueReference>
                                            <xsl:apply-templates select="." mode="doOrganizationReference"/>
                                        </valueReference>
                                    </extension>
                                </source>
                            </xsl:for-each>
                            <xsl:for-each select="./auteur_is_patient[@value = 'true']">
                                <source>
                                    <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference"/>
                                </source>
                            </xsl:for-each>
                        </xsl:for-each>
                        <!-- the entries with references to medicatieafspraak/toedieningsafspraak/medicatiegebruik -->
                        <!-- MA's en TA's -->
                        <xsl:apply-templates select="$entries[f:resource/*/f:category/f:coding[f:system/@value = 'http://snomed.info/sct'][f:code/@value = ('16076005', '422037009')]]" mode="doMOListReference"/>
                        <!-- MGB's -->
                        <xsl:apply-templates select="$entries[f:resource/*/f:category/f:coding[f:system/@value = 'urn:oid:2.16.840.1.113883.2.4.3.11.60.20.77.5.3'][f:code/@value = '6']]" mode="doMOListReference"/>
                    </List>
                </resource>
            </entry>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Make an entry with a reference to another entry as is used in the List resource in Bundle for Medicatieoverzicht (medication overview)</xd:desc>
    </xd:doc>
    <xsl:template name="medicatieoverzicht-list-reference" match="f:entry" mode="doMOListReference">
        <entry>
            <item>
                <reference>
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test="$referById">
                                <xsl:value-of select="concat(./f:resource/*[f:id]/local-name(), '/', ./f:resource/*/f:id/@value)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="./f:fullUrl/@value"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </reference>
                <display value="{./f:resource/*/f:category/f:text/@value} identifier: value='{./f:resource/*/f:identifier[1]/f:value/@value}', system='{./f:resource/*/f:identifier[1]/f:system/@value}'"/>
            </item>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="medication-reference" match="product" mode="doMedicationReference">
        <!-- determine most specific product_code -->
        <xsl:variable name="productCode" select="./product_code"/>
        <xsl:variable name="mainGstdLevel" as="xs:string?">
            <xsl:choose>
                <xsl:when test="$productCode[@codeSystem = $oidGStandaardZInummer]">
                    <xsl:value-of select="$oidGStandaardZInummer"/>
                </xsl:when>
                <xsl:when test="$productCode[@codeSystem = $oidGStandaardHPK]">
                    <xsl:value-of select="$oidGStandaardHPK"/>
                </xsl:when>
                <xsl:when test="$productCode[@codeSystem = $oidGStandaardPRK]">
                    <xsl:value-of select="$oidGStandaardPRK"/>
                </xsl:when>
                <xsl:when test="$productCode[@codeSystem = $oidGStandaardGPK]">
                    <xsl:value-of select="$oidGStandaardGPK"/>
                </xsl:when>
                <xsl:when test="$productCode[@codeSystem = $oidGStandaardSSK]">
                    <xsl:value-of select="$oidGStandaardSSK"/>
                </xsl:when>
                <xsl:when test="$productCode[@codeSystem = $oidGStandaardSNK]">
                    <xsl:value-of select="$oidGStandaardSNK"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>

        <medicationReference>
            <reference value="{nf:getFullUrlOrId('PRODUCT', nf:getGroupingKeyDefault(.), false())}"/>
            <display>
                <xsl:attribute name="value">
                    <xsl:choose>
                        <xsl:when test="./product_code[@codeSystem = $mainGstdLevel]/@displayName">
                            <xsl:value-of select="./product_code[@codeSystem = $mainGstdLevel]/@displayName"/>
                        </xsl:when>
                        <xsl:when test="./product_code/@displayName">
                            <xsl:value-of select="./product_code[@displayName][1]/@displayName"/>
                        </xsl:when>
                        <xsl:when test="./product_specificatie/product_naam/@value">
                            <xsl:value-of select="./product_specificatie/product_naam/@value"/>
                        </xsl:when>
                        <xsl:otherwise>ERROR: DISPLAYNAME NOT FOUND IN INPUT</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </display>
        </medicationReference>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an organization resource as a FHIR entry</xd:desc>
        <xd:param name="uuid">boolean to determine whether to generate a uuid for the fullURL</xd:param>
    </xd:doc>
    <xsl:template name="organization-entry" match="zorgaanbieder[not(zorgaanbieder)]" mode="doOrganization">
        <xsl:param name="uuid" as="xs:boolean"/>
        <xsl:variable name="ada-id" select="
                if ($uuid) then
                    (nf:get-fhir-uuid(.))
                else
                    (nf:getUriFromAdaId(nf:ada-za-id(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)))"/>
        <entry>
            <fullUrl value="{$ada-id}"/>
            <resource>
                <xsl:choose>
                    <xsl:when test="$referById">
                        <xsl:variable name="fhir-resource-id">
                            <xsl:choose>
                                <xsl:when test="$uuid">
                                    <xsl:value-of select="generate-id(.)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(string-join(./*/@value, ''))))"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:call-template name="nl-core-organization-2.0">
                            <xsl:with-param name="ada-zorgaanbieder" select="."/>
                            <xsl:with-param name="organization-id" select="$fhir-resource-id"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="nl-core-organization-2.0">
                            <xsl:with-param name="ada-zorgaanbieder" select="."/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </resource>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="organization-reference" match="zorgaanbieder" mode="doOrganizationReference">
        <reference value="{nf:getFullUrlOrId('ORGANIZATION',nf:getGroupingKeyDefault(.), false())}"/>
        <xsl:variable name="display-for-reference">
            <xsl:choose>
                <xsl:when test="organisatie_naam[@value]">
                    <xsl:value-of select="organisatie_naam/@value"/>
                </xsl:when>
                <xsl:when test="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)[@value]">Organisatie met id '<xsl:value-of select="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)/@value"/>' in identificerend systeem '<xsl:value-of select="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)/@root"/>'.</xsl:when>
                <xsl:otherwise>Organisatie informatie: <xsl:value-of select="string-join(.//(@value | @code | @root | @codeSystem), ' - ')"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <display value="{$display-for-reference}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="uuid"/>
    </xd:doc>
    <xsl:template name="patient-entry" match="patient" mode="doPatientEntry">
        <xsl:param name="uuid" as="xs:boolean"/>

        <!-- For privacy reasons always use UUID as fullUrl for patient -->
        <xsl:variable name="patient-fullUrl" select="nf:get-fhir-uuid(.)"/>
        <entry>
            <fullUrl value="{$patient-fullUrl}"/>
            <resource>
                <xsl:choose>
                    <xsl:when test="$referById">
                        <xsl:variable name="fhir-resource-id">
                            <xsl:choose>
                                <xsl:when test="$uuid">
                                    <xsl:value-of select="generate-id(.)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="upper-case(nf:removeSpecialCharacters(./naamgegevens/geslachtsnaam/achternaam/@value))"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:call-template name="nl-core-patient-2.0">
                            <xsl:with-param name="ada-patient" select="."/>
                            <xsl:with-param name="patient-id" select="$fhir-resource-id"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="nl-core-patient-2.0">
                            <xsl:with-param name="ada-patient" select="."/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </resource>
        </entry>
    </xsl:template>


    <xd:doc>
        <xd:desc/>
        <xd:param name="uuid"/>
    </xd:doc>
    <xsl:template name="practitioner-entry" match="zorgverlener" mode="doPractitioner">
        <xsl:param name="uuid" as="xs:boolean"/>
        <xsl:variable name="ada-id" select="
                if ($uuid) then
                    nf:get-fhir-uuid(.)
                else
                    if (./(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer)) then
                        nf:getUriFromAdaId(nf:ada-zvl-id(./(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer)))
                    else
                        nf:get-fhir-uuid(.)"/>
        <entry>
            <fullUrl value="{$ada-id}"/>
            <resource>
                <xsl:choose>
                    <xsl:when test="$referById">
                        <xsl:variable name="fhir-resource-id">
                            <xsl:choose>
                                <xsl:when test="$uuid">
                                    <xsl:value-of select="generate-id(.)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(string-join(.//*[not(ancestor-or-self::zorgaanbieder)]/@value, ''))))"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:call-template name="nl-core-practitioner-2.0">
                            <xsl:with-param name="ada-zorgverlener" select="."/>
                            <xsl:with-param name="practitioner-id" select="$fhir-resource-id"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="nl-core-practitioner-2.0">
                            <xsl:with-param name="ada-zorgverlener" select="."/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </resource>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="practitionerRole-entry" match="zorgverlener" mode="doPractitionerRoleEntry">
        <entry>
            <!-- input the node above this node, otherwise the fullUrl / fhir resource id will be identical to that of Practitioner.... -->
            <fullUrl value="{nf:get-fhir-uuid(./..)}"/>
            <resource>
                <xsl:choose>
                    <xsl:when test="$referById">
                        <xsl:variable name="fhir-resource-id" select="generate-id(./..)"/>
                        <xsl:call-template name="nl-core-practitionerrole-2.0">
                            <xsl:with-param name="ada-zorgverlener" select="."/>
                            <xsl:with-param name="practitionerrole-id" select="$fhir-resource-id"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="nl-core-practitionerrole-2.0">
                            <xsl:with-param name="ada-zorgverlener" select="."/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>

            </resource>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="uuid"/>
    </xd:doc>
    <xsl:template name="relatedperson-entry" match="persoon" mode="doRelatedPersonEntry">
        <xsl:param name="uuid" as="xs:boolean"/>
        <xsl:variable name="relatedperson-fullUrl" select="nf:get-fhir-uuid(.)"/>
        <entry>
            <fullUrl value="{$relatedperson-fullUrl}"/>
            <resource>
                <xsl:choose>
                    <xsl:when test="$referById">
                        <xsl:variable name="fhir-resource-id">
                            <xsl:choose>
                                <xsl:when test="$uuid">
                                    <xsl:value-of select="generate-id(.)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="upper-case(nf:removeSpecialCharacters(./naamgegevens/geslachtsnaam/achternaam/@value))"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:call-template name="nl-core-relatedperson-2.0">
                            <xsl:with-param name="relatedperson-id" select="$fhir-resource-id"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="nl-core-relatedperson-2.0"/>
                    </xsl:otherwise>
                </xsl:choose>
            </resource>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc> copy an element with all of it's contents in comments </xd:desc>
        <xd:param name="element"/>
    </xd:doc>
    <xsl:template name="copyElementInComment">
        <xsl:param name="element"/>
        <xsl:text disable-output-escaping="yes">
                       &lt;!--</xsl:text>
        <xsl:for-each select="$element">
            <xsl:call-template name="copyWithoutComments"/>
        </xsl:for-each>
        <xsl:text disable-output-escaping="yes">--&gt;
</xsl:text>
    </xsl:template>

    <xd:doc>
        <xd:desc> copy without comments </xd:desc>
    </xd:doc>
    <xsl:template name="copyWithoutComments">
        <xsl:copy>
            <xsl:for-each select="@* | *">
                <xsl:call-template name="copyWithoutComments"/>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>



</xsl:stylesheet>
