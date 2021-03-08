<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:f="http://hl7.org/fhir"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:nts="http://nictiz.nl/xsl/testscript"
    exclude-result-prefixes="#all">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>

    <!-- Create a de-duplicated list of all fixtures and rules referenced from a TestScript resource, formatted as 
         strings that can be read by Ant. Reading this output will result in the property's "fixtures" and "rules",
         each containing a list of files separated by semicolons.
         The parameters "additionalFixtures" and "additionalRules" can be used to specify lists of additional fixtures
         and rules (in the same format), so that this stylesheet can be used iteratively.
         The parameter "includesDir" can be given as the part that should be removed from the fixture/rules path. -->
         
    <xsl:param name="additionalTargets" as="xs:string" select="''"/>

    <xsl:template match="f:TestScript">
        <xsl:variable name="targets" as="xs:string*">
            <xsl:for-each select="//f:*[@nts:only-in]">
                <xsl:value-of select="tokenize(./@nts:only-in, ' ')"/>
            </xsl:for-each>
            <xsl:for-each select="tokenize($additionalTargets, ';')">
                <xsl:if test="string-length(.) &gt; 0">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:text>targets=</xsl:text>
        <xsl:for-each select="distinct-values($targets)">
            <xsl:if test="not(starts-with(., '#'))">
                <xsl:value-of select="."/>
                <xsl:text>;</xsl:text>                
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
</xsl:stylesheet>