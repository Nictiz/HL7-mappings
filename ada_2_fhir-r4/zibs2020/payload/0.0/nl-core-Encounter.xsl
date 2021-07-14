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
    xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions" 
    xmlns:nm="http://www.nictiz.nl/mappings"
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada verrichting to FHIR Procedure resource conforming to profile nl-core-Encounter</xd:desc>
    </xd:doc>
    
    <xsl:template match="contact" name="nl-core-Encounter" mode="nl-core-Encounter" as="element(f:Encounter)?">
        <Encounter>
            <xsl:call-template name="insertLogicalId"/>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Encounter"/>
            </meta>
            <xsl:comment>.status: Dependent on outcome of https://github.com/Nictiz/Nictiz-R4-zib2020/issues/45</xsl:comment>
            <status value="unknown"/>
            <xsl:for-each select="contact_type[@code]">
                <class>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </class>
            </xsl:for-each>
            <xsl:for-each select="contact_met">
                <participant>
                    <individual>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="zorgverlener"/>
                            <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                        </xsl:call-template>
                    </individual>
                </participant>
            </xsl:for-each>                
            <xsl:if test="begin_datum_tijd/@value and eind_datum_tijd/@value">
                <period>
                    <start value="{normalize-space(begin_datum_tijd/@value)}"/>
                    <end value="{normalize-space(eind_datum_tijd/@value)}"/>
                </period>                    
            </xsl:if>                   
            <xsl:for-each select="reden_contact/afwijkende_uitslag">
                <reasonReference>
                    <xsl:for-each select="reden_contact/toelichting_reden_contact">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-Comment">
                            <valueString>
                                <xsl:call-template name="string-to-string">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueString>
                        </extension>
                    </xsl:for-each>
                    <!--<xsl:call-template name="nl-core-Procedure-Reference"/>-->
                </reasonReference>                    
            </xsl:for-each>                  
            <xsl:for-each select="herkomst[@code]">
                <admitSource>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </admitSource>
            </xsl:for-each>
            <xsl:for-each select="bestemming[@code]">
                <dischargeDisposition>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </dischargeDisposition>
            </xsl:for-each>
            <xsl:for-each select="locatie">
                <location>
                    <!--<xsl:call-template name="nl-core-HealthcareProvider-Reference"/>-->
                </location>
            </xsl:for-each>
        </Encounter>
    </xsl:template>    
</xsl:stylesheet>