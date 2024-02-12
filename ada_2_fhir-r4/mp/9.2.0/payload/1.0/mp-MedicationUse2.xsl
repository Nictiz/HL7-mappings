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
        <xd:desc>Converts ADA medicatie_gebruik to FHIR MedicationStatement conforming to profile mp-MedicationUse2</xd:desc>
    </xd:doc>
    
    <xsl:variable name="mgbCode920" select="$mgbCode[1]"/>
    

    <xd:doc>
        <xd:desc>Create an mp-MedicationUse2 instance as a MedicationStatement FHIR instance from ADA medicatie_gebruik.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">The MedicationStatement.subject as ADA element or reference.</xd:param>
        <xd:param name="medicationReference">The MedicationStatement.medicationReference as ADA element or reference.</xd:param>
        <xd:param name="prescriber">The MedicationStatement.prescriber as ADA element or reference.</xd:param>
    </xd:doc>
    <xsl:template name="mp-MedicationUse2" mode="mp-MedicationUse2" match="medicatie_gebruik | medicatiegebruik" as="element(f:MedicationStatement)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="medicationReference" select="gebruiksproduct/farmaceutisch_product" as="element()?"/>
        <xsl:param name="prescriber" select="voorschrijver/zorgverlener" as="element()?"/>

        <xsl:for-each select="$in">
            <MedicationStatement>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>

                <xsl:for-each select="gebruiksinstructie">
                    <xsl:call-template name="ext-RenderedDosageInstruction"/>
                </xsl:for-each>

                <xsl:for-each select="$prescriber">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationUse2.Prescriber">
                        <valueReference>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="profile">nl-core-HealthProfessional-PractitionerRole</xsl:with-param>
                            </xsl:call-template>
                        </valueReference>
                    </extension>
                </xsl:for-each>

                <!-- TODO: check if we can use same extension as in medicatietoediening, the specific extension for MedicationUse can be made obsolete in that case -->
                <xsl:for-each select="volgens_afspraak_indicator">
                    <xsl:call-template name="ext-AsAgreedIndicator"/>                    
                </xsl:for-each>

                <!-- pharmaceuticalTreatmentIdentifier -->
                <xsl:for-each select="../identificatie">
                    <xsl:call-template name="ext-PharmaceuticalTreatmentIdentifier">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>

                <xsl:for-each select="kopie_indicator[@value | @nullFlavor]">
                    <xsl:call-template name="ext-CopyIndicator"/>
                </xsl:for-each>

                <!-- auteur -->
                <xsl:for-each select="auteur">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationUse2.Author">
                        <valueReference>
                            <xsl:choose>
                                <xsl:when test="auteur_is_patient[@value = 'true']">
                                    <xsl:call-template name="makeReference">
                                        <xsl:with-param name="in" select="$subject"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:when test="ancestor::data/*//zorgverlener[@id = current()/auteur_is_zorgverlener/zorgverlener/@value]">
                                    <xsl:call-template name="makeReference">
                                        <xsl:with-param name="in" select="ancestor::data/*//zorgverlener[@id = current()/auteur_is_zorgverlener/zorgverlener/@value]"/>
                                        <xsl:with-param name="profile" select="$profileNameHealthProfessionalPractitionerRole"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:when test="ancestor::data/*//zorgaanbieder[@id = current()/auteur_is_zorgaanbieder/zorgaanbieder/@value]">
                                    <xsl:call-template name="makeReference">
                                        <xsl:with-param name="in" select="ancestor::data/*//zorgaanbieder[@id = current()/auteur_is_zorgaanbieder/zorgaanbieder/@value]"/>
                                        <xsl:with-param name="profile" select="$profilenameHealthcareProvider"/>
                                    </xsl:call-template>
                                </xsl:when>
                            </xsl:choose>
                        </valueReference>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="gebruiksinstructie">
                    <xsl:call-template name="ext-InstructionsForUse.RepeatPeriodCyclicalSchedule"/>
                </xsl:for-each>

                <xsl:for-each select="medicatie_gebruik_stop_type">
                    <modifierExtension url="http://nictiz.nl/fhir/StructureDefinition/ext-StopType">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </valueCodeableConcept>
                    </modifierExtension>
                </xsl:for-each>

                <xsl:for-each select="identificatie[@value | @root]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier"/>
                    </identifier>
                </xsl:for-each>

                <!-- AWE: MP-737 - no distinction between active/intended/completed needed -->
                <status>
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test="medicatie_gebruik_stop_type[@code = $stoptypeMap[@stoptype = 'tijdelijk']/@code]">on-hold</xsl:when>
                        <xsl:when test="medicatie_gebruik_stop_type[@code = $stoptypeMap[@stoptype = 'definitief']/@code]">stopped</xsl:when>
                            <xsl:when test="gebruik_indicator/@value = 'false'">not-taken</xsl:when>
                            <xsl:otherwise>active</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                </status>

                <xsl:for-each select="reden_wijzigen_of_stoppen_gebruik">
                    <statusReason>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </statusReason>
                </xsl:for-each>

                <category>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="{$mgbCode920}"/>
                        <display value="bevinding betreffende gedrag met betrekking tot medicatieregime"/>
                    </coding>
                </category>

                <xsl:for-each select="$medicationReference">
                    <medicationReference>
                        <xsl:call-template name="makeReference"/>
                    </medicationReference>
                </xsl:for-each>

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

                <xsl:for-each select="gebruiksperiode">
                    <xsl:call-template name="ext-TimeInterval.Period">
                        <xsl:with-param name="wrapIn">effectivePeriod</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <xsl:for-each select="(medicatie_gebruik_datum_tijd | medicatiegebruik_datum_tijd)">
                    <dateAsserted>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="./@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </dateAsserted>
                </xsl:for-each>

                <!-- informant -->
                <xsl:for-each select="informant/*">
                    <xsl:choose>
                        <xsl:when test="ancestor::data/*//contactpersoon[@id = current()/self::persoon/contactpersoon/@value]">
                            <informationSource>
                                <xsl:call-template name="makeReference">
                                    <xsl:with-param name="in" select="ancestor::data/*//contactpersoon[@id = current()/self::persoon/contactpersoon/@value]"/>
                                </xsl:call-template>
                            </informationSource>
                        </xsl:when>
                        <xsl:when test="self::informant_is_patient[@value = 'true']">
                            <informationSource>
                                <xsl:call-template name="makeReference">
                                    <xsl:with-param name="in" select="$subject"/>
                                </xsl:call-template>
                            </informationSource>
                        </xsl:when>
                        <xsl:when test="ancestor::data/*//zorgverlener[@id = current()/self::informant_is_zorgverlener/zorgverlener/@value]">
                            <informationSource>
                                <xsl:call-template name="makeReference">
                                    <xsl:with-param name="in" select="ancestor::data/*//zorgverlener[@id = current()/self::informant_is_zorgverlener/zorgverlener/@value]"/>
                                    <xsl:with-param name="profile" select="$profileNameHealthProfessionalPractitionerRole"/>
                                </xsl:call-template>
                            </informationSource>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
                <!-- relatie_medicatieafspraak -->
                <!-- relatie_toedieningsafspraak -->
                <!-- relatie_medicatieverstrekking -->
                <xsl:for-each select="relatie_medicatieafspraak/identificatie[@value]">
                    <derivedFrom>
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-ResourceCategory">
                            <valueCodeableConcept>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="{$maCodeMP920}"/>
                                    <display value="voorschrijven"/>
                                </coding>
                            </valueCodeableConcept>
                        </extension>
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                        <type value="MedicationRequest"/>
                        <display value="relatie naar medicatieafspraak"/>
                    </derivedFrom>
                </xsl:for-each>
                <xsl:for-each select="relatie_toedieningsafspraak/identificatie[@value]">
                    <derivedFrom>
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-ResourceCategory">
                            <valueCodeableConcept>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="{$taCode930}"/>
                                    <display value="toedieningsafspraak"/>
                                </coding>
                            </valueCodeableConcept>
                        </extension>
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                        <type value="MedicationDispense"/>
                        <display value="relatie naar toedieningsafspraak"/>
                    </derivedFrom>
                </xsl:for-each>
                <xsl:for-each select="relatie_medicatieverstrekking/identificatie[@value]">
                    <derivedFrom>
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-ResourceCategory">
                            <valueCodeableConcept>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="{$mveCode920}"/>
                                    <display value="verstrekken van medicatie"/>
                                </coding>
                            </valueCodeableConcept>
                        </extension>
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                        <type value="MedicationDispense"/>
                        <display value="relatie naar medicatieverstrekking"/>
                    </derivedFrom>
                </xsl:for-each>

                <xsl:for-each select="reden_gebruik">
                    <reasonCode>
                        <text>
                            <xsl:attribute name="value" select="./@value"/>
                        </text>
                    </reasonCode>
                </xsl:for-each>

                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:attribute name="value" select="./@value"/>
                        </text>
                    </note>
                </xsl:for-each>

                <xsl:for-each select="gebruiksinstructie">
                    <xsl:call-template name="mp-InstructionsForUse.DosageInstruction">
                        <xsl:with-param name="wrapIn">dosage</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
            </MedicationStatement>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="medicatie_gebruik | medicatiegebruik" mode="_generateId">
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
    <xsl:template match="medicatie_gebruik | medicatiegebruik" mode="_generateDisplay">
        <xsl:choose>
            <xsl:when test="identificatie[@value | @root]">
                <xsl:for-each select="identificatie[@value | @root][1]">
                    <xsl:value-of select="concat('Medicatiegebruik met identificatie ', @value, ' in identificatiesysteem: ', @root)"/>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="parts">
                    <xsl:value-of select="'Medication use'"/>
                    <xsl:if test="medicatiegebruik_datum_tijd[@value]">
                        <xsl:value-of select="concat(',registered on: ', medicatiegebruik_datum_tijd/@value, '.')"/>
                    </xsl:if>
                </xsl:variable>
                <xsl:value-of select="string-join($parts, ' ')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
