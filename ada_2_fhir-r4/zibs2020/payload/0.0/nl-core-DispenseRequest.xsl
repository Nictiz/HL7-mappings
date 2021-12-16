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
        <xd:desc>Converts ADA verstrekkingsverzoek to FHIR MedicationRequest conforming to profile nl-core-DispenseRequest.</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Create a nl-core-DispenseRequest instance as a MedicationRequest FHIR instance from ADA verstrekkingsverzoek.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">The MedicationRequest.subject as ADA element or reference.</xd:param>
        <xd:param name="medicationReference">The MedicationRequest.medicationReference as ADA element or reference.</xd:param>
        <xd:param name="performer">The MedicationDispense.performer as ADA element or reference.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-DispenseRequest" mode="nl-core-DispenseRequest" match="verstrekkingsverzoek" as="element(f:MedicationRequest)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="medicationReference" select="te_verstrekken_geneesmiddel/farmaceutisch_product" as="element()?"/>
        <xsl:param name="performer" select="beoogd_verstrekker/zorgaanbieder" as="element()?"/>

        <xsl:for-each select="$in">
            <MedicationRequest>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                     <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>                    
                </meta>

                <xsl:for-each select="aanvullende_wensen">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-DispenseRequest.AdditionalWishes">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>

                <!-- pharmaceuticalTreatmentIdentifier -->
                <xsl:for-each select="../identificatie">
                    <xsl:call-template name="ext-PharmaceuticalTreatmentIdentifier">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>

                <xsl:for-each select="financiele_indicatiecode">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-DispenseRequest.FinancialIndicationCode">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>

                <xsl:for-each select="relatie_zorgepisode/(identificatie | identificatienummer)[@value]">
                    <xsl:call-template name="ext-Context-EpisodeOfCare"/>
                </xsl:for-each>

                <xsl:for-each select="identificatie[@value | @root | @nullFlavor]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier"/>
                    </identifier>
                </xsl:for-each>

                <!-- There's no mapping from the dataset to the status except for geannuleerd_indicator, so we'll default to unknown unless it was cancelled -->
                <status>
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test="geannuleerd_indicator/@value = 'true'">entered-in-error</xsl:when>
                            <xsl:otherwise>unknown</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </status>

                <intent value="order"/>

                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="52711000146108"/>
                        <display value="verstrekkingsverzoek"/>
                    </coding>
                </category>

                <xsl:for-each select="$medicationReference">
                    <medicationReference>
                        <xsl:call-template name="makeReference"/>
                    </medicationReference>
                </xsl:for-each>

                <xsl:for-each select="$subject">
                    <subject>
                        <xsl:call-template name="makeReference"/>
                    </subject>
                </xsl:for-each>

                <xsl:for-each select="relatie_contact/(identificatie | identificatienummer)[@value]">
                    <encounter>
                        <type value="Encounter"/>
                        <identifier>
                            <xsl:call-template name="id-to-Identifier"/>
                        </identifier>
                        <display value="relatie naar contact met identificatie: {string-join((@value, @root), ' || ')}"/>
                    </encounter>
                </xsl:for-each>

                <xsl:for-each select="verstrekkingsverzoek_datum">
                    <authoredOn>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="./@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </authoredOn>
                </xsl:for-each>

                <xsl:for-each select="$performer">
                    <performer>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="profile" select="$profilenameHealthcareProviderOrganization"/>
                        </xsl:call-template>
                    </performer>
                </xsl:for-each>

                <xsl:for-each select="relatie_medicatieafspraak/identificatie[@value]">
                    <basedOn>
                        <type value="MedicationRequest"/>
                        <identifier>
                            <xsl:call-template name="id-to-Identifier"/>
                        </identifier>
                        <display value="relatie naar medicatieafspraak  met identificatie: {string-join((@value, @root), ' || ')}"/>
                    </basedOn>
                </xsl:for-each>

                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string"/>
                        </text>
                    </note>
                </xsl:for-each>

                <xsl:variable name="dispenseRequest" as="element()*">
                    <xsl:for-each select="afleverlocatie[@value]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-DispenseRequest.DispenseLocation">
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="wrapIn">valueReference</xsl:with-param>
                            </xsl:call-template>
                        </extension>
                    </xsl:for-each>

                    <xsl:for-each select="verbruiksperiode">
                        <xsl:call-template name="ext-TimeInterval.Duration"/>
                        <xsl:call-template name="ext-TimeInterval.Period">
                            <xsl:with-param name="wrapIn">validityPeriod</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>



                    <xsl:for-each select="aantal_herhalingen">
                        <numberOfRepeatsAllowed value="{./@value}"/>
                    </xsl:for-each>

                    <!-- zib ada dataset -->
                    <xsl:for-each select="te_verstrekken_hoeveelheid[@value]">
                        <quantity>
                            <xsl:call-template name="hoeveelheid-to-Quantity"/>
                        </quantity>
                    </xsl:for-each>
                    <!-- MP9 ada dataset -->
                    <xsl:for-each select="te_verstrekken_hoeveelheid/aantal[@value]">
                        <quantity>
                            <xsl:call-template name="_buildMedicationQuantity">
                                <xsl:with-param name="adaValue" select="."/>
                                <xsl:with-param name="adaUnit" select="../eenheid[@codeSystem = $oidGStandaardBST902THES2]"/>
                            </xsl:call-template>
                        </quantity>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:if test="count($dispenseRequest) gt 0">
                    <dispenseRequest>
                        <xsl:copy-of select="$dispenseRequest"/>
                    </dispenseRequest>
                </xsl:if>
            </MedicationRequest>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="verstrekkingsverzoek" mode="_generateId">
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
            <xsl:with-param name="profileName" select="nf:get-profilename-from-adaelement(.)"/>
            <xsl:with-param name="uniqueString" select="$uniqueString"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="afleverlocatie" mode="_generateId">
        <xsl:variable name="uniqueString" as="xs:string?">
            <xsl:choose>
                <xsl:when test="@value">
                    <xsl:value-of select="@value"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- we do not have anything to create a stable logicalId, lets return a UUID -->
                    <xsl:value-of select="uuid:get-uuid(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:call-template name="generateLogicalId">
            <xsl:with-param name="profileName">Location</xsl:with-param>
            <xsl:with-param name="uniqueString" select="$uniqueString"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="verstrekkingsverzoek" mode="_generateDisplay">
        <xsl:text>Dispense request</xsl:text>
        <xsl:if test="afleverlocatie/@value">
            <xsl:value-of select="concat(', ', afleverlocatie/@value)"/>
        </xsl:if>
        <xsl:if test="verstrekkingsverzoekdatum[@value]">
            <xsl:value-of select="concat(' (', verstrekkingsverzoekdatum/@value, ')')"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
