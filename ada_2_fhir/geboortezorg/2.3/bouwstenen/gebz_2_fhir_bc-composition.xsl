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
        <xd:desc>Mapping of ADA geboortezorg concept to FHIR Composition <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation">zib-LaboratoryTestResult-Observation</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of an Composition resource</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
    </xd:doc>
    <xsl:template name="bc-composition" match="prio1_huidige_zwangerschap | prio1_vorige_zwangerschap | bevallingsgegevens_23" mode="doCompositionResource" as="element()">
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient"/>
        <xsl:param name="adaZorgverlener"/>
        <xsl:param name="entries"/>
        <xsl:variable name="elementName" select="name(.)"/>
                
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
            <!-- TODO: ophalen datum uit transactie -->
            <date value="{current-dateTime()}"/>
            <!--<date value="2012-01-04T09:10:14Z"/>-->
            <xsl:for-each select="$adaZorgverlener">
                <author> 
                    <xsl:call-template name="practitionerReference"/>
                </author>                 
            </xsl:for-each>
            <title value="Example {replace($elementName,'_',' ')}"/> 
            <section> 
                <xsl:for-each select="$entries">
                    <xsl:apply-templates select="." mode="doCreateCompositionEntry"/>
                </xsl:for-each>
            </section>           
        </Composition> 
    </xsl:template>
    
    <xsl:template match="/*" mode="doCreateCompositionEntry"> <!--f:Resource/* | f:Patient | f:Organization | f:Practitioner | f:PractitionerRole | f:Condition | f:EpisodeOfCare | f:Observation | f:Procedure-->
        <xsl:for-each select="f:entry">
            <entry> 
                <reference value="{concat(f:resource/*/name(.),'/',f:resource/*/f:id/@value)}"/>
                <display value="{../reference-display}"/>
            </entry>               
        </xsl:for-each>
    </xsl:template>   
         
</xsl:stylesheet>
