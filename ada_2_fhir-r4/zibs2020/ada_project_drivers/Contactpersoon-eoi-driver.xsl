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
    
    <xsl:import href="_driverInclude.xsl"/>
    <xsl:param name="outputDir" select="'.'" as="xs:string"/>
    
    <xd:doc>
        <xd:desc>
            Process ADA instances to create resources that conform to the nl-core-HealthcareProvider profile.
        </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:for-each select="$bundle/contactpersoon">
            <xsl:variable name="logicalId">
                <xsl:call-template name="getLogicalIdFromFhirMetadata">
                    <xsl:with-param name="profile" select="'nl-core-HealthcareProvider'"/>
                </xsl:call-template>
            </xsl:variable>
            
            <xsl:result-document href="{$outputDir}/{$logicalId}.xml">
                <xsl:call-template name="nl-core-ContactPerson">
                    <xsl:with-param name="patient" as="element()" select="$bundle/patient"/>
                </xsl:call-template>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>