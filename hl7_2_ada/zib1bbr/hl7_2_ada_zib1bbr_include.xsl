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
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nf="http://www.nictiz.nl/functions" version="2.0">
    <!--<xsl:include href="../hl7/hl7_include.xsl"/>-->
    
    <!-- addEnding checks baseString if it ends in endString, and if not adds it at the end. -->
    <xsl:function name="nf:addEnding">
        <xsl:param name="baseString"/>
        <xsl:param name="endString"/>        
        
        <xsl:choose>
            <xsl:when test="substring($baseString, string-length($baseString)-string-length($endString)+1, string-length($endString)) eq $endString">
                <xsl:value-of select="$baseString"/>                    
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($baseString, $endString)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    
    
    
</xsl:stylesheet>
