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

<xsl:stylesheet 
    exclude-result-prefixes="#all" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:uuid="http://www.uuid.org" 
    xmlns:local="urn:fhir:stu3:functions" 
    xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:nm="http://www.nictiz.nl/mappings"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    <xsl:import href="../../ada_2_fhir/fhir/2_fhir_fhir_include.xsl"/>
    <xsl:param name="fhirVersion" select="'R4'"/>

    <!-- Here all overrules be placed -->
    
    <xsl:template name="getFhirMetadata">
        <xsl:param name="in"/>
        
        <!-- if-statement to allow for local variables -->
        <xsl:if test="$in//patient">
            <xsl:variable name="identifier" select="(identificatienummer[@root = $oidBurgerservicenummer],identificatienummer[not(@root = $oidBurgerservicenummer)])[1]"/>
            <!-- How necessary is it to add [not(patient)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] behind every group? -->
            <xsl:for-each-group select="$in//patient[not(patient)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="concat($identifier/@root, $identifier/@value)">
                <!-- Experiment: why don't we just use nf:getGroupingKeyDefault()? Less hardly-used functions, and nobody is going to see the result anyways. -->
                <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="getFhirMetadataForAdaEntry">
                        <xsl:with-param name="type">Patient</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each-group>
            </xsl:for-each-group>
        </xsl:if>
        
        <xsl:for-each-group select="$in//bloeddruk" group-by="nf:getGroupingKeyDefault()">
            <xsl:call-template name="getFhirMetadataForAdaEntry">
                <xsl:with-param name="type">BloodPressure</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each-group>
        <xsl:for-each-group select="$in//lichaams_lengte" group-by="nf:getGroupingKeyDefault()">
            <xsl:call-template name="getFhirMetadataForAdaEntry">
                <xsl:with-param name="type">BodyLenght</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template name="getFhirMetadataForAdaEntry">
        <xsl:param name="type" as="xs:string"/> <!-- zib name? resource type? -->
        <nm:resource type="{$type}">
            <xsl:if test="./@id">
                <nm:ada-id>
                    <xsl:value-of select="@id"/>
                </nm:ada-id>
            </xsl:if>
            <nm:group-key>
                <xsl:value-of select="current-grouping-key()"/>
            </nm:group-key>
            <!-- Unless overruled, fullUrl is always a uuid? -->
            <xsl:variable name="fullUrl">
                <xsl:value-of select="nf:get-fhir-uuid(current-group()[1])"/>
            </xsl:variable>
            <nm:full-url>
                <xsl:value-of select="$fullUrl"/>
            </nm:full-url>
            <xsl:if test="$referById">
                <nm:logical-id>
                    <xsl:choose>
                        <xsl:when test="
                            (:not($uuid) and :)
                            string-length(nf:get-resourceid-from-token(.)) gt 0">
                            <xsl:value-of select="nf:get-resourceid-from-token(.)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="current-group()[1]" mode="generateId">
                                <xsl:with-param name="fullUrl" select="$fullUrl" tunnel="yes"/>
                            </xsl:apply-templates>
                        </xsl:otherwise>
                    </xsl:choose>
                </nm:logical-id>
            </xsl:if>
            <nm:reference-display>
                <xsl:apply-templates select="current-group()[1]" mode="generateDisplay"/>
            </nm:reference-display>
        </nm:resource>
    </xsl:template>
    
    <!-- For example -->
    <xsl:template match="patient" mode="generateId">
        <xsl:param name="fullUrl" tunnel="yes"/>
        <xsl:choose>
            <!-- Tries to match patient to token -->
            <xsl:when test="string-length(nf:get-resourceid-from-token(.)) gt 0">
                <xsl:value-of select="nf:get-resourceid-from-token(.)"/>
            </xsl:when>
            <xsl:when test="naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value">
                <xsl:value-of select="upper-case(nf:removeSpecialCharacters(normalize-space(string-join(naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value, ' '))))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="nf:removeSpecialCharacters(replace($fullUrl, 'urn:[^i]*id:', ''))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="patient" mode="generateDisplay">
        <xsl:value-of select="normalize-space(string-join(.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' '))"/>
    </xsl:template>

</xsl:stylesheet>
