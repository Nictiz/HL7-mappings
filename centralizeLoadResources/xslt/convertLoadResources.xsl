<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:f="http://hl7.org/fhir" exclude-result-prefixes="#all" version="2.0">

    <xsl:output indent="yes" omit-xml-declaration="yes"/>

    <!-- The path to the base folder of fixtures, relative to the output. Defaults to '../_reference'. -->
    <xsl:param name="relativePath" required="yes"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="f:fixture/f:resource/f:reference/@value">
        <xsl:variable name="value" select="."/>
        <xsl:variable name="newValue" select="replace(concat($relativePath, '/' ,$value), '_LoadResources/../' ,'')"/>
        
        <xsl:attribute name="value" select="$newValue"/>
    </xsl:template>
    
</xsl:stylesheet>
