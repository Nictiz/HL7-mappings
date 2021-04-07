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
                            <xsl:apply-templates select="." mode="generateId"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </nm:logical-id>
            </xsl:if>
            <nm:reference-display>
                <xsl:apply-templates select="." mode="generateDisplay"/>
            </nm:reference-display>
        </nm:resource>

</xsl:template>

</xsl:stylesheet>
