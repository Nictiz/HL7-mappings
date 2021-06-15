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
    xmlns:nm="http://www.nictiz.nl/mappings"
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada zorgaanbieder to FHIR resource conforming to profile nl-core-HealthcareProvider</xd:desc>
    </xd:doc>
    
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xd:doc>
        <xd:desc>Produces a Location resource based on nl-core-HealthcareProvider</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="logicalId">Optional logical id for the FHIR instance.</xd:param>
    </xd:doc>
    <xsl:template match="zorgaanbieder[not(zorgaanbieder)]" mode="nl-core-HealthcareProvider" name="nl-core-HealthcareProvider" as="element(f:Location)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="logicalId" as="xs:string?"></xsl:param>
        
        <xsl:for-each select="$in">
            <Location>
                <xsl:choose>
                    <xsl:when test="string-length($logicalId) gt 0">
                        <id value="{$logicalId}"/>
                    </xsl:when>
                    <xsl:when test="$referById = true()">
                        <id>
                            <xsl:attribute name="value">
                                <xsl:apply-templates select="." mode="_generateId">
                                    <xsl:with-param name="profile" select="'nl-core-HealthcareProvider'"></xsl:with-param>
                                </xsl:apply-templates>
                            </xsl:attribute>
                        </id>
                    </xsl:when>
                </xsl:choose>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider"/>
                </meta>
                
                <xsl:for-each select="organisatie_locatie/locatie_naam">
                    <name value="{@value}"/>
                </xsl:for-each>
                
                <xsl:for-each select="organisatie_locatie/locatie_nummer">
                    <alias value="{@value}"/>
                </xsl:for-each>
                
                <xsl:call-template name="nl-core-ContactInformation">
                    <xsl:with-param name="in" select="contactgegevens"/>
                </xsl:call-template>
                
                <!--<xsl:call-template name="nl-core-AddressInformation">
                    <xsl:with-param name="in" select="adresgegevens"/>
                </xsl:call-template>-->
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="profile" select="'nl-core-HealthcareProvider-Organization'"/>
                    <xsl:with-param name="wrapIn" select="'managingOrganization'"/>
                </xsl:call-template>
            </Location>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Produces a Organization resource based on nl-core-HealthcareProvider-Organization</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="logicalId">Optional logical id for the FHIR instance.</xd:param>
    </xd:doc>
    <xsl:template match="zorgaanbieder[not(zorgaanbieder)]" mode="nl-core-HealthcareProvider-Organization" name="nl-core-HealthcareProvider-Organization">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="logicalId" as="xs:string?"></xsl:param>
        
        <xsl:for-each select="$in">
            <Organization>
                <xsl:choose>
                    <xsl:when test="string-length($logicalId) gt 0">
                        <id value="{$logicalId}"/>
                    </xsl:when>
                    <xsl:when test="$referById = true()">
                        <id>
                            <xsl:attribute name="value">
                                <xsl:apply-templates select="." mode="_generateId">
                                    <xsl:with-param name="profile" select="'nl-core-HealthcareProvider-Organization'"/>
                                </xsl:apply-templates>
                            </xsl:attribute>
                        </id>
                    </xsl:when>
                </xsl:choose>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization"/>
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
                <xsl:call-template name="nl-core-ContactInformation">
                    <xsl:with-param name="in" select="contactgegevens"/>
                </xsl:call-template>
                <!-- address -->
                <xsl:call-template name="nl-core-AddressInformation">
                    <xsl:with-param name="in" select="adresgegevens"/>
                </xsl:call-template>
            </Organization>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing a HealthcareProvider, both to a Location and an Organization resource</xd:desc>
        <xd:param name="profile"></xd:param>
    </xd:doc>
    <xsl:template match="zorgaanbieder" mode="_generateDisplay">
        <xsl:param name="profile" required="yes" as="xs:string"/>
        
        <xsl:variable name="organizationName" select="organisatie_naam/@value[not(. = '')]"/>
        <xsl:variable name="organizationLocation" select="organisatie_locatie/locatie_naam/@value[not(. = '')]"/>
        <xsl:variable name="organizationIdentifier" select="zorgaanbieder_identificatienummer[@value[not(. = '')]]"/>
        
        <xsl:choose>
            <xsl:when test="$profile = 'nl-core-HealthcareProvider'">
                <xsl:choose>
                    <xsl:when test="$organizationName or $organizationLocation">
                        <xsl:value-of select="string-join($organizationLocation[1] | $organizationName[1], ' - ')"/>
                    </xsl:when>
                    <xsl:when test="$organizationIdentifier">Locatie met Organisatie-id '<xsl:value-of select="$organizationIdentifier/@value"/>' in identificerend systeem '<xsl:value-of select="$organizationIdentifier/@root"/>'.</xsl:when>
                    <xsl:otherwise>Locatie-informatie: <xsl:value-of select="string-join(.//(@value | @code | @root | @codeSystem), ' - ')"/></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$profile = 'nl-core-HealthcareProvider-Organization'">
                <xsl:choose>
                    <xsl:when test="$organizationName">
                        <xsl:value-of select="$organizationName[1]"/>
                    </xsl:when>
                    <xsl:when test="$organizationIdentifier">Organisatie met id '<xsl:value-of select="$organizationIdentifier/@value"/>' in identificerend systeem '<xsl:value-of select="$organizationIdentifier/@root"/>'.</xsl:when>
                    <xsl:otherwise>Organisatie-informatie: <xsl:value-of select="string-join(.//(@value | @code | @root | @codeSystem), ' - ')"/></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify a HealthProfessional present in a (set of) ada-instance(s)</xd:desc>
        <xd:param name="profile">If the patient is identified by fullUrl, this optional parameter can be used as fallback for an id</xd:param>
        <xd:param name="fullUrl">If the patient is identified by fullUrl, this optional parameter can be used as fallback for an id</xd:param>
    </xd:doc>
    <xsl:template match="zorgaanbieder" mode="_generateId">
        <xsl:param name="profile" required="yes" as="xs:string"/>
        <xsl:param name="fullUrl" tunnel="yes"/>
        
        <xsl:variable name="organizationLocation" select="organisatie_locatie/locatie_naam/@value[not(. = '')]"/>
        
        <xsl:choose>
            <xsl:when test="$profile = 'nl-core-HealthcareProvider'">
                <xsl:choose>
                    <xsl:when test="zorgaanbieder_identificatienummer[@value | @root]">
                        <xsl:value-of select="upper-case(nf:removeSpecialCharacters(concat(string-join(zorgaanbieder_identificatienummer[1]/(@value | @root), ''),'-',$organizationLocation)))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($fullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:otherwise>   
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$profile = 'nl-core-HealthcareProvider-Organization'">
                <xsl:choose>
                    <xsl:when test="zorgaanbieder_identificatienummer[@value | @root]">
                        <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(string-join(zorgaanbieder_identificatienummer[1]/(@value | @root), ''))))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($fullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:otherwise>   
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
        
        <!--<xsl:choose>
            <xsl:when test="$profile = 'nl-core-HealthProfessional-PractitionerRole'">
                <xsl:variable name="personIdentifier" select="nf:getValueAttrDefault(nf:ada-zvl-id(zorgverlener_identificatienummer))"/>
                <xsl:variable name="specialism" select="upper-case(string-join((specialisme//@code)/normalize-space(), ''))"/>
                <xsl:variable name="organizationId" select="nf:getValueAttrDefault(nf:ada-za-id(.//(zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number)))"/>
                
                <xsl:value-of select="concat($personIdentifier, $specialism, $organizationId)"/>
            </xsl:when>
            <xsl:when test="$profile = 'nl-core-HealthProfessional-Practitioner'">
                <xsl:choose>
                    <xsl:when test="(zorgverlener_identificatienummer)[@value | @root]">
                        <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(string-join((zorgverlener_identificatienummer)[1]/(@value | @root), ''))))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($fullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>-->
        
    </xsl:template>
    
</xsl:stylesheet>
