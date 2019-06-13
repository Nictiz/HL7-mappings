<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:f="http://hl7.org/fhir" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="community-filename" as="xs:string?">community-ICA612_2_MedMij112All.xml</xsl:param>
    <xsl:variable name="community-doc" select="document($community-filename)"/>
    <xsl:variable name="community-name" select="$community-doc/community/@name"/>

    <xsl:template match="concept/implementation">
        <xsl:variable name="current-concept-id" select="../@id"/>
        <!-- add the community stuff before implementation -->
        <xsl:comment>Added community stuff using xslt</xsl:comment>
        <community name="{$community-name}">
            <xsl:for-each select="$community-doc//association[object/@ref=$current-concept-id]/data">
                <xsl:variable name="current-type" select="@type"/>
                <xsl:variable name="current-prototype" select="$community-doc//prototype/data[@type = $current-type]"/>
                <data type="{$current-type}" label="{$current-prototype/@label}" datatype="{$current-prototype/@datatype}">
                    <xsl:value-of select="."/>
                </data>
                
            </xsl:for-each>
           </community>
        <xsl:copy-of select="."/>
        <xsl:apply-templates/>
    </xsl:template>



    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>


</xsl:stylesheet>
