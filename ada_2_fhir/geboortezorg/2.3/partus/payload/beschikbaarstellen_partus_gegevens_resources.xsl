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
    <xsl:import href="../../../2_fhir_gebz_include.xsl"/>
   
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="true()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    
    <xsl:param name="mask-ids"/>
         
    <xsl:variable name="usecase">partus</xsl:variable>
     
    <xd:doc>
        <xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen partus gegevens".</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:apply-templates select="//bevallingsgegevens_23"/>
    </xsl:template>
    <xd:doc>
        <xd:desc>Build the individual FHIR resources.</xd:desc>
    </xd:doc>
    <xsl:template name="ConversiePartusGegevens" match="bevallingsgegevens_23">             
        <xsl:apply-templates select="$bouwstenen" mode="doResourceInResultdoc"/>
    </xsl:template>
      
    <xd:doc>
        <xd:desc>Creates xml document for a FHIR resource</xd:desc>
    </xd:doc>
    <xsl:template match="f:Resource/* | f:Patient | f:RelatedPerson | f:Practitioner | f:PractitionerRole | f:Organization | f:ReferralRequest | f:Condition | f:EpisodeOfCare | f:Observation | f:Procedure | f:List" mode="doResourceInResultdoc">
        <xsl:variable name="zib-name" select="tokenize(f:meta/f:profile[last()]/@value, './')[last()]"/>
        <!--<xsl:variable name="obs-code" select="f:code/f:coding/f:code/@value"/>-->
        <xsl:result-document href="../fhir_instance/Gebz-{$usecase}-{$zib-name}-{f:id/@value}.xml"> 
            <xsl:apply-templates select="." mode="ResultOutput"/>
        </xsl:result-document>
    </xsl:template>   
          
</xsl:stylesheet>
