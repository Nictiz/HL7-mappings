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
        <xd:desc>Converts ada contact to FHIR resource conforming to profile nl-core-Encounter</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Unwrap contact_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="contact_registratie">
        <xsl:apply-templates select="contact" mode="nl-core-Encounter"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Produces FHIR Address datatypes with address elements.</xd:desc>
        <xd:param name="in">Ada 'contact' element containing the zib data</xd:param>
    </xd:doc>
    <xsl:template match="contact" mode="nl-core-Encounter" name="nl-core-Encounter" as="element(f:Encounter)*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:for-each select="$in[.//@value]">          
            <Encounter>              
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Encounter"/>
                </meta>             
          
           <!--
                <xsl:for-each select="naamgegevens">
                    <xsl:call-template name="nl-core-NameInformation"/>
                </xsl:for-each>
                <xsl:for-each select="zorgverlener">
                    <xsl:call-template name="nl-core-HealthProfessional"/>
                </xsl:for-each>       
                <xsl:for-each select="zorgaanbieder">
                    <xsl:call-template name="nl-core-HealthcareProvider-reference"/>
                </xsl:for-each>-->
                <xsl:if test="begin_datum_tijd/@value and eind_datum_tijd/@value">
                    <period>
                    <start value="{normalize-space(begin_datum_tijd/@value)}"/>
                    <end value="{normalize-space(eind_datum_tijd/@value)}"/>
                    </period>
                </xsl:if>             
                
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
            </Encounter>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>