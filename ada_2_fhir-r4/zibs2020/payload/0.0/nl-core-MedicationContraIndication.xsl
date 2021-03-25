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

<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns:util="urn:hl7:utilities" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns="http://hl7.org/fhir"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions" 
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
        
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada medicatie_contra_indicatie to FHIR resource conforming to profile nl-core-MedicationContraIndication</xd:desc>
    </xd:doc>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xd:doc>
        <xd:desc>Unwrap medicatie_contra_indicatie_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="medicatie_contra_indicatie_registratie">
        <xsl:apply-templates select="medicatie_contra_indicatie" mode="nl-core-MedicationContraIndication"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Mapping of zib-MedicationContraIndication concept in ADA to FHIR resource.</xd:desc>
        <xd:param name="logicalId">Flag.id value</xd:param>
        <xd:param name="in">Node to consider in the creation of a Flag resource</xd:param>
    </xd:doc>
    <xsl:template match="medicatie_contra_indicatie" name="nl-core-MedicationContraIndication" mode="nl-core-MedicationContraIndication">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="onderwerp" as="element()?"/>
        <xsl:param name="onderwerpLogicalId" as="xs:string?"/>
        <xsl:param name="melder" as="element()?"/>
        <xsl:param name="melderLogicalId" as="xs:string?"/>
          
        <xsl:for-each select="$in">
                <Flag>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{$logicalId}"/>
                    </xsl:if>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicationContraIndication"/>
                    </meta>
                    
                    <xsl:variable name="redenVanAfsluiten" select="reden_van_afsluiten/@value"/>
                    <xsl:variable name="toelichting" select="toelichting/@value"/>
                    <xsl:variable name="beginDatum" select="begin_datum/@value"/>
                    <xsl:variable name="eindDatum" select="eind_datum/@value"/>
                    <xsl:variable name="medicatieContraIndicatieNaam" select="medicatie_contra_indicatie_naam"/>
                                        
                    <!-- ReasonClosure - NL-CM:9.14.4 - cardinality is 0..1 hence an if statement and not a for-each -->                        
                    <xsl:if test="string-length($redenVanAfsluiten) gt 0">   
                         <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-nl-core-MedicationContraIndication-ReasonClosure">
                             <valueString>
                                 <xsl:attribute name="value" select="$redenVanAfsluiten"/>
                             </valueString>
                         </extension>
                    </xsl:if> 
                    
                    <!-- Comment - NL-CM:9.14.7 -->
                    <xsl:if test="string-length($toelichting) gt 0">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-Comment">
                            <valueString>
                                <xsl:attribute name="value" select="$toelichting"/>
                            </valueString>
                        </extension>
                    </xsl:if>
                    
                    <!-- Decide on mandatory Flag.status value based on presence of 'reden_van_afsluiten' value or an 'eind_datum' that lies in the past. -->
                    <status>
                        <xsl:choose>
                            <xsl:when test="string-length($redenVanAfsluiten) gt 0">
                                <xsl:attribute name="value" select="'inactive'"/>
                            </xsl:when>
                            <xsl:when test="xs:date($eindDatum) lt current-date()">
                                <xsl:attribute name="value" select="'inactive'"/>
                            </xsl:when>
                           <xsl:otherwise>
                               <xsl:attribute name="value" select="'active'"/>
                           </xsl:otherwise>
                        </xsl:choose>
                    </status>
                    
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="140401000146105"/>
                            <display value="contra-indicatie met betrekking op medicatiebewaking"/>
                        </coding>
                    </category>
                    
                    <!-- MedicationContraIndicationName - NL-CM:9.14.6 -->
                    <xsl:if test="$medicatieContraIndicatieNaam">
                        <code>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="$medicatieContraIndicatieNaam"/>
                            </xsl:call-template>
                        </code>
                    </xsl:if>         
                    
                    <!-- Subject is mandatory by FHIR -->
                    <xsl:if test="$onderwerp">
                        <subject>
                            <xsl:call-template name="nl-core-Patient-reference">
                                <xsl:with-param name="in" select="$onderwerp"/>
                                <xsl:with-param name="logicalId" select="$onderwerpLogicalId"/>
                            </xsl:call-template>
                        </subject>
                    </xsl:if>
                   
                    <xsl:if test="$beginDatum|$eindDatum">
                        <period>
                            <!-- StartDate - NL-CM:9.14.2 -->
                            <xsl:if test="$beginDatum">
                                <start>
                                    <xsl:attribute name="value" select="$beginDatum"/>
                                </start>
                            </xsl:if>
                            <!-- EndDate - NL-CM:9.14.3 -->
                            <xsl:if test="$eindDatum">
                                <end>
                                    <xsl:attribute name="value" select="$eindDatum"/>
                                </end>
                            </xsl:if>                       
                        </period>
                    </xsl:if>  
                                        
                   <!-- Reporter - NL-CM:9.14.5 -->                                     
<!--                   <xsl:if test="$melder">
                        <author>
                           <xsl:call-template name="nl-core-HealthProfessional-reference">
                               <xsl:with-param name="in" select="$melder"/>
                               <xsl:with-param name="logicalId" select="$melderLogicalId"/>
                           </xsl:call-template>
                       </author>
                   </xsl:if>-->
                                      
                </Flag>
        </xsl:for-each>
    </xsl:template>  
</xsl:stylesheet>
