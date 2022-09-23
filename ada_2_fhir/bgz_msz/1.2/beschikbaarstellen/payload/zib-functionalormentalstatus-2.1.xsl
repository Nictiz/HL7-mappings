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
    <xsl:strip-space elements="*"></xsl:strip-space>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xd:doc>
        <xd:desc>Mapping of HCIM FunctionalOrMentalStatus concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-FunctionalOrMentalStatus">zib-FunctionalOrMentalStatus</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the Observation resource for FunctionalOrMentalStatus.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-FunctionalOrMentalStatus-2.1" match="functionele_of_mentale_status[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | functional_or_mental_status[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:Observation)" mode="doZibFunctionalOrMentalStatus-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-FunctionalOrMentalStatus</xsl:variable>
                <Observation>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                    </xsl:if>
                    
                    <meta>
                        <profile value="{$profileValue}"/>
                    </meta>
                    
                    <!--<xsl:for-each select="hulpmiddel | medical_device">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-FunctionalOrMentalStatus-MedicalDevice">
                            <valueReference>
                                <xsl:apply-templates select="$adaProblem" mode="doMedicalDeviceReference-2.2"/>
                            </valueReference>
                        </extension>
                    </xsl:for-each>-->
                    
                    <status value="final"/>
                    
                    <!-- Not able to determine category code in general, so is determined explicitly by the codes present in the ada instances -->
                    <category>
                        <coding>
                            <xsl:choose>
                                <xsl:when test="(status_naam | status_name)[@code = ('15188001', '301438001', '713512009') and @codeSystem = '2.16.840.1.113883.6.96']">
                                    <system value="http://snomed.info/sct"/>
                                    <code value="118228005"/>
                                    <display value="bevinding betreffende functioneren"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <system value="http://snomed.info/sct"/>
                                    <code value="384821006"/>
                                    <display value="bevinding betreffende mentale toestand, gedrag en/of psychosociaal functioneren"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </coding>
                    </category>
                    
                    <!-- code is required in the FHIR profile, so always output code, data-absent-reason if no actual value -->
                    <code>
                        <xsl:choose>
                            <xsl:when test="(status_naam | status_name)[@code]">
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="status_naam | status_name"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <extension url="{$urlExtHL7DataAbsentReason}">
                                    <valueCode value="unknown"/>
                                </extension>
                            </xsl:otherwise>
                        </xsl:choose>
                    </code>
                    
                    <!-- Patient reference -->
                    <subject>
                        <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                    </subject>
                    
                    <xsl:for-each select="(status_datum | status_date)[@value]">
                        <effectivePeriod>
                            <start>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                        <xsl:with-param name="dateT" select="$dateT"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </start>
                        </effectivePeriod>
                    </xsl:for-each>
                    
                    <xsl:for-each select="(status_waarde | status_value)[@code]">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </xsl:for-each>
                    
                    <xsl:for-each select="(toelichting | comment)[@value]">
                        <comment>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </comment>
                    </xsl:for-each>
                    
                </Observation>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>