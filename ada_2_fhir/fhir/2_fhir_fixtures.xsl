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
<!-- Purpose: do handling for FHIR fixtures for examples and/or Touchstone fixtures
-->
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:util="urn:hl7:utilities" xmlns:uuid="http://www.uuid.org" version="2.0" exclude-result-prefixes="#all">

    <!-- parameter to determine whether to refer by resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <xsl:param name="referById" as="xs:boolean" select="true()"/>
    
    <xd:doc>
        <xd:desc>Usecasename for resource id. Optional, no default.</xd:desc>
    </xd:doc>
    <xsl:param name="usecase" as="xs:string?"/>
  
     <xd:doc>
        <xd:desc>Helper template for creating logicalId for Touchstone. Adheres to requirements in MM-1752. Profilename-usecase-uniquestring.</xd:desc>
        <xd:param name="in">The ada element for which to create a logical id. Optional. Used to find profileName. Defaults to context.</xd:param>
        <xd:param name="uniqueString">The unique string with which to create a logical id. Optional. If not given a uuid will be generated.</xd:param>
    </xd:doc>
    <xsl:template name="generateLogicalId">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="uniqueString" as="xs:string?"/>
        
        <xsl:variable name="profileName" as="xs:string?" select="nf:get-profilename-from-adaelement($in)"/>        
        
        <xsl:variable name="logicalIdStartString" as="xs:string*">
            <xsl:value-of select="$profileName"/>
            <xsl:value-of select="$usecase"/>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="string-length($uniqueString) le $maxLengthFHIRLogicalId - 2 and string-length($uniqueString) gt 0">
                <xsl:value-of select="replace(nf:assure-logicalid-length(nf:assure-logicalid-chars(concat(string-join($logicalIdStartString, '-'), '-', $uniqueString))), '\.', '-')"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- we do not have anything to create a stable logicalId, lets return a UUID -->
                <xsl:value-of select="nf:assure-logicalid-length(nf:assure-logicalid-chars(concat(string-join($logicalIdStartString, '-'), '-', uuid:get-uuid(.))))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates xml document for a FHIR resource</xd:desc>
    </xd:doc>
    <xsl:template match="*" mode="doResourceInResultdoc">
        <xsl:result-document href="./{./f:id/@value}.xml">
            <xsl:copy-of select="."/>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
