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
<xsl:stylesheet xmlns="http://hl7.org/fhir" 
    xmlns:foo="dummy"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all"
    xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication"
    xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <!-- Dit is een conversie van query response batches van het LSP naar FHIR -->

    <xsl:template match="/">
        <!--<xsl:variable name="Control_error" select="hl7:MCCI_IN200101/*/hl7:ControlActProcess/hl7:reasonOf/hl7:justifiedDetectedIssue"/>
        <xsl:variable name="Transmission_error" select="hl7:MCCI_IN200101/*/hl7:acknowledgement/hl7:acknowledgementDetail"/>-->
        <!--Scope wat breder voor test-->
        <xsl:variable name="Control_error" select="//hl7:ControlActProcess/hl7:reasonOf/hl7:justifiedDetectedIssue"/>
        <xsl:variable name="Transmission_error" select="//hl7:acknowledgement/hl7:acknowledgementDetail"/>
        <!--Dummy element om valide XML te outputten-->
        <foo:Dummy>
            <xsl:for-each select="$Transmission_error">
                <entry>
                    <fullUrl value=""/><!--uuid in Xproc voor de oefening-->
                    <resource>
                        <xsl:call-template name="Transmission_error_translate">
                            <xsl:with-param name="Transmission_error_list" select="."/>
                        </xsl:call-template>
                    </resource>
                    <search>
                        <mode value="outcome"/>
                    </search>
                </entry>
            </xsl:for-each>
            <xsl:for-each select="$Control_error">
                <entry>
                    <fullUrl value=""/><!--uuid in Xproc voor de oefening-->
                    <resource>
                        <xsl:call-template name="Control_error_translate">
                            <xsl:with-param name="Control_error_list" select="."/>
                        </xsl:call-template>
                    </resource>
                    <search>
                        <mode value="outcome"/>
                    </search>
                </entry>
            </xsl:for-each>
        </foo:Dummy>
    </xsl:template>
    
    <xsl:template name="Transmission_error_translate">
        <xsl:param name="Transmission_error_list" as="element()"/>
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
        <OperationOutcome xmlns="http://hl7.org/fhir"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
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
    </xsl:template>
    
    <xsl:template name="Control_error_translate">
        <xsl:param name="Control_error_list" as="element()*"/>
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
        <OperationOutcome xmlns="http://hl7.org/fhir"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
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
    </xsl:template>
    
</xsl:stylesheet>
