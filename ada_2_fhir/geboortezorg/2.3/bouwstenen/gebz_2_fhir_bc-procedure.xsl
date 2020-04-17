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
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>  
   
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
   
    <xd:doc>
        <xd:desc>Mapping of ADA geboortezorg concept to FHIR Procedure <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation">zib-LaboratoryTestResult-Observation</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of an Observation resource</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
    </xd:doc>
    <xsl:template name="bc-procedure" match="/" as="element()">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient"/>
        <xsl:param name="dossierId"/>
        <xsl:param name="pregnancyId"/>
        <xsl:param name="childId"/>
        
        <xsl:variable name="elementName" select="name(.)"/>
        <xsl:variable name="parentElemName" select="parent::node()/name(.)"/>
        <xsl:variable name="startDelivery">
            <xsl:for-each select="tijdstip_begin_actieve_ontsluiting">
                <xsl:call-template name="format-date"/>
            </xsl:for-each>
        </xsl:variable> 
 
        <xsl:for-each select="$in">            
            <Procedure>
                <xsl:if test="$referById">
                    <id value="{$logicalId}"/>
                </xsl:if>
                <meta>
                    <xsl:call-template name="bc-profile"/>
                </meta>
                <xsl:if test="$parentElemName='kindspecifieke_uitkomst_gegevens' and $childId!='' and $pregnancyId!=''">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/event-partOf">
                        <valueReference>
                            <reference value="Observation/{concat('geboorte-',$childId,'-',$pregnancyId)}"/>
                        </valueReference>
                    </extension>
                </xsl:if>
                <status value="completed"/>
                <category>
                    <coding>
                        <system value='http://snomed.info/sct'/>
                        <code value="386637004"/>
                        <display value='Obstetric procedure (procedure)'/>
                    </coding>
                </category>               
                <code>
                    <xsl:call-template name="bc-procedure-coding"/>
                </code>
                <xsl:for-each select="$adaPatient">
                    <subject>
                        <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                    </subject>
                </xsl:for-each>                 
                <xsl:if test="$dossierId!=''">
                    <context value="EpisodeOfCare/{$dossierId}"/>
                </xsl:if>
                <xsl:if test="$startDelivery!=''">
                    <performedPeriod>
                        <start value ="{$startDelivery}"/>
                    </performedPeriod>
                </xsl:if>
                <xsl:if test="$pregnancyId!=''">
                    <reasonReference>
                        <reference value = "Condition/{$pregnancyId}"/>
                    </reasonReference>
                </xsl:if>
            </Procedure>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="@*|node()">
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>
