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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc>
        <xd:desc>Create ada contact_point using an hl7 element which must be in context</xd:desc>
        <xd:param name="adaId">Optional parameter to specify the ada id for this ada element. Defaults to a generate-id of context element</xd:param>
    </xd:doc>
    <xsl:template name="HandleContactPerson" match="hl7:responsibleParty" mode="HandleContactPerson">
        <xsl:param name="adaId" as="xs:string?" select="generate-id(.)"/>
        
        <contactpersoon>
            <xsl:attribute name="id" select="$adaId"/>
            
            <xsl:call-template name="handleENtoNameInformation">
                <xsl:with-param name="in" select="hl7:agentPerson/hl7:name"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            
            <xsl:call-template name="handleTELtoContactInformation">
                <xsl:with-param name="in" select="hl7:telecom"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            
            <xsl:call-template name="handleADtoAddressInformation">
                <xsl:with-param name="in" select="hl7:addr"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            
        </contactpersoon>
    </xsl:template>
    
</xsl:stylesheet>
