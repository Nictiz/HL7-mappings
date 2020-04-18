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
    <xsl:import href="gebz_mappings.xsl"/>
    <!--<xsl:import href="../../../../zibs2017/payload/nl-core-patient-2.1.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>  
   
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
   
    <xd:doc>
        <xd:desc>Mapping of ADA geboortezorg concept to FHIR Observation <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation">zib-LaboratoryTestResult-Observation</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of an Observation resource</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
    </xd:doc>
    <xsl:template name="bc-observation" match="/*" as="element()">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient"/>
        <xsl:param name="dossierId"/>
        <xsl:param name="pregnancyId"/>
        <xsl:param name="childId"/>
        
        <xsl:variable name="elementName" select="name(.)"/>
        <xsl:variable name="parentElemName" select="parent::node()/name(.)"/>
                
        <xsl:for-each select="$in">            
            <Observation>
                <xsl:if test="$referById">
                    <id value="{$logicalId}"/>
                </xsl:if>
                <meta>
                    <xsl:call-template name="bc-profile"/>
                </meta>
                <xsl:if test="$pregnancyId!='' and $parentElemName!='lichamelijk_onderzoek_kind'">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/Observation-focus-stu3">
                        <valueReference>
                            <xsl:choose>
                                <xsl:when test="$parentElemName='zwangerschap'">
                                    <reference value="Condition/{$pregnancyId}"/>
                                </xsl:when>
                                <xsl:when test="$parentElemName='bevalling' or $elementName='baring'">
                                    <reference value="Procedure/{concat('bevalling-',$pregnancyId)}"/>
                                </xsl:when>   
                                <xsl:when test="($parentElemName='kindspecifieke_maternale_gegevens' or $parentElemName='kindspecifieke_uitkomst_gegevens') and $childId!=''">
                                    <reference value="Observation/{concat('geboorte-',$childId,'-',$pregnancyId)}"/>
                                </xsl:when>
                            </xsl:choose>
                        </valueReference>
                    </extension>
                </xsl:if>
                <xsl:if test="$childId!='' and $elementName='baring'">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/Observation-focus-stu3">
                        <valueReference>
                            <reference value="Patient/{$childId}"/>
                        </valueReference>
                    </extension>                 
                </xsl:if>
                <status value="final"/>
                <code>
                    <xsl:call-template name="bc-observation-coding"/>
                </code>
                <xsl:choose>
                    <xsl:when test="$childId!='' and $parentElemName='lichamelijk_onderzoek_kind'">
                        <subject>
                            <reference value="Patient/{$childId}"/>
                        </subject>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="$adaPatient">
                            <subject>
                                <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                            </subject>
                        </xsl:for-each>                 
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="$dossierId!=''">
                    <context value="EpisodeOfCare/{$dossierId}"/>
                </xsl:if>
                <xsl:for-each select=".">
                    <xsl:choose>
                        <xsl:when test="$elementName='baring'">
                            <valueCodeableConcept>
                                <coding>
                                    <system value="http://snomed.info/sct"/>
                                    <code value="3950001"/>
                                    <display value="Birth (finding)"/>
                                </coding>
                            </valueCodeableConcept>
                        </xsl:when>
                        <xsl:when test="@datatype='datetime'">
                            <xsl:call-template name="any-to-date"/>
                        </xsl:when>
                        <xsl:when test="not(@code) and @value castable as xs:integer">
                            <xsl:element name="valueQuantity" namespace="http://hl7.org/fhir">
                                <xsl:call-template name="hoeveelheid-to-Quantity">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="any-to-value"> 
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="elemName">value</xsl:with-param>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>   
            </Observation>
        </xsl:for-each>
    </xsl:template>
      
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="@*|node()">
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>
