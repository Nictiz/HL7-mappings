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
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:import href="../payload/0.0/all_zibs.xsl"/>
    
    <xd:doc>
        <xd:desc>
            Process a bundle containing ADA instances for zibs that are mapped onto/into the nl-core-Patient profile:
            <xd:ul>
                <xd:li>nl-core-MedicationContraIndicatino</xd:li>
            </xd:ul>
        </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <Bundle>
            <xsl:for-each select=".//medicatie_contra_indicatie">
                <xsl:variable name="onderwerp" as="element()">
                    <patient xmlns="" conceptId="2.16.840.1.113883.2.4.3.11.60.40.1.0.1.1">
                        <naamgegevens conceptId="2.16.840.1.113883.2.4.3.11.60.40.1.0.1.6">
                            <voornamen value="Johanna Petronella Maria" conceptId="2.16.840.1.113883.2.4.3.11.60.121.2.287"/>
                            <initialen value="J.P.M." conceptId="2.16.840.1.113883.2.4.3.11.60.121.2.288"/>
                            <roepnaam value="Jo" conceptId="2.16.840.1.113883.2.4.3.11.60.121.2.289"/>
                            <geslachtsnaam conceptId="2.16.840.1.113883.2.4.3.11.60.121.2.291">
                                <voorvoegsels value="van" conceptId="2.16.840.1.113883.2.4.3.11.60.121.2.292"/>
                                <achternaam value="Putten" conceptId="2.16.840.1.113883.2.4.3.11.60.121.2.293"/>
                            </geslachtsnaam>
                            <geslachtsnaam_partner conceptId="2.16.840.1.113883.2.4.3.11.60.121.2.294">
                                <voorvoegsels_partner value="van der" conceptId="2.16.840.1.113883.2.4.3.11.60.121.2.295"/>
                                <achternaam_partner value="Giessen" conceptId="2.16.840.1.113883.2.4.3.11.60.121.2.296"/>
                            </geslachtsnaam_partner>
                        </naamgegevens>
                        <identificatienummer value="999911120" root="2.16.840.1.113883.2.4.6.3" conceptId="2.16.840.1.113883.2.4.3.11.60.40.1.0.1.7"/>
                        <geboortedatum value="1934-04-28" datatype="datetime" conceptId="2.16.840.1.113883.2.4.3.11.60.40.1.0.1.10"/>
                        <geslacht conceptId="2.16.840.1.113883.2.4.3.11.60.40.1.0.1.9" value="3" code="F" codeSystem="2.16.840.1.113883.5.1" displayName="Female"/>
                        <meerling_indicator value="true" conceptId="2.16.840.1.113883.2.4.3.11.60.40.1.0.1.31"/>
                        <overlijdens_indicator value="true" conceptId="2.16.840.1.113883.2.4.3.11.60.40.1.0.1.32"/>
                        <datum_overlijden value="2021-01-01" datatype="datetime" conceptId="2.16.840.1.113883.2.4.3.11.60.40.1.0.1.33"/>
                    </patient>
                </xsl:variable>
                <xsl:variable name="melderId" select="melder/zorgverlener[@datatype = 'reference']/@value"/>
                <xsl:variable name="melder" select="referenties/zorgverlener[@id = $melderId]" as="element()"/>
                <xsl:variable name="onderwerpLogicalId" select="nf:get-uuid($onderwerp)"/>
                <xsl:variable name="melderLogicalId" select="nf:get-uuid($melder)"/>
                <entry>
                    <resource>
                        <xsl:call-template name="nl-core-MedicationContraIndication">
                            <xsl:with-param name="logicalId" select="nf:get-uuid(.)"/>
                            <xsl:with-param name="onderwerp" select="$onderwerp"/>
                            <xsl:with-param name="onderwerpLogicalId" select="$onderwerpLogicalId"/>
                            <xsl:with-param name="melder" select="$melder"/>
                            <xsl:with-param name="melderLogicalId" select="$melderLogicalId"/>
                        </xsl:call-template>
                    </resource>
                </entry>
                <xsl:if test="$onderwerp">
                    <entry>
                        <resource>
                            <xsl:apply-templates mode="nl-core-Patient" select="$onderwerp">
                                <xsl:with-param name="logicalId" select="$onderwerpLogicalId"/>
                            </xsl:apply-templates>
                        </resource>
                    </entry>
                </xsl:if>
                <xsl:if test="$melder">
                    <entry>
                        <resource>
                            <xsl:apply-templates mode="nl-core-HealthProfessional" select="$melder">
                                <xsl:with-param name="logicalId" select="$melderLogicalId"/>
                            </xsl:apply-templates>
                        </resource>
                    </entry>
                </xsl:if>
            </xsl:for-each>
        </Bundle>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
    </xd:doc>
    <xsl:template name="nl-core-Patient-reference" match="patient" mode="nl-core-Patient-reference" as="element()*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="fullUrl" as="xs:string?"/>
        <xsl:variable name="identifier" select="$in/identificatienummer[normalize-space(@value | @nullFlavor)]"/>
        <xsl:choose>
            <xsl:when test="$logicalId">
                <reference value="Patient/{$logicalId}"/>
            </xsl:when>
            <xsl:when test="$fullUrl">
                <reference value="{$fullUrl}"/>
            </xsl:when>
            <xsl:when test="$identifier">
                <identifier>
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="($identifier[not(@root = $mask-ids-var)], $identifier)[1]"/>
                    </xsl:call-template>
                </identifier>
            </xsl:when>
        </xsl:choose>
        
        <xsl:variable name="display" select="$in/normalize-space(string-join(.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value, ' '))"/>
        <xsl:if test="string-length($display) gt 0">
            <display value="{$display}"/>
        </xsl:if>
    </xsl:template>

    
</xsl:stylesheet>