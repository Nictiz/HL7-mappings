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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->
    <!--<xsl:import href="2_fhir_fhir_include.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
    </xd:doc>
    <xsl:template name="practitioner-reference" match="zorgverlener[not(zorgverlener)] | health_professional[not(health_professional)]" mode="doPractitionerReference-2.0" as="element()*">
        <xsl:variable name="theIdentifier" select="zorgverlener_identificatienummer[@value] | zorgverlener_identificatie_nummer[@value] | health_professional_identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyPractitioner(.)"/>
        <xsl:variable name="theGroupElement" select="$practitioners[group-key = $theGroupKey]" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$theGroupElement">
                <reference value="{nf:getFullUrlOrId($theGroupElement/f:entry)}"/>
            </xsl:when>
            <xsl:when test="$theIdentifier">
                <identifier>
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="($theIdentifier[not(@root = $mask-ids-var)], $theIdentifier)[1]"/>
                    </xsl:call-template>
                </identifier>
            </xsl:when>
        </xsl:choose>
        
        <xsl:if test="string-length($theGroupElement/reference-display) gt 0">
            <display value="{$theGroupElement/reference-display}"/>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Produces a FHIR entry element with a Practitioner resource</xd:desc>
        <xd:param name="uuid">If false and (zorgverlener_identificatie_nummer | health_professional_identification_number) generate from that. Otherwise generate uuid from scratch. Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="entry-fullurl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhir-resource-id">Optional. Value for the entry.resource.Practitioner.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="practitioner-entry" match="zorgverlener[not(zorgverlener)] | health_professional[not(health_professional)]" mode="doPractitionerEntry-2.0">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="entry-fullurl">
            <xsl:choose>
                <xsl:when test="not($uuid) and (zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number)">
                    <xsl:value-of select="nf:getUriFromAdaId(nf:ada-zvl-id(zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="nf:get-fhir-uuid(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:param>
        <xsl:param name="fhir-resource-id">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="$uuid">
                        <xsl:value-of select="nf:removeSpecialCharacters($entry-fullurl)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(string-join(.//*[not(ancestor-or-self::zorgaanbieder | ancestor-or-self::healthcare_provider)]/@value, ''))))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$entry-fullurl}"/>
            <resource>
                <xsl:call-template name="nl-core-practitioner-2.0">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="practitioner-id" select="$fhir-resource-id"/>
                </xsl:call-template>
            </resource>
            <xsl:if test="string-length($searchMode) gt 0">
                <search>
                    <mode value="{$searchMode}"/>
                </search>
            </xsl:if>
        </entry>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="practitioner-id">Practitioner.id value</xd:param>
        <xd:param name="in">Node to consider in the creation of a Practitioner resource</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-practitioner-2.0" match="zorgverlener[not(zorgverlener)] | health_professional[not(health_professional)]" mode="doPractitionerResource-2.0">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="practitioner-id" as="xs:string?"/>
        <!-- zorgverlener -->
        <xsl:for-each select="$in">
            <Practitioner>
                <xsl:if test="string-length($practitioner-id) gt 0">
                    <id value="{$practitioner-id}"/>
                </xsl:if>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-practitioner"/>
                </meta>
                <!-- zorgverlener_identificatie_nummer -->
                <xsl:for-each select="zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- naamgegevens -->
                <xsl:for-each select=".//naamgegevens[not(naamgegevens)] | .//name_information[not(name_information)]">
                    <xsl:call-template name="nl-core-humanname-2.0">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
            </Practitioner>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
