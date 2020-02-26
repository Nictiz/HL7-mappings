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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->    
    <xsl:import href="../../../../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:import href="../../../../zibs2017/payload/zib-LaboratoryTestResult-Observation-2.1.xsl"/>
    <xsl:import href="gebz_prio1_2_fhir_nl-core-patient.xsl"/>
    <xsl:import href="gebz_prio1_2_fhir_nl-core-organization.xsl"/>
    <xsl:import href="gebz_prio1_2_fhir_bc-observation.xsl"/>
    <xsl:import href="gebz_prio1_2_fhir_zib-laboratory-testresult-observation.xsl"/>
    <xsl:import href="gebz_prio1_mappings.xsl"/>
    <xsl:import href="../../../2_fhir_gebz_include.xsl"/>
   
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="true()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    
    <xsl:param name="mask-ids"/>
         
    <xsl:variable name="usecase">prio1</xsl:variable>
    <xsl:variable name="commonEntries" as="element(f:entry)*">
        <xsl:copy-of select="$patients/f:entry , $practitioners/f:entry , $organizations/f:entry , $practitionerRoles/f:entry , $relatedPersons/f:entry"/>
    </xsl:variable>  
      
    <xd:doc>
        <xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen prio 1 gegevens".</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:apply-templates select="//prio1_huidig | prio1_vorig"/>
    </xsl:template>
    <xd:doc>
        <xd:desc>Build the individual FHIR resources.</xd:desc>
    </xd:doc>
    <xsl:template name="ConversiePrio1Gegevens" match="prio1_huidig | prio1_vorig">     
        <!-- <xsl:copy-of select="$patients"></xsl:copy-of> --> <!-- unieke patienten ipv onderstaande var -->
        <xsl:variable name="patients" as="element(f:Patient)*"> <!--  as="element()*"> -->
            <!--
            <xsl:call-template name="patients">
                <xsl:with-param name="in" select="$patient-ada"/>
            </xsl:call-template>
            -->
            <xsl:apply-templates mode="doVrouwToFhir"/>
            <xsl:apply-templates mode="doKindToFhir"/>
            <!-- common entries (patient, practitioners, organizations, practitionerroles, relatedpersons -->
            <!--<xsl:copy-of select="$commonEntries"/>-->
        </xsl:variable>
        <xsl:variable name="organizations" as="element(f:Organization)*">
            <xsl:apply-templates mode="doZorginstellingToFhir"/>
        </xsl:variable>
        <xsl:variable name="conditions" as="element(f:Condition)*">
            <xsl:apply-templates mode="doZwangerschapToFhir"/>
        </xsl:variable>
        <xsl:variable name="episodesofcare" as="element(f:EpisodeOfCare)*">
            <xsl:call-template name="zwangerschapsdossier"/>
        </xsl:variable>
        <xsl:variable name="observations" as="element(f:Observation)*">
            <xsl:apply-templates mode="doMaternaleOnderzoeksgegevensToFhir"/>
            <xsl:apply-templates mode="doZwangerschapEnBevallingGegevensToFhir"/>
            <xsl:apply-templates mode="doKindGegevensToFhir"/>
        </xsl:variable>

        
        <xsl:apply-templates select="$patients" mode="doResourceInResultdoc"/>
        <xsl:apply-templates select="$organizations" mode="doResourceInResultdoc"/>
        <xsl:apply-templates select="$conditions" mode="doResourceInResultdoc"/>
        <xsl:apply-templates select="$episodesofcare" mode="doResourceInResultdoc"/>
        <xsl:apply-templates select="$observations" mode="doResourceInResultdoc"/>
      
        <!--    
        <xsl:apply-templates select="$patients/f:resource/*" mode="doResourceInResultdoc"/>
        -->
    </xsl:template>
      
    <xd:doc>
        <xd:desc>Creates xml document for a FHIR resource</xd:desc>
    </xd:doc>
    <xsl:template match="f:Resource/* | f:Patient | f:Organization | f:Condition | f:EpisodeOfCare | f:Observation" mode="doResourceInResultdoc">
        <xsl:variable name="zib-name" select="replace(tokenize(f:meta/f:profile/@value, './')[last()], '-GebzToFHIRConversion-', '-')"/>
        <!--<xsl:variable name="obs-code" select="f:code/f:coding/f:code/@value"/>-->
        <xsl:result-document href="../fhir_instance/{$usecase}-{$zib-name}-{f:id/@value}.xml"> 
            <xsl:apply-templates select="." mode="ResultOutput"/>
        </xsl:result-document>
    </xsl:template>   
          
</xsl:stylesheet>
