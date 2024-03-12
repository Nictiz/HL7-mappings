<?xml version="1.0" encoding="UTF-8"?>
<!-- Deze stylesheet zet hl7 instances van JGZ DOB berichten om naar templates geschikt voor het uploaden naar de kwalificatie server. Onno Gieling, 30-10-2022 -->
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="urn:hl7-org:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:f="http://hl7.org/fhir" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>



    <xsl:template match="hl7:id[@extension] | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
            <xsl:choose>
                <xsl:when test="./@extension = '{$receiverId}'">
                    <xsl:attribute name="extension">jgz-nictiz</xsl:attribute>
                </xsl:when>
                <xsl:when test="./@extension = '{$applicationId}'">
                    <xsl:attribute name="extension">90000249</xsl:attribute>
                </xsl:when>
                <xsl:when test="./@extension = '{$orgId}'">
                    <xsl:attribute name="extension">00000509</xsl:attribute>
                </xsl:when>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>





</xsl:stylesheet>
