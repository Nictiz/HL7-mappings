<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (c) Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!--<xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="alertReference" match="alert[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doAlertReference-2.1">
        <xsl:variable name="theIdentifier" select="identificatie_nummer[@value] | identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$alerts[group-key = $theGroupKey]" as="element()?"/>
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
        <xd:desc>Produces a FHIR entry element with an Alert resource</xd:desc>
        <xd:param name="uuid">If true generate uuid from scratch. Defaults to false(). Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="adaPatient">Optional, but should be there. Patient this Alert is for.</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.Alert.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="alertEntry" match="alert[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doAlertEntry-2.1" as="element(f:entry)">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        <xsl:param name="entryFullUrl" select="nf:get-fhir-uuid(.)"/>
        <xsl:param name="fhirResourceId">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="not($uuid) and string-length(nf:removeSpecialCharacters((zibroot/identificatienummer | hcimroot/identification_number)/@value)) gt 0">
                        <xsl:value-of select="nf:removeSpecialCharacters(string-join((zibroot/identificatienummer | hcimroot/identification_number)/@value, ''))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        
        <entry>
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="zib-Alert-2.1">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                    <xsl:with-param name="dateT" select="$dateT"/>
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
        <xd:desc>Mapping of nl.zorg.Alert concept in ADA to FHIR resource <xd:a href="https://simplifier.net/search?canonical=http://nictiz.nl/fhir/StructureDefinition/zib-Alert">zib-Alert</xd:a>, version 2.1.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the patient record.</xd:param>
        <xd:param name="adaPatient">The ada patient that is subject of this Alert.</xd:param>
    </xd:doc>
    <xsl:template name="zib-Alert-2.1" match="alert[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element()" mode="doZibAlert-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:variable name="patientRef" as="element()*">
            <xsl:for-each select="$adaPatient">
                <xsl:call-template name="patientReference"/>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <Flag>
                    <xsl:if test="exists($logicalId)">
                        <id value="{$logicalId}"/>
                    </xsl:if>
        
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Alert"/>
                    </meta>
        
                    <xsl:for-each select="nf:ada-resolve-reference(conditie/probleem | condition/problem)">
                        <extension url="http://hl7.org/fhir/StructureDefinition/flag-detail">
                            <valueReference>
                                <xsl:call-template name="_doReference">
                                    <xsl:with-param name="ResourceType">Condition</xsl:with-param>
                                </xsl:call-template>
                            </valueReference>
                        </extension>
                    </xsl:for-each>
                    <!-- status does not exist in zib but is 1..1 in FHIR profile -->
                    <status>
                        <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
                            <valueCode value="unknown"/>
                        </extension>
                    </status>
                    
                    <xsl:for-each select="alert_type[@code]">
                        <category>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </category>
                    </xsl:for-each>
                    
                    <!-- code is 1..1 in FHIR profile, in zib either alert_naam or reference to problem should exist -->
                    <code>
                        <xsl:variable name="nullFlavorsInValueset" select="('OTH')"/>
                        <xsl:choose>
                            <xsl:when test="alert_naam[@code]">
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="alert_naam[@code]"/>
                                    <xsl:with-param name="treatNullFlavorAsCoding" select="alert_naam/@code = $nullFlavorsInValueset and alert_naam/@codeSystem = $oidHL7NullFlavor"/>
                                </xsl:call-template>
                                <xsl:if test="alert_naam[@displayName]">
                                    <text value="{alert_naam/@displayName}"/>
                                </xsl:if>
                            </xsl:when>
                            <!-- code is 1..1 in FHIR profile, but alert_name is 0..1 in zib -->
                            <xsl:otherwise>
                                <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
                                    <valueCode value="unknown"/>
                                </extension>
                            </xsl:otherwise>
                        </xsl:choose>
                    </code>
                    
                    <!-- >     NL-CM:0.0.12    Onderwerp Patient via nl.zorg.part.basiselementen -->
                    <subject>
                        <xsl:copy-of select="$patientRef[self::f:extension]"/>
                        <xsl:copy-of select="$patientRef[self::f:reference]"/>
                        <xsl:copy-of select="$patientRef[self::f:identifier]"/>
                        <xsl:copy-of select="$patientRef[self::f:display]"/>
                    </subject>
                </Flag>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
