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
    
    <xd:doc>
        <xd:desc>Mapping of ADA geboortezorg concepts to profiles.</xd:desc>
        <xd:param name="in">Node to consider in the creation of an Observation resource</xd:param>
    </xd:doc>
    <xsl:template name="bc-profile" match="graviditeit | pariteit | pariteit_voor_deze_zwangerschap | a_terme_datum | wijze_einde_zwangerschap | datum_einde_zwangerschap" as="element()">      
        <xsl:variable name="elementName" select="name(.)"/>
                
        <xsl:for-each select=".">            
            <xsl:choose>
                <xsl:when test="$elementName='graviditeit'">
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Pregnancy-Gravidity"/>
                </xsl:when>
                <xsl:when test="$elementName='pariteit' or $elementName='pariteit_voor_deze_zwangerschap'">
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Pregnancy-Parity"/>
                </xsl:when>
                <xsl:when test="$elementName='a_terme_datum'">
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Pregnancy-TermDate"/>
                </xsl:when>
                <xsl:when test="$elementName='wijze_einde_zwangerschap'">
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/bc-WayEndPregnancy"/>
                </xsl:when>
                <xsl:when test="$elementName='datum_einde_zwangerschap'">
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/bc-DateEndPregnancy"/>
                </xsl:when>
                <xsl:when test="$elementName='tijdstip_begin_actieve_ontsluiting'">
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/bc-OnsetOfLaborFirstStage"/>
                </xsl:when>
                <xsl:when test="$elementName='hoeveelheid_bloedverlies'">
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/bc-BloodLoss"/>
                </xsl:when>        
                <xsl:when test="$elementName='conditie_perineum_postpartum'">
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/bc-StatePerineumPostPartum"/>
                </xsl:when>              
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="bc-observation-coding" match="graviditeit | pariteit | pariteit_voor_deze_zwangerschap | a_terme_datum | wijze_einde_zwangerschap | datum_einde_zwangerschap" as="element()">      
        <xsl:variable name="elementName" select="name(.)"/>
        <xsl:for-each select="."> 
            <coding>
            <xsl:choose>
                <xsl:when test="$elementName='graviditeit'">
                    <system value="http://loinc.org"/>
                    <code value="11996-6"/>
                    <display value="Gravidity"/>
                </xsl:when>
                <xsl:when test="$elementName='pariteit' or $elementName='pariteit_voor_deze_zwangerschap'">
                    <system value="http://loinc.org"/>
                    <code value="11977-6"/>
                    <display value="Parity"/>
                </xsl:when>
                <xsl:when test="$elementName='a_terme_datum'">
                    <system value="http://loinc.org"/>
                    <code value="11778-8"/>
                    <display value="Deliv date Clin est"/>
                </xsl:when>
                <xsl:when test="$elementName='wijze_einde_zwangerschap'">
                    <system value="urn:oid:2.16.840.1.113883.2.4.4.13"/>
                    <code value="EindeZw"/>
                    <display value="Wijze einde zwangerschap"/>
                </xsl:when>
                <xsl:when test="$elementName='datum_einde_zwangerschap'">
                    <system value="http://snomed.info/sct"/>
                    <code value="118185001"/>
                    <display value="Finding related to pregnancy (finding)"/>
                </xsl:when>
                <xsl:when test="$elementName='tijdstip_begin_actieve_ontsluiting'">
                    <system value="http://snomed.info/sct"/>
                    <code value="249120008"/>
                    <display value="Onset of labor first stage (observable entity)"/>
                </xsl:when>
                <xsl:when test="$elementName='hoeveelheid_bloedverlies'">            
                    <system value="http://snomed.info/sct"/>
                    <code value="64332008"/>
                    <display value="Blood loss in labour"/>
                </xsl:when>
                <xsl:when test="$elementName='conditie_perineum_postpartum'">
                    <system value="http://snomed.info/sct"/>
                    <code value="364297003"/>
                    <display value="Female perineum observable (observable entity)"/>
                </xsl:when>
            </xsl:choose>
            </coding>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="@*|node()">
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>
