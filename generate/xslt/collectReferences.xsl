<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:f="http://hl7.org/fhir"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>

    <!-- Create a de-duplicated list of all fixtures and rules referenced from a TestScript resource, formatted as 
         strings that can be read by Ant. Reading this output will result in the property's "fixtures" and "rules",
         each containing a list of files separated by semicolons.
         The parameters "additionalFixtures" and "additionalRules" can be used to specify lists of additional fixtures
         and rules (in the same format), so that this stylesheet can be used iteratively.
         The parameter "includesDir" can be given as the part that should be removed from the fixture/rules path. -->
         
    <xsl:param name="additionalFixtures" as="xs:string" select="''"/>
    <xsl:param name="additionalRules" as="xs:string" select="''"/>
    <xsl:param name="includesDir" select="'../_reference'"/>

    <xsl:template match="f:TestScript">
        <xsl:variable name="fixtures" as="xs:string*">
            <xsl:for-each select="//f:fixture">
                <xsl:value-of select="substring-after(f:resource/f:reference/@value, concat($includesDir,'/'))"/>        
            </xsl:for-each>
            <xsl:for-each select="tokenize($additionalFixtures, ';')">
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
        <xsl:text>&#xA;</xsl:text>
        
        <xsl:variable name="rules" as="xs:string*">
            <xsl:for-each select="//f:rule[f:resource]">
                <xsl:value-of select="substring-after(f:resource/f:reference/@value, $includesDir)"/>        
            </xsl:for-each>
            <xsl:for-each select="tokenize($additionalRules, ';')">
                <xsl:if test="string-length(.) &gt; 0">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:text>rules=</xsl:text>
        <xsl:for-each select="distinct-values($rules)">
            <xsl:value-of select="."/>
            <xsl:text>;</xsl:text>
        </xsl:for-each>
        
    </xsl:template>
</xsl:stylesheet>