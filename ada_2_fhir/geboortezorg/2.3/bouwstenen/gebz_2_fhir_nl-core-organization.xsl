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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xsl xs xd"
    version="2.0">
    <xsl:import href="../../../zibs2017/payload/all-zibs.xsl"/>

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc>
        <xd:desc>Converts ada organization</xd:desc>
    </xd:doc>
              
    <xsl:template name="convert-zorginstelling-ada" mode="zorginstelling-ada" match="zorginstelling" as="element()*">
        <xsl:variable name="organizationId" select="zorginstelling_lvrid/@value | zorgaanbieder_identificatie_nummer/@value"/>
        <xsl:variable name="organizationName" select="naam_zorginstelling/@value"/>   
        <healthcare_provider>
            <xsl:if test="$organizationId!=''">
                <healthcare_provider_identification_number value="{$organizationId}"/>
            </xsl:if>
            <xsl:if test="$organizationName!=''">
                <organization_name value="{$organizationName}"/>
            </xsl:if>
        </healthcare_provider>
    </xsl:template>
  
    <xd:doc>
        <xd:desc>Converts ada organization to fhir organization</xd:desc>
    </xd:doc>

    <xsl:template name="convert-zorginstelling-fhir" mode="zorginstelling-fhir" match="zorginstelling">
        <xsl:variable name="ADAzorginstelling" as="element()*">
            <xsl:call-template name="convert-zorginstelling-ada"/>
        </xsl:variable>
        <xsl:call-template name="nl-core-organization-2.0">
            <xsl:with-param name="in" select="$ADAzorginstelling"/>
        </xsl:call-template>       
    </xsl:template>
          
</xsl:stylesheet>
