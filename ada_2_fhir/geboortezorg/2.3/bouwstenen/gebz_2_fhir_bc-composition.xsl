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
    <xsl:template name="bc-composition" mode="doCompositionInstance" match="/" as="element()">
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient"/>
        <xsl:param name="entries"/>
                
        <Composition xmlns="http://hl7.org/fhir">
            <id value="{$logicalId}"/>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/bc-TransactionComposition"/>
            </meta>
            <status value="final"/> 
            <type> 
                <coding> 
                    <system value="http://loinc.org"/> 
                    <code value="15508-5"/> 
                    <display value="Labor and delivery records"/> 
                </coding> 
            </type> 
            <xsl:for-each select="$adaPatient">
                <subject>
                    <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                </subject>
            </xsl:for-each> 
            <date value="2012-01-04T09:10:14Z"/> 
            <author> 
                <reference value="Practitioner/{$entries/f:Practitioner/f:id/@value}"/>
            </author> 
            <title value="Example Prio 1 Huidige Zwangerschap"/> 
            <section> 
                <xsl:for-each select="$entries">
                    <xsl:apply-templates select="." mode="doCreateCompositionEntry"/>
                </xsl:for-each>
            </section>           
        </Composition> 
    </xsl:template>
    
    <xsl:template match="f:Resource/* | f:Patient | f:Organization | f:Practitioner | f:PractitionerRole | f:Condition | f:EpisodeOfCare | f:Observation | f:Procedure" mode="doCreateCompositionEntry">
        <entry> 
            <reference value="{concat(name(.),'/',f:id/@value)}"/>
        </entry>   
    </xsl:template>   
         
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="@*|node()">
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>
