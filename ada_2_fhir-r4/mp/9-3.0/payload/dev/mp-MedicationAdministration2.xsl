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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nm="http://www.nictiz.nl/mappings" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>Converts ADA medicatie_toediening to FHIR MedicationAdministration conforming to profile mp-MedicationAdministration2</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Create an mp-MedicationAdministration2 instance as a MedicationAdministration FHIR instance from ADA medicatie_toediening.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">The MedicationAdministration.subject as ADA element or reference.</xd:param>
        <xd:param name="medicationReference">The MedicationAdministration.medicationReference as ADA element or reference.</xd:param>
        <xd:param name="administrationAgreement">The MedicationAdministration.administrationAgreement as ADA element or reference.</xd:param>
        <xd:param name="request">The MedicationAdministration.request as ADA element or reference.</xd:param>
        <xd:param name="performer">The MedicationAdministration.performer as ADA element or reference.</xd:param>
    </xd:doc>
    <xsl:template name="mp-MedicationAdministration2" mode="mp-MedicationAdministration2" match="medicatie_toediening | medicatietoediening" as="element(f:MedicationAdministration)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="medicationReference" select="toedienings_product/farmaceutisch_product" as="element()?"/>
        <xsl:param name="administrationAgreement" select="gerelateerde_afspraak/toedieningsafspraak/*" as="element()?"/>
        <xsl:param name="request" select="gerelateerde_afspraak/medicatieafspraak/*" as="element()?"/>
        <xsl:param name="performer" select="toediener/*[self::patient or self::zorgaanbieder or self::mantelzorger]/*" as="element()?"/>

        <xsl:for-each select="$in">
            <MedicationAdministration>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>

                <xsl:for-each select="afgesproken_datum_tijd">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAdministration2.AgreedDateTime">
                        <valueDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="./@value"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </valueDateTime>
                    </extension>
                </xsl:for-each>

                <xsl:for-each select="dubbele_controle_uitgevoerd">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAdministration2.DoubleCheckPerformed">
                        <valueBoolean>
                            <xsl:call-template name="boolean-to-boolean"/>
                        </valueBoolean>
                    </extension>
                </xsl:for-each>

                <xsl:for-each select="afwijkende_toediening">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAdministration2.DeviatingAdministration">
                        <valueBoolean>
                            <xsl:call-template name="boolean-to-boolean"/>
                        </valueBoolean>
                    </extension>
                </xsl:for-each>

                <xsl:for-each select="medicatie_toediening_reden_van_afwijken">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAdministration2.ReasonForDeviation">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>

                <!-- TODO: extension is not yet in profile -->
                <xsl:for-each select="volgens_afspraak_indicator">
                    <xsl:call-template name="ext-AsAgreedIndicator"/>
                </xsl:for-each>

                <!-- pharmaceuticalTreatmentIdentifier -->
                <xsl:for-each select="../identificatie">
                    <xsl:call-template name="ext-PharmaceuticalTreatmentIdentifier">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>

                <xsl:for-each select="identificatie[@value | @root | @nullFlavor]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier"/>
                    </identifier>
                </xsl:for-each>

                <!-- status -->
                <xsl:choose>
                    <xsl:when test="geannuleerd_indicator[@value = 'true']">
                        <status value="entered-in-error"/>
                    </xsl:when>
                    <xsl:when test="medicatie_toediening_status[@code]">
                        <xsl:for-each select="medicatie_toediening_status">
                            <status>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="code-to-code">
                                        <xsl:with-param name="codeMap" as="element()*">
                                            <map inCodeSystem="{$oidHL7ActStatus}" inCode="active" code="in-progress"/>
                                            <map inCodeSystem="{$oidHL7ActStatus}" inCode="suspended" code="on-hold"/>
                                            <map inCodeSystem="{$oidHL7ActStatus}" inCode="aborted" code="stopped"/>
                                            <map inCodeSystem="{$oidHL7ActStatus}" inCode="completed" code="completed"/>
                                            <map inCodeSystem="{$oidHL7ActStatus}" inCode="cancelled" code="not-done"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </status>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <status value="unknown"/>
                    </xsl:otherwise>
                </xsl:choose>

                <category>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="18629005"/>
                        <display value="toediening van medicatie"/>
                    </coding>
                </category>

                <xsl:for-each select="$medicationReference">
                    <medicationReference>
                        <xsl:call-template name="makeReference"/>
                    </medicationReference>
                </xsl:for-each>

                <!-- subject -->
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn">subject</xsl:with-param>
                </xsl:call-template>
                
                <!-- relatie_contact relatie_zorgepisode in context -->
                <xsl:for-each select="relatie_contact/(identificatie | identificatienummer)[@value]">
                    <context>
                        <!-- relatie_episode -->
                        <xsl:for-each select="../../relatie_zorgepisode/(identificatie | identificatienummer)[@value]">
                            <xsl:call-template name="ext-Context-EpisodeOfCare"/>
                        </xsl:for-each>
                        <!-- relatie_contact -->
                        <xsl:apply-templates select="." mode="nl-core-Encounter-RefIdentifier"/>
                    </context>
                </xsl:for-each>

                <!-- relatie_episode when there is no relatie_contact -->
                <xsl:if test="relatie_zorgepisode/(identificatie | identificatienummer)[@value] and not(relatie_contact/(identificatie | identificatienummer)[@value])">
                    <context>
                        <xsl:apply-templates select="relatie_zorgepisode/identificatienummer[@value]" mode="nl-core-EpisodeOfCare-RefIdentifier"/>
                    </context>
                </xsl:if>

                <!-- relatie_toedieningsafspraak -->
                <xsl:choose>
                    <!-- mp9 dataset -->
                    <xsl:when test="relatie_toedieningsafspraak/identificatie[@value]">
                        <supportingInformation>
                            <type value="MedicationDispense"/>
                            <identifier>
                                <xsl:call-template name="id-to-Identifier">
                                    <xsl:with-param name="in" select="relatie_toedieningsafspraak/identificatie[@value]"/>
                                </xsl:call-template>
                            </identifier>
                            <display value="relatie naar toedieningsafspraak met identificatie: {string-join((@value, @root), ' || ')}"/>
                        </supportingInformation>
                    </xsl:when>
                    <!-- zib dataset -->
                    <xsl:otherwise>
                        <xsl:if test="not(empty($administrationAgreement))">
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="$administrationAgreement"/>
                                <xsl:with-param name="wrapIn">supportingInformation</xsl:with-param>
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when test="toedienings_datum_tijd[@value]">
                        <effectiveDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="(toedienings_datum_tijd[@value])[1]/@value"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </effectiveDateTime>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- 1..1 in FHIR, so we'll output a data absent reason -->
                        <effectiveDateTime>
                            <extension url="{$urlExtHL7DataAbsentReason}">
                                <valueCode value="unknown"/>
                            </extension>
                        </effectiveDateTime>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:for-each select="$performer">
                    <performer>
                        <!-- There's at most 1 perfomer, so we can write both elements here -->
                        <actor>
                            <xsl:choose>
                                <xsl:when test="self::zorgaanbieder">
                                    <xsl:call-template name="makeReference">
                                        <xsl:with-param name="profile" select="$ada2resourceType/nm:map[@ada = current()/local-name()][@resource = 'PractitionerRole']/@profile"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="makeReference"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </actor>
                    </performer>
                </xsl:for-each>

                <!-- request -->
                <!-- relatie_medicatieafspraak -->                
                <!-- relatie_wisselend_doseerschema -->
                <xsl:choose>
                    <xsl:when test="relatie_medicatieafspraak/identificatie[@value]">
                        <!-- MP9 dataset -->
                        <xsl:for-each select="relatie_medicatieafspraak/identificatie[@value]">
                            <request>
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-ResourceCategory">
                                     <valueCodeableConcept>
                                        <coding>
                                            <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                            <code value="{$maCodeMP920}"/>
                                            <display value="voorschrijven"/>
                                        </coding>
                                    </valueCodeableConcept>
                                </extension>
                                <type value="MedicationRequest"/>
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier"/>
                                </identifier>
                                <display value="relatie naar medicatieafspraak met identificatie: {string-join((@value, @root), ' || ')}"/>
                            </request>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="relatie_wisselend_doseerschema/identificatie[@value]">
                        <!-- MP9 dataset -->
                        <xsl:for-each select="relatie_wisselend_doseerschema/identificatie[@value]">
                            <request>
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-ResourceCategory">
                                    <valueCodeableConcept>
                                        <coding>
                                            <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                            <code value="{$wdsCode}"/>
                                            <display value="optimaliseren van dosering van medicatie"/>
                                        </coding>
                                    </valueCodeableConcept>
                                </extension>
                                <type value="MedicationRequest"/>
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier"/>
                                </identifier>
                                <display value="relatie naar wisselend doseerschema met identificatie: {string-join((@value, @root), ' || ')}"/>
                            </request>
                        </xsl:for-each>
                    </xsl:when>

                    <xsl:otherwise>
                        <!-- zib dataset -->
                        <xsl:for-each select="$request">
                            <request>
                                <xsl:call-template name="makeReference"/>
                            </request>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string"/>
                        </text>
                    </note>
                </xsl:for-each>

                <xsl:variable name="dosage">
                    <!--  afgesproken_hoeveelheid -->
                    <xsl:for-each select="afgesproken_hoeveelheid">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAdministration2.AgreedAmount">
                            <valueQuantity>
                                <xsl:call-template name="_buildMedicationQuantity">
                                    <xsl:with-param name="adaValue" select="aantal"/>
                                    <xsl:with-param name="adaUnit" select="eenheid"/>
                                </xsl:call-template>
                            </valueQuantity>
                        </extension>
                    </xsl:for-each>

                    <xsl:for-each select="prik_plak_locatie[@value | @nullFlavor]">
                        <site>
                            <text>
                                <xsl:call-template name="string-to-string"/>
                            </text>
                        </site>
                    </xsl:for-each>
                    <xsl:for-each select="toedieningsweg[@code]">
                        <route>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </route>
                    </xsl:for-each>
                    <xsl:for-each select="toegediende_hoeveelheid[.//(@value | @nullFlavor | @unit | @code)]">
                        <dose>
                            <xsl:choose>
                                <!-- zib ada dataset -->
                                <xsl:when test="@value | @unit">
                                    <xsl:call-template name="hoeveelheid-to-Quantity"/>
                                </xsl:when>
                                <!-- MP9 ada dataset -->
                                <xsl:when test="*">
                                    <xsl:for-each select="aantal[@value]">
                                        <xsl:call-template name="_buildMedicationQuantity">
                                            <xsl:with-param name="adaValue" select="."/>
                                            <xsl:with-param name="adaUnit" select="../eenheid[@codeSystem = $oidGStandaardBST902THES2]"/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>
                        </dose>
                    </xsl:for-each>
                    <!-- toedieningssnelheid nominale waarde -->
                    <xsl:for-each select="toedieningssnelheid[*/nominale_waarde]">
                        <xsl:choose>
                            <xsl:when test="not(tijdseenheid/@value castable as xs:integer)">
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="msg">Encountered a toedieningssnelheid/tijdseenheid/@value which is not castable as integer, cannot output rate.</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="ucum-tijdseenheid-value">
                                    <xsl:if test="xs:integer(tijdseenheid/@value) ne 1">
                                        <xsl:value-of select="concat(tijdseenheid/@value, '.')"/>
                                    </xsl:if>
                                </xsl:variable>
                                <!-- we cannot use the G-standaard unit in this case, can only be communicated in FHIR using UCUM -->
                                <!-- let's determine the right UCUM for the rate (toedieningssnelheid) -->
                                <xsl:variable name="UCUM-rate" select="concat(nf:convertGstdBasiseenheid2UCUM(eenheid/@code), '/', $ucum-tijdseenheid-value, nf:convertTime_ADA_unit2UCUM_FHIR(tijdseenheid/@unit))"/>

                                <xsl:if test="waarde/nominale_waarde[@value]">
                                    <rateQuantity>
                                        <value value="{waarde/nominale_waarde/@value}"/>
                                        <unit value="{$UCUM-rate}"/>
                                        <system value="http://unitsofmeasure.org"/>
                                        <code value="{$UCUM-rate}"/>
                                    </rateQuantity>
                                </xsl:if>


                            </xsl:otherwise>
                        </xsl:choose>

                    </xsl:for-each>

                    <!-- TODO: mapping of zib Range for AdministreringSpeed. Also see https://bits.nictiz.nl/browse/ZIB-815
                        A extension for Range on the root of .dosage - has been created by https://github.com/Nictiz/Nictiz-R4-zib2020/issues/118 
                    
                    http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAdministration2.AdministreringSpeedRange
                    -->

                </xsl:variable>
                <xsl:if test="$dosage">
                    <dosage>
                        <xsl:copy-of select="$dosage"/>
                    </dosage>
                </xsl:if>
            </MedicationAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="medicatie_toediening | medicatietoediening" mode="_generateId">
        <xsl:variable name="uniqueString" as="xs:string?">
            <xsl:choose>
                <xsl:when test="identificatie[@root][@value]">
                    <xsl:for-each select="(identificatie[@root][@value])[1]">
                        <!-- we remove '.' in root oid and '_' in extension to enlarge the chance of staying in 64 chars -->
                        <xsl:value-of select="concat(replace(@root, '\.', ''), '-', replace(@value, '_', ''))"/>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <!-- we do not have anything to create a stable logicalId, lets return a UUID -->
                    <xsl:value-of select="uuid:get-uuid(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:call-template name="generateLogicalId">
            <xsl:with-param name="uniqueString" select="$uniqueString"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="medicatie_toediening | medicatietoediening" mode="_generateDisplay">
        <xsl:variable name="parts">
            <xsl:text>Medication administration</xsl:text>
            <xsl:if test="toedienings_datum_tijd/@value">
                <xsl:value-of select="concat('administration date', toedienings_datum_tijd/@value)"/>
            </xsl:if>
            <xsl:value-of select="toelichting/@value"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ', ')"/>
    </xsl:template>
</xsl:stylesheet>
