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
    
    <xd:doc>
        <xd:desc>Mapping of HCIM DrugUse concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-DrugUse">zib-DrugUse</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the Observation resource for DrugUse.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-DrugUse-2.1" match="(drugs_gebruik | drug_use)[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:Observation)" mode="doZibDrugUse-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-DrugUse</xsl:variable>
                <Observation>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                    </xsl:if>
                    
                    <meta>
                        <profile value="{$profileValue}"/>
                    </meta>
                    
                    <xsl:for-each select="zibroot/identificatienummer | hcimroot/identification_number">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    
                    <status value="final"/>
                    
                    <code>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="228366006"/>
                            <display value="bevinding betreffende drugsgebruik"/>
                        </coding>
                    </code>
                    
                    <!-- Patient reference -->
                    <subject>
                        <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                    </subject>
                    
                    <xsl:if test="(waarneming_gebruik/start_datum | observation_of_use/start_date)[@value] or (waarneming_gebruik/stop_datum | observation_of_use/stop_date)[@value]">
                        <effectivePeriod>
                            <xsl:for-each select="(waarneming_gebruik/start_datum | observation_of_use/start_date)[@value]">
                                <start>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                            <xsl:with-param name="dateT" select="$dateT"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </start>
                            </xsl:for-each>
                            <xsl:for-each select="(waarneming_gebruik/stop_datum | observation_of_use/stop_date)[@value]">
                                <end>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                            <xsl:with-param name="dateT" select="$dateT"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </end>
                            </xsl:for-each>
                        </effectivePeriod>
                    </xsl:if>
                    
                    <!-- valueCodeableConcept is required in the FHIR profile, so always output valueCodeableConcept, data-absent-reason if no actual value -->
                    <valueCodeableConcept>
                        <xsl:choose>
                            <xsl:when test="(drugs_gebruik_status | drug_use_status)[@code]">
                                <xsl:variable name="nullFlavorsInValueset" select="('OTH')"/>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="drugs_gebruik_status | drug_use_status"/>
                                    <xsl:with-param name="treatNullFlavorAsCoding" select="(drugs_gebruik_status | drug_use_status)/@code = $nullFlavorsInValueset and (drugs_gebruik_status | drug_use_status)/@codeSystem = $oidHL7NullFlavor"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <extension url="{$urlExtHL7DataAbsentReason}">
                                    <valueCode value="unknown"/>
                                </extension>
                            </xsl:otherwise>
                        </xsl:choose>
                    </valueCodeableConcept>
                    
                    <xsl:for-each select="(toelichting | comment)[@value]">
                        <comment>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </comment>
                    </xsl:for-each>
                    
                    <xsl:for-each select="(drugs_of_geneesmiddel_soort | drug_or_medication_type)[@code]">
                        <component>
                            <code>
                                <coding>
                                    <system value="http://snomed.info/sct"/>
                                    <code value="410942007"/>
                                    <display value="drug of geneesmiddel"/>
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
                    
                    <xsl:for-each select="(toedieningsweg | route_of_administration)[@code]">
                        <component>
                            <code>
                                <coding>
                                    <system value="http://snomed.info/sct"/>
                                    <code value="410675002"/>
                                    <display value="toedieningsweg"/>
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
                    
                    <xsl:for-each select="(waarneming_gebruik/hoeveelheid | observation_of_use/amount)[@value]">
                        <component>
                            <code>
                                <coding>
                                    <system value="http://snomed.info/sct"/>
                                    <code value="228390007"/>
                                    <display value="Frequency of drug misuse"/>
                                </coding>
                            </code>
                            <valueString>
                                <xsl:call-template name="string-to-string">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueString>
                        </component>
                    </xsl:for-each>
                    
                </Observation>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>