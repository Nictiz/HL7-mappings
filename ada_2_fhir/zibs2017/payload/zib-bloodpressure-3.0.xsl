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
        <xd:desc>Mapping of HCIM BloodPressure concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-BloodPressure">zib-BloodPressure</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the Observation resource for BloodPressure.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-BloodPressure-3.0" match="(bloeddruk | blood_pressure)[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:Observation)" mode="doZibBloodPressure-3.0">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-BloodPressure</xsl:variable>
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
                    
                    <category>
                        <coding>
                            <system value="http://hl7.org/fhir/observation-category"/>
                            <code value="vital-signs"/>
                            <display value="Vital Signs"/>
                        </coding>
                    </category>
                    
                    <code>
                        <coding>
                            <system value="{local:getUri($oidLOINC)}"/>
                            <code value="85354-9"/>
                            <display value="Blood pressure panel with all children optional"/>
                        </coding>
                    </code>
                    
                    <!-- Patient reference -->
                    <subject>
                        <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                    </subject>
                    
                    <!-- effectiveDateTime is required in the FHIR profile, so always output effectiveDateTime, data-absent-reason if no actual value -->
                    <effectiveDateTime>
                        <xsl:choose>
                            <xsl:when test="(bloeddruk_datum_tijd | blood_pressure_date_time)[@value]">
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string((bloeddruk_datum_tijd | blood_pressure_date_time)/@value)"/>
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
                    </effectiveDateTime>
                    
                    <xsl:for-each select="(toelichting | comment)[@value]">
                        <comment>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </comment>
                    </xsl:for-each>
                    
                    <xsl:for-each select="(meet_locatie | measuring_location)[@code]">
                        <bodySite>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </bodySite>
                    </xsl:for-each>
                    
                    <xsl:for-each select="(meetmethode | measuring_method)[@code]">
                        <method>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </method>
                    </xsl:for-each>
                    
                    <!-- component SystolicBP is required in the FHIR profile, so always output component, data-absent-reason if no actual value -->
                    <component>
                        <code>
                            <coding>
                                <system value="{local:getUri($oidLOINC)}"/>
                                <code value="8480-6"/>
                                <display value="Intravasculaire systolische bloeddruk [druk] in arterieel vaatstelsel"/>
                            </coding>
                        </code>
                        <valueQuantity>
                            <xsl:choose>
                                <xsl:when test="(systolische_bloeddruk | systolic_blood_pressure)[@value]">
                                    <xsl:call-template name="hoeveelheid-to-Quantity">
                                        <xsl:with-param name="in" select="systolische_bloeddruk | systolic_blood_pressure"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <extension url="{$urlExtHL7DataAbsentReason}">
                                        <valueCode value="unknown"/>
                                    </extension>
                                </xsl:otherwise>
                            </xsl:choose>
                        </valueQuantity>
                    </component>
                    
                    <!-- component DiastolicBP is required in the FHIR profile, so always output component, data-absent-reason if no actual value -->
                    <component>
                        <code>
                            <coding>
                                <system value="{local:getUri($oidLOINC)}"/>
                                <code value="8462-4"/>
                                <display value="Intravasculaire diastolische bloeddruk [druk] in arterieel vaatstelsel"/>
                            </coding>
                        </code>
                        <valueQuantity>
                            <xsl:choose>
                                <xsl:when test="(diastolische_bloeddruk | diastolic_blood_pressure)[@value]">
                                    <xsl:call-template name="hoeveelheid-to-Quantity">
                                        <xsl:with-param name="in" select="diastolische_bloeddruk | diastolic_blood_pressure"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <extension url="{$urlExtHL7DataAbsentReason}">
                                        <valueCode value="unknown"/>
                                    </extension>
                                </xsl:otherwise>
                            </xsl:choose>
                        </valueQuantity>
                    </component>
                    
                    <xsl:for-each select="(gemiddelde_bloeddruk | average_blood_pressure)[@value]">
                        <component>
                            <code>
                                <coding>
                                    <system value="{local:getUri($oidLOINC)}"/>
                                    <code value="8478-0"/>
                                    <display value="Mean blood pressure"/>
                                </coding>
                            </code>
                            <valueQuantity>
                                <xsl:call-template name="hoeveelheid-to-Quantity">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueQuantity>
                        </component>
                        
                        <component>
                            <code>
                                <coding>
                                    <system value="{local:getUri($oidSNOMEDCT)}"/>
                                    <code value="6797001"/>
                                    <display value="gemiddelde bloeddruk"/>
                                </coding>
                            </code>
                            <valueQuantity>
                                <xsl:call-template name="hoeveelheid-to-Quantity">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueQuantity>
                        </component>
                    </xsl:for-each>
                    
                    <xsl:for-each select="(diastolisch_eindpunt | diastolic_endpoint)[@code]">
                        <component>
                            <code>
                                <coding>
                                    <system value="{local:getUri($oidSNOMEDCT)}"/>
                                    <code value="85549003"/>
                                    <display value="Korotkofftonen"/>
                                </coding>
                            </code>
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </component>
                    </xsl:for-each>
                    
                    <xsl:for-each select="(manchet_type | cuff_type)[@code]">
                        <component>
                            <code>
                                <coding>
                                    <system value="{local:getUri($oidLOINC)}"/>
                                    <code value="8358-4"/>
                                    <display value="Blood pressure device Cuff size"/>
                                </coding>
                            </code>
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </component>
                        
                        <component>
                            <code>
                                <coding>
                                    <system value="{local:getUri($oidSNOMEDCT)}"/>
                                    <code value="70665002"/>
                                    <display value="bloeddrukmanchet"/>
                                </coding>
                            </code>
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </component>
                    </xsl:for-each>
                    
                    <xsl:for-each select="(houding | position)[@code]">
                        <component>
                            <code>
                                <coding>
                                    <system value="{local:getUri($oidSNOMEDCT)}"/>
                                    <code value="424724000"/>
                                    <display value="lichaamspositie voor bepalen van bloeddruk"/>
                                </coding>
                            </code>
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </component>
                        
                        <component>
                            <code>
                                <coding>
                                    <system value="{local:getUri($oidLOINC)}"/>
                                    <code value="8361-8"/>
                                    <display value="Body position with respect to gravity"/>
                                </coding>
                            </code>
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </component>
                    </xsl:for-each>
                    
                </Observation>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>