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
    
    <xsl:param name="populateId" select="true()" as="xs:boolean"/>
    <xsl:param name="referencingStrategy" select="'logicalId'" as="xs:string"/>
    
    <!-- Because we create fhirMetadata from ada elements, overruling either a generated logicalId (Resource.id) or a generated referenceUri (Reference.reference), should be done by adding it to the ada element. How unwanted is this? Because I think you get something like this. And this doesn't even work because there are two different resources being created from 1 zorgverlener element -->
    <xsl:variable name="editedZorgverlener">
        <xsl:for-each select=".//zorgverlener">
            <!-- Aargh why doesn't ada have a namespace -->
            <zorgverlener xmlns="" logicalId="nl-core-HealthProfessional-{format-number(position(),'00')}">
                <!--<xsl:copy-of select="*"/>-->
                <!-- Copy-of dekt de lading niet, maar bijv. zorgaanbieder zou zo aangepast kunnen/moeten worden: -->
                <!-- [...] -->
                <zorgaanbieder datatype="reference" nullFlavor="NI" conceptId="2.16.840.1.113883.2.4.3.11.60.121.2.526" referenceUri="http://nictiz.nl/fhir/PractitionerRole/nl-core-HealthcareProvider-Location-{format-number(position(),'00')}"/>
                <!-- [...] -->
            </zorgverlener>
        </xsl:for-each>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>Process ADA instances to create resources that conform to the nl-core-HealthProfessional-Practitioner profile and include the reference resources inside a Bundle as output:
            <xd:ul>
                <xd:li>nl-core-HealthProfessional-Practitioner</xd:li>
                <xd:li>nl-core-HealthProfessional-PractitionerRole</xd:li>          
            </xd:ul>
        </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="fhirMetadata" as="element()*">
            <xsl:call-template name="getFhirMetadata">
                <xsl:with-param name="in" select="."/>
            </xsl:call-template>
        </xsl:variable>
        
        <Bundle>            
            <xsl:for-each select=".//zorgverlener">
                <!-- Always create PractitionerRole according to Profiling Guidelines -->
                    <entry>
                        <resource>
                            <xsl:call-template name="nl-core-HealthProfessional-PractitionerRole">
                                <xsl:with-param name="fhirMetadata" select="$fhirMetadata" tunnel="yes" as="element()*"/>
                            </xsl:call-template>
                        </resource>
                    </entry>
                <xsl:if test="zorgverlener_identificatienummer |naamgegevens | geslacht | adresgegevens | contactgegevens">
                    <entry>
                        <resource>
                            <xsl:call-template name="nl-core-HealthProfessional-Practitioner">
                                <xsl:with-param name="fhirMetadata" select="$fhirMetadata" tunnel="yes" as="element()*"/>
                            </xsl:call-template>
                        </resource>
                    </entry>
                </xsl:if>
            </xsl:for-each>
        </Bundle>
    </xsl:template>    
</xsl:stylesheet>