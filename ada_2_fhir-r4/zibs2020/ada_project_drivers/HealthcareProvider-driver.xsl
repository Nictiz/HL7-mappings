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
            Process ADA instances to create resources that conform to the nl-core-MedicationContraIndication profile and include the reference resources inside a Bundle as output:
            <xd:ul>
                <xd:li>nl-core-MedicationContraIndication</xd:li>
                <xd:li>nl-core-Patient</xd:li>
                <xd:li>nl-core-HealthProfessional</xd:li>
            </xd:ul>
        </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <Bundle>            
            <xsl:for-each select=".//zorgaanbieder">
                <xsl:if test="organisatie_locatie/locatie_naam[@value] | contactgegevens | adresgegevens">
                    <entry>
                        <resource>
                            <xsl:call-template name="nl-core-HealthcareProvider"/>
                        </resource>
                    </entry>
                </xsl:if>
                <xsl:if test="zorgaanbieder_identificatienummer | afdeling_specialisme | organisatie_type | organisatie_naam">
                    <entry>
                        <resource>
                            <xsl:call-template name="nl-core-HealthcareProvider-Organization"/>
                        </resource>
                    </entry>
                </xsl:if>
            </xsl:for-each>
        </Bundle>
    </xsl:template>
    
</xsl:stylesheet>