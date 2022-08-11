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
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <!--<xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
    </xd:doc>
    <xsl:template name="tobaccoUseReference" match="tabak_gebruik[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | tobacco_use[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doTobaccoUseReference-2.1">
        <xsl:variable name="theIdentifier" select="(zibroot/identificatienummer | hcimroot/identification_number)[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$tobaccoUses[group-key = $theGroupKey]" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$theGroupElement">
                <xsl:variable name="fullUrl" select="nf:getFullUrlOrId(($theGroupElement/f:entry)[1])"/>
                <reference value="{$fullUrl}"/>
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
        <xd:desc>Produces a FHIR entry element with an Observation resource for TobaccoUse</xd:desc>
        <xd:param name="uuid">If true generate uuid from scratch. Defaults to false(). Generating a uuid from scratch limits reproduction of the same output as the uuids will be different every time.</xd:param>
        <xd:param name="adaPatient">Optional, but should be there. Patient this resource is for.</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.Observation.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="tobaccoUseEntry" match="tabak_gebruik[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | tobacco_use[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doTobaccoUseEntry-2.1" as="element(f:entry)">
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
                <xsl:call-template name="zib-TobaccoUse-2.1">
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
    </xsl:template>-->
    
    <xd:doc>
        <xd:desc>Mapping of HCIM TobaccoUse concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-TobaccoUse">zib-TobaccoUse</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the Observation resource for TobaccoUse.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-TobaccoUse-2.1" match="tabak_gebruik[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | tobacco_use[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:Observation)" mode="doZibTobaccoUse-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-TobaccoUse</xsl:variable>
                <Observation>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                    </xsl:if>
                    
                    <meta>
                        <profile value="{$profileValue}"/>
                    </meta>
                    
                    <status value="final"/>
                    
                    <code>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="365980008"/>
                            <display value="bevinding betreffende tabakgebruik en blootstelling aan tabaksrook"/>
                        </coding>
                    </code>
                    
                    <!-- Patient reference -->
                    <subject>
                        <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                    </subject>
                    
                    <xsl:if test="(waarneming_gebruik/start_datum | observation_of_use/start_date) or (waarneming_gebruik/stop_datum | observation_of_use/stop_date)">
                        <effectivePeriod>
                            <xsl:for-each select="waarneming_gebruik/start_datum | observation_of_use/start_date">
                                <start>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </start>
                            </xsl:for-each>
                            <xsl:for-each select="waarneming_gebruik/stop_datum | observation_of_use/stop_date">
                                <end>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </end>
                            </xsl:for-each>
                        </effectivePeriod>
                    </xsl:if>
                    
                    <xsl:for-each select="tabak_gebruik_status | tobacco_use_status">
                        <valueCodeableConcept>
                            <xsl:variable name="nullFlavorsInValueset" select="('OTH')"/>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="treatNullFlavorAsCoding" select="@code = $nullFlavorsInValueset and @codeSystem = $oidHL7NullFlavor"/>
                                </xsl:call-template>
                        </valueCodeableConcept>
                    </xsl:for-each>
                    
                    <xsl:for-each select="toelichting | comment">
                        <comment>
                            <xsl:attribute name="value" select="./@value"/>
                        </comment>
                    </xsl:for-each>
                    
                    <xsl:for-each select="tabak_gebruik_status | type_of_tobacco_used">
                        <component>
                            <code>
                                <coding>
                                    <system value="http://snomed.info/sct"/>
                                    <code value="53661000146106"/>
                                    <display value="type tabak gebruikt"/>
                                </coding>
                            </code>
                            <valueCodeableConcept>
                                <xsl:variable name="nullFlavorsInValueset" select="('OTH')"/>
                                    <xsl:call-template name="code-to-CodeableConcept">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="treatNullFlavorAsCoding" select="@code = $nullFlavorsInValueset and @codeSystem = $oidHL7NullFlavor"/>
                                    </xsl:call-template>
                            </valueCodeableConcept>
                        </component>
                    </xsl:for-each>
                    
                    <xsl:for-each select="waarneming_gebruik/hoeveelheid | observation_of_use/amount">
                        <component>
                            <code>
                                <coding>
                                    <system value="http://snomed.info/sct"/>
                                    <code value="266918002"/>
                                    <display value="hoeveelheid en type tabak gerookt"/>
                                </coding>
                            </code>
                            <valueQuantity>
                                <xsl:call-template name="hoeveelheid-to-Quantity">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueQuantity>
                        </component>
                    </xsl:for-each>
                    
                    <xsl:for-each select="waarneming_gebruik/pack_years | observation_of_use/pack_years">
                        <component>
                            <code>
                                <coding>
                                    <system value="http://snomed.info/sct"/>
                                    <code value="401201003"/>
                                    <display value="pakjaren"/>
                                </coding>
                            </code>
                            <valueQuantity>
                                <value>
                                    <xsl:attribute name="value" select="./@value"/>
                                </value>
                                <system value="http://unitsofmeasure.org"/>
                                <code value="{{PackYears}}"/>
                            </valueQuantity>
                        </component>
                    </xsl:for-each>
                    
                </Observation>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>