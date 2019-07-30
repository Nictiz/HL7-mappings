<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:strip-space elements="*"/>
    
    <xd:doc>
        <xd:desc>Returns a unit string for display purposes, depending on the given unit ánd whether the value is singular or plural</xd:desc>
        <xd:param name="value">Input param to determine whether to return the singular or plural form for display</xd:param>
        <xd:param name="unit-in">Input unit string</xd:param>
    </xd:doc>
    <xsl:function name="nf:unit-string" as="xs:string?">
        <xsl:param name="value" as="xs:double?"/>
        <xsl:param name="unit-in" as="xs:string?"/>
        
        <xsl:variable name="unit" select="normalize-space(lower-case($unit-in))"/>
        
        <xsl:choose>
            <!-- same string for singular and plural -->
            <xsl:when test="$unit = ('milliliter', 'ml')">ml</xsl:when>
            <xsl:when test="$unit = ('internationale eenheid', '[iU]')">internationale eenheid</xsl:when>
            <xsl:when test="$unit = ('uur', 'h')">uur</xsl:when>
            <!-- return singular form -->
            <xsl:when test="$value gt 0 and $value lt 2">
                <xsl:choose>
                    <xsl:when test="$unit = ('dag', 'd')">dag</xsl:when>
                    <xsl:when test="$unit = ('week', 'wk')">week</xsl:when>
                    <xsl:when test="$unit = ('jaar', 'a')">jaar</xsl:when>
                    <xsl:when test="$unit = ('stuk', '1')">stuk</xsl:when>
                    <xsl:when test="$unit = ('dosis')">dosis</xsl:when>
                    <xsl:when test="$unit = ('druppel', '[drp]')">druppel</xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$unit"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <!-- return plural form -->
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$unit = ('dag', 'd')">dagen</xsl:when>
                    <xsl:when test="$unit = ('week', 'wk')">weken</xsl:when>
                    <xsl:when test="$unit = ('jaar', 'a')">jaar</xsl:when>
                    <xsl:when test="$unit = ('stuk', '1')">stuks</xsl:when>
                    <xsl:when test="$unit = ('dosis')">doses</xsl:when>
                    <xsl:when test="$unit = ('druppel', '[drp]')">druppels</xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$unit"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="in-code"/>
    </xd:doc>
    <xsl:function name="nf:code-2-simple-string" as="xs:string?">
        <xsl:param name="in-code" as="element()?"/>
        <xsl:for-each select="$in-code">
        <xsl:choose>
            <xsl:when test="./(@displayName | @originalText)">
                <xsl:value-of select="normalize-space(concat(./@originalText, ' ', ./@displayName))"/>
            </xsl:when>
            <xsl:when test="./@value and not(./@code)">
                <xsl:value-of select="normalize-space(./@value)"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- should not happen -->                                                        
                <xsl:value-of select="concat('Unexpected contents of ', ./local-name(), ': ', string-join(./@*, ' '))"/>
            </xsl:otherwise>
        </xsl:choose></xsl:for-each>
    </xsl:function>
    
</xsl:stylesheet>
