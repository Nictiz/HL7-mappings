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
        <xd:desc>Mapping of HCIM Vaccination concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-Vaccination">zib-Vaccination</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the Immunization resource for Vaccination.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-Vaccination-2.1" match="vaccinatie[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | vaccination[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:Immunization)" mode="doZibVaccination-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <!--<xsl:param name="adaPractitioner" as="element()"/>-->
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-Vaccination</xsl:variable>
                <Immunization>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                    </xsl:if>
                    
                    <meta>
                        <profile value="{$profileValue}"/>
                    </meta>
                    
                    <status value="completed"/>
                    
                    <notGiven value="false"/>
                    
                    <!-- vaccineCode is required in the FHIR profile, so always output vaccineCode, data-absent-reason if no actual value -->
                    <vaccineCode>
                        <xsl:choose>
                            <xsl:when test="product_code[@code]">
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="product_code"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <extension url="{$urlExtHL7DataAbsentReason}">
                                    <valueCode value="unknown"/>
                                </extension>
                            </xsl:otherwise>
                        </xsl:choose>
                    </vaccineCode>
                    
                    <!-- Patient reference -->
                    <patient>
                        <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                    </patient>
                    
                    <!-- date is required in the FHIR profile, so always output date, data-absent-reason if no actual value -->
                    <date>
                        <xsl:choose>
                            <xsl:when test="(vaccinatie_datum | vaccination_date)[@value]">
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string((vaccinatie_datum | vaccination_date)/@value)"/>
                                        <xsl:with-param name="dateT" select="$dateT"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
                                    <valueCode value="unknown"/>
                                </extension>
                            </xsl:otherwise>
                        </xsl:choose>
                    </date>
                    
                    <primarySource value="false"/>
                    
                    <xsl:for-each select="(dosis | dose)[@value]">
                        <doseQuantity>
                            <xsl:call-template name="hoeveelheid-to-Quantity">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </doseQuantity>
                    </xsl:for-each>
                    
                    <!-- TODO Practitioner reference-->
                    <!--<xsl:for-each select="toediener/zorgverlener | administrator/health_professional">
                        <practitioner>
                            <actor>
                                 <extension url="http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference">
                                     <valueReference>
                                         <xsl:apply-templates select="$adaPractitioner" mode="doPractitionerRoleReference-2.0"/>
                                     </valueReference>
                                 </extension>
                                <xsl:apply-templates select="$adaPractitioner" mode="doPractitionerReference-2.0"/>
                            </actor>
                        </practitioner>
                    </xsl:for-each>-->
                    
                    <xsl:for-each select="(toelichting | comment)[@value]">
                        <note>
                            <text>
                                <xsl:call-template name="string-to-string">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </text>
                        </note>    
                    </xsl:for-each>
                    
                </Immunization>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Mapping of HCIM Vaccination concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-VaccinationRecommendation">zib-VaccinationRecommendation</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the ImmunizationRecommendation resource for Vaccination.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-VaccinationRecommendation-2.0" match="vaccinatie[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | vaccination[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:ImmunizationRecommendation)" mode="doZibVaccinationRecommendation-2.0">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-VaccinationRecommendation</xsl:variable>
                <ImmunizationRecommendation>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                    </xsl:if>
                    
                    <meta>
                        <profile value="{$profileValue}"/>
                    </meta>
                    
                    <!-- Patient reference -->
                    <patient>
                        <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                    </patient>
                    
                    <xsl:for-each select="(gewenste_datum_hervaccinatie | prefered_date_for_revaccination)[@value]">
                        <recommendation>
                            <date>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                        <xsl:with-param name="dateT" select="$dateT"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </date>
                                                        
                            <xsl:for-each select="../product_code[@code]">
                                <vaccineCode>
                                    <xsl:call-template name="code-to-CodeableConcept">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </vaccineCode>
                            </xsl:for-each>
                            
                            <forecastStatus>
                                <coding>
                                    <system value="http://hl7.org/fhir/immunization-recommendation-status"/>
                                    <code value="due"/>
                                    <display value="Due"/>
                                </coding>
                            </forecastStatus>
                        </recommendation>
                    </xsl:for-each>
                    
                </ImmunizationRecommendation>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>