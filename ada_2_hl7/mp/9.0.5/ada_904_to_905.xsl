<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- Script om MP ada forms te converteren van 9.04 naar 9.05 -->


    <!-- Vervang 'auteur/zorgaanbieder' door 'auteur/auteur_is_zorgaanbieder/zorgaanbieder' -->
    <xsl:template match="//documentgegevens/auteur/zorgaanbieder">
        <auteur_is_zorgaanbieder conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.23410">
            <xsl:copy>
                <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
        </auteur_is_zorgaanbieder>
    </xsl:template>

    <!-- Vervang <tijdseenheid value="x"> door <tijdseenheid value="1" unit="x"> -->
    <xsl:template match="tijdseenheid[not(@unit)]">
        <xsl:variable name="eenheid">
            <xsl:choose>
                <xsl:when test="@value = 's'">seconde</xsl:when>
                <xsl:when test="@value = 'm'">minuut</xsl:when>
                <xsl:when test="@value = 'h'">uur</xsl:when>
                <xsl:when test="@value = 'd'">dag</xsl:when>
                <xsl:when test="@value = 'w'">week</xsl:when>
                <xsl:when test="@value = 'y'">jaar</xsl:when>
                <xsl:otherwise><xsl:value-of select="@value"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <tijdseenheid value="1" unit="{$eenheid}" conceptId="{@conceptId}"/>
    </xsl:template>
    
    <xsl:template match="verbruiks_duur">
        <xsl:variable name="eenheid">
            <xsl:choose>
                <xsl:when test="@unit = 'm'">minuut</xsl:when>
                <xsl:when test="@unit = 'h'">uur</xsl:when>
                <xsl:when test="@unit = 'd'">dag</xsl:when>
                <xsl:when test="@unit = 'w'">week</xsl:when>
                <xsl:when test="@unit = 'y'">jaar</xsl:when>
                <xsl:otherwise><xsl:value-of select="@unit"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <verbruiksduur value="{@value}" unit="{$eenheid}" conceptId="{@conceptId}"/>
    </xsl:template>
    
    <xsl:template match="keerdosis/eenheid[@unit and not(@value)]">
        <eenheid value="{@unit}" conceptId="{@conceptId}"/>    
    </xsl:template>
    
    <!--Vervang <aanvullende_instructie value="x" .../> door <aanvullende_instructie displayName="goed naspoelen" .../>-->
    <xsl:template match="aanvullende_instructie[@value and not(@displayName)]">
        <aanvullende_instructie
            conceptId="{@conceptId}" displayName="{@value}"/>
    </xsl:template>
    
    
    <!-- Kopieer verder alles 1-op-1 -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>


</xsl:stylesheet>
