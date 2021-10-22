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
        <xd:desc>Converts ADA [...] to FHIR [...] conforming to profile [...]</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-[zib name] instance as a [resource name] FHIR instance from ADA [ADA instance name].</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-MedicalDevice" mode="nl-core-MedicalDevice" match="medisch_hulpmiddel" as="element(f:DeviceUseStatement)?">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <DeviceUseStatement>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-MedicalDevice'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice"/>
                </meta>
                
                <xsl:for-each select="zorgverlener">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicalDevice.HealthProfessional">
                        <valueReference>
                            <xsl:call-template name="makeReference"/>
                        </valueReference>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="locatie">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicalDevice.Location">
                        <valueReference>
                            <xsl:call-template name="makeReference"/>
                        </valueReference>
                    </extension>
                </xsl:for-each>
                
                <!-- TODO: status -->
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                
                <xsl:if test="begin_datum[@value] | eind_datum[@value]">
                    <timingPeriod>
                        <xsl:if test="begin_datum[@value]">
                            <start>
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="begin_datum"/>
                                </xsl:call-template>
                            </start>
                        </xsl:if>
                        <xsl:if test="eind_datum[@value]">
                            <start>
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="eind_datum"/>
                                </xsl:call-template>
                            </start>
                        </xsl:if>
                    </timingPeriod>
                </xsl:if>
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="profile">nl-core-MedicalDevice.Product</xsl:with-param>
                    <xsl:with-param name="wrapIn">device</xsl:with-param>
                </xsl:call-template>
                
                <xsl:for-each select="indicatie">
                    <xsl:call-template name="makeReference"/>
                    <xsl:wrapIn>reasonReference</xsl:wrapIn>
                </xsl:for-each>
                
                <xsl:for-each select="anatomische_locatie">
                    <xsl:call-template name="ext-AnatomicalLocation"/>
                </xsl:for-each>
            </DeviceUseStatement>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create a nl-core-[zib name] instance as a [resource name] FHIR instance from ADA [ADA instance name].</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-MedicalDevice.Product" mode="nl-core-MedicalDevice.Product" match="medisch_hulpmiddel" as="element(f:Device)?">
        <xsl:param name="in" as="element()?" select="."/>
        
        <xsl:for-each select="$in">
            <Device>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-MedicalDevice.Product'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice.Product"/>
                </meta>
                
                <xsl:for-each select="product/product_id[@value]">
                    <identifier value="{./@value}"/>
                </xsl:for-each>
                
                <xsl:for-each select="toelichting[@value]">
                    <note>
                        <text>
                            <xsl:attribute name="value">
                                <xsl:value-of select="./@value"/>
                            </xsl:attribute>
                        </text>
                    </note>
                </xsl:for-each>
            </Device>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="medisch_hulpmiddel" mode="_generateId">
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="medisch_hulpmiddel" mode="_generateDisplay">
    </xsl:template>
</xsl:stylesheet>
