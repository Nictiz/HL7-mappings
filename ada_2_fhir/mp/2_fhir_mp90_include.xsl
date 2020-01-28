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
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>

    <xsl:variable name="bouwstenen-907" as="element(f:entry)*">
        <xsl:variable name="searchMode" as="xs:string">match</xsl:variable>
        
        <!-- medicatieafspraken -->
        <xsl:for-each select="//medicatieafspraak">
            <!-- entry for MedicationRequest -->
            <xsl:call-template name="MedicationAgreementEntry-2.2">
                <xsl:with-param name="searchMode" select="$searchMode"/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- verstrekkingsverzoeken -->
        <xsl:for-each select="//verstrekkingsverzoek">
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
    

</xsl:stylesheet>
