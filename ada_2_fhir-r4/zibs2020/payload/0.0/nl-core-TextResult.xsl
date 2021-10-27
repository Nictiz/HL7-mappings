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

<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions" 
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada tekst_uitslag to FHIR DiagnosticReport conforming to profile nl-core-TextResult</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a FHIR DiagnosticReport instance conforming to profile nl-core-TextResult from ada tekst_uitslag element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <!--<xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
        <xd:param name="author">Optional ADA instance or ADA reference element for the author.</xd:param>-->
    </xd:doc>
    <xsl:template match="tekst_uitslag" name="nl-core-TextResult" mode="nl-core-TextResult" as="element(f:DiagnosticReport)?">
        <xsl:param name="in" select="." as="element()?"/>
        
        <xsl:for-each select="$in">
            <DiagnosticReport>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-TextResult'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-TextResult"/>
                </meta>
                <xsl:for-each select="tekst_uitslag_status">
                    <status>
                        <xsl:call-template name="code-to-code">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="codeMap" as="element()*">
                                <map inCode="pending" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="registered"/>
                                <map inCode="preliminary" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="preliminary"/>
                                <map inCode="final" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="final"/>
                                <map inCode="appended" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="appended"/>
                                <map inCode="corrected" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="corrected"/>
                            </xsl:with-param>
                        </xsl:call-template>
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </status>
                </xsl:for-each>
                <xsl:for-each select="tekst_uitslag_type">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>
                <xsl:for-each select="tekst_uitslag_datum_tijd">
                    <effectiveDateTime>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </effectiveDateTime>
                </xsl:for-each>
                <xsl:for-each select="visueel_resultaat">
                    <media>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="'nl-core-TextResult.VisualResult'"/>
                            <xsl:with-param name="wrapIn" select="'link'"/>
                        </xsl:call-template>
                    </media>
                </xsl:for-each>
                <xsl:for-each select="tekst_resultaat">
                    <conclusion value="{@value}"/>
                </xsl:for-each>
            </DiagnosticReport>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="visueel_resultaat" name="nl-core-TextResult.VisualResult" mode="nl-core-TextResult.VisualResult" as="element(f:Media)?">
        <xsl:param name="in" select="." as="element()?"/>
        
        <xsl:for-each select="$in">
            <Media>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile">nl-core-TextResult.VisualResult</xsl:with-param>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-TextResult.VisualResult"/>
                </meta>
                <status value="unknown"/>
                <content>
                    <!-- Needed to satisfy contraint att-1. 'application/octet-stream' is basically 'unkown'('arbitrary binary data') -->
                    <contentType value="application/octet-stream"/>
                    <data value="{@value}"/>
                </content>
            </Media>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="tekst_verslag" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Text report</xsl:text>
            <xsl:if test="tekst_uitslag_datum_tijd[@value]">
                <xsl:value-of select="concat('date ', tekst_uitslag_datum_tijd/@value)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="visueel_resultaat" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Text report, visual result</xsl:text>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
    
</xsl:stylesheet>
