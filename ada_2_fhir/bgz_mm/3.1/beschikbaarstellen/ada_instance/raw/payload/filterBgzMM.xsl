<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:param name="inputdir">../data/</xsl:param>
    <xsl:param name="outputdir">../../</xsl:param>
    
    <xsl:output indent="yes"/>
    
    <xsl:template match="/">
        <xsl:for-each select="collection(concat($inputdir, '?select=*.xml;recurse=yes'))/adaxml[data/*[ends-with(local-name(),'_registration')]/@title/starts-with(., 'mm-bgz')]">
            <xsl:variable name="title" select="data/*[ends-with(local-name(),'_registration')]/@title"/>
            <xsl:result-document href="{concat($outputdir,$title,'.xml')}">
                <xsl:copy-of select="."></xsl:copy-of>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>