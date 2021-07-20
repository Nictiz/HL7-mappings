<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz
This program is free software; you can redistribuste it and/or modify it under the terms of the
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
    xmlns:nm="http://www.nictiz.nl/mapping" xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ADA zorgteam to FHIR Procedure conforming to profile nl-core-FreedomRestrictingIntervention</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-FreedomRestrictingIntervention instance as a Procedure FHIR instance from ADA nl-core-FreedomRestrictingIntervention-01.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template match="vrijheidsbeperkende_interventie" name="nl-core-FreedomRestrictingIntervention" mode="nl-core-FreedomRestrictingIntervention" as="element(f:Procedure)">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:for-each select="$in">
            <Procedure>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-FreedomRestrictingIntervention"/>
                </meta>               
                <xsl:for-each select="wilsbekwaam_toelichting">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-FreedomRestrictingIntervention.LegallyCapable">
                        <valueString>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueString>                    
                    </extension>                  
                </xsl:for-each>                 
                <xsl:for-each select="instemming">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-FreedomRestrictingIntervention.Assent">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>                    
                    </extension>                  
                </xsl:for-each>              
                <status value="completed"/>
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="225317005"/>
                        <display value="beperking van bewegingsvrijheid"/>
                    </coding>
                </category>                   
                <xsl:for-each select="soort_interventie">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>        
                <xsl:choose>
                    <xsl:when test="begin and einde">
                        <performedPeriod>
                            <xsl:call-template name="startend-to-Period">
                                <xsl:with-param name="start" select="begin"/>
                                <xsl:with-param name="end" select="einde"/>
                            </xsl:call-template>
                        </performedPeriod>
                    </xsl:when>
                    <xsl:when test="begin">
                        <performedDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </performedDateTime>
                    </xsl:when>
                </xsl:choose>                
                <xsl:for-each select="reden_van_toepassen">
                    <reasonCode>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </reasonCode>
                </xsl:for-each>                
           <!--     <xsl:for-each select="//juridische_situatie/juridische_situatie">
                    <reasonReference>                      
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                            </xsl:call-template>                      
                    </reasonReference>
                </xsl:for-each>-->                
            </Procedure>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="vrijheidsbeperkende_interventie" mode="_generateId">
        <xsl:value-of select="concat('nl-core-CareTeam-', position())"/>
    </xsl:template>
    

</xsl:stylesheet>