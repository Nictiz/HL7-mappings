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
        <xd:desc>Converts ADA wisselend_doseerschema to FHIR MedicationRequest conforming to profile mp-VariableDosingRegimen</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Create an mp-VariableDosingRegimen instance as a MedicationRequest FHIR instance from ADA wisselend_doseerschema.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">The MedicationRequest.subject as ADA element or reference.</xd:param>
        <xd:param name="medicationReference">The MedicationRequest.medicationReference as ADA element or reference.</xd:param>
        <xd:param name="requester">The MedicationRequest.requester as ADA element or reference.</xd:param>
    </xd:doc>
    <xsl:template name="mp-VariableDosingRegimen" mode="mp-VariableDosingRegimen" match="wisselend_doseerschema" as="element(f:MedicationRequest)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="medicationReference" select="(afgesprokengeneesmiddel | afgesproken_geneesmiddel)/farmaceutisch_product" as="element()?"/>
        <xsl:param name="requester" select="auteur" as="element()?"/>

        <xsl:for-each select="$in">
            <MedicationRequest>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>

                <!-- pharmaceuticalTreatmentIdentifier -->
                <xsl:for-each select="../identificatie">
                    <xsl:call-template name="ext-PharmaceuticalTreatmentIdentifier">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>

                <xsl:for-each select="kopie_indicator[@value | @nullFlavor]">
                    <xsl:call-template name="ext-CopyIndicator"/>
                </xsl:for-each>

                <xsl:for-each select="relatie_zorgepisode/(identificatie | identificatienummer)[@value]">
                    <xsl:call-template name="ext-Context-EpisodeOfCare"/>
                </xsl:for-each>

                <xsl:for-each select="gebruiksinstructie">
                    <xsl:call-template name="ext-RenderedDosageInstruction"/>
                </xsl:for-each>

                <xsl:for-each select="gebruiksperiode">
                    <xsl:call-template name="ext-TimeInterval.Period"/>
                </xsl:for-each>

                <!--herhaalperiode_cyclisch_schema-->
                <xsl:for-each select="gebruiksinstructie">
                    <xsl:call-template name="ext-InstructionsForUse.RepeatPeriodCyclicalSchedule"/>
                </xsl:for-each>

                <xsl:for-each select="wisselend_doseerschema_stop_type">
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

                <!-- we do not know the current status of this instance -->
                <status value="unknown"/>

                <intent value="order"/>
                
                <category>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="395067002"/>
                        <display value="optimaliseren van dosering van medicatie"/>
                    </coding>
                </category>

                <xsl:choose>
                    <xsl:when test="$medicationReference">
                        <xsl:for-each select="$medicationReference">
                            <medicationReference>
                                <xsl:call-template name="makeReference"/>
                            </medicationReference>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- no medication available in input, but required element in FHIR
                            the source system really knows it, so unknown seems unfair, chose 'masked' -->
                        <medicationCodeableConcept>
                            <coding>
                                <code>
                                    <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
                                        <valueCode value="masked"/>
                                    </extension>
                                </code>
                            </coding>
                            <text value="zie bijbehorende medicatiebouwstenen in deze medicamenteuze behandeling"/>
                        </medicationCodeableConcept>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:for-each select="$subject">
                    <subject>
                        <xsl:call-template name="makeReference"/>
                    </subject>
                </xsl:for-each>

                <xsl:for-each select="relatie_contact/(identificatie | identificatienummer)[@value]">
                    <encounter>
                        <xsl:apply-templates select="." mode="nl-core-Encounter-RefIdentifier"/>
                    </encounter>
                </xsl:for-each>
                
                <xsl:for-each select="wisselend_doseerschema_datum_tijd">
                    <authoredOn>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="./@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </authoredOn>
                </xsl:for-each>

                <xsl:for-each select="$requester">
                    <requester>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="profile">nl-core-HealthProfessional-PractitionerRole</xsl:with-param>
                        </xsl:call-template>
                    </requester>
                </xsl:for-each>

                <xsl:for-each select="reden_wijzigen_of_staken">
                    <reasonCode>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </reasonCode>
                </xsl:for-each>

                <xsl:for-each select="relatie_medicatieafspraak/identificatie[@value]">
                    <basedOn>
                        <type value="MedicationRequest"/>
                        <identifier>
                            <xsl:call-template name="id-to-Identifier"/>
                        </identifier>
                        <display value="relatie naar medicatieafspraak met identificatie: {string-join((@value, @root), ' || ')}"/>
                    </basedOn>
                </xsl:for-each>

                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string"/>
                        </text>
                    </note>
                </xsl:for-each>

                <xsl:for-each select="gebruiksinstructie">
                    <xsl:call-template name="mp-InstructionsForUse.DosageInstruction">
                        <xsl:with-param name="wrapIn">dosageInstruction</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="relatie_wisselend_doseerschema/identificatie[@value]">
                    <priorPrescription>
                        <type value="MedicationRequest"/>
                        <identifier>
                            <xsl:call-template name="id-to-Identifier"/>
                        </identifier>
                        <display value="relatie naar wisselend doseerschema met identificatie: {string-join((@value, @root), ' || ')}"/>
                    </priorPrescription>
                </xsl:for-each>
            </MedicationRequest>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="wisselend_doseerschema" mode="_generateId">
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
    <xsl:template match="wisselend_doseerschema" mode="_generateDisplay">
        <xsl:variable name="parts">
            <xsl:value-of select="'Variable dosing regimen '"/>
            <xsl:value-of select="afgesprokengeneesmiddel/@displayName"/>
            <xsl:value-of select="wisselend_doseerschema_datum_tijd/@value"/>
            <xsl:value-of select="wisselend_doseerschema_stop_type/@displayName"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ' - ')"/>
    </xsl:template>
</xsl:stylesheet>
