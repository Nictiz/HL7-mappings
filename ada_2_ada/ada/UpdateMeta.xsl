<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
        
    <xsl:template match="/">
        <xsl:apply-templates select="node()" mode="updateMeta"/>
    </xsl:template>
    
    <xsl:template match="meta/@creation-date | meta/@last-update-date" mode="updateMeta">
        <!-- update to a fixed date to avoid pseudo changes for GitHub test instances -->
        <xsl:attribute name="{name()}">2024-01-01T00:00:00+02:00</xsl:attribute>
    </xsl:template>
    
    <xsl:template match="node() | @*" mode="updateMeta">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="#current"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
