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
<!-- Templates of the form 'make<datatype/flavor>Value' correspond to ART-DECOR supported datatypes / HL7 V3 Datatypes R1 -->
<xsl:stylesheet exclude-result-prefixes="#default nf" xmlns="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 16, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> nictiz</xd:p>
            <xd:p>Helper xslt stuff for creating HL7 for any information standard / use case. To be imported or included from another xslt.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:include href="../../util/constants.xsl"/>

    <xd:doc>
        <xd:desc>Formats an xml date to a HL7 formatted date.</xd:desc>
        <xd:param name="dateTime"/>
        <xd:param name="precision">determines the picture of the date format, currently only use case for minute. Seconds is the default.</xd:param>
    </xd:doc>
    <xsl:template name="format2HL7Date">
        <xsl:param name="dateTime"/>
        <xsl:param name="precision">second</xsl:param>
        <xsl:variable name="picture" as="xs:string?">
            <xsl:choose>
                <xsl:when test="upper-case($precision) = ('MINUTE', 'MINUUT', 'MINUTES', 'MINUTEN', 'MIN', 'M')">[Y0001][M01][D01][H01][m01]</xsl:when>
                <xsl:otherwise>[Y0001][M01][D01][H01][m01][s01]</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="normalize-space($dateTime) castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime($dateTime), $picture)"/>
            </xsl:when>
            <xsl:when test="normalize-space($dateTime) castable as xs:date">
                <xsl:value-of select="format-date(xs:date($dateTime), '[Y0001][M01][D01]')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$dateTime"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeADXPValue">
        <xsl:param name="xsiType">ADXP</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <!-- ADXP never occurs outside AD and never needs xsi:type -->
            <xsl:copy-of select="@code"/>
            <xsl:copy-of select="@codeSystem"/>
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="inputValue"/>
        <xd:param name="inputNullFlavor"/>
    </xd:doc>
    <xsl:template name="makeBLAttribute">
        <xsl:param name="inputValue" as="xs:string?"/>
        <xsl:param name="inputNullFlavor" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="$inputValue castable as xs:boolean">
                <xsl:attribute name="value" select="$inputValue"/>
            </xsl:when>
            <xsl:when test="lower-case($inputValue) = ('ja', 'yes', 'ja', 'oui', 'si')">
                <xsl:attribute name="value" select="true()"/>
            </xsl:when>
            <xsl:when test="lower-case($inputValue) = ('nee', 'no', 'nein', 'non', 'no')">
                <xsl:attribute name="value" select="false()"/>
            </xsl:when>
            <xsl:when test="string-length($inputNullFlavor) gt 0">
                <xsl:attribute name="nullFlavor" select="$inputNullFlavor"/>
            </xsl:when>
            <xsl:when test="string-length($inputValue) = 0 and string-length($inputNullFlavor) = 0">
                <!-- Do nothing -->
            </xsl:when>
            <xsl:otherwise>
                <!-- assume nullFlavor -->
                <xsl:attribute name="nullFlavor" select="$inputValue"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Generates an element with a boolean value. Also handles nullFlavors. Expected context is ada element.</xd:desc>
        <xd:param name="xsiType">The xsi type to be included. Defaults to BL.</xd:param>
        <xd:param name="elemName">The hl7 element name to be outputted</xd:param>
        <xd:param name="elemNamespace">The namespace this element is in. Defaults to the hl7 namespace.</xd:param>
    </xd:doc>
    <xsl:template name="makeBLValue" match="element()" mode="MakeBLValue">
        <xsl:param name="xsiType">BL</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="elemNamespace">urn:hl7-org:v3</xsl:param>
        <xsl:variable name="inputValue" select="./@value" as="xs:string?"/>
        <xsl:variable name="inputNullFlavor" select="./@nullFlavor" as="xs:string?"/>
        <xsl:element name="{$elemName}" namespace="{$elemNamespace}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:call-template name="makeBLAttribute">
                <xsl:with-param name="inputValue" select="$inputValue"/>
                <xsl:with-param name="inputNullFlavor" select="$inputNullFlavor"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeBNValue">
        <xsl:param name="xsiType">BN</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeBLValue">
            <xsl:with-param name="xsiType" select="$xsiType"/>
            <xsl:with-param name="elemName" select="$elemName"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="code"/>
        <xd:param name="codeSystem"/>
        <xd:param name="displayName"/>
        <xd:param name="elemName"/>
        <xd:param name="originalText"/>
        <xd:param name="strOriginalText"/>
        <xd:param name="translations"/>
        <xd:param name="xsiType"/>
    </xd:doc>
    <xsl:template name="makeCDValue">
        <xsl:param name="code" as="xs:string?" select="./@code"/>
        <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
        <xsl:param name="displayName" as="xs:string?" select="./@displayName"/>
        <xsl:param name="elemName" as="xs:string?">value</xsl:param>
        <xsl:param name="originalText"/>
        <xsl:param name="strOriginalText" as="xs:string?"/>
        <xsl:param name="translations" as="element(hl7:translation)*"/>
        <xsl:param name="xsiType" as="xs:string?">CD</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:call-template name="makeCodeAttribs">
                <xsl:with-param name="code" select="$code"/>
                <xsl:with-param name="codeSystem" select="$codeSystem"/>
                <xsl:with-param name="displayName" select="$displayName"/>
                <xsl:with-param name="originalText" select="$originalText"/>
                <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
            </xsl:call-template>
            <xsl:copy-of select="$translations"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="code"/>
        <xd:param name="codeSystem"/>
        <xd:param name="displayName"/>
        <xd:param name="elemName"/>
        <xd:param name="originalText"/>
        <xd:param name="strOriginalText"/>
        <xd:param name="translations"/>
        <xd:param name="xsiType"/>
    </xd:doc>
    <xsl:template name="makeCEValue">
        <xsl:param name="code" as="xs:string?" select="./@code"/>
        <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
        <xsl:param name="displayName" as="xs:string?" select="@displayName"/>
        <xsl:param name="elemName" as="xs:string?">value</xsl:param>
        <xsl:param name="originalText"/>
        <xsl:param name="strOriginalText" as="xs:string?"/>
        <xsl:param name="translations" as="element(hl7:translation)*"/>
        <xsl:param name="xsiType" as="xs:string?">CE</xsl:param>
        <xsl:call-template name="makeCDValue">
            <xsl:with-param name="code" select="$code"/>
            <xsl:with-param name="codeSystem" select="$codeSystem"/>
            <xsl:with-param name="displayName" select="$displayName"/>
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="originalText" select="$originalText"/>
            <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
            <xsl:with-param name="translations" select="$translations"/>
            <xsl:with-param name="xsiType" select="$xsiType"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="code"/>
        <xd:param name="codeSystem"/>
        <xd:param name="displayName"/>
        <xd:param name="elemName"/>
        <xd:param name="xsiType"/>
        <xd:param name="originalText"/>
        <xd:param name="translations"/>
    </xd:doc>
    <xsl:template name="makeCVValue">
        <xsl:param name="code" as="xs:string?" select="./@code"/>
        <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
        <xsl:param name="displayName" as="xs:string?" select="./@displayName"/>
        <xsl:param name="elemName" as="xs:string?">value</xsl:param>
        <xsl:param name="xsiType">CV</xsl:param>
        <xsl:param name="originalText"/>
        <xsl:param name="translations" as="element(hl7:translation)*"/>
        <xsl:call-template name="makeCDValue">
            <xsl:with-param name="code" select="$code"/>
            <xsl:with-param name="codeSystem" select="$codeSystem"/>
            <xsl:with-param name="displayName" select="$displayName"/>
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="originalText" select="$originalText"/>
            <xsl:with-param name="xsiType" select="$xsiType"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
        <xd:param name="originalText"/>
    </xd:doc>
    <xsl:template name="makeCSValue">
        <xsl:param name="xsiType">CS</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="originalText"/>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="@codeSystem = $oidHL7NullFlavor">
                    <!-- NullFlavor -->
                    <xsl:attribute name="nullFlavor" select="@code"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="code" select="@code"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Makes a HL7 code type element based on ada element with datatype code</xd:desc>
        <xd:param name="originalText">Optional to supply originalText with OTH code</xd:param>
        <xd:param name="elemName">The HL7 xml element name. Defaults to code.</xd:param>
    </xd:doc>
    <xsl:template name="makeCode">
        <xsl:param name="originalText"/>
        <xsl:param name="elemName" as="xs:string?">code</xsl:param>

        <xsl:element name="{$elemName}">
            <xsl:choose>
                <xsl:when test="$originalText instance of element()">
                    <xsl:call-template name="makeCodeAttribs">
                        <xsl:with-param name="originalText" select="$originalText"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="makeCodeAttribs">
                        <xsl:with-param name="strOriginalText" select="$originalText"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="code"/>
        <xd:param name="codeSystem"/>
        <xd:param name="codeSystemName"/>
        <xd:param name="displayName"/>
        <xd:param name="originalText"/>
        <xd:param name="strOriginalText"/>
        <xd:param name="value"/>
    </xd:doc>
    <xsl:template name="makeCodeAttribs">
        <xsl:param name="code" as="xs:string?" select="@code"/>
        <xsl:param name="codeSystem" as="xs:string?" select="@codeSystem"/>
        <xsl:param name="codeSystemName" as="xs:string?" select="@codeSystemName"/>
        <xsl:param name="displayName" as="xs:string?" select="@displayName"/>
        <xsl:param name="originalText"/>
        <xsl:param name="strOriginalText" as="xs:string?"/>
        <xsl:param name="value" select="@value"/>
        <xsl:choose>
            <xsl:when test="string-length($code) = 0 and (string-length($value) gt 0 or string-length($strOriginalText) gt 0)">
                <xsl:attribute name="nullFlavor" select="'OTH'"/>
            </xsl:when>
            <xsl:when test="$codeSystem = $oidHL7NullFlavor">
                <!-- NullFlavor -->
                <xsl:attribute name="nullFlavor" select="$code"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="string-length($code) gt 0">
                    <xsl:attribute name="code" select="$code"/>
                </xsl:if>
                <xsl:if test="string-length($codeSystem) gt 0">
                    <xsl:attribute name="codeSystem" select="$codeSystem"/>
                </xsl:if>
                <xsl:if test="string-length($displayName) gt 0">
                    <xsl:attribute name="displayName" select="$displayName"/>
                </xsl:if>
                <xsl:if test="string-length($codeSystemName) gt 0">
                    <xsl:attribute name="codeSystemName" select="$codeSystemName"/>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="string-length($strOriginalText) gt 0">
                <xsl:call-template name="makeoriginalText2">
                    <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="makeoriginalText">
                    <xsl:with-param name="originalText" as="element()*">
                        <xsl:choose>
                            <xsl:when test="$originalText">
                                <xsl:copy-of select="$originalText"/>
                            </xsl:when>
                            <xsl:when test="not(@code) and @value">
                                <xsl:copy-of select="."/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc> OriginalText with element() param </xd:desc>
        <xd:param name="originalText"/>
    </xd:doc>
    <xsl:template name="makeoriginalText">
        <xsl:param name="originalText" as="element()*"/>
        <xsl:if test="$originalText">
            <originalText>
                <xsl:value-of select="normalize-space(string-join($originalText/(@value | @displayName), ' '))"/>
            </originalText>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc> OriginalText with string param </xd:desc>
        <xd:param name="strOriginalText"/>
    </xd:doc>
    <xsl:template name="makeoriginalText2">
        <xsl:param name="strOriginalText" as="xs:string?"/>
        <xsl:if test="string-length($strOriginalText) gt 0">
            <originalText>
                <xsl:value-of select="$strOriginalText"/>
            </originalText>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
        <xd:param name="mediaType"/>
        <xd:param name="representation"/>
        <xd:param name="reference"/>
    </xd:doc>
    <xsl:template name="makeEDValue">
        <xsl:param name="xsiType">ED</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="mediaType" as="xs:string?"/>
        <xsl:param name="representation" as="xs:string?"/>
        <xsl:param name="reference" as="xs:string?"/>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:if test="$mediaType">
                <xsl:attribute name="mediaType" select="$mediaType"/>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="$representation">
                    <xsl:attribute name="representation" select="$representation"/>
                </xsl:when>
                <xsl:when test="not($mediaType = 'text/plain')">
                    <xsl:attribute name="representation" select="'B64'"/>
                </xsl:when>
            </xsl:choose>
            <xsl:value-of select="@value"/>
            <xsl:if test="$reference">
                <reference value="{$reference}"/>
            </xsl:if>
        </xsl:element>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="effectiveTime"/>
    </xd:doc>
    <xsl:template name="makeEffectiveTime">
        <xsl:param name="effectiveTime"/>
        <xsl:if test="$effectiveTime[1] instance of element()">
            <xsl:for-each select="$effectiveTime[@value | @nullFlavor]">
                <effectiveTime>
                    <xsl:call-template name="makeTSValueAttr"/>
                </effectiveTime>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
        <xd:param name="qualifier"/>
    </xd:doc>
    <xsl:template name="makeENXPValue">
        <xsl:param name="xsiType">ENXP</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="qualifier"/>
        <xsl:element name="{$elemName}">
            <!-- ENXP never occurs outside AD and never needs xsi:type -->
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Generates an element with an integer value. Also handles nullFlavors. Expected context is ada element.</xd:desc>
        <xd:param name="xsiType">The xsi type to be included. Defaults to INT.</xd:param>
        <xd:param name="elemName">The hl7 element name to be outputted</xd:param>
        <xd:param name="elemNamespace">The namespace this element is in. Defaults to the hl7 namespace.</xd:param>
    </xd:doc>
    <xsl:template name="makeINTValue">
        <xsl:param name="xsiType">INT</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="elemNamespace">urn:hl7-org:v3</xsl:param>

        <xsl:variable name="inputValue" select="@value" as="xs:string?"/>
        <xsl:variable name="inputNullFlavor" select="@nullFlavor" as="xs:string?"/>

        <xsl:element name="{$elemName}" namespace="{$elemNamespace}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:if test="string-length($inputNullFlavor) gt 0">
                <xsl:attribute name="nullFlavor" select="$inputNullFlavor"/>
            </xsl:if>
            <xsl:if test="string-length($inputValue) gt 0">
                <xsl:attribute name="value" select="$inputValue"/>
            </xsl:if>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeINT.NONNEGValue">
        <xsl:param name="xsiType">INT</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeINTValue">
            <xsl:with-param name="xsiType" select="$xsiType"/>
            <xsl:with-param name="elemName" select="$elemName"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeINT.POSValue">
        <xsl:param name="xsiType">INT</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeINTValue">
            <xsl:with-param name="xsiType" select="$xsiType"/>
            <xsl:with-param name="elemName" select="$elemName"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="makeIIid">
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="xsiType" select="''"/>
            <xsl:with-param name="elemName">id</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeIIValueBSN">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeII.NL.BSNValue">
            <xsl:with-param name="elemName" select="$elemName"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeII.NL.AGBValue">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidAGB"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeII.NL.BIGValue">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidBIGregister"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeII.NL.BSNValue">
        <xsl:param name="xsiType"/>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="xsiType" select="$xsiType"/>
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidBurgerservicenummer"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeII.NL.URAValue">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidURAOrganizations"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeII.NL.UZIValue">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidUZIPersons"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
        <xd:param name="root"/>
        <xd:param name="nullFlavor"/>
    </xd:doc>
    <xsl:template name="makeIIValue">
        <xsl:param name="xsiType"/>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="root" select="@root"/>
        <xsl:param name="nullFlavor">NI</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:choose>
                <!-- extension + root ... the regular case -->
                <xsl:when test="string-length($root) gt 0 and string-length(@value) gt 0">
                    <xsl:attribute name="extension" select="@value"/>
                    <xsl:attribute name="root" select="$root"/>
                </xsl:when>
                <!-- extension + nullFlavor=UNC. Extension MAY NOT appear on its own unless with nullFlavor=UNC -->
                <xsl:when test="string-length($root) = 0 and string-length(@value) gt 0">
                    <xsl:attribute name="extension" select="@value"/>
                    <xsl:attribute name="nullFlavor">UNC</xsl:attribute>
                </xsl:when>
                <!-- nullFlavor -->
                <xsl:otherwise>
                    <xsl:attribute name="nullFlavor" select="$nullFlavor"/>
                </xsl:otherwise>
                <!--<xsl:when test="string-length($root) gt 0 and string-length(@value) = 0">
                    <xsl:attribute name="nullFlavor" select="$nullFlavor"/>
                </xsl:choose>
                <xsl:when test="string-length($root) = 0 and string-length(@value) = 0">
                    <xsl:attribute name="nullFlavor" select="$nullFlavor"/>
                </xsl:when>-->
            </xsl:choose>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="inputValue"/>
    </xd:doc>
    <xsl:template name="makeNegationAttr">
        <xsl:param name="inputValue" select="@value"/>
        <xsl:choose>
            <xsl:when test="$inputValue castable as xs:boolean">
                <xsl:attribute name="negationInd" select="$inputValue = 'false'"/>
            </xsl:when>
            <xsl:when test="lower-case($inputValue) = ('ja', 'yes', 'ja', 'oui', 'si', 'waar')">
                <xsl:attribute name="negationInd" select="false()"/>
            </xsl:when>
            <xsl:when test="lower-case($inputValue) = ('nee', 'no', 'nein', 'non', 'no', 'onwaar')">
                <xsl:attribute name="negationInd" select="true()"/>
            </xsl:when>
            <xsl:when test="string-length($inputValue) = 0">
                <!-- Do nothing -->
            </xsl:when>
            <xsl:otherwise>
                <!-- assume nullFlavor -->
                <xsl:attribute name="nullFlavor" select="$inputValue"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="makeNullflavorWithToelichting">
        <xsl:attribute name="nullFlavor">OTH</xsl:attribute>
        <xsl:call-template name="makeoriginalText">
            <xsl:with-param name="originalText" select="."/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeONValue">
        <xsl:param name="xsiType">ON</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makePNValue">
        <xsl:param name="xsiType">PN</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Makes an element of type PQ</xd:desc>
        <xd:param name="inputValue">input value string, default to context/@value</xd:param>
        <xd:param name="xsiType">the xsi:type for the HL7 element to be generated</xd:param>
        <xd:param name="elemName">the element name to be created, defaults to value</xd:param>
        <xd:param name="unit">the unit belonging to value context/@unit</xd:param>
        <xd:param name="nullFlavor">the nullFlavor context/@nullFlavor</xd:param>
    </xd:doc>
    <xsl:template name="makePQValue" match="element()" mode="MakePQValue">
        <xsl:param name="inputValue" select="@value" as="xs:string?"/>
        <xsl:param name="xsiType" as="xs:string?">PQ</xsl:param>
        <xsl:param name="elemName" as="xs:string?">value</xsl:param>
        <xsl:param name="unit" as="xs:string?" select="@unit"/>
        <xsl:param name="nullFlavor" as="xs:string?" select="@nullFlavor"/>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:call-template name="makePQValueAttribs">
                <xsl:with-param name="value" select="$inputValue"/>
                <xsl:with-param name="unit" select="$unit"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="value"/>
        <xd:param name="unit"/>
    </xd:doc>
    <xsl:template name="makePQValueAttribs">
        <xsl:param name="value" select="@value"/>
        <xsl:param name="unit" select="@unit"/>
        <xsl:param name="nullFlavor" select="@nullFlavor"/>
        <xsl:if test="$value">
            <xsl:attribute name="value" select="$value"/>
        </xsl:if>
        <xsl:if test="$unit">
            <xsl:attribute name="unit" select="nf:convert_ADA_unit2UCUM($unit)"/>
        </xsl:if>
        <xsl:if test="$nullFlavor">
            <xsl:attribute name="nullFlavor" select="$nullFlavor"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeSCValue">
        <xsl:param name="xsiType">SC</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:copy-of select="@code"/>
            <xsl:copy-of select="@codeSystem"/>
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeSTValue">
        <xsl:param name="xsiType">ST</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
        <xd:param name="use"/>
    </xd:doc>
    <xsl:template name="makeTELValue">
        <xsl:param name="xsiType">TEL</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="use"/>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:if test="$use">
                <xsl:attribute name="use" select="$use"/>
            </xsl:if>
            <xsl:attribute name="value" select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
        <xd:param name="use"/>
    </xd:doc>
    <xsl:template name="makeTEL.NL.EXTENDEDValue">
        <xsl:param name="xsiType">TEL</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="use"/>
        <xsl:call-template name="makeTELValue">
            <xsl:with-param name="elemName"/>
            <xsl:with-param name="use"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="makeText">
        <text>
            <xsl:value-of select="@value"/>
        </text>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeTNValue">
        <xsl:param name="xsiType">TN</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xsiType"/>
        <xd:param name="elemName"/>
    </xd:doc>
    <xsl:template name="makeTS.DATE.MINValue">
        <xsl:param name="xsiType">TS</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:call-template name="makeTSValueAttr"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:doc>
            <xd:desc>Generates an element with a date(time) value. Also handles nullFlavors. Expected context is ada element.</xd:desc>
            <xd:param name="xsiType">The xsi type to be included. Defaults to BL.</xd:param>
            <xd:param name="elemName">The hl7 element name to be outputted. Defaults to value.</xd:param>
            <xd:param name="elemNamespace">The namespace this element is in. Defaults to the hl7 namespace.</xd:param>
        </xd:doc>
    </xd:doc>
    <xsl:template name="makeTSValue" match="element()" mode="MakeBLValue">
        <xsl:param name="inputValue" as="xs:string?" select="./@value"/>
        <!-- Do not supply default for xsiType. Due to the datatypes.xsd schema, you cannot always use xsi:type TS, 
            unless the base type is TS, QTY or ANY -->
        <xsl:param name="xsiType"/>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="elemNamespace">urn:hl7-org:v3</xsl:param>
        <xsl:variable name="inputValue" select="@value" as="xs:string?"/>
        <xsl:variable name="inputNullFlavor" select="@nullFlavor" as="xs:string?"/>
        <xsl:element name="{$elemName}" namespace="{$elemNamespace}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:call-template name="makeTSValueAttr">
                <xsl:with-param name="inputValue" select="$inputValue"/>
                <xsl:with-param name="inputNullFlavor" select="$inputNullFlavor"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="inputValue"/>
    </xd:doc>
    <xsl:template name="makeTSValueAttr">
        <xsl:param name="inputValue" as="xs:string?" select="@value"/>
        <xsl:param name="inputNullFlavor" as="xs:string?" select="@nullFlavor"/>
        <xsl:choose>
            <xsl:when test="$inputValue">
                <xsl:attribute name="value">
                    <xsl:call-template name="format2HL7Date">
                        <xsl:with-param name="dateTime" select="$inputValue"/>
                    </xsl:call-template>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test="$inputNullFlavor">
                <xsl:attribute name="nullFlavor" select="$inputNullFlavor"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="nullFlavor" select="'NI'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="ada-postcode-value"/>
    </xd:doc>
    <xsl:function name="nf:convertAdaNlPostcode" as="xs:string?">
        <xsl:param name="ada-postcode-value" as="xs:string?"/>
        <xsl:variable name="postcode-uc" select="normalize-space(upper-case($ada-postcode-value))"/>

        <xsl:choose>
            <xsl:when test="string-length($postcode-uc) = 6 and matches(($postcode-uc), '\d{4}[A-Z]{2}')">
                <xsl:value-of select="concat(substring($postcode-uc, 1, 4), ' ', substring($postcode-uc, 5, 2))"/>
            </xsl:when>
            <xsl:when test="string-length($postcode-uc) = 7 and matches(($postcode-uc), '\d{4}\s{1}[A-Z]{2}')">
                <xsl:value-of select="$postcode-uc"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$ada-postcode-value"/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:function>

    <xd:doc>
        <xd:desc> addEnding checks baseString if it ends in endString, and if not adds it at the end. </xd:desc>
        <xd:param name="baseString"/>
        <xd:param name="endString"/>
    </xd:doc>
    <xsl:function name="nf:addEnding">
        <xsl:param name="baseString"/>
        <xsl:param name="endString"/>

        <xsl:choose>
            <xsl:when test="substring($baseString, string-length($baseString) - string-length($endString) + 1, string-length($endString)) eq $endString">
                <xsl:value-of select="$baseString"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($baseString, $endString)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Converts ADA time unit 2 UCUM</xd:desc>
        <xd:param name="ADAtime"/>
    </xd:doc>
    <xsl:function name="nf:convertTime_ADA_unit2UCUM" as="xs:string?">
        <xsl:param name="ADAtime" as="xs:string?"/>
        <xsl:if test="$ADAtime">
            <xsl:choose>
                <xsl:when test="$ADAtime = $ada-unit-second">s</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-minute">min</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-hour">h</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-day">d</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-week">wk</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-month">mo</xsl:when>
                <xsl:when test="$ADAtime = $ada-unit-year">a</xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat('onbekende tijdseenheid: ', $ADAtime)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>Converts ADA unit 2 UCUM</xd:desc>
        <xd:param name="ADAunit"/>
    </xd:doc>
    <xsl:function name="nf:convert_ADA_unit2UCUM" as="xs:string?">
        <xsl:param name="ADAunit" as="xs:string?"/>
        <xsl:if test="$ADAunit">
            <xsl:choose>
                <xsl:when test="$ADAunit = $ada-unit-kilo">kg</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-gram">g</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-cm">cm</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-m">m</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-liter">l</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-dl">dl</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-cl">cl</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-ml">ml</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-ul">ul</xsl:when>

                <xsl:when test="$ADAunit = $ada-unit-druppel">[drp]</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-degrees-celsius">Cel</xsl:when>
                <xsl:when test="$ADAunit = $ada-unit-pH">[pH]</xsl:when>
                
                <xsl:when test="not(contains(nf:convertTime_ADA_unit2UCUM($ADAunit), 'onbekend'))">
                    <xsl:value-of select="nf:convertTime_ADA_unit2UCUM($ADAunit)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat('unknown ada unit: ', $ADAunit)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>

</xsl:stylesheet>
