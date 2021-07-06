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
        <xd:desc>Converts ada naamgegevens to FHIR 'name' element conforming to profile nl-core-NameInformation</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Unwrap naamgegevens_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="naamgegevens_registratie">
        <xsl:apply-templates select="naamgegevens" mode="zib-NameInformation"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Produces FHIR Address datatypes with address elements.</xd:desc>
        <xd:param name="in">Ada 'adresgegevens' element containing the zib data</xd:param>
    </xd:doc>
    <xsl:template match="naamgegevens" mode="nl-core-NameInformation" name="nl-core-NameInformation" as="element(f:name)*">
        <xsl:param name="in" select="." as="element()?"/>
        
        <xsl:for-each select="$in">
            
            <name><xsl:comment>Processing zib-NameInformation is paused until https://github.com/Nictiz/Nictiz-R4-zib2020/issues/82 is resolved.</xsl:comment>
                <text value="TODO"/>
            </name>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>