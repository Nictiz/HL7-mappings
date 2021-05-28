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
        <xd:desc>Converts ada freedomrestrictingjntervention to FHIR resource conforming to profile
            nl-core-FreedomrestrictingIntervention</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Unwrap vrijheidsbeperkende_interventie_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="vrijheidsbeperkende_interventie_registratie">
        <xsl:apply-templates select="vrijheidsbeperkende_interventie" mode="nl-core-FreedomrestrictingIntervention"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Produces FHIR Address datatypes with address elements.</xd:desc>
        <xd:param name="in">Ada 'FreedomrestrictingIntervention' element containing the zib data</xd:param>
    </xd:doc>
    <xsl:template match="vrijheidsbeperkende_interventie" mode="nl-core-FreedomrestrictingIntervention" name="nl-core-FreedomrestrictingIntervention" as="element(f:Procedure)*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:for-each select="$in[.//@value]">
            <Procedure>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-FreedomrestrictingIntervention"/>
                </meta>
                <xsl:for-each select="wilsbekwaam">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-FreedomRestrictingIntervention.LegallyCapable">
                        <valueString>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueString>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="wilsbekwaam_toelichting">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-FreedomRestrictingIntervention.LegallyCapable">
                        <valueString>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueString>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="soort_interventie[@code]">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>
                <xsl:for-each select="reden_van_toepassen[@code]">
                    <reasonCode>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </reasonCode>
                </xsl:for-each>
                <xsl:for-each select="juridische_situatie">
                    <reasonReference>
                        <reference value="Condition/nl-core-LegalSituation-Representation-01"/>
                        <display value="js1"/>                   
                    </reasonReference>                
                </xsl:for-each>   
                <xsl:for-each select="instemming[@code]">
                    <reasonCode>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </reasonCode>
                </xsl:for-each>
                <xsl:if test="begin/@value and einde/@value">
                    <period>
                        <start value="{normalize-space(begin/@value)}"/>
                        <end value="{normalize-space(einde/@value)}"/>
                    </period>
                </xsl:if>
            </Procedure>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>