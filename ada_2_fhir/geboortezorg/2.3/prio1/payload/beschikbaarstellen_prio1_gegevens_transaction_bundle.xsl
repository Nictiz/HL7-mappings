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
    <xsl:import href="../../../2_fhir_gebz_include.xsl"/>
   
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="true()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    
    <xsl:param name="mask-ids"/>
         
    <xsl:variable name="usecase">prio1</xsl:variable>
<!--    <xsl:variable name="commonEntries" as="element(f:entry)*">
        <xsl:copy-of select="$patients/f:entry , $practitioners/f:entry , $organizations/f:entry , $practitionerRoles/f:entry , $relatedPersons/f:entry"/>
    </xsl:variable>  -->
    
<!--    <xsl:variable name="patients" as="element()*">
        <xsl:call-template name="patients">
            <xsl:with-param name="in" select="$patient-ada"/>
        </xsl:call-template>
    </xsl:variable> -->
     
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
        <xsl:variable name="children" as="element()*">
            <xsl:apply-templates mode="doKindToFhir"/>
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
        <xsl:variable name="procedures" as="element(f:Procedure)*">
            <xsl:apply-templates mode="doDeliveryToFhir"/>
            <xsl:apply-templates mode="doObstetricProceduresToFhir"/> 
        </xsl:variable>
        
        <xsl:variable name="entries" select="$patients | $children | $organizations | $episodesofcare | $conditions | $procedures | $observations"/>
        
        <xsl:variable name="composition" as="element(f:Composition)">
            <xsl:call-template name="composition">
                <xsl:with-param name="logicalId"><xsl:value-of select="concat('samenvatting-zwangerschap',$pregnancyNo)"/></xsl:with-param>
                <xsl:with-param name="entries"><xsl:copy-of select="$entries"></xsl:copy-of></xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="transactionBundle" as="element(f:Bundle)*">
            <Bundle xmlns="http://hl7.org/fhir">
                <id value="{concat('samenvatting-zwangerschap',$pregnancyNo)}"/>
                <type value="transaction"/>   
                <xsl:apply-templates select="$composition" mode="doCreateTransactionBundleEntry"/>
                <xsl:for-each select="$entries/f:entry">
                    <xsl:apply-templates select="." mode="doCreateTransactionBundleEntry"/>
                </xsl:for-each>
            </Bundle>
        </xsl:variable>
        
        <xsl:apply-templates select="$transactionBundle" mode="doResourceInResultdoc"/>     
    </xsl:template>
      
    <xd:doc>
        <xd:desc>Creates transaction bundle entry for a FHIR resource</xd:desc>
    </xd:doc>
    <xsl:template match="f:Resource/* | f:Patient | f:Organization | f:Condition | f:EpisodeOfCare | f:Observation | f:Procedure | f:Composition" mode="doCreateTransactionBundleEntry">
        <entry>
            <fullUrl value="{concat(name(.),'/',f:id/@value)}"/>
            <resource>
                <xsl:apply-templates select="." mode="ResultOutput"/>
            </resource>
            <request>
                <method value="PUT"/>
                <url value="{concat(name(.),'/',f:id/@value)}"/>
            </request>
        </entry>
    </xsl:template>   
          
    <xd:doc>
        <xd:desc>Creates xml document for a FHIR resource</xd:desc>
    </xd:doc>
    <xsl:template match="f:Bundle" mode="doResourceInResultdoc">
        <xsl:result-document href="../fhir_instance/{$usecase}-transaction-{f:id/@value}.xml"> 
            <xsl:apply-templates select="." mode="ResultOutput"/>
        </xsl:result-document>
    </xsl:template>   
          
</xsl:stylesheet>
