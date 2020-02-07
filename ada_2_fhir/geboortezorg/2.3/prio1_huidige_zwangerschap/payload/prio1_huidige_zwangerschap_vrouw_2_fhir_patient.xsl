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
    <xsl:import href="../../../../zibs2017/payload/all-zibs.xsl"/>

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc>
        <xd:desc>Converts ada vrouw to ada patient</xd:desc>
    </xd:doc>
              
    <xsl:template name="convert-vrouw-ada" mode="vrouw-ada" match="vrouw" as="element()*">
        <xsl:variable name="theIdentifier" select="burgerservicenummer/@value"/>   
        <patient>
            <patient_identification_number value="{$theIdentifier}"/>
        </patient>
    </xsl:template>
  
    <xd:doc>
        <xd:desc>Converts ada vrouw to fhir patient</xd:desc>
    </xd:doc>

    <xsl:template name="convert-vrouw-fhir" mode="vrouw-fhir" match="vrouw">
        <xsl:variable name="ADApatient" as="element()*">
            <xsl:call-template name="convert-vrouw-ada"/>
        </xsl:variable>
        <xsl:call-template name="nl-core-patient-2.1">
            <xsl:with-param name="in" select="$ADApatient"/>
        </xsl:call-template>       
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:variable name="x" select="'test'"/>
        <xsl:apply-templates mode="vrouw-fhir"/>
    </xsl:template>
       
</xsl:stylesheet>
