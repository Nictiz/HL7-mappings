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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <!-- Can be uncommented for debug purposes. Please comment before committing! -->
    <xsl:import href="../../../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada problem to FHIR resource conforming to profile nl-core-Encounter</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Unwrap problem_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="probleem_registratie">
        <xsl:apply-templates select="probleem" mode="nl-core-Problem"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Produces FHIR Address datatypes with address elements.</xd:desc>
        <xd:param name="in">Ada 'contact' element containing the zib data</xd:param>
    </xd:doc>
    <xsl:template match="probleem" mode="nl-core-Problem" name="nl-core-Problem" as="element(f:Condition)*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:for-each select="$in[.//@value]">          
            <Condition> 
                
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem"/>
                </meta>      
                <xsl:for-each select="probleem_status">
                    <clinicalStatus>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </clinicalStatus>
                </xsl:for-each>
                
                <xsl:for-each select="verificatie_status">
                    <verificationStatus>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </verificationStatus>
                </xsl:for-each>         
                
                <xsl:for-each select="probleem_type">
                    <category>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </category>
                </xsl:for-each> 
                
                <xsl:for-each select="probleem_naam">
                    <code>                       
                        <!--Bug in ada? no system value-->
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>     
                
                <!-- This is still incorrect here -->
                <xsl:for-each select="nadere_specificatie_probleem_naam">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-Problem.FurtherSpecificationProblemName">
                        <valueString>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueString>
                    </extension>
                </xsl:for-each> 
                
                <xsl:for-each select="probleem_anatomische_locatie/lateraliteit">
                    <bodySite>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </bodySite>
                </xsl:for-each>    
                
                <xsl:for-each select="probleem_begin_datum[@value]">
                    <onsetDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </onsetDateTime>
                </xsl:for-each>
                <xsl:for-each select="probleem_eind_datum[@value]">
                    <abatementDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </abatementDateTime>
                </xsl:for-each>                        
                            
                <xsl:if test="toelichting/@value">
                    <note>
                        <text value="{normalize-space(toelichting/@value)}"/>
                    </note>
                </xsl:if>
            </Condition>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>