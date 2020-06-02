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
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    xmlns:local="urn:fhir:stu3:functions"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:import href="../../util/constants.xsl"/>
    
    <xd:doc>
        <xd:desc>Get the ada OID from FHIR System URI</xd:desc>
        <xd:param name="uri">input FHIR System URI</xd:param>
    </xd:doc>
    <xsl:function name="local:getOid" as="xs:string?">
        <xsl:param name="uri" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="$oidMap[@uri = $uri][@oid]">
                <xsl:value-of select="$oidMap[@uri = $uri]/@oid"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$uri"/>
                <xsl:message>WARNING: local:getOid() expects a FHIR System URI, but got "<xsl:value-of select="$uri"/>"</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Identity transformation</xd:desc>
    </xd:doc>
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Remove comments</xd:desc>
    </xd:doc>
    <xsl:template match="comment()"/>
    
    <xd:doc>
        <xd:desc>Throw process if an unhandled FHIR element is matched.</xd:desc>
    </xd:doc>
    <xsl:template match="f:*" mode="#all">
        <xsl:message terminate="yes">Unhandled FHIR element: <xsl:value-of select="local-name()"/></xsl:message>
    </xsl:template>
    
</xsl:stylesheet>