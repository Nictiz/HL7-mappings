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
    xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <!-- Can be uncommented for debug purposes. Please comment before committing! -->
    <!--<xsl:import href="../../../fhir/2_fhir_fhir_include.xsl"/>-->

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada zorgaanbieder to FHIR resource conforming to profile zib-HealthcareProvider</xd:desc>
    </xd:doc>

    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xd:doc>
        <xd:desc>Unwrap zorgaanbieder_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="zorgaanbieder_registratie">
        <xsl:apply-templates select="zorgaanbieder" mode="zib-HealthcareProviderEntry">
            <xsl:with-param name="searchMode" select="''"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Filter all unique healthcareProviders in a variable</xd:desc>
    </xd:doc>
    <xsl:variable name="organizations" as="element()*">
        <xsl:variable name="healthcareProvider" select="//zorgaanbieder[not(zorgaanbieder)]"/>
        
        <!-- Zorgaanbieders -->
        <xsl:for-each-group select="$healthcareProvider[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
            concat(nf:ada-za-id(zorgaanbieder_identificatienummer)/@root,
            nf:ada-za-id(zorgaanbieder_identificatienummer)/normalize-space(@value))">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-zorgaanbieder xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                        <xsl:variable name="organizationName" select="(organisatie_naam)/@value[not(. = '')]"/>
                        <xsl:variable name="organizationIdentifier" select="(zorgaanbieder_identificatie_nummer)[@value[not(. = '')]]"/>
                        
                        <xsl:choose>
                            <xsl:when test="$organizationName">
                                <xsl:value-of select="current-group()[1]/normalize-space($organizationName[1])"/>
                            </xsl:when>
                            <xsl:when test="$organizationIdentifier">Organisatie met id '<xsl:value-of select="$organizationIdentifier/@value"/>' in identificerend systeem '<xsl:value-of select="$organizationIdentifier/@root"/>'.</xsl:when>
                            <xsl:otherwise>Organisatie informatie: <xsl:value-of select="string-join(.//(@value | @code | @root | @codeSystem), ' - ')"/></xsl:otherwise>
                        </xsl:choose>
                    </reference-display>
                    <xsl:call-template name="zib-HealthcareProviderEntry">
                        <xsl:with-param name="uuid" select="$uuid"/>
                        <xsl:with-param name="includeLocation" select="false()"/>
                    </xsl:call-template>
                </unieke-zorgaanbieder>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>Produces a FHIR entry element with an Organization resource and, if applicable, a FHIR entry element with a Location resource.</xd:desc>
        <xd:param name="uuid"> If false and zorgaanbieder_identificatienummer[@value] generate from that. Otherwise generate uuid from scratch. Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time. </xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.Organization.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
        <xd:param name="includeLocation">Optional. Include the Location resource as a second entry. Default: true()</xd:param>
    </xd:doc>
    <xsl:template match="zorgaanbieder[not(zorgaanbieder)]" mode="zib-HealthcareProviderEntry" name="zib-HealthcareProviderEntry">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="entryFullUrl">
            <xsl:choose>
                <xsl:when test="not($uuid) and zorgaanbieder_identificatienummer">
                    <xsl:value-of select="nf:getUriFromAdaId(nf:ada-za-id(zorgaanbieder_identificatienummer))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="nf:get-fhir-uuid(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:param>
        <xsl:param name="fhirResourceId">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="$uuid">
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:when>
                    <xsl:when test="zorgaanbieder_identificatienummer[@value | @root]">
                        <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(string-join(zorgaanbieder_identificatienummer[1]/(@value | @root), ''))))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        <xsl:param name="includeLocation" select="true()"/>
        <entry>
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="zib-HealthcareProvider-Organization">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                </xsl:call-template>
            </resource>
            <xsl:if test="string-length($searchMode) gt 0">
                <search>
                    <mode value="{$searchMode}"/>
                </search>
            </xsl:if>
        </entry>
        <xsl:if test="organisatie_locatie/*[@value] and $includeLocation">
            <xsl:variable name="secondaryEntryFullUrl">
                <xsl:value-of select="nf:get-fhir-uuid(.)"/>
            </xsl:variable>
            <xsl:variable name="secondaryFhirResourceId">
                <xsl:if test="$referById">
                    <xsl:choose>
                        <xsl:when test="$uuid">
                            <xsl:value-of select="nf:removeSpecialCharacters(replace($secondaryEntryFullUrl, 'urn:[^i]*id:', ''))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="nf:removeSpecialCharacters(replace($secondaryEntryFullUrl, 'urn:[^i]*id:', ''))"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:variable>
            <entry>
                <fullUrl value="{$secondaryEntryFullUrl}"/>
                <resource>
                    <xsl:call-template name="zib-HealthcareProvider-Location">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="logicalId" select="$secondaryFhirResourceId"/>
                    </xsl:call-template>
                </resource>
                <xsl:if test="string-length($searchMode) gt 0">
                    <search>
                        <mode value="{$searchMode}"/>
                    </search>
                </xsl:if>
            </entry>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>Produces a Location resource based on zib-HealthcareProvider</xd:desc>
        <xd:param name="logicalId">Location.id value</xd:param>
        <xd:param name="in">Node to consider in the creation of an Organization resource</xd:param>
    </xd:doc>
    <xsl:template match="zorgaanbieder[not(zorgaanbieder)]" mode="zib-HealthcareProvider-Organization" name="zib-HealthcareProvider-Organization">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:for-each select="$in">
            <!--<xsl:variable name="resource">-->
                <Organization>
                    <xsl:if test="$referById">
                        <id value="{$logicalId}"/>
                    </xsl:if>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-HealthcareProvider-Organization"/>
                    </meta>
                    <xsl:for-each select="zorgaanbieder_identificatienummer[@value]">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    <!-- type -->
                    <xsl:for-each select="organisatie_type | afdeling_specialisme">
                        <type>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </type>
                    </xsl:for-each>
                    <!-- name -->
                    <xsl:if test="organisatie_naam/@value">
                        <name value="{organisatie_naam/@value}"/>
                    </xsl:if>
                    <!-- contactgegevens -->
                    <!--<xsl:call-template name="zib-ContactInformation">
                        <xsl:with-param name="in" select="contactgegevens"/>
                    </xsl:call-template>-->
                    <!-- address -->
                    <!--<xsl:call-template name="zib-AddressInformation">
                        <xsl:with-param name="in" select="adresgegevens"/>
                    </xsl:call-template>-->
                </Organization>
            <!--</xsl:variable>

            <!-\- Add resource.text -\->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>-->
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Produces a Location resource based on zib-HealthcareProvider</xd:desc>
        <xd:param name="logicalId">Location.id value</xd:param>
        <xd:param name="in">Node to consider in the creation of a Location resource</xd:param>
    </xd:doc>
    <xsl:template match="zorgaanbieder[not(zorgaanbieder)]" mode="zib-HealthcareProvider-Location" name="zib-HealthcareProvider-Location">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:for-each select="$in">
            <!--<xsl:variable name="resource">-->
            <Location>
                <xsl:if test="$referById">
                    <id value="{$logicalId}"/>
                </xsl:if>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-HealthcareProvider-Location"/>
                </meta>
                <!-- name - locatie_naam -->
                <xsl:if test="organisatie_locatie/locatie_naam/@value">
                    <name value="{organisatie_locatie/locatie_naam/@value}"/>
                </xsl:if>
                <!-- alias - locatie_nummer -->
                <xsl:if test="organisatie_locatie/locatie_nummer/@value">
                    <alias value="{organisatie_locatie/locatie_nummer/@value}"/>
                </xsl:if>
                <!-- telecom -->
                <!--<xsl:call-template name="zib-ContactInformation">
                        <xsl:with-param name="in" select="contactgegevens"/>
                    </xsl:call-template>-->
                <!-- address -->
                <!--<xsl:call-template name="zib-AddressInformation">
                        <xsl:with-param name="in" select="adresgegevens"/>
                    </xsl:call-template>-->
                <!-- managingOrganization -->
                <managingOrganization>
                    <xsl:call-template name="zib-HealthcareProvider-Organization-Reference"/>
                </managingOrganization>
            </Location>
            <!--</xsl:variable>

            <!-\- Add resource.text -\->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>-->
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates zib-HealthcareProvider-Organization reference</xd:desc>
    </xd:doc>
    <xsl:template name="zib-HealthcareProvider-Organization-Reference" match="zorgaanbieder[not(zorgaanbieder)]" mode="zib-HealthcareProvider-Organization-Reference">
        <xsl:variable name="theIdentifier" select="zorgaanbieder_identificatienummer[@value] | zorgaanbieder_identificatie_nummer[@value] | healthcare_provider_identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$organizations[group-key = $theGroupKey]" as="element()*"/>
        <xsl:choose>
            <xsl:when test="$theGroupElement">
                <reference value="{nf:getFullUrlOrId(($theGroupElement/f:entry)[1])}"/>
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

</xsl:stylesheet>
