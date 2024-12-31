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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:pharm="urn:ihe:pharm:medication" xmlns:util="urn:hl7:utilities" xmlns:hl7="urn:hl7-org:v3"  xmlns:f="http://hl7.org/fhir" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc>
        <xd:desc> MP 9 MP CDA Medication Information </xd:desc>
        <xd:param name="product-hl7">The hl7 xml element which contains the medication product. Defaults to context.</xd:param>
        <xd:param name="generateId">whether or not to output an ada id on the root element, optional, default to false()</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
        <xsl:param name="product-hl7" select="."/>
        <xsl:param name="generateId" as="xs:boolean?" select="false()"/>
        <!-- product -->
        <farmaceutisch_product>
            <xsl:if test="$generateId">
                <xsl:attribute name="id">
                    <xsl:value-of select="generate-id()"/>
                </xsl:attribute>
            </xsl:if>
            <!-- product_code -->
            <xsl:variable name="ada-elemName">product_code</xsl:variable>
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="hl7:code | hl7:code/hl7:translation"/>
                <xsl:with-param name="elemName" select="$ada-elemName"/>
            </xsl:call-template>
            <!-- product_specificatie -->
            <xsl:if test="not(hl7:code) or hl7:code/following-sibling::*">
                <xsl:variable name="ada-elemName">product_specificatie</xsl:variable>
                <xsl:element name="{$ada-elemName}">
                    <!-- product_naam -->
                    <xsl:variable name="ada-elemName">product_naam</xsl:variable>
                    <xsl:call-template name="handleST">
                        <xsl:with-param name="in" select="hl7:name"/>
                        <xsl:with-param name="elemName" select="$ada-elemName"/>
                    </xsl:call-template>
                    <!-- omschrijving -->
                    <xsl:variable name="ada-elemName">omschrijving</xsl:variable>
                    <xsl:call-template name="handleST">
                        <xsl:with-param name="in" select="pharm:desc"/>
                        <xsl:with-param name="elemName" select="$ada-elemName"/>
                    </xsl:call-template>
                    <!-- farmaceutische vorm -->
                    <xsl:variable name="ada-elemName">farmaceutische_vorm</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="pharm:formCode"/>
                        <xsl:with-param name="elemName" select="$ada-elemName"/>
                    </xsl:call-template>
                    <!-- ingredient -->
                    <xsl:for-each select="./pharm:ingredient">
                        <xsl:variable name="ada-elemName">ingredient</xsl:variable>
                        <xsl:element name="{$ada-elemName}">
                            <!-- ingredient_code -->
                            <xsl:for-each select="pharm:ingredient/pharm:code">
                                <xsl:call-template name="handleCV">
                                    <xsl:with-param name="in" select=". | ./hl7:translation"/>
                                    <xsl:with-param name="elemName" select="'ingredient_code'"/>
                                </xsl:call-template>
                            </xsl:for-each>
                            <!-- sterkte -->
                            <xsl:for-each select="./pharm:quantity">
                                <xsl:variable name="ada-elemName">sterkte</xsl:variable>
                                <xsl:element name="{$ada-elemName}">
                                    <!-- hoeveelheid_ingredient -->
                                    <xsl:for-each select="hl7:numerator[.//@value | @nullFlavor]">
                                        <ingredient_hoeveelheid>
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                            </xsl:call-template>
                                        </ingredient_hoeveelheid>
                                    </xsl:for-each>
                                    <!-- hoeveelheid_product  -->
                                    <xsl:for-each select="hl7:denominator[.//@value]">
                                        <product_hoeveelheid>
                                            <xsl:call-template name="mp-ingredient-waarde-en-eenheid">
                                                <xsl:with-param name="hl7-num-or-denom" select="."/>
                                            </xsl:call-template>
                                        </product_hoeveelheid>
                                    </xsl:for-each>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:element>
                        
                    </xsl:for-each>
                </xsl:element>
            </xsl:if>
        </farmaceutisch_product>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Ingrediënt waarde en eenheid</xd:desc>
        <xd:param name="hl7-num-or-denom">HL7 nominator or denominator</xd:param>
    </xd:doc>
    <xsl:template name="mp-ingredient-waarde-en-eenheid">
        <xsl:param name="hl7-num-or-denom"/>
        
        <!-- waarde -->
        <xsl:for-each select="$hl7-num-or-denom">
            <xsl:variable name="ada-elemName">waarde</xsl:variable>
            <xsl:element name="{$ada-elemName}">
                <xsl:call-template name="mp9-ingredient-waarde">
                    <xsl:with-param name="hl7-num-or-denom" select="$hl7-num-or-denom"/>
                </xsl:call-template>
            </xsl:element>
            <xsl:variable name="ada-elemName">eenheid</xsl:variable>
            <xsl:element name="{$ada-elemName}">
                <xsl:call-template name="mp9-ingredient-eenheid">
                    <xsl:with-param name="hl7-num-or-denom" select="$hl7-num-or-denom"/>
                </xsl:call-template>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="hl7-num-or-denom"/>
    </xd:doc>
    <xsl:template name="mp9-ingredient-eenheid">
        <xsl:param name="hl7-num-or-denom" select="." as="element()?"/>
        <!-- @unit kán leeg zijn als de default waarde '1' is, dus stuks -->
        <!-- @unit is ook leeg als de waarde gerepresenteerd wordt door een nullFlavor, wat vooral legaal is bij nullFlavor QS - aanvullen tot -->
        <xsl:choose>
            <xsl:when test="$hl7-num-or-denom[@value]">
                <xsl:for-each select="$hl7-num-or-denom[@value]">
                    <xsl:choose>
                        <xsl:when test="hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                            <xsl:for-each select="hl7:translation">
                                <xsl:call-template name="mp9-code-attribs">
                                    <xsl:with-param name="current-hl7-code" select="."/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- translate UCUM unit to Gstd -->
                            <xsl:call-template name="UCUM2GstdBasiseenheid">
                                <xsl:with-param name="UCUM">
                                    <xsl:choose>
                                        <xsl:when test="./@unit">
                                            <xsl:value-of select="./@unit"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="'1'"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$hl7-num-or-denom[@nullFlavor]">
                <xsl:variable name="currentNullFlavor" select="./@nullFlavor"/>
                <xsl:attribute name="code" select="$currentNullFlavor"/>
                <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                <xsl:attribute name="displayName" select="$hl7NullFlavorMap[@hl7NullFlavor = $currentNullFlavor]/@displayName"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- no value, no nullFlavor, let's set a default nullFlavor  -->
                <xsl:attribute name="code">NI</xsl:attribute>
                <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                <xsl:attribute name="displayName">geen informatie</xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="hl7-num-or-denom"/>
    </xd:doc>
    <xsl:template name="mp9-ingredient-waarde">
        <xsl:param name="hl7-num-or-denom" as="node()"/>
        <xsl:variable name="gstd-translation" select="$hl7-num-or-denom/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]"/>
        <xsl:choose>
            <xsl:when test="$gstd-translation">
                <xsl:attribute name="value" select="$gstd-translation/@value"/>
            </xsl:when>
            <xsl:when test="./@nullFlavor">
                <xsl:attribute name="nullFlavor" select="./@nullFlavor"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="value" select="./@value"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    
    
    
   </xsl:stylesheet>
