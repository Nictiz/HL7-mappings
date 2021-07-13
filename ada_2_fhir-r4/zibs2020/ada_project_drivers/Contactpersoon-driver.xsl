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
    
    <xsl:import href="_driverInclude.xsl"/>
    
    <xsl:template match="/nm:bundle">
        <xsl:apply-templates mode="_doTransform" select="$bundle/contactpersoon"/>
    </xsl:template>
    
    <xsl:template match="//contactpersoon_registratie/contactpersoon">
        <xsl:copy-of select="$fhirMetadata"></xsl:copy-of>
        <xsl:apply-templates mode="_doTransform" select="."/>
    </xsl:template>
    
    <xsl:template mode="_doTransform" match="contactpersoon">
        <xsl:variable name="subject" as="element()?">
            <xsl:call-template name="_resolveAdaPatient">
                <xsl:with-param name="businessIdentifierRef" select="onderwerp/patient-id"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:call-template name="nl-core-ContactPerson">
            <xsl:with-param name="patient" select="$subject"/>
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>