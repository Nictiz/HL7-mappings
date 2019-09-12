<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nf="http://www.nictiz.nl/functions" version="2.0">
<!--    <xsl:include href="../hl7/2_hl7_hl7_include.xsl"/>-->
    
    <!-- addEnding checks baseString if it ends in endString, and if not adds it at the end. -->
    <!-- moved function nf:addEnding to 2_hl7_hl7_include.xsl -->
  <!--  <xsl:function name="nf:addEnding">
        <xsl:param name="baseString"/>
        <xsl:param name="endString"/>        
        
        <xsl:choose>
            <xsl:when test="substring($baseString, string-length($baseString)-string-length($endString)+1, string-length($endString)) eq $endString">
                <xsl:value-of select="$baseString"/>                    
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($baseString, $endString)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
-->	
     
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.101_20170602000000">
        <!-- address NL - generic  (van repository: zib2015bbr-) -->
        <xsl:param name="adres"/>
        
        <addr>
            <xsl:attribute name="use" select="./adres_soort[1]/@code"/>
            <xsl:for-each select="./straat">
                <streetName><xsl:value-of select="./@value"/></streetName> 
            </xsl:for-each>
            <xsl:for-each select="./huisnummer">
                <houseNumber><xsl:value-of select="./@value"/></houseNumber>
            </xsl:for-each>
            <xsl:if test="./huisnummerletter or ./huisnummertoevoeging">
                <buildingNumberSuffix>
                    <xsl:value-of select="./huisnummerletter/@value"/>
                    <!-- voeg scheidende spatie toe als beide aanwezig -->
                    <xsl:if test="./huisnummerletter and ./huisnummertoevoeging"><xsl:text> </xsl:text></xsl:if>  
                    <xsl:value-of select="./huisnummertoevoeging/@value"/>
                </buildingNumberSuffix>
            </xsl:if>
            <xsl:for-each select="./aanduiding_bij_nummer">
                <additionalLocator><xsl:value-of select="./@code"/></additionalLocator>
            </xsl:for-each>
            <xsl:for-each select="./postcode">
                <postalCode><xsl:value-of select="nf:convertAdaNlPostcode(./@value)"/></postalCode>
            </xsl:for-each>
            <xsl:for-each select="./gemeente">
                <county><xsl:value-of select="./@value"/></county>
            </xsl:for-each>
            <xsl:for-each select="./woonplaats">
                <city><xsl:value-of select="./@value"/></city>
            </xsl:for-each>
            <xsl:for-each select="./land">
                <country><xsl:value-of select="./@value"/></country>
            </xsl:for-each>
            <!-- Additionele informatie wordt geschrapt uit de definitie
                <xsl:for-each select="./additioneleinformatie">
                <unitID><xsl:value-of select="./@value"/></unitID>
            </xsl:for-each>-->
            <!-- UseablePeriod nog niet geimplementeerd - kan niet in ADA forms opgegeven worden. -->
        </addr>
    </xsl:template>
    
    
 </xsl:stylesheet>
