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
    
    <xsl:import href="../../../../zibs2020/payload/zib_latest_package.xsl"/>
    
    <xsl:param name="referencingStrategy" select="'logicalId'" as="xs:string"/>
    <!-- If the desired output is to be a Bundle, then a self link string of type url is required. 
         See: https://www.hl7.org/fhir/R4/search.html#conformance -->
    <xsl:param name="bundleSelfLink" as="xs:string?"/>
    
    <!-- Generate metadata for all ADA instances -->
    <xsl:param name="fhirMetadata" as="element()*">
        <xsl:call-template name="buildFhirMetadata">
            <!-- ADA instances for this project start with $zib2020Oid and end in .1, or in 9.*.* in the case of the medication related zibs -->
            <xsl:with-param name="in" select="//(
                    sturen_laboratoriumresultaten/onderzoeksresultaat/laboratorium_uitslag |
                    sturen_laboratoriumresultaten/patientgegevens/patient | 
                    sturen_laboratoriumresultaten/beschikbaarstellende_partij/zorgaanbieder |
                    sturen_laboratoriumresultaten/onderzoeksresultaat/laboratorium_uitslag/uitvoerder/zorgaanbieder
            )"/>
        </xsl:call-template>
    </xsl:param>
    
    <xsl:template match="sturen_laboratoriumresultaten | beschikbaarstellen_laboratoriumresultaten">
        <xsl:variable name="entries" as="element(f:entry)*">
            <xsl:apply-templates select="onderzoeksresultaat"/>
        </xsl:variable>
        <Bundle xmlns="http://hl7.org/fhir">
            <type value="searchset"/>
            <total value="{count($entries[*:search/*:mode/@value = 'match'])}"/>
            <xsl:choose>
                <xsl:when test="$bundleSelfLink[not(. = '')]">
                    <link>
                        <relation value="self"/>
                        <url value="{$bundleSelfLink}"/>
                    </link>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="level" select="$logWARN"/>
                        <xsl:with-param name="msg">Parameter bundleSelfLink is empty, but server SHALL return the parameters that were actually used to process the search.</xsl:with-param>
                        <xsl:with-param name="terminate" select="false()"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:copy-of select="$entries[*:search/*:mode/@value = 'match']"/>
            <xsl:copy-of select="$entries[not(*:search/*:mode/@value = 'match')]"/>
        </Bundle>
    </xsl:template>
    
    <xsl:template match="onderzoeksresultaat">
        <xsl:variable name="laboratoriumresultaten" as="element()*">
            <xsl:for-each select="laboratorium_uitslag[onderzoek]">
                <xsl:call-template name="_nl-core-LaboratoryTestResult-panel">
                    <xsl:with-param name="subject" select="../../patientgegevens/patient"/>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="laboratorium_uitslag[not(onderzoek)]/laboratorium_test">
                <xsl:call-template name="_nl-core-LaboratoryTestResult-individualTest">
                    <xsl:with-param name="subject" select="../../patientgegevens/patient"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="zorgaanbieders" as="element()*">
            <xsl:for-each select="beschikbaarstellende_partij/zorgaanbieder | laboratorium_uitslag/uitvoerder/zorgaanbieder">
                <xsl:call-template name="nl-core-HealthcareProvider"/>
                <xsl:call-template name="nl-core-HealthcareProvider-Organization"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="patient" as="element()?">
            <xsl:for-each select="../patientgegevens/patient">
                <xsl:call-template name="nl-core-Patient"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="specimen" as="element()?">
            <xsl:for-each select="laboratorium_uitslag/monster">
                <xsl:call-template name="_nl-core-LaboratoryTestResult.Specimen">
                    <xsl:with-param name="type" select="microorganisme"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="all" select="$laboratoriumresultaten | $specimen | $zorgaanbieders | $patient" as="element()*"/>
        <xsl:for-each select="$laboratoriumresultaten">
            <entry xmlns="http://hl7.org/fhir">
                <xsl:call-template name="_insertFullUrlById"/>
                <resource>
                    <xsl:copy-of select="."/>
                </resource>
                <search>
                    <mode value="match"/>
                </search>
            </entry>
        </xsl:for-each>
        <xsl:for-each select="$specimen | $zorgaanbieders | $patient">
            <entry xmlns="http://hl7.org/fhir">
                <xsl:call-template name="_insertFullUrlById"/>
                <resource>
                    <xsl:copy-of select="."/>
                </resource>
                <search>
                    <mode value="include"/>
                </search>
            </entry>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="*" mode="_generateId" priority="2">
        <xsl:param name="profile" as="xs:string" required="yes"/>
        <xsl:variable name="id" select="replace(tokenize(base-uri(), '/')[last()], '.xml', '')"/>
        <xsl:variable name="baseId" select="replace($id, '-[0-9]{2}$', '')"/>
        <xsl:variable name="localName" select="local-name()"/>
        <xsl:variable name="logicalId">
            <xsl:choose>
                <xsl:when test="$localName = 'laboratorium_test'">
                    <xsl:value-of select="nf:assure-logicalid-length('labtest-' || replace((test_identificatie/@value, format-number(count(preceding-sibling::*[local-name() = 'laboratorium_test'])+1, '00'))[1], '[^A-Za-z0-9\.-]', ''))"/>
                </xsl:when>
                <xsl:when test="$localName = 'monster' and $profile = 'nl-core-LaboratoryTestResult.Specimen.asMicroorganism'">
                    <xsl:value-of select="nf:assure-logicalid-length('microorganism-' || replace((@displayName, @code)[1], '[^A-Za-z0-9\.-]', ''))"/>
                </xsl:when>
                <xsl:when test="$localName = 'monster' and $profile = 'nl-core-LaboratoryTestResult.Specimen'">
                    <xsl:value-of select="nf:assure-logicalid-length('monster-' || replace(string-join((monsternummer/@value, monstervolgnummer/@value), ''), '[^A-Za-z0-9\.-]', ''))"/>
                </xsl:when>
                <xsl:when test="$localName = 'zorgaanbieder' and $profile = 'nl-core-HealthcareProvider'">
                    <xsl:value-of select="nf:assure-logicalid-length('locatie-' || replace((organisatie_locatie/(locatie_nummer, locatie_naam)[1]/@value, afdeling_specialisme/(@displayName, @code))[1], '[^A-Za-z0-9\.-]', ''))"/>
                </xsl:when>
                <xsl:when test="$localName = 'zorgaanbieder' and $profile = 'nl-core-HealthcareProvider-Organization'">
                    <xsl:text>locatie-</xsl:text>
                    <xsl:value-of select="nf:assure-logicalid-length(replace(
                        ((zorgaanbieder_identificatienummer, organisatie_naam)/@value, organisatie_type/(@displayName, @code))[1]
                        , '[^A-Za-z0-9\.-]', ''))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="nf:removeSpecialCharacters($localName)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- Failsafe, ids can get quite long -->
        <xsl:value-of select="nf:assure-logicalid-length($logicalId)"/>
    </xsl:template>
    
    <xsl:template name="_insertFullUrlById">
        <xsl:param name="in" select="."/>   
        <xsl:param name="fhirId" select="$in/f:id/@value"/>
        
        <xsl:variable name="theMetaData" select="$fhirMetadata[nm:logical-id = $fhirId]" as="element()*"/>
        <xsl:choose>
            <xsl:when test="count($theMetaData) = 0">
                <xsl:message terminate="yes">_insertFullUrlById: Nothing found.  (<xsl:value-of select="count($fhirId)"/>)</xsl:message>
            </xsl:when>
            <xsl:when test="count($theMetaData) gt 1">
                <xsl:message terminate="no">_insertFullUrlById: Multiple found (<xsl:value-of select="count($theMetaData)"/>): <xsl:value-of select="$fhirId"/> - <xsl:value-of select="$theMetaData/nm:full-url"/></xsl:message>
            </xsl:when>
        </xsl:choose>
        
        <xsl:variable name="fullUrl" select="$theMetaData/nm:full-url"/>
        
        <xsl:if test="string-length($fullUrl) gt 0">
            <fullUrl value="{$fullUrl}"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>