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
        <xd:param name="in">Node to consider in the creation of a Location resource</xd:param>
    </xd:doc>
    <xsl:template match="zorgaanbieder[not(zorgaanbieder)]" mode="nl-core-HealthcareProvider" name="nl-core-HealthcareProvider">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="logicalId" as="xs:string?"></xsl:param>
        
        <xsl:for-each select="$in">
            <!-- Because we need to generate a unique uuid, we slightly edit the ada input to make the input node unique -->
            <xsl:variable name="uuidNode" as="element()">
                <zorgaanbiederLocation>
                    <xsl:copy-of select="./*"/>
                </zorgaanbiederLocation>
            </xsl:variable>
            
            <Location>
                <xsl:if test="string-length($logicalId) gt 0">
                    <id value="{$logicalId}"/>
                </xsl:if>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider"/>
                </meta>
                
                <xsl:for-each select="organisatie_locatie/locatie_naam/@value">
                    <name value="{organisatie_locatie/locatie_naam/@value}"/>
                </xsl:for-each>
                
                <xsl:for-each select="organisatie_locatie/locatie_nummer/@value">
                    <alias value="{organisatie_locatie/locatie_nummer/@value}"/>
                </xsl:for-each>
                
                <xsl:call-template name="nl-core-ContactInformation">
                    <xsl:with-param name="in" select="contactgegevens"/>
                </xsl:call-template>
                
                <!--<xsl:call-template name="nl-core-AddressInformation">
                        <xsl:with-param name="in" select="adresgegevens"/>
                    </xsl:call-template>-->
                
                <managingOrganization>
                    <!--<xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select=""/>
                        <xsl:with-param name="elementName" select=""/>
                    </xsl:call-template>-->
                    <!--<xsl:call-template name="nl-core-HealthcareProvider-Organization-reference"/>-->
                </managingOrganization>
            </Location>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Produces a Organization resource based on nl-core-HealthcareProvider-Organization</xd:desc>
        <xd:param name="in">Node to consider in the creation of an Organization resource</xd:param>
    </xd:doc>
    <xsl:template match="zorgaanbieder[not(zorgaanbieder)]" mode="nl-core-HealthcareProvider-Organization" name="nl-core-HealthcareProvider-Organization">
        <xsl:param name="in" as="element()?" select="."/>
        
        <xsl:for-each select="$in">
            <!-- Because we need to generate a unique uuid, we slightly edit the ada input to make the input node unique -->
            <xsl:variable name="uuidNode" as="element()" select="."/>

            <Organization>
                <id value="{nf:get-uuid($uuidNode)}"/>
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
    
    <!--<xd:doc>
        <xd:desc>Creates nl-core-HealthcareProvider-Organization reference</xd:desc>
    </xd:doc>
    <xsl:template name="nl-core-HealthcareProvider-Organization-reference" match="zorgaanbieder[not(zorgaanbieder)]" mode="nl-core-HealthcareProvider-Organization-reference" as="element(f:reference)">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="fullUrl" as="xs:string?"/>
        
        <!-\- Because we need to generate a unique uuid, we slightly edit the ada input to make the input node unique -\->
        <xsl:variable name="uuidNode" as="element()" select="."/>
        
        <xsl:variable name="identifier" select="$in/zorgaanbieder_identificatienummer[normalize-space(@value | @nullFlavor)]"/>
        <xsl:variable name="logicalIdOrUuid">
            <xsl:choose>
                <xsl:when test="$logicalId">
                    <xsl:value-of select="$logicalId"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="nf:get-uuid($in)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <reference>
            <xsl:choose>
                <xsl:when test="$referById">
                    <reference>
                        <xsl:value-of select="concat('Organization/', $logicalIdOrUuid)"/>
                    </reference>
                </xsl:when>
                <xsl:when test="$fullUrl">
                    <reference>
                        <xsl:value-of select="$fullUrl"/>
                    </reference>
                </xsl:when>
                <xsl:when test="$identifier">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="($identifier[not(@root = $mask-ids-var)], $identifier)[1]"/>
                        </xsl:call-template>
                    </identifier>
                </xsl:when>
            </xsl:choose>
            
            <xsl:variable name="display">
                <xsl:variable name="organizationName" select="normalize-space($in/organisatie_naam/@value)"/>
                <xsl:variable name="organizationIdentifier" select="$in/zorgaanbieder_identificatienummer[normalize-space(@value)]"/>
                
                <xsl:choose>
                    <xsl:when test="$organizationName">
                        <xsl:value-of select="$organizationName"/>
                    </xsl:when>
                    <xsl:when test="$organizationIdentifier">Organisatie met id '<xsl:value-of select="$organizationIdentifier/@value"/>' in identificerend systeem '<xsl:value-of select="$organizationIdentifier/@root"/>'.</xsl:when>
                    <xsl:otherwise>Organisatie informatie: <xsl:value-of select="string-join(.//(@value | @code | @root | @codeSystem), ' - ')"/></xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:if test="string-length($display) gt 0">
                <display>
                    <xsl:copy-of select="$display"/>
                </display>
            </xsl:if>
        </reference>
    </xsl:template>-->
    
</xsl:stylesheet>
