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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:util="urn:hl7:utilities" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../zibs2020/payload/zib_latest_package.xsl"/>
    <xsl:import href="../../../util/mp-functions.xsl"/>

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
    <!--    <xsl:param name="generateInstructionText" as="xs:boolean?" select="true()"/>-->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>
 
    <xsl:variable name="bouwstenen-920" as="element(f:entry)*">
        <xsl:variable name="searchMode" as="xs:string">match</xsl:variable>

        <!-- medicatieafspraken -->
        <xsl:for-each select="//medicatieafspraak">
            <!-- entry for MedicationRequest -->
            <entry>
                <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                <resource>
                    <xsl:call-template name="nl-core-MedicationAgreement">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="subject" select="../../patient"/>
                        <xsl:with-param name="requester" select="ancestor::adaxml/data/*/bouwstenen/zorgverlener[@id = current()/voorschrijver/zorgverlener/@value]"/>
                    </xsl:call-template>
                </resource>
                <xsl:if test="string-length($searchMode) gt 0">
                    <search>
                        <mode value="{$searchMode}"/>
                    </search>
                </xsl:if>
            </entry>
        </xsl:for-each>
        
        <!-- TODO wisselend_doseerschema -->
        
        <!-- verstrekkingsverzoeken -->
         <xsl:for-each select="//verstrekkingsverzoek">
             <!-- entry for MedicationRequest -->
             <entry>
                 <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                 <resource>
                     <xsl:call-template name="nl-core-DispenseRequest">
                         <xsl:with-param name="in" select="."/>
                         <xsl:with-param name="subject" select="../../patient" as="element()"/>
                         <xsl:with-param name="performer" select="ancestor::adaxml/data/*/bouwstenen/zorgaanbieder[@id = current()/beoogd_verstrekker/zorgaanbieder/@value]"/>
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
                <fullUrl value="{nf:getUriFromAdaId(identificatie)}"/>
                <resource>
                    <xsl:call-template name="nl-core-AdministrationAgreement">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="subject" select="../../patient" as="element()"/>
                        <xsl:with-param name="performer" select="ancestor::adaxml/data/*/bouwstenen/zorgaanbieder[@id = current()/verstrekker/zorgaanbieder/@value]"/>
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
        <xsl:for-each select="//medicatieverstrekking">
            <!-- entry for MedicationDispense -->
            <entry>
                <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                <resource>
                    <xsl:call-template name="nl-core-MedicationDispense">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="subject" select="../../patient" as="element()"/>
                        <xsl:with-param name="performer" select="ancestor::adaxml/data/*/bouwstenen/zorgaanbieder[@id = current()/verstrekker/zorgaanbieder/@value]"/>
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
        <xsl:for-each select="//(medicatie_gebruik | medicatiegebruik)">
            <!-- entry for MedicationRequest -->
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(identificatie)}"/>
                <resource>
                    <xsl:call-template name="nl-core-MedicationUse2">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="subject" select="../../patient" as="element()"/>
                        <xsl:with-param name="prescriber" select="ancestor::adaxml/data/*/bouwstenen/zorgverlener[@id = current()/voorschrijver/zorgverlener/@value]"/>
                    </xsl:call-template>
                </resource>
                <xsl:if test="string-length($searchMode) gt 0">
                    <search>
                        <mode value="{$searchMode}"/>
                    </search>
                </xsl:if>
            </entry>
        </xsl:for-each>
        
        <!-- TODO medicatietoediening -->
        
    </xsl:variable>
   <xd:doc>
        <xd:desc>Create the ext-RenderedDosageInstruction extension from ADA InstructionsForUse.</xd:desc>
        <xd:param name="in">The ADA instance to extract the rendered dosage instruction from, override for default function in nl-core-InstructionsForUse</xd:param>
    </xd:doc>
    <xsl:template name="ext-RenderedDosageInstruction" mode="ext-RenderedDosageInstruction" match="gebruiksinstructie" as="element(f:extension)?">
        <xsl:param name="in" as="element()?" select="."/>

        <xsl:for-each select="$in">
            <xsl:for-each select="omschrijving[@value != '']">
                <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-RenderedDosageInstruction">
                    <valueString>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <xsl:when test="$generateInstructionText">
                                    <xsl:value-of select="nf:gebruiksintructie-string(..)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@value"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </valueString>
                </extension>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    </xsl:stylesheet>
