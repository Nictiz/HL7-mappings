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
        <xd:desc>Converts ADA documentgegevens to FHIR List  conforming to profile MedicationOverview.</xd:desc>
    </xd:doc>


    <xd:doc>
        <xd:desc>Makes the List entry for MP 9</xd:desc>
        <xd:param name="in">Document data for medication overview. Defaults to context.</xd:param>
        <xd:param name="entries">FHIR entries for the List</xd:param>
        <xd:param name="searchMode">The search mode, defaults to 'match'</xd:param>
    </xd:doc>
    <xsl:template name="MedicationOverview" match="documentgegevens" mode="MedicationOverview">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="entries" as="element(f:entry)*"/>
        <xsl:param name="searchMode" as="xs:string">match</xsl:param>
        <xsl:for-each select="$in">
            <entry xmlns="http://hl7.org/fhir">
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
                                        <valueDateTime>
                                            <xsl:attribute name="value">
                                                <xsl:call-template name="format2FHIRDate">
                                                    <xsl:with-param name="dateTime" select="xs:string(.)"/>
                                                </xsl:call-template>
                                            </xsl:attribute>
                                        </valueDateTime>
                                    </extension>
                                </xsl:for-each>
                                <xsl:for-each select="./verificatie_zorgverlener/geverifieerd_met_zorgverlenerq/@value">
                                    <extension url="VerificationHealthProfessional">
                                        <valueBoolean value="{.}"/>
                                    </extension>
                                </xsl:for-each>
                                <xsl:for-each select="./verificatie_zorgverlener/verificatie_datum/@value">
                                    <extension url="VerificationHealthProfessionalDate">
                                        <valueDateTime>
                                            <xsl:attribute name="value">
                                                <xsl:call-template name="format2FHIRDate">
                                                    <xsl:with-param name="dateTime" select="xs:string(.)"/>
                                                </xsl:call-template>
                                            </xsl:attribute>
                                        </valueDateTime>
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
                            <xsl:for-each select="ancestor::*[ancestor::data]/patient">
                                <xsl:call-template name="makeReference"/>
                            </xsl:for-each>
                        </subject>
                        <xsl:for-each select="document_datum/@value">
                            <date>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="."/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </date>
                        </xsl:for-each>
                        <xsl:for-each select="auteur">
                            <xsl:for-each select="auteur_is_zorgaanbieder/zorgaanbieder[.//(@value | @code)]">
                                <source>
                                    <extension url="http://nictiz.nl/fhir/StructureDefinition/MedicationOverview-SourceOrganization">
                                        <valueReference>
                                            <xsl:call-template name="makeReference">
                                                <xsl:with-param name="profile" select="$profilenameHealthcareProviderOrganization"/>
                                            </xsl:call-template>
                                        </valueReference>
                                    </extension>
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
                                </source>
                            </xsl:for-each>
                            <xsl:for-each select="auteur_is_patient[@value = 'true']">
                                <source>
                                    <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference-2.1"/>
                                </source>
                            </xsl:for-each>
                        </xsl:for-each>
                        <!-- the entries with references to medicatieafspraak/toedieningsafspraak/medicatiegebruik -->
                        <xsl:apply-templates select="../medicamenteuze_behandeling/(medicatieafspraak | toedieningsafspraak | medicatiegebruik | medicatie_gebruik)" mode="doMOListReference"/>
                      </List>
                </resource>
                <xsl:if test="string-length($searchMode) gt 0">
                    <search>
                        <mode value="{$searchMode}"/>
                    </search>
                </xsl:if>
            </entry>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Make an entry with a reference to another entry as is used in the List resource in Bundle for Medicatieoverzicht (medication overview)</xd:desc>
    </xd:doc>
    <xsl:template name="medicatieoverzicht-list-reference" match="*" mode="doMOListReference">
        <entry xmlns="http://hl7.org/fhir">
            <item>
                <xsl:call-template name="makeReference"/>               
            </item>
        </entry>
    </xsl:template>


</xsl:stylesheet>
