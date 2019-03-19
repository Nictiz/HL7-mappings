<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- Parameters to be set, may be overridden by an importing stylesheet -->
    <xsl:param name="adaReleaseFile" select="document('kernset-ada-release.xml')"/>
    <xsl:param name="releaseUri" select="'http://decor.nictiz.nl/decor/services/RetrieveTransaction?id=2.16.840.1.113883.2.4.3.11.60.90.77.4.2410&amp;language=nl-NL&amp;version=2014-11-19T17:15:44&amp;format=xml'"/>
    <xsl:param name="hl7PayloadContext" select="'/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject'"/>

    <xsl:template match="//*[@transactionRef]">
        <xsl:comment>Schematron <xsl:value-of select="@title"/></xsl:comment>
        <sch:schema xmlns:hl7="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
            <sch:ns uri="urn:hl7-org:v3" prefix="hl7"/>
            <sch:ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
            <sch:ns uri="http://www.w3.org/XML/1998/namespace" prefix="xml"/>
            <sch:pattern id="{concat('id-', @id)}">

                <xsl:apply-templates select="*" mode="doRule"/>
            </sch:pattern>
        </sch:schema>
    </xsl:template>

    <xsl:template match="*" mode="doRule">
        <xsl:comment><xsl:value-of select="local-name()"/></xsl:comment>
        <sch:rule context="{$hl7PayloadContext}"> </sch:rule>
    </xsl:template>

    <xsl:template match="*" mode="doAssert4Date">
        <xsl:param name="context" select="$hl7PayloadContext"/>
        <xsl:variable name="hl7-date" select="substring(nf:ada2hl7-datetime(@value), 1, 8)"/>        
        <!--Datum moet aan substring(@value,1,8)='xxxxxxxx' voldoen.-->
        <xsl:comment><xsl:value-of select="concat(local-name(), ' moet aan substring(@value,1,8)=', $hl7-date, ' voldoen.')"/></xsl:comment>
        <sch:assert role="error" test="{$context}/substring(@value, 1, 8) = '{$hl7-date}'">Verwacht is een <xsl:value-of select="local-name()"/> met waarde "<xsl:value-of select="nf:ada2datestring(@value)"/>" (<xsl:value-of select="$hl7-date"/>).</sch:assert>

    </xsl:template>
    
    <xsl:template match="*" mode="doAssert4Code">
        <xsl:param name="context" select="$hl7PayloadContext"/>
        <!--Eindverantwoordelijk in welke perinatale periode? moet aan . voldoen.-->
        <xsl:comment><xsl:value-of select="concat(local-name(), ' moet aan code = ''', @code ,''' voldoen.')"/></xsl:comment>
        
        <sch:assert role="error" test="{$context}[(@code = '{@code}' and @codeSystem = '{@codeSystem}')]/.">Verwacht is een <xsl:value-of select="local-name()"/> met waarde "<xsl:value-of select="@displayName"/>" (code: <xsl:value-of select="@code"/>).</sch:assert>        
    </xsl:template>

    <xsl:function name="nf:ada2hl7-datetime">
        <xsl:param name="ada-datetime"/>
        <xsl:choose>
            <xsl:when test="$ada-datetime castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime($ada-datetime), '[Y0001][M01][D01][H01][m01][s01]')"/>                
            </xsl:when>
            <xsl:when test="$ada-datetime castable as xs:date">
                <xsl:value-of select="format-date(xs:date($ada-datetime), '[Y0001][M01][D01]')"/>                
            </xsl:when>
            <xsl:otherwise><xsl:value-of select="$ada-datetime"/></xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="nf:ada2datestring">
        <xsl:param name="ada-datetime"/>        
        <xsl:choose>
            <xsl:when test="$ada-datetime castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime($ada-datetime), '[D01] [Mn] [Y0001]','nl', 'AD', 'NL')"/>                
            </xsl:when>
            <xsl:when test="$ada-datetime castable as xs:date">
                <xsl:value-of select="format-date(xs:date($ada-datetime), '[D01] [Mn] [Y0001]','nl', 'AD', 'NL')"/>                
            </xsl:when>
            <xsl:otherwise><xsl:value-of select="$ada-datetime"/></xsl:otherwise>
        </xsl:choose>
    </xsl:function>

</xsl:stylesheet>
