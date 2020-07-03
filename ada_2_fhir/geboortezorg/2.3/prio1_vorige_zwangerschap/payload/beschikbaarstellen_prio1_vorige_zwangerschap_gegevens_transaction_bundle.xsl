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
         
    <xsl:variable name="usecase">prio1-vorige-zwangerschap</xsl:variable>
     
    <xd:doc>
        <xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen prio 1 gegevens".</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:apply-templates select="//(prio1_vorige_zwangerschap)"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Build the Bundle with FHIR resources.</xd:desc>
    </xd:doc>
    <xsl:template name="ConversiePrio1Gegevens" match="prio1_vorige_zwangerschap">              
        <xsl:variable name="transactionBundle"> <!--as="element(f:Bundle)*"-->
            <Bundle xmlns="http://hl7.org/fhir">
                <id value="{concat('samenvatting-',$vrouwId,'-zwangerschap',$bouwstenen/f:resource/f:Condition/f:id/@value)}"/>
                <type value="transaction"/>   
                <xsl:for-each select="$bouwstenen">
                    <xsl:copy-of select="."/>
                </xsl:for-each>
            </Bundle>
        </xsl:variable>
        <xsl:apply-templates select="$transactionBundle" mode="doResourceInResultdoc"/>
        <xsl:variable name="transformedBundle">
            <xsl:apply-templates select="$transactionBundle" mode="doConditionalTransform"/>    
        </xsl:variable>
        <xsl:apply-templates select="$transformedBundle" mode="doResourceInResultdoc">
            <xsl:with-param name="postfix" select="'-conditionalReferences'"/>
        </xsl:apply-templates>
    </xsl:template> 
          
    <xd:doc>
        <xd:desc>Creates xml document for a FHIR resource</xd:desc>
    </xd:doc>
    <xsl:template match="f:Bundle" mode="doResourceInResultdoc">
        <xsl:param name="postfix"></xsl:param>
        <xsl:result-document href="../fhir_instance/Gebz-{$usecase}-transaction-{f:id/@value}{$postfix}.xml"> 
            <xsl:apply-templates select="." mode="ResultOutput"/>
        </xsl:result-document>
    </xsl:template>   
          
</xsl:stylesheet>
