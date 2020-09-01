<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:f="http://hl7.org/fhir"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>

    <!-- Create a de-duplicated list of all fixtures referenced from a TestScript resource, formatted as a string that
         can be read by Ant. This will result in the single property "fixtures", with a list of fixture files separated
         by semicolons.
         The parameter "additional" can be used to specify a list of additional fixtures (in the same format), so that
         this stylesheet can be used iteratively.
         The parameter "includesDir" can be given as the part that should be removed from the fixture path. -->
         
    <xsl:param name="additional" as="xs:string" select="''"/>
    <xsl:param name="includesDir" select="'../_reference/'"/>

    <xsl:template match="f:TestScript">
        <xsl:variable name="fixtures" as="xs:string+">
            <xsl:for-each select="//f:fixture">
                <xsl:value-of select="substring-after(f:resource/f:reference/@value, $includesDir)"/>        
            </xsl:for-each>
            <xsl:apply-templates select="//f:fixture"/>
            <xsl:for-each select="tokenize($additional, ';')">
                <xsl:if test="string-length(.) &gt; 0">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:text>fixtures=</xsl:text>
        <xsl:for-each select="distinct-values($fixtures)">
            <xsl:value-of select="."/>
            <xsl:text>;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>