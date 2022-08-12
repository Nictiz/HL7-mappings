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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:util="urn:hl7:utilities" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../util/constants.xsl"/>
    <xsl:import href="../../util/datetime.xsl"/>
    <xsl:import href="../../util/utilities.xsl"/>
    <xsl:import href="../../util/units.xsl"/>
    
    <!-- only give dateT a value if you want conversion of relative T dates -->
    <xsl:param name="dateT" as="xs:date?"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 16, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> nictiz</xd:p>
            <xd:p>Helper xslt stuff for creating HL7 for any information standard / use case. To be imported or included from another xslt.</xd:p>
        </xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Formats an ada xml date or an ada vague date or an ada relative Date string to a HL7 formatted date.</xd:desc>
        <xd:param name="dateTime">The dateTime string to be formatted. May be a relative or vague date(time)</xd:param>
        <xd:param name="precision">Determines the picture of the date(time) format. Seconds is the default.</xd:param>
        <xd:param name="inputDateT">Optional. For test instances with relative T date</xd:param>
    </xd:doc>
    <xsl:template name="format2HL7Date">
        <xsl:param name="dateTime" as="xs:string?" select="."/>
        <xsl:param name="precision" as="xs:string?">second</xsl:param>
        <xsl:param name="inputDateT" as="xs:date?" select="$dateT"/>
        <xsl:variable name="picture" as="xs:string?">
            <xsl:choose>
                <xsl:when test="upper-case($precision) = ('MINUTE', 'MINUUT', 'MINUTES', 'MINUTEN', 'MIN', 'M')">[Y0001][M01][D01][H01][m01]</xsl:when>
                <xsl:when test="upper-case($precision) = ('HOUR', 'UUR', 'HOURS', 'UREN', 'HR', 'HH', 'H', 'U')">[Y0001][M01][D01][H01]</xsl:when>
                <xsl:when test="upper-case($precision) = ('SECOND', 'SECONDE', 'SECONDES', 'SECONDEN', 'SEC', 'S')">[Y0001][M01][D01][H01][m01][s01]</xsl:when>
                <xsl:when test="upper-case($precision) = ('MILLISECOND', 'MILLISECONDE', 'MILLISECONDES', 'MILLISECONDEN', 'MILLISEC', 'MS', 'MSEC')">[Y0001][M01][D01][H01][m01][s01].[f001]</xsl:when>
                <xsl:otherwise>[Y0001][M01][D01][H01][m01][s01]</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="inputDateTime" select="upper-case(normalize-space($dateTime))"/>
        <xsl:variable name="processedDateTime">
            <xsl:choose>
                <!-- relative Date when first character is 'T' -->
                <xsl:when test="starts-with($inputDateTime, 'T')">
                    <xsl:value-of select="nf:calculate-t-date($inputDateTime, $inputDateT)"/>
                </xsl:when>
                <!-- relative Date when first character is 'DOB' -->
                <xsl:when test="starts-with($inputDateTime, 'DOB')">
                    <xsl:value-of select="nf:calculate-t-date($inputDateTime, $inputDateT)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$inputDateTime"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="$processedDateTime castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime($processedDateTime), $picture)"/>
            </xsl:when>
            <xsl:when test="$processedDateTime castable as xs:date">
                <xsl:value-of select="format-date(xs:date($processedDateTime), '[Y0001][M01][D01]')"/>
            </xsl:when>
            <!-- input dateTime stops at minutes -->
            <xsl:when test="matches($processedDateTime, '\d{4}-(0[1-9]|1[012])-(0[1-9]|[12]\d|3[01])T([01]\d|2[0-3])(:(0\d|[1-5]\d))')">
                <xsl:value-of select="format-dateTime(xs:dateTime(concat($processedDateTime, ':00')), '[Y0001][M01][D01][H01][m01]')"/>
            </xsl:when>
            <!-- input dateTime stops at hours -->
            <xsl:when test="matches($processedDateTime, '\d{4}-(0[1-9]|1[012])-(0[1-9]|[12]\d|3[01])T([01]\d|2[0-3])')">
                <xsl:value-of select="format-dateTime(xs:dateTime(concat($processedDateTime, ':00:00')), '[Y0001][M01][D01][H01]')"/>
            </xsl:when>
            <!-- input date stops at months -->
            <xsl:when test="matches($processedDateTime, '\d{4}-(0[1-9]|1[012])')">
                <xsl:value-of select="format-date(xs:date(concat($processedDateTime, '-01')), '[Y0001][M01]')"/>
            </xsl:when>
            <!-- input date stops at year -->
            <xsl:when test="matches($processedDateTime, '\d{4}')">
                <xsl:value-of select="format-date(xs:date(concat($processedDateTime, '-01-01')), '[Y0001]')"/>
            </xsl:when>
            <!-- return the normalize space of whatever was the input -->
            <xsl:otherwise>
                <xsl:message terminate="no">Encountered an ada dateTime '<xsl:value-of select="$inputDateTime"/>' which could not be converted to HL7 date(time). Input = output.</xsl:message>
                <xsl:value-of select="$processedDateTime"/>
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
        <xd:desc>Makes element of a HL7 type which matches the ada attribute datatype</xd:desc>
        <xd:param name="in">Input ada element</xd:param>
        <xd:param name="elemName">The HL7 element name to be outputted, defaults to value</xd:param>
        <xd:param name="outputXsiType">Optional boolean, defaults to true. Controls whether to output a xsi:type attribute with the HL7 element</xd:param>
    </xd:doc>
    <xsl:template name="makeAny" match="element()" mode="MakeAny">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="outputXsiType" as="xs:boolean" select="true()"/>

        <xsl:for-each select="$in[@datatype]">
            <xsl:variable name="dataType" select="$in/@datatype"/>
            <xsl:variable name="notSupported">template makeAny: ada datatype <xsl:value-of select="$dataType"/> not supported</xsl:variable>
            <xsl:choose>
                <xsl:when test="$dataType = ('blob', 'complex', 'duration', 'ordinal', 'reference')">
                    <!-- could argue this is reason to terminate, however not in case of MP voorschrift... -->
                    <xsl:message terminate="no">
                        <xsl:value-of select="$notSupported"/>
                    </xsl:message>
                </xsl:when>
                <xsl:when test="$dataType = 'boolean'">
                    <xsl:call-template name="makeBLValue">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$dataType = 'code'">
                    <xsl:call-template name="makeCVValue">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$dataType = 'count'">
                    <xsl:call-template name="makeINTValue">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$dataType = ('date', 'datetime')">
                    <xsl:call-template name="makeTSValue">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$dataType = ('decimal')">
                    <xsl:call-template name="makeREALValue">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$dataType = ('duration')">
                    <xsl:message terminate="no">
                        <xsl:value-of select="$notSupported"/>
                    </xsl:message>
                </xsl:when>
                <xsl:when test="$dataType = ('identifier')">
                    <xsl:call-template name="makeIIValue">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$dataType = ('ordinal')">
                    <xsl:message terminate="no">
                        <xsl:value-of select="$notSupported"/>
                    </xsl:message>
                </xsl:when>
                <xsl:when test="$dataType = 'quantity'">
                    <xsl:call-template name="makePQValue">
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <!-- AWE: fix for xsiType, entering empty in parameter overrides the default with an empty value -->
                        <xsl:with-param name="xsiType" select="
                                if ($outputXsiType) then
                                    ('PQ')
                                else
                                    ''"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$dataType = 'reference'">
                    <xsl:message terminate="no">
                        <xsl:value-of select="$notSupported"/>
                    </xsl:message>
                </xsl:when>
                <xsl:when test="$dataType = 'string'">
                    <xsl:call-template name="makeSTValue">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$dataType = 'text'">
                    <xsl:call-template name="makeText">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message terminate="no">
                        <xsl:value-of select="$notSupported"/>
                    </xsl:message>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
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
        <xd:param name="xsiType">The xsi type to be included. Defaults to BL. Input empty string if no xsi:type should be outputted.</xd:param>
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
        <xsl:param name="strOriginalText" as="xs:string?" select="./@originalText"/>
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
        <xsl:param name="code" as="xs:string?" select="@code"/>
        <xsl:param name="codeSystem" as="xs:string?" select="@codeSystem"/>
        <xsl:param name="displayName" as="xs:string?" select="@displayName"/>
        <xsl:param name="elemName" as="xs:string?">value</xsl:param>
        <xsl:param name="originalText" as="element()?"/>
        <xsl:param name="strOriginalText" as="xs:string?" select="@originalText"/>
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
        <xd:param name="originalText">Optional to supply originalText with OTH code. Defaults to originalText attribute, if any</xd:param>
        <xd:param name="elemName">The HL7 xml element name. Defaults to code.</xd:param>
        <xd:param name="codeMap">Array of map elements to be used to map input ADA codes to output HL7v3 codes if those differ. For codeMap expect one or more elements like this: <xd:p><xd:pre>&lt;map inCode="xx" inCodeSystem="yy" value=".." code=".." codeSystem=".." codeSystemName=".." codeSystemVersion=".." displayName=".." originalText=".."/&gt;</xd:pre></xd:p>
            <xd:p>If input @code | @codeSystem matches, copy the other attributes from this element. Expected are usually @code, @codeSystem, @displayName, others optional. If the @code / @codeSystem are omitted, the mapping assumes you meant to copy the @inCode / @inCodeSystem.</xd:p>
            <xd:p>For @inCode and @inCodeSystem, first the input @code/@codeSystem is checked, with fallback onto @nullFlavor.</xd:p></xd:param>
    </xd:doc>
    <xsl:template name="makeCode">
        <xsl:param name="originalText" select="@originalText"/>
        <xsl:param name="elemName" as="xs:string?">code</xsl:param>
        <xsl:param name="codeMap" as="element()*"/>

        <!-- FIXME: this seems obsolete: in ADA the nullFlavor is also in @code with nullFlavor codesystem in @codeSystem, 
             the @nullFlavor attribute does not exist in ADA code datatype -->
        <xsl:variable name="theCode">
            <xsl:choose>
                <xsl:when test="@code">
                    <xsl:value-of select="@code"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@nullFlavor"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="theCodeSystem">
            <xsl:choose>
                <xsl:when test="@code">
                    <xsl:value-of select="@codeSystem"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$oidHL7NullFlavor"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="out" as="element()">
            <xsl:choose>
                <xsl:when test="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]">
                    <xsl:copy-of select="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:element name="{$elemName}">
            <xsl:call-template name="makeCodeAttribs">
                <xsl:with-param name="code" select="$out/@code"/>
                <xsl:with-param name="displayName" select="$out/@displayName"/>
                <xsl:with-param name="codeSystem" select="$out/@codeSystem"/>
                <xsl:with-param name="codeSystemName" select="$out/@codeSystemName"/>
                <xsl:with-param name="codeSystemVersion" select="$out/@codeSystemVersion"/>
                <xsl:with-param name="value" select="$out/@value"/>
                <xsl:with-param name="originalText" select="
                        if ($originalText instance of element()) then
                            $originalText
                        else
                            ()"/>
                <xsl:with-param name="strOriginalText" select="
                        if ($originalText castable as xs:string) then
                            $originalText
                        else
                            ()"/>
            </xsl:call-template>
            <!-- make translation with code from ADA, if it differs due to codemap -->
            <xsl:if test="$codeMap[@inCode = $theCode]">
                <translation>
                    <xsl:call-template name="makeCodeAttribs"/>
                </translation>
            </xsl:if>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Makes code attributes</xd:desc>
        <xd:param name="code"/>
        <xd:param name="codeSystem"/>
        <xd:param name="codeSystemName"/>
        <xd:param name="codeSystemVersion"/>
        <xd:param name="displayName"/>
        <xd:param name="originalText"/>
        <xd:param name="strOriginalText"/>
        <xd:param name="value"/>
    </xd:doc>
    <xsl:template name="makeCodeAttribs">
        <xsl:param name="code" as="xs:string?" select="@code"/>
        <xsl:param name="codeSystem" as="xs:string?" select="@codeSystem"/>
        <xsl:param name="codeSystemName" as="xs:string?" select="@codeSystemName"/>
        <xsl:param name="codeSystemVersion" as="xs:string?" select="@codeSystemVersion"/>
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
                <xsl:if test="string-length($codeSystemVersion) gt 0">
                    <xsl:attribute name="codeSystemVersion" select="$codeSystemVersion"/>
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
            <xsl:if test="string-length($mediaType) gt 0">
                <xsl:attribute name="mediaType" select="$mediaType"/>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="string-length($representation) gt 0">
                    <xsl:attribute name="representation" select="$representation"/>
                </xsl:when>
                <xsl:when test="string-length($mediaType) gt 0 and not($mediaType = 'text/plain')">
                    <xsl:attribute name="representation" select="'B64'"/>
                </xsl:when>
            </xsl:choose>
            <xsl:value-of select="@value"/>
            <xsl:if test="string-length($reference) gt 0">
                <reference value="{$reference}"/>
            </xsl:if>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Make HL7 effectiveTime based on ada input element</xd:desc>
        <xd:param name="effectiveTime">ada input element with date(time), defaults to context element</xd:param>
        <xd:param name="nullIfAbsent">Optional. Boolean to control whether to output HL7 element with nullFlavor if input element is absent. Defaults to false() - do not output element with nullFlavor..</xd:param>
    </xd:doc>
    <xsl:template name="makeEffectiveTime">
        <xsl:param name="effectiveTime" as="element()?" select="."/>
        <xsl:param name="nullIfAbsent" as="xs:boolean?" select="false()"/>
        <xsl:choose>
            <xsl:when test="$effectiveTime[1] instance of element() and $effectiveTime[@value | @nullFlavor]">
                <xsl:for-each select="$effectiveTime[@value | @nullFlavor]">
                    <effectiveTime>
                        <xsl:call-template name="makeTSValueAttr"/>
                    </effectiveTime>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$nullIfAbsent">
                <effectiveTime nullFlavor="NI"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>make ENXP Value</xd:desc>
        <xd:param name="xsiType">Optional. The xsi:type to be outputted. Defaults to ENXP. However: is not used in this template.</xd:param>
        <xd:param name="elemName">Optional. The element name to be outputted. Defaults to value.</xd:param>
        <xd:param name="qualifier">Optional. The qualifier string to add as attribute</xd:param>
    </xd:doc>
    <xsl:template name="makeENXPValue">
        <xsl:param name="xsiType" as="xs:string?">ENXP</xsl:param>
        <xsl:param name="elemName" as="xs:string?">value</xsl:param>
        <xsl:param name="qualifier" as="xs:string*"/>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($qualifier) gt 0">
                <xsl:attribute name="qualifier" select="$qualifier"/>
            </xsl:if>
            <!-- ENXP never occurs outside EN/PN/ON and never needs xsi:type -->
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
        <xd:desc>Makes a HL7 id element (datatype II) based on ada identification element</xd:desc>
        <xd:param name="in">Optional. Defaults to context. The ada element which contains the id. </xd:param>
    </xd:doc>
    <xsl:template name="makeIIid">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <xsl:call-template name="makeIIValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">id</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
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
        <xd:desc>makeIIValue. Makes a HL7 II element based on ada identification element</xd:desc>
        <xd:param name="xsiType">Optional. The @xsi:type to be outputted. No default.</xd:param>
        <xd:param name="elemName">The HL7 element name to be outputted, defaults to 'value'</xd:param>
        <xd:param name="root">The @root attribute to be outputted, defaults to @root of context</xd:param>
        <xd:param name="nullFlavor">The @nullFlavor attribute to be outputted, defaults to NI</xd:param>
    </xd:doc>
    <xsl:template name="makeIIValue">
        <xsl:param name="xsiType"/>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="root" select="@root"/>
        <xsl:param name="nullFlavor" select="(@nullFlavor, 'NI')[1]"/>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:choose>
                <!-- extension + root ... the regular case -->
                <xsl:when test="string-length($root) gt 0 and string-length(@value) gt 0">
                    <xsl:attribute name="extension">
                        <xsl:choose>
                            <!-- https://bits.nictiz.nl/browse/MM-831 -->
                            <!-- HL7v3 II.NL.BSN http://hl7.nl/wiki/index.php?title=Implementatiehandleiding_HL7v3_basiscomponenten_v2.3_Rev2#Identificatiesystemen_OID_Referentietabel 
                                says to add a leading zero on 8-digit-BSNs in the datatype -->
                            <xsl:when test="$root = $oidBurgerservicenummer and matches(@value, '^\d{8}$')">
                                <xsl:value-of select="concat('0', @value)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@value"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
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
        <xd:param name="nullFlavor"/>
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
        <xd:desc>Generates an element with a real value. Also handles nullFlavors. Expected context is ada element.</xd:desc>
        <xd:param name="xsiType">The xsi type to be included. Defaults to REAL.</xd:param>
        <xd:param name="elemName">The hl7 element name to be outputted. Defaults to value.</xd:param>
        <xd:param name="elemNamespace">The namespace this element is in. Defaults to the hl7 namespace.</xd:param>
    </xd:doc>
    <xsl:template name="makeREALValue">
        <xsl:param name="xsiType">REAL</xsl:param>
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
    <xsl:template name="makeSCValue">
        <xsl:param name="xsiType">SC</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:copy-of select="@code"/>
            <xsl:copy-of select="@codeSystem"/>
            <!-- Not always clear what the input looks like -->
            <xsl:value-of select="(@displayName, @value)[1]"/>
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
        <xd:desc>Make an HL7 element for a datatype TEL</xd:desc>
        <xd:param name="in">The ada element to be converted, defaults to context.</xd:param>
        <xd:param name="elemName">The hl7 element name, for example: telecom.</xd:param>
        <xd:param name="urlSchemeCode">The URL scheme code for this telecom value. For example: tel / fax / mailto. See http://www.hl7.nl/wiki/index.php?title=DatatypesR1:URL .</xd:param>
        <xd:param name="use">The contents for the @use attribute on this HL7 element</xd:param>
        <xd:param name="xsiType">The xsiType for the HL7 element, set to empty string when not needed.</xd:param>
    </xd:doc>
    <xsl:template name="makeTELValue">
        <xsl:param name="in" select="."/>
        <xsl:param name="elemName" as="xs:string">value</xsl:param>
        <xsl:param name="urlSchemeCode" as="xs:string?"/>
        <xsl:param name="use" as="xs:string*"/>
        <xsl:param name="xsiType" as="xs:string?">TEL</xsl:param>        
      
        <xsl:for-each select="$in">
            <!-- spaces are not allowed in URL scheme -->
            <xsl:variable name="theValue" select="translate(@value, ' ', '')"/>
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($xsiType) gt 0">
                    <xsl:attribute name="xsi:type" select="$xsiType"/>
                </xsl:if>
                <xsl:if test="$use">
                    <xsl:attribute name="use" select="$use"/>
                </xsl:if>
                <xsl:attribute name="value">
                    <xsl:choose>
                        <xsl:when test="matches($theValue, '^([a-z\-]+):.*')">
                            <!-- there is already an url scheme code in the @value -->
                            <xsl:value-of select="$theValue"/>
                        </xsl:when>
                        <xsl:when test="string-length($urlSchemeCode) gt 0">
                            <xsl:value-of select="concat($urlSchemeCode, ':', $theValue)"/>                            
                        </xsl:when>
                        <xsl:when test="matches($theValue, '.+@[^\.]+\.')">
                            <!-- email -->
                            <xsl:value-of select="concat('mailto:', $theValue)"/>
                        </xsl:when>
                        <xsl:when test="matches($theValue, '^[\d\s\(\)+-]+$')">
                            <!-- fax or tel number, but without $urlSchemeCode we have no way of knowing, 
                                so we default to tel, since fax really is also a telephone number technically -->
                            <xsl:value-of select="concat('tel:', $theValue)"/>                            
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- hmmm, should not happen, so log a message, but let's still output the input -->
                            <xsl:call-template name="util:logMessage">
                                <xsl:with-param name="level" select="$logERROR"/>
                                <xsl:with-param name="terminate" select="false()"/>
                                <xsl:with-param name="msg">Encountered a telecom value for which an Url scheme could not be found: '<xsl:value-of select="$theValue"/>'</xsl:with-param>
                            </xsl:call-template>
                            <xsl:value-of select="$theValue"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Makes HL7 text type element</xd:desc>
        <xd:param name="elemName">Optional. The element name to be created, defaults to text.</xd:param>
    </xd:doc>
    <xsl:template name="makeText">
        <xsl:param name="elemName" as="xs:string?">text</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:choose>
                <xsl:when test="string-length(@value) gt 0">
                    <xsl:value-of select="@value"/>
                </xsl:when>
                <xsl:when test="@nullFlavor">
                    <xsl:copy-of select="@nullFlavor"/>
                </xsl:when>
            </xsl:choose>
        </xsl:element>
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
        </xd:doc>
        <xd:param name="inputValue"/>
        <xd:param name="xsiType">The xsi type to be included. Defaults to BL.</xd:param>
        <xd:param name="elemName">The hl7 element name to be outputted. Defaults to value.</xd:param>
        <xd:param name="elemNamespace">The namespace this element is in. Defaults to the hl7 namespace.</xd:param>
        <xd:param name="inputNullFlavor">nullFlavor string if applicable</xd:param>
    </xd:doc>
    <xsl:template name="makeTSValue" match="element()" mode="MakeBLValue">
        <xsl:param name="inputValue" as="xs:string?" select="@value"/>
        <!-- Do not supply default for xsiType. Due to the datatypes.xsd schema, you cannot always use xsi:type TS, 
            unless the base type is TS, QTY or ANY -->
        <xsl:param name="xsiType"/>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="elemNamespace">urn:hl7-org:v3</xsl:param>
        <xsl:param name="inputNullFlavor" select="@nullFlavor" as="xs:string?"/>
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
        <xd:desc>Makes HL7 TS value attribute, based on input ada possible vague date/time string</xd:desc>
        <xd:param name="inputValue">The input ada value string</xd:param>
        <xd:param name="inputNullFlavor">The input ada nullFlavor</xd:param>
        <xd:param name="precision">Determines the picture of the date(time) format. Seconds is the default.</xd:param>
        <xd:param name="inputDateT">The input variable date T as xs:date. Optional, default to global param $dateT</xd:param>
    </xd:doc>
    <xsl:template name="makeTSValueAttr" match="element()" mode="MakeTSValueAttr">
        <xsl:param name="inputDateT" as="xs:date?" select="$dateT"/>
        <xsl:param name="inputValue" as="xs:string?" select="@value"/>
        <xsl:param name="inputNullFlavor" as="xs:string?" select="@nullFlavor"/>
        <xsl:param name="precision" as="xs:string?">second</xsl:param>
        <xsl:choose>
            <xsl:when test="$inputValue">
                <xsl:attribute name="value">
                    <xsl:call-template name="format2HL7Date">
                        <xsl:with-param name="dateTime" select="$inputValue"/>
                        <xsl:with-param name="inputDateT" select="$inputDateT"/>
                        <xsl:with-param name="precision" select="$precision"/>
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
        <xd:param name="adaPostalCodeValue"/>
    </xd:doc>
    <xsl:function name="nf:convertAdaNlPostcode" as="xs:string?">
        <xsl:param name="adaPostalCodeValue" as="xs:string?"/>
        <xsl:variable name="postalCodeUpperCase" select="normalize-space(upper-case($adaPostalCodeValue))"/>

        <xsl:choose>
            <xsl:when test="string-length($postalCodeUpperCase) = 6 and matches(($postalCodeUpperCase), '\d{4}[A-Z]{2}')">
                <xsl:value-of select="concat(substring($postalCodeUpperCase, 1, 4), ' ', substring($postalCodeUpperCase, 5, 2))"/>
            </xsl:when>
            <xsl:when test="string-length($postalCodeUpperCase) = 7 and matches(($postalCodeUpperCase), '\d{4}\s{1}[A-Z]{2}')">
                <xsl:value-of select="$postalCodeUpperCase"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$adaPostalCodeValue"/>
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

</xsl:stylesheet>
