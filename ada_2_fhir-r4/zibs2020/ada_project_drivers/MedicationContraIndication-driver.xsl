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
    
    <!--    <xsl:import href="../payload/zibs2020_2_fhir.xsl"/>-->
    <xsl:import href="../payload/0.0/all_zibs.xsl"/>
    
    <xd:doc>
        <xd:desc>
            Process ADA instances to create resources that conform to the nl-core-MedicationContraIndication profile and include the reference resources inside a Bundle as output:
            <xd:ul>
                <xd:li>nl-core-MedicationContraIndication</xd:li>
                <xd:li>nl-core-Patient</xd:li>
                <xd:li>nl-core-HealthProfessional</xd:li>
            </xd:ul>
        </xd:desc>
    </xd:doc>
    <xsl:template match="/bundle">
        <xsl:variable name="inputBundle">
            <xsl:for-each select="source[@href]">
                <xsl:copy-of select="document(@href)"/>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="fhirMetadata" as="element()*">
            <xsl:call-template name="getFhirMetadata">
                <xsl:with-param name="in" select="$inputBundle"/>
            </xsl:call-template>
        </xsl:variable>
        
        <Bundle>            
            <xsl:for-each select="$inputBundle//medicatie_contra_indicatie">
                <entry>
                    <resource>
                        <xsl:call-template name="nl-core-MedicationContraIndication">
                            <xsl:with-param name="logicalId" select="nf:get-uuid(.)"/>
                            <xsl:with-param name="subject" as="element()" select="$inputBundle//patient"/>
                            <xsl:with-param name="fhirMetadata" select="$fhirMetadata" tunnel="yes" as="element()*"/>
                        </xsl:call-template>
                    </resource>
                </entry>
                <xsl:if test="$inputBundle//patient[not(patient)][not(@datatype = 'reference')]">
                    <entry>
                        <resource>
                            <xsl:apply-templates mode="nl-core-Patient" select="$inputBundle//patient">
                                <xsl:with-param name="fhirMetadata" select="$fhirMetadata" tunnel="yes" as="element()*"/>
                            </xsl:apply-templates>
                        </resource>
                    </entry>
                </xsl:if>
                <xsl:if test="$inputBundle//zorgverlener[not(zorgverlener)][not(@datatype = 'reference')]">
                    <entry>
                        <resource>
                            <xsl:apply-templates mode="nl-core-HealthProfessional-Practitioner" select="$inputBundle//zorgverlener[not(zorgverlener)][not(@datatype = 'reference')]">
                                <xsl:with-param name="fhirMetadata" select="$fhirMetadata" tunnel="yes" as="element()*"/>
                            </xsl:apply-templates>
                        </resource>
                    </entry>
                </xsl:if>
            </xsl:for-each>
        </Bundle>
    </xsl:template>
    
</xsl:stylesheet>