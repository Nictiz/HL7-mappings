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
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:include href="../../util/constants.xsl"/>
    <xsl:include href="../../util/uuid.xsl"/>

    <!-- Returns an ISO 8601 date or dateTime string based on HL7v3 ts input string, and calculated precision
        
        Calculation is done by calling nf:determine_date_precision($dateTime)
        
        Example nf:formatHL72XMLDate(hl7:effectiveTime/@value)
        
        @param $dateTime HL7 ts date/time string expected format yyyymmddHHMMSS.sssss[+-]ZZzz
        @return date or dateTime. If no date or dateTime can be produced, a non-fatal error is issued and $input-hl7-date is returned as-is
    -->
    <xsl:function name="nf:formatHL72XMLDate" as="xs:string">
        <xsl:param name="input-hl7-date" as="xs:string"/>
        
        <xsl:value-of select="nf:formatHL72XMLDate($input-hl7-date, nf:determine_date_precision($input-hl7-date))"/>
    </xsl:function>
    
    <!-- Returns an ISO 8601 date or dateTime string based on HL7v3 ts input string, and requested precision.
        
        Example nf:formatHL72XMLDate(hl7:effectiveTime/@value, nf:determine_date_precision(hl7:effectiveTime/@value))
        
        @param $input-hl7-date HL7 ts date/time string expected format yyyymmddHHMMSS.sssss[+-]ZZzz
        @param $precision Coded string indicator for requested precision. Use DAY for date and SECOND for dateTime. 
            Note that if the input does not allow for dateTime, fallback to date is applied.
        @return date or dateTime. If no date or dateTime can be produced, a non-fatal error is issued and $input-hl7-date is returned as-is
    -->
    <xsl:function name="nf:formatHL72XMLDate" as="xs:string">
        <xsl:param name="input-hl7-date" as="xs:string"/>
        <!-- precision determines the picture of the date format, currently only use case for day or second. -->
        <xsl:param name="precision"/>
        
        <xsl:variable name="yyyy" select="substring($input-hl7-date, 1, 4)"/>
        <xsl:variable name="mm" select="substring($input-hl7-date, 5, 2)"/>
        <xsl:variable name="dd" select="substring($input-hl7-date, 7, 2)"/>
        
        <xsl:variable name="HH" select="substring($input-hl7-date, 9, 2)"/>
        <xsl:variable name="MM" select="substring($input-hl7-date, 11, 2)"/>
        <xsl:variable name="SS" select="substring($input-hl7-date, 13, 2)"/>
        
        <xsl:variable name="sss" select="replace($input-hl7-date, '^\d+(\.\d+)', '$1')"/>
        
        <xsl:variable name="TZ" select="replace($input-hl7-date, '.*([+-]\d{2,4})$', '$1')"/>
        
        <xsl:variable name="str_date" select="concat($yyyy, '-', $mm, '-', $dd)"/>
        <xsl:variable name="str_time" select="concat($HH, ':', $MM, '-', $SS, $sss, $TZ)"/>
        <xsl:variable name="str_datetime" select="concat($str_date, 'T', $str_time)"/>
        <xsl:choose>
            <xsl:when test="upper-case($precision) = ('SECOND', 'SECONDE', 'SECONDS', 'SECONDEN', 'SEC', 'S') and $str_datetime castable as xs:dateTime">
                <xsl:value-of select="$str_datetime"/>
            </xsl:when>
            <xsl:when test="upper-case($precision) = ('DAY', 'DAG', 'DAYS', 'DAGEN', 'D') and $str_date castable as xs:date">
                <xsl:value-of select="$str_date"/>
            </xsl:when>
            <xsl:when test="$str_date castable as xs:dateTime">
                <xsl:value-of select="$str_date"/>
            </xsl:when>
            <xsl:when test="$str_date castable as xs:date">
                <xsl:value-of select="$str_date"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$input-hl7-date"/>
                <xsl:message terminate="no">Could not determine xml date from input: '<xsl:value-of select="$input-hl7-date"/>' with precision: '<xsl:value-of select="$precision"/>'.</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!-- Returns DAY if the input is <= 8 characters, or SECOND otherwise
    
        @param $input-hl7-date HL7 ts date/time string expected format yyyymmddHHMMSS.sssss[+-]ZZzz
    -->
    <xsl:function name="nf:determine_date_precision">
        <xsl:param name="input-hl7-date"/>
        <xsl:choose>
            <xsl:when test="string-length($input-hl7-date) le 8">DAY</xsl:when>
            <!--<xsl:when test="string-length($input-hl7-date) gt 8">SECOND</xsl:when>-->
            <xsl:otherwise>SECOND</xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!-- appends an HL7 date with zeros so that an XML dateTime can be created or dates can be compared -->
    <xsl:function name="nf:appendDate2DateTime" as="xs:string?">
        <xsl:param name="inputDate" as="xs:string?"/>
        
        <!-- split date/time from subseconds/timezone (if any) -->
        <xsl:variable name="yyyymmddHHMMSS" select="replace($inputDate, '^(\d+).*', '$1')"/>
        <xsl:variable name="ssZZzz" select="substring($inputDate, string-length(replace($inputDate, '^(\d+).*', '$1')) + 1)"/>
        
        <xsl:value-of select="concat(substring(concat($yyyymmddHHMMSS, '00000000000000'), 1, 14), $ssZZzz)"/>
    </xsl:function>

    <!-- appends an HL7 date with zeros so that an XML date or dateTime can be created -->
    <xsl:function name="nf:appendDate2DateOrTime" as="xs:string?">
        <xsl:param name="inputDate"/>
        
        <!-- split date/time from subseconds/timezone (if any) -->
        <xsl:variable name="yyyymmddHHMMSS" select="replace($inputDate, '^(\d+).*', '$1')"/>
        <xsl:variable name="ssZZzz" select="substring($inputDate, string-length(replace($inputDate, '^(\d+).*', '$1')) + 1)"/>
        
        <xsl:choose>
            <xsl:when test="string-length($yyyymmddHHMMSS) gt 8">
                <xsl:value-of select="concat(substring(concat($yyyymmddHHMMSS, '00000000000000'), 1, 14), $ssZZzz)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="substring(concat($yyyymmddHHMMSS, '00000000'), 1, 8)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <!-- Returns an array of ADA elements based on an array of HL7v3 AND elements that have an @xsi:type attribute to determine the type with. 
        After the type is determined, the element is handed off to handleXX for further processing. Failure to determine type is a fatal error.
        
        Supported values for @xsi:type (datatypes releases 1 in namespace "urn:hl7-org:v3"): BL, CS, CV, CE, CD, CO, II, PQ, ST, TS
        
        @param $in Array of elements to process. If empty array, then no output is created.
        @param $codeSystem Relevant/required only for CS. CS has no codeSystem so it has to be supplied from external. Usually oidHL7ActStatus or oidHL7RoleStatus
        @param $conceptId Optional value for an ADA @conceptId attribute 
        @param $elemName Name of the ADA element to produce
        @param $dodatatype Boolean. If true creates relevant @datatype attribute on the output.
        @param $codeMap Array of map elements to be used to map input HL7v3 codes to output ADA codes if those differ. See handleCV for more documentation.
    -->
    <xsl:template name="handleANY">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="codeSystem" as="xs:string?"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="dodatatype" select="false()" as="xs:boolean"/>
        <xsl:param name="codeMap" as="element()*"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="xsiType" select="@xsi:type"/>
            <xsl:variable name="xsiTypePrefix" select="if (contains($xsiType,':')) then (substring-before($xsiType,':')) else ('')"/>
            <xsl:variable name="xsiTypeName" select="if (contains($xsiType,':')) then (substring-after($xsiType,':')) else ($xsiType)"/>
            <xsl:variable name="xsiTypeURI" select="namespace-uri-for-prefix($xsiTypePrefix, .)"/>
            <xsl:variable name="xsiTypeURIName" select="concat('{', $xsiTypeURI, '}:', $xsiTypeName)"/>
            
            <xsl:choose>
                <xsl:when test="$xsiTypeURIName = '{urn:hl7-org:v3}:BL'">
                    <xsl:call-template name="handleBL">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="conceptId" select="$conceptId"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="datatype">
                            <xsl:if test="$dodatatype">boolean</xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$xsiTypeURIName = '{urn:hl7-org:v3}:CS'">
                    <xsl:call-template name="handleCS">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="codeSystem" select="$codeSystem"/>
                        <xsl:with-param name="conceptId" select="$conceptId"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="datatype">
                            <xsl:if test="$dodatatype">code</xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$xsiTypeURIName = '{urn:hl7-org:v3}:CV' or $xsiTypeURIName = '{urn:hl7-org:v3}:CE' or $xsiTypeURIName = '{urn:hl7-org:v3}:CD' or $xsiTypeURIName = '{urn:hl7-org:v3}:CO'">
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="conceptId" select="$conceptId"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="datatype">
                            <xsl:if test="$dodatatype">code</xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$xsiTypeURIName = '{urn:hl7-org:v3}:II'">
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="conceptId" select="$conceptId"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="datatype">
                            <xsl:if test="$dodatatype">identifier</xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$xsiTypeURIName = '{urn:hl7-org:v3}:PQ'">
                    <xsl:call-template name="handlePQ">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="conceptId" select="$conceptId"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="datatype">
                            <xsl:if test="$dodatatype">quantity</xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$xsiTypeURIName = '{urn:hl7-org:v3}:ST'">
                    <xsl:call-template name="handleST">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="conceptId" select="$conceptId"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="datatype">
                            <xsl:if test="$dodatatype">string</xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$xsiTypeURIName = '{urn:hl7-org:v3}:TS'">
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="conceptId" select="$conceptId"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        <xsl:with-param name="datatype">
                            <xsl:if test="$dodatatype">date</xsl:if>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message terminate="yes">Cannot determine the datatype based on @xsi:type, or value not supported: <xsl:value-of select="$xsiType"/></xsl:message>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <!-- Returns an array of ADA elements based on an array of HL7v3 CS elements. CS has no displayName. The code, e.g. active or completed, normally reflects the displayName too so copy code to displayName.
        
        Input is first rewritten into full CV elements, and then passed off to handleCV for producing the ADA output
        
        @param $in Array of elements to process. If empty array, then no output is created. Normally there's only 1 CS datatyped element by the same name in an HL7v3 instance
        @param $codeSystem CS has no codeSystem so it has to be supplied from external. Usually oidHL7ActStatus or oidHL7RoleStatus
        @param $conceptId Optional value for an ADA @conceptId attribute 
        @param $elemName Name of the ADA element to produce
        @param $datatype If populated this is the value for the @datatype attribute on the output. No @datatype is created otherwise
        @param $codeMap Array of map elements to be used to map input HL7v3 codes to output ADA codes if those differ. See handleCV for more documentation.
            
            Example. if you only want to add a @value and a @displayName for an hl7:act <statusCode code="completed"/>, this would suffice:
            
            <map inCode="completed" inCodeSystem="$codeSystem" value="3" displayName="Voltooid"/> 
            to produce 
            <$elemName code="completed" codeSystem="$codeSystem" value="3" displayName="Voltooid"/>
    -->
    <xsl:template name="handleCS">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="codeSystem" as="xs:string" required="yes"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="datatype" as="xs:string?"/>
        <xsl:param name="codeMap" as="element()*"/>
        
        <xsl:variable name="rewrite" as="element()*">
            <xsl:for-each select="$in">
                <xsl:element name="{name(.)}">
                    <xsl:copy-of select="@*"/>
                    <xsl:if test="not(@codeSystem)">
                        <xsl:attribute name="codeSystem" select="$codeSystem"/>
                    </xsl:if>
                    <xsl:if test="not(@displayName)">
                        <xsl:attribute name="displayName" select="@code"/>
                    </xsl:if>
                    <xsl:copy-of select="node()"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:variable>
        <xsl:call-template name="handleCV">
            <xsl:with-param name="in" select="$rewrite"/>
            <xsl:with-param name="conceptId" select="$conceptId"/>
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="datatype" select="$datatype"/>
            <xsl:with-param name="codeMap" select="$codeMap"/>
        </xsl:call-template>
    </xsl:template>
    
    <!-- Returns an array of ADA elements based on an array of HL7v3 CV elements. @nullFlavor is rewritten into ADA @code/@codeSystem attributes as ADA does not know @nullFlavor for coded elements.
        
        @param $in Array of elements to process. If empty array, then no output is created.
        @param $conceptId Optional value for an ADA @conceptId attribute 
        @param $elemName Name of the ADA element to produce
        @param $datatype If populated this is the value for the @datatype attribute on the output. No @datatype is created otherwise
        @param $codeMap Array of map elements to be used to map input HL7v3 codes to output ADA codes if those differ. For codeMap expect one or more elements like this:
            <map inCode="xx" inCodeSystem="yy" value=".." code=".." codeSystem=".." codeSystemName=".." codeSystemVersion=".." displayName=".." originalText=".."/>
        
            If input @code | @codeSystem matches, copy the other attributes from this element. Expected are usually @code, @codeSystem, @displayName, others optional. 
            In some cases the @value is required in ADA. The $codeMap may then to be used to supply that @value based on @inCode / @inCodeSystem. If the @code / @codeSystem 
            are omitted, the mapping assumes you meant to copy the @inCode / @inCodeSystem.
            
            For @inCode and @inCodeSystem, first the input @code/@codeSystem is checked, with fallback onto @nullFlavor.
    -->
    <xsl:template name="handleCV">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="datatype" as="xs:string?"/>
        <xsl:param name="codeMap" as="element()*"/>
        
        <xsl:for-each select="$in">
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
                    <xsl:when test="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]">
                        <xsl:copy-of select="$codeMap[@inCode = $theCode][@inCodeSystem = $theCodeSystem]"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                
                <xsl:copy-of select="$out/@value"/>
                
                <xsl:choose>
                    <xsl:when test="$out/@nullFlavor">
                        <xsl:attribute name="code" select="$out/@nullFlavor"/>
                        <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                        <xsl:choose>
                            <xsl:when test="$out/@displayName">
                                <xsl:copy-of select="$out/@displayName"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy-of select="$hl7NullFlavorMap[@hl7NullFlavor = $out/@nullFlavor]/@displayName"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="$out/@code"/>
                        <!-- In the case where codeMap if only used to add a @value for ADA, this saves having to repeat the @inCode and @inCodeSystem as @code resp. @codeSystem -->
                        <xsl:if test="not($out/@code) and not(empty($theCode))">
                            <xsl:attribute name="code" select="$theCode"/>
                        </xsl:if>
                        <xsl:copy-of select="$out/@codeSystem"/>
                        <xsl:if test="not($out/@codeSystem) and not(empty($theCodeSystem))">
                            <xsl:attribute name="codeSystem" select="$theCodeSystem"/>
                        </xsl:if>
                        <xsl:copy-of select="$out/@codeSystemName"/>
                        <xsl:copy-of select="$out/@codeSystemVersion"/>
                        <xsl:copy-of select="$out/@displayName"/>
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:if test="hl7:originalText">
                    <xsl:attribute name="originalText" select="hl7:originalText"/>
                </xsl:if>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Returns an array of ADA elements based on an array of HL7v3 BL elements.
        
        @param $in Array of elements to process. If empty array, then no output is created.
        @param $conceptId Optional value for an ADA @conceptId attribute 
        @param $elemName Name of the ADA element to produce
        @param $datatype If populated this is the value for the @datatype attribute on the output. No @datatype is created otherwise
    -->
    <xsl:template name="handleBL">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="datatype" as="xs:string?"/>
        
        <xsl:for-each select="$in">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:copy-of select="@value"/>
                <xsl:copy-of select="@nullFlavor"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Returns an array of ADA elements based on an array of HL7v3 II elements.
        
        @param $in Array of elements to process. If empty array, then no output is created.
        @param $conceptId Optional value for an ADA @conceptId attribute 
        @param $elemName Name of the ADA element to produce
        @param $datatype If populated this is the value for the @datatype attribute on the output. No @datatype is created otherwise
    -->
    <xsl:template name="handleII">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="datatype" as="xs:string?"/>
        
        <xsl:for-each select="$in">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:if test="@extension">
                    <xsl:attribute name="value" select="@extension"/>
                </xsl:if>
                <xsl:copy-of select="@root"/>
                <xsl:copy-of select="@nullFlavor"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Returns an array of ADA elements based on an array of HL7v3 PQ elements.
        
        @param $in Array of elements to process. If empty array, then no output is created.
        @param $conceptId Optional value for an ADA @conceptId attribute 
        @param $elemName Name of the ADA element to produce
        @param $datatype If populated this is the value for the @datatype attribute on the output. No @datatype is created otherwise
    -->
    <xsl:template name="handlePQ">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="datatype" as="xs:string?"/>
        
        <xsl:for-each select="$in">
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype" select="$datatype"/>
                </xsl:if>
                <xsl:copy-of select="@value"/>
                <xsl:copy-of select="@unit[not(. = '1')]"/>
                <xsl:copy-of select="@nullFlavor"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Returns an array of ADA elements based on an array of HL7v3 ST elements.
        
        @param $in Array of elements to process. If empty array, then no output is created.
        @param $conceptId Optional value for an ADA @conceptId attribute 
        @param $elemName Name of the ADA element to produce
        @param $datatype If populated this is the value for the @datatype attribute on the output. No @datatype is created otherwise
    -->
    <xsl:template name="handleST">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName" as="xs:string" required="yes"/>
        <xsl:param name="datatype" as="xs:string?"/>
        
        <xsl:for-each select="$in">
            <xsl:if test="string-length($datatype) gt 0">
                <xsl:attribute name="datatype" select="$datatype"/>
            </xsl:if>
            <xsl:element name="{$elemName}">
                <xsl:if test="text()[not(normalize-space() = '')]">
                    <xsl:attribute name="value" select="."/>
                </xsl:if>
                <xsl:copy-of select="@nullFlavor"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <!-- Returns an array of ADA elements based on an array of HL7v3 TS elements. The ADA attribute @value will be created, if the input has a @value, with as much precision as possible based on the input.
        
        @param $in Array of elements to process. If empty array, then no output is created.
        @param $conceptId Optional value for an ADA @conceptId attribute 
        @param $elemName Name of the ADA element to produce
        @param $datatype If populated and @value is xs:dateTime, @datatype will be dateTime, otherwise if populated @datatype will be date. No @datatype is created otherwise
    -->
    <xsl:template name="handleTS">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="conceptId" as="xs:string?"/>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="datatype" as="xs:string?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="value" select="nf:formatHL72XMLDate(@value, nf:determine_date_precision(@value))"/>
            
            <xsl:element name="{$elemName}">
                <xsl:if test="string-length($datatype) gt 0">
                    <xsl:attribute name="datatype">
                        <xsl:choose>
                            <xsl:when test="$value castable as xs:dateTime">dateTime</xsl:when>
                            <xsl:otherwise>date</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="@value">
                    <xsl:attribute name="value" select="nf:formatHL72XMLDate(@value, nf:determine_date_precision(@value))"/>
                </xsl:if>
                <xsl:copy-of select="@nullFlavor"/>
                <xsl:if test="string-length($conceptId) gt 0">
                    <xsl:attribute name="conceptId" select="$conceptId"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

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

    <xsl:template name="makeBLAttribute">
        <xsl:param name="inputValue"/>
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
            <xsl:when test="string-length($inputValue) = 0">
                <!-- Do nothing -->
            </xsl:when>
            <xsl:otherwise>
                <!-- assume nullFlavor -->
                <xsl:attribute name="nullFlavor" select="$inputValue"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="makeBLValue">
        <xsl:param name="xsiType">BL</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:variable name="inputValue" select="@value"/>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:call-template name="makeBLAttribute">
                <xsl:with-param name="inputValue" select="$inputValue"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xsl:template name="makeBNValue">
        <xsl:param name="xsiType">BN</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeBLValue">
            <xsl:with-param name="xsiType" select="$xsiType"/>
            <xsl:with-param name="elemName" select="$elemName"/>
        </xsl:call-template>
    </xsl:template>

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

    <xsl:template name="makeCode">
        <xsl:param name="originalText"/>
        <code>
            <xsl:call-template name="makeCodeAttribs">
                <xsl:with-param name="originalText" select="$originalText"/>
            </xsl:call-template>
        </code>
    </xsl:template>

    <xsl:template name="makeCodeAttribs">
        <xsl:param name="code" as="xs:string?" select="./@code"/>
        <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
        <xsl:param name="displayName" as="xs:string?" select="./@displayName"/>
        <xsl:param name="originalText"/>
        <xsl:param name="strOriginalText" as="xs:string?"/>
        <xsl:param name="value" select="./@value"/>
        <xsl:choose>
            <xsl:when test="string-length($code) = 0 and (string-length($value) gt 0 or string-length($strOriginalText) gt 0)">
                <xsl:attribute name="nullFlavor" select="'OTH'"/>
            </xsl:when>
            <xsl:when test="$codeSystem = $oidHL7NullFlavor">
                <!-- NullFlavor -->
                <xsl:attribute name="nullFlavor" select="$code"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="code" select="$code"/>
                <xsl:attribute name="codeSystem" select="$codeSystem"/>
                <xsl:attribute name="displayName" select="$displayName"/>
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
    <!-- OriginalText with element() param -->
    <xsl:template name="makeoriginalText">
        <xsl:param name="originalText" as="element()*"/>
        <xsl:if test="$originalText">
            <originalText>
                <xsl:value-of select="$originalText/@value"/>
            </originalText>
        </xsl:if>
    </xsl:template>
    <!-- OriginalText with string param -->
    <xsl:template name="makeoriginalText2">
        <xsl:param name="strOriginalText" as="xs:string?"/>
        <xsl:if test="string-length($strOriginalText) gt 0">
            <originalText>
                <xsl:value-of select="$strOriginalText"/>
            </originalText>
        </xsl:if>
    </xsl:template>

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

    <xsl:template name="makeENXPValue">
        <xsl:param name="xsiType">ENXP</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="qualifier"/>
        <xsl:element name="{$elemName}">
            <!-- ENXP never occurs outside AD and never needs xsi:type -->
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="makeINTValue">
        <xsl:param name="xsiType">INT</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:element name="{$elemName}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:attribute name="value" select="@value"/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="makeINT.NONNEGValue">
        <xsl:param name="xsiType">INT</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeINTValue">
            <xsl:with-param name="xsiType" select="$xsiType"/>
            <xsl:with-param name="elemName" select="$elemName"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="makeINT.POSValue">
        <xsl:param name="xsiType">INT</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeINTValue">
            <xsl:with-param name="xsiType" select="$xsiType"/>
            <xsl:with-param name="elemName" select="$elemName"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="makeIIid">
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="xsiType" select="''"/>
            <xsl:with-param name="elemName">id</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="makeIIValueBSN">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeII.NL.BSNValue">
            <xsl:with-param name="elemName" select="$elemName"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="makeII.NL.AGBValue">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidAGB"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="makeII.NL.BIGValue">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidBIGregister"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="makeII.NL.BSNValue">
        <xsl:param name="xsiType"/>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="xsiType" select="$xsiType"/>
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidBurgerservicenummer"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="makeII.NL.URAValue">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidURAOrganizations"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="makeII.NL.UZIValue">
        <xsl:param name="xsiType">II</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:call-template name="makeIIValue">
            <xsl:with-param name="elemName" select="$elemName"/>
            <xsl:with-param name="root" select="$oidUZIPersons"/>
        </xsl:call-template>
    </xsl:template>

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

    <xsl:template name="makeNullflavorWithToelichting">
        <xsl:attribute name="nullFlavor" select="'OTH'"/>
        <xsl:call-template name="makeoriginalText">
            <xsl:with-param name="originalText" select="."/>
        </xsl:call-template>
    </xsl:template>

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

    <xsl:template name="makePQValue">
        <xsl:param name="inputValue" select="./@value"/>
        <xsl:param name="xsiType">PQ</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="unit" select="./@unit"/>
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

    <xsl:template name="makePQValueAttribs">
        <xsl:param name="value" select="@value"/>
        <xsl:param name="unit" select="@unit"/>
        <xsl:if test="$value">
            <xsl:attribute name="value" select="$value"/>
        </xsl:if>
        <xsl:if test="$unit">
            <xsl:attribute name="unit" select="$unit"/>
        </xsl:if>
    </xsl:template>

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

    <xsl:template name="makeTEL.NL.EXTENDEDValue">
        <xsl:param name="xsiType">TEL</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="use"/>
        <xsl:call-template name="makeTELValue">
            <xsl:with-param name="elemName"/>
            <xsl:with-param name="use"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="makeText">
        <text>
            <xsl:value-of select="@value"/>
        </text>
    </xsl:template>

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

    <!-- Returns an XML comment on the output that marks that the output is generated content, and shows what instance (element name + hl7:id or hl7:code or hl7:templateId) it came from 
        
        @param $in Optional explicit element to start from, if not the context node.
    -->
    <xsl:template name="doGeneratedComment">
        <xsl:param name="in" select="." as="node()*"/>
        
        <xsl:variable name="firstHL7Element" select="$in/descendant-or-self::hl7:*[1]" as="element()?"/>
        
        <xsl:comment>
            <xsl:text>Generated from HL7v3 </xsl:text>
            <xsl:choose>
                <xsl:when test="$firstHL7Element">
                    <xsl:value-of select="$firstHL7Element/local-name()"/>
                    <xsl:text> </xsl:text>
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
            <xsl:text>instance</xsl:text>
            
            <xsl:choose>
                <xsl:when test="$firstHL7Element/hl7:id">
                    <xsl:text> with: </xsl:text>
                    <xsl:text>&lt;id</xsl:text>
                    <xsl:for-each select="($firstHL7Element/hl7:id)[1]/@*">
                        <xsl:value-of select="concat(' ', name(), '=&quot;', ., '&quot;')"/>
                    </xsl:for-each>
                    <xsl:text>/&gt;</xsl:text>
                </xsl:when>
                <xsl:when test="$firstHL7Element/hl7:code">
                    <xsl:text> with: </xsl:text>
                    <xsl:text>&lt;code</xsl:text>
                    <xsl:for-each select="($firstHL7Element/hl7:code)[1]/@*">
                        <xsl:value-of select="concat(' ', name(), '=&quot;', ., '&quot;')"/>
                    </xsl:for-each>
                    <xsl:text>/&gt;</xsl:text>
                </xsl:when>
                <xsl:when test="$firstHL7Element/hl7:templateId">
                    <xsl:text> with: </xsl:text>
                    <xsl:text>&lt;templateId</xsl:text>
                    <xsl:for-each select="($firstHL7Element/hl7:templateId)[1]/@*">
                        <xsl:value-of select="concat(' ', name(), '=&quot;', ., '&quot;')"/>
                    </xsl:for-each>
                    <xsl:text>/&gt;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>.</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:comment>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
