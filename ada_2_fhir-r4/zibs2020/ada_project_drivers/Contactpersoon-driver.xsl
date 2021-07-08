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
    
    <xsl:import href="_buildFhirMetadata.xsl"/>
        
    <xd:doc>
        <xd:desc>
            Process ADA instances to create resources that conform to the nl-core-HealthcareProvider profile.
        </xd:desc>
    </xd:doc>
    <xsl:template match="//contactpersoon_registratie">
        <xsl:variable name="patient-id" select="contactpersoon/onderwerp/patient-id/@value"/>
        <xsl:apply-templates mode="nl-core-ContactPerson" select="contactpersoon">
            <xsl:with-param name="patient" select="collection('../ada_instance')//patient[identificatienummer/@value = $patient-id]"/>
        </xsl:apply-templates>
    </xsl:template>
    
</xsl:stylesheet>