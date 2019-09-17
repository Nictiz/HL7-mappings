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
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xd:doc>
        <xd:desc>Creates organization reference</xd:desc>
    </xd:doc>
    <xsl:template name="organization-reference" match="zorgaanbieder[not(zorgaanbieder)] | healthcare_provider[not(healthcare_provider)]" mode="doOrganizationReference-2.0">
        <xsl:variable name="theIdentifier" select="zorgaanbieder_identificatienummer[@value] | zorgaanbieder_identificatie_nummer[@value] | healthcare_provider_identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$organizations[group-key = $theGroupKey]" as="element()*"/>
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
        <xd:desc>Produces a FHIR entry element with an Organization resource</xd:desc>
        <xd:param name="uuid">If false and (zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number) generate from that. Otherwise generate uuid from scratch. Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="entry-fullurl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhir-resource-id">Optional. Value for the entry.resource.Organization.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="organization-entry" match="zorgaanbieder[not(zorgaanbieder)] | healthcare_provider[not(healthcare_provider)]" mode="doOrganizationEntry-2.0">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="entry-fullurl">
            <xsl:choose>
                <xsl:when test="not($uuid) and (zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number)">
                    <xsl:value-of select="nf:getUriFromAdaId(nf:ada-za-id(zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number))"/>
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
                        <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(string-join(./*/@value, ''))))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        <entry>
            <fullUrl value="{$entry-fullurl}"/>
            <resource>
                <xsl:call-template name="nl-core-organization-2.0">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="organization-id" select="$fhir-resource-id"/>
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
        <xd:param name="organization-id">Organization.id value</xd:param>
        <xd:param name="in">Node to consider in the creation of an Organization resource</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-organization-2.0" match="zorgaanbieder[not(zorgaanbieder)] | healthcare_provider[not(healthcare_provider)]" mode="doOrganizationResource-2.0">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="organization-id" as="xs:string?"/>
        <xsl:for-each select="$in">
            <Organization>
                <xsl:if test="$referById">
                    <id value="{$organization-id}"/>
                </xsl:if>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-organization"/>
                </meta>
                <xsl:for-each select="zorgaanbieder_identificatienummer[@value] | zorgaanbieder_identificatie_nummer[@value] | healthcare_provider_identification_number[@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- type -->
                <xsl:for-each select="organization_type | organisatie_type | department_specialty | afdeling_specialisme">
                    <type>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </type>
                </xsl:for-each>
                <!-- name -->
                <xsl:variable name="organizationName" select="(organisatie_naam | organization_name)/@value"/>
                <xsl:variable name="organizationLocation" select="(organisatie_locatie | organization_location)/@value"/>
                <xsl:if test="$organizationName | $organizationLocation">
                    <!-- Cardinality of ADA allows organizationLocation to be present without organizationName. This allows Organization.name to be the value of organizationLocation. This conforms to mapping of HCIM HealthcareProvider -->
                    <name value="{string-join(($organizationName, $organizationLocation)[not(. = '')],' - ')}"/>
                </xsl:if>
                <!-- contactgegevens -->
                <xsl:call-template name="nl-core-contactpoint-1.0">
                    <xsl:with-param name="in" select="contactgegevens | contact_information"/>
                </xsl:call-template>
                <!-- address -->
                <xsl:call-template name="nl-core-address-2.0">
                    <xsl:with-param name="in" select="adresgegevens | address_information"/>
                </xsl:call-template>
            </Organization>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
