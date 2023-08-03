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
        <xd:desc>Mapping of HCIM NutritionAdvice concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-NutritionAdvice">zib-NutritionAdvice</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the NutritionOrder resource for NutritionAdvice.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-NutritionAdvice-2.1" match="(voedings_gebruik | nutrition_advice)[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:NutritionOrder)" mode="doZibNutritionAdvice-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-NutritionAdvice</xsl:variable>
                <NutritionOrder>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                    </xsl:if>
                    
                    <meta>
                        <profile value="{$profileValue}"/>
                    </meta>
                    
                    <xsl:for-each select="(toelichting | comment)[@value]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-NutritionAdvice-Explanation">
                            <valueString>
                                <xsl:call-template name="string-to-string">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueString>
                        </extension>    
                    </xsl:for-each>
                    
                    <xsl:for-each select="zibroot/identificatienummer | hcimroot/identification_number">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    
                    <status value="active"/>
                    
                    <!-- Patient reference -->
                    <patient>
                        <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                    </patient>
                    
                    <!-- dateTime is required in the FHIR profile, so always output dateTime, data-absent-reason if no actual value -->
                    <dateTime>
                        <xsl:choose>
                            <xsl:when test="(zibroot/datum_tijd | hcimroot/date_time)[@value]">
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string((zibroot/datum_tijd | hcimroot/date_time)/@value)"/>
                                        <xsl:with-param name="dateT" select="$dateT"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <extension url="{$urlExtHL7DataAbsentReason}">
                                    <valueCode value="unknown"/>
                                </extension>
                            </xsl:otherwise>
                        </xsl:choose>
                    </dateTime>
                    
                    <xsl:if test="(dieet_type | diet_type)[@value] | (consistentie | consistency)[@value]">
                        <oralDiet>
                            <xsl:for-each select="(dieet_type | diet_type)[@value]">
                                <type>
                                    <text>
                                        <xsl:call-template name="string-to-string">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </text>
                                </type>
                            </xsl:for-each>
                            <xsl:for-each select="(consistentie | consistency)[@value]">
                                <texture>
                                    <modifier>
                                        <text>
                                            <xsl:call-template name="string-to-string">
                                                <xsl:with-param name="in" select="."/>
                                            </xsl:call-template>
                                        </text>
                                    </modifier>
                                    
                                    <foodType>
                                        <text>
                                            <xsl:call-template name="string-to-string">
                                                <xsl:with-param name="in" select="."/>
                                            </xsl:call-template>
                                        </text>
                                    </foodType>
                                </texture>
                                <fluidConsistencyType>
                                    <text>
                                        <xsl:call-template name="string-to-string">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </text>
                                </fluidConsistencyType>
                            </xsl:for-each>
                        </oralDiet>
                    </xsl:if>
                    
                </NutritionOrder>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>