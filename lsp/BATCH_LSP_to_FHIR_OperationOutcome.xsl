<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © VZVZ (Tom de Jong)

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../hl7_2_ada/mp/6.12.9/opleveren_verstrekkingenlijst/payload/opleveren_verstrekkingenlijst_612_to_ada_vv.xsl"/>
    <xsl:import href="../ada_2_fhir/mp/9.0.7/beschikbaarstellen_verstrekkingenvertaling/payload/beschikbaarstellen_verstrekkingenvertaling_2_fhir.xsl"/>
    <xsl:output method="xml" indent="yes"/>

    <!-- hl7 input, defaults to context  -->
    <xsl:param name="hl7Input" select="."/>

    <!-- '//' used here because not sure if preceding SOAP stuff is still part of input? -->
    <xsl:variable name="verstrekkingslijst-612" select="$hl7Input//hl7:MCCI_IN200101/hl7:QURX_IN990113NL/hl7:ControlActProcess/hl7:subject/hl7:MedicationDispenseList"/>


    <!-- ada input parameter for ada2fhir-->
    <!-- does hl72ada -->
    <xsl:param name="adaInput">
        <xsl:choose>
            <!-- alleen inhoudelijke conversie als er ook een verstrekkingenlijst is -->
            <xsl:when test="$verstrekkingslijst-612">
                <xsl:call-template name="Verstrekking_612">
                    <xsl:with-param name="dispense-lists" select="$verstrekkingslijst-612"/>
                </xsl:call-template>
            </xsl:when>
            <!-- anders alleen root element om valide xml in output te hebben -->
            <xsl:otherwise>
                <beschikbaarstellen_verstrekkingenvertaling xmlns="" app="mp-mp907" shortName="{$transaction-name}" formName="{$ada-formname}" transactionRef="{$transaction-oid}" transactionEffectiveDate="{$transaction-effectiveDate}" prefix="mp-" language="nl-NL"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>


    <xd:doc>
        <xd:desc> Dit is een conversie van query response batches van het LSP naar FHIR </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <!-- ada2fhir -->
        <xsl:variable name="fhir-result">
            <xsl:for-each select="$adaInput">
                <xsl:call-template name="verstrekkingenvertaling_90">
                    <xsl:with-param name="mbh" select="adaxml/data/beschikbaarstellen_verstrekkingenvertaling/medicamenteuze_behandeling"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:variable>

        <!--        <xsl:copy-of select="$fhir-result"></xsl:copy-of>-->

        <!-- output the FHIR result and add operationOutcome - if necessary -->
        <xsl:apply-templates select="$fhir-result" mode="lsp-copy-for-operationoutcome"/>

    </xsl:template>

    <xd:doc>
        <xd:desc>Copy template for possible adding of operation outcome</xd:desc>
    </xd:doc>
    <xsl:template match="f:Bundle" mode="lsp-copy-for-operationoutcome">
        <xsl:copy>
            <!-- copy everything in this Bundle -->
            <xsl:apply-templates select="@* | node()" mode="lsp-copy-for-operationoutcome"/>

            <!-- then - if necessary - add an entry at the end with response-outcome-OperationOutcome -->
            <xsl:variable name="Control_error" select="$hl7Input//hl7:justifiedDetectedIssue"/>
            <xsl:variable name="Transmission_error" select="$hl7Input//hl7:acknowledgementDetail"/>
            <!-- alleen conversie naar OperationOutcome als er ook fouten zijn -->
            <xsl:for-each select="$Transmission_error">
                <entry>
                    <response>
                        <!-- status 200, klopt dat? -->
                        <status value="200"/>
                        <outcome>
                            <xsl:call-template name="Transmission_error_translate">
                                <xsl:with-param name="Transmission_error_list" select="."/>
                            </xsl:call-template>
                        </outcome>
                    </response>
                </entry>
            </xsl:for-each>
            <xsl:for-each select="$Control_error">
                <entry>
                    <response>
                        <!-- status 200, klopt dat? -->
                        <status value="200"/>
                        <outcome>
                            <xsl:call-template name="Control_error_translate">
                                <xsl:with-param name="Control_error_list" select="."/>
                            </xsl:call-template>
                        </outcome>
                    </response>
                </entry>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>

    <xsl:template name="Transmission_error_translate">
        <xsl:param name="Transmission_error_list" as="element()*"/>

        <xsl:for-each select="$Transmission_error_list">
            <xsl:variable name="errorHL7code" select="./hl7:code/@code"/>
            <xsl:variable name="errordisplay" select="./hl7:code/@displayName"/>
            <xsl:variable name="errortext" select="./hl7:text"/>
            <xsl:variable name="errorFHIRcode">
                <xsl:choose>
                    <xsl:when test="contains($errorHL7code, 'RTEDEST')">
                        <xsl:value-of select="'no-store'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'incomplete'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <OperationOutcome>
                <issue>
                    <severity value="error"/>
                    <code value="{$errorFHIRcode}"/>
                    <xsl:if test="$errordisplay">
                        <details>
                            <text value="{$errordisplay}"/>
                        </details>
                    </xsl:if>
                    <xsl:if test="$errortext">
                        <diagnostics value="{$errortext}"/>
                    </xsl:if>
                </issue>
            </OperationOutcome>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="Control_error_translate">
        <xsl:param name="Control_error_list" as="element()*"/>

        <xsl:for-each select="$Control_error_list">
            <xsl:variable name="errorHL7code" select="./hl7:code/@code"/>
            <xsl:variable name="errordisplay" select="./hl7:code/@displayName"/>
            <xsl:variable name="errortext" select="./hl7:text"/>
            <xsl:variable name="errorFHIRcode">
                <xsl:choose>
                    <xsl:when test="contains($errorHL7code, 'QABRTITI')">
                        <xsl:value-of select="'timeout'"/>
                    </xsl:when>
                    <xsl:when test="contains($errorHL7code, 'AUTERR_MEDISCH')">
                        <xsl:value-of select="'forbidden'"/>
                    </xsl:when>
                    <xsl:when test="contains($errorHL7code, 'AUTERR_SWV_FALSE')">
                        <xsl:value-of select="'suppressed'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'incomplete'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <OperationOutcome>
                <issue>
                    <severity value="error"/>
                    <code value="{$errorFHIRcode}"/>
                    <xsl:if test="$errordisplay">
                        <details>
                            <text value="{$errordisplay}"/>
                        </details>
                    </xsl:if>
                    <xsl:if test="$errortext">
                        <diagnostics value="{$errortext}"/>
                    </xsl:if>
                </issue>
            </OperationOutcome>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            Template for enriching resulting FHIR Bundle with OperationOutcome - if necessary
            Default copy template with specific mode
        </xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()" mode="lsp-copy-for-operationoutcome">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="lsp-copy-for-operationoutcome"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
