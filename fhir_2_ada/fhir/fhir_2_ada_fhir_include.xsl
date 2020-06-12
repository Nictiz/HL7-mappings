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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    xmlns:local="urn:fhir:stu3:functions"
    xmlns:nf="http://www.nictiz.nl/functions" 
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:import href="../../util/constants.xsl"/>
    <xsl:import href="../../util/datetime.xsl"/>
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc>
        <xd:desc>Transforms FHIR <xd:a href="http://hl7.org/fhir/STU3/datatypes.html#code">@value</xd:a> to ada code element</xd:desc>
        <xd:param name="value">The FHIR @value</xd:param>
        <xd:param name="codeMap">Array of map elements to be used to map input FHIR codes to output ADA codes.</xd:param>
    </xd:doc>
    <xsl:template name="code-to-code" as="attribute()+">
        <xsl:param name="value" as="xs:string" select="."/>
        <xsl:param name="codeMap" as="element()*"/>
               
        <xsl:variable name="out" as="element()">
            <xsl:choose>
                <xsl:when test="$codeMap[@inValue = $value]">
                    <xsl:copy-of select="$codeMap[@inValue = $value]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:attribute name="code" select="$out/@code"/>
        <xsl:attribute name="codeSystem" select="$out/@codeSystem"/>
        <xsl:if test="$out/@displayName">
            <xsl:attribute name="displayName" select="$out/@displayName"/>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Transforms FHIR <xd:a href="http://hl7.org/fhir/STU3/datatypes.html#CodeableConcept">CodeableConcept contents</xd:a> to ada code element.</xd:desc>
        <xd:param name="in">the FHIR CodeableConcept element</xd:param>
        <xd:param name="inElementName">Optionally provide the element name, default = coding. In extensions it is valueCoding.</xd:param>
    </xd:doc>
    <xsl:template name="CodeableConcept-to-code" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="adaElementName" as="xs:string"/>
        <xsl:param name="inElementName" as="xs:string?">coding</xsl:param>
        <xsl:param name="originalText" as="xs:string?"/>
        
        <xsl:choose>
            <xsl:when test="$in/f:extension/@url=$urlExtHL7NullFlavor">
                <xsl:variable name="nullFlavorValue" select="$in/f:extension[@url=$urlExtHL7NullFlavor]/f:valueCode/@value"/>
                <xsl:variable name="nullFlavorDisplayName" select="$hl7NullFlavorMap[@hl7NullFlavor=$nullFlavorValue]/@displayName"/>
                <xsl:element name="{$adaElementName}">
                    <xsl:call-template name="Coding-to-code">
                        <xsl:with-param name="in" as="element()">
                            <f:coding>
                                <f:system value="{$oidHL7NullFlavor}"/>
                                <f:code value="{$nullFlavorValue}"/>
                                <f:display value="{$nullFlavorDisplayName}"/>
                            </f:coding>
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="string-length($originalText) gt 0">
                        <xsl:attribute name="originalText" select="$originalText"/>
                    </xsl:if>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$in/f:*[local-name()=$inElementName]">
                <xsl:for-each select="$in/f:*[local-name()=$inElementName]">
                    <xsl:element name="{$adaElementName}">
                        <xsl:call-template name="Coding-to-code">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Transforms FHIR <xd:a href="http://hl7.org/fhir/STU3/datatypes.html#Coding">Coding contents</xd:a> to ada code element</xd:desc>
        <xd:param name="in">the FHIR Coding contents</xd:param>
    </xd:doc>
    <xsl:template name="Coding-to-code" as="attribute()*">
        <xsl:param name="in" as="element()?" select="."/>
        
        <xsl:variable name="oid" select="local:getOid($in/f:system/@value)"/>
        <xsl:variable name="codeSystemName" select="local:getDisplayName($oid)"/>
        <xsl:if test="$in/f:code/@value">
            <xsl:attribute name="code" select="$in/f:code/@value"/>
        </xsl:if>
        <xsl:if test="$oid">
            <xsl:attribute name="codeSystem" select="$oid"/>
        </xsl:if>
        <xsl:if test="not($codeSystemName=$oid)">
            <xsl:attribute name="codeSystemName" select="$codeSystemName"/>
        </xsl:if>
        <xsl:if test="$in/f:version/@value">
            <xsl:attribute name="codeSystemVersion" select="$in/f:version/@value"/>
        </xsl:if>
        <xsl:if test="$in/f:display/@value">
            <xsl:attribute name="displayName" select="$in/f:display/@value"></xsl:attribute>
        </xsl:if>
        <xsl:if test="$in/f:userSelected/@value">
            <xsl:attribute name="preferred" select="'true'"></xsl:attribute>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Transforms FHIR Quantity to ada waarde and eenheid elements</xd:desc>
        <xd:param name="quantity">FHIR Quantity element</xd:param>
        
        <!--<xd:param name="waarde">ada element may have any name but should have datatype aantal (count)</xd:param>
        <xd:param name="eenheid">ada element may have any name but should have datatype code</xd:param>-->
    </xd:doc>
    <xsl:template name="Quantity-to-hoeveelheid-complex" as="element()*">
        <!--<xsl:param name="quantity" as="element()"/>-->
        <xsl:param name="adaWaarde"/>
        <xsl:param name="adaEenheid">eenheid</xsl:param>
        <xsl:param name="withRange" select="false()"/>
        <xsl:variable name="adaWaardeElementName">
            <xsl:choose>
                <xsl:when test="not($adaWaarde='')">
                    <xsl:value-of select="$adaWaarde"/>
                </xsl:when>
                <xsl:when test="$withRange=true()">vaste_waarde</xsl:when>
                <xsl:otherwise>waarde</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="f:extension/@url=$urlExtHL7NullFlavor">
                <aantal>
                    <xsl:element name="{$adaWaardeElementName}">
                        <xsl:attribute name="nullFlavor" select="(f:extension[@url=$urlExtHL7NullFlavor]/f:valueCode/@value,'NI')[1]"></xsl:attribute>
                    </xsl:element>
                </aantal>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$withRange=true()">
                        <aantal>
                            <xsl:element name="{$adaWaardeElementName}">
                                <xsl:attribute name="value" select="f:value/@value"/>
                            </xsl:element>
                        </aantal>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="{$adaWaardeElementName}">
                            <xsl:attribute name="value" select="f:value/@value"/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:element name="{$adaEenheid}">
                    <xsl:variable name="oid" select="local:getOid(f:system/@value)"/>
                    <xsl:attribute name="code" select="f:code/@value"/>
                    <xsl:attribute name="codeSystem" select="$oid"></xsl:attribute>
                    <xsl:attribute name="codeSystemName" select="local:getDisplayName($oid)"></xsl:attribute>
                    <xsl:attribute name="displayName" select="f:unit/@value"></xsl:attribute>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        <!--
                <value value="{$waarde/@value}"/>
                <xsl:for-each select="$eenheid[@code]">
                    <xsl:for-each select="./@displayName">
                        <unit value="{replace(., '(^\s+)|(\s+$)', '')}"/>
                    </xsl:for-each>
                    <xsl:for-each select="./@codeSystem">
                        <system value="{local:getUri(.)}"/>
                    </xsl:for-each>
                    <code value="{if (@codeSystem = $oidUCUM) then nf:convert_ADA_unit2UCUM_FHIR($eenheid/@code) else $eenheid/@code}"/>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>-->
    </xsl:template>
    
    <xsl:template name="Ratio-to-hoeveelheid-complex" as="element()*">
        <!--<xsl:param name="numerator" as="element()"/>
        <xsl:param name="denominator" as="element()"/>-->
        <xsl:param name="numeratorAdaName" as="xs:string"/>
        <xsl:param name="denominatorAdaName" as="xs:string"/>
        
        <xsl:for-each select="f:numerator">
            <xsl:element name="{$numeratorAdaName}">
                <xsl:call-template name="Quantity-to-hoeveelheid-complex">
                    <!--<xsl:with-param name="quantity" select="f:numerator"/>-->
                </xsl:call-template>
            </xsl:element>
        </xsl:for-each>
        
        <xsl:for-each select="f:denominator">
            <xsl:element name="{$denominatorAdaName}">
                <xsl:call-template name="Quantity-to-hoeveelheid-complex">
                    <!--<xsl:with-param name="quantity" select="f:denominator"/>-->
                </xsl:call-template>
            </xsl:element>
        </xsl:for-each>
        
        <!--<xsl:for-each select="$numerator">
            <numerator>
                <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                    <xsl:with-param name="eenheid" select="./eenheid"/>
                    <xsl:with-param name="waarde" select="./waarde"/>
                </xsl:call-template>
            </numerator>
        </xsl:for-each>
        <xsl:for-each select="$denominator">
            <denominator>
                <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                    <xsl:with-param name="eenheid" select="./eenheid"/>
                    <xsl:with-param name="waarde" select="./waarde"/>
                </xsl:call-template>
            </denominator>
        </xsl:for-each>-->
    </xsl:template>
    
    <xsl:template name="Identifier-to-identificatie" as="element()">
        <xsl:param name="adaElementName">identificatie</xsl:param>
        <xsl:element name="{$adaElementName}">
            <xsl:choose>
                <xsl:when test="f:value/f:extension/@url='http://hl7.org/fhir/StructureDefinition/data-absent-reason'">
                    <xsl:attribute name="nullFlavor" select="'MSK'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="value" select="f:value/@value"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:attribute name="root" select="local:getOid(f:system/@value)"/>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Formats FHIR date(Time) or ada normal or relativeDate(time) based on input precision</xd:desc>
        <xd:param name="dateTime">Input FHIR date(Time)</xd:param>
        <xd:param name="precision">Determines the precision of the output. Precision of minutes outputs seconds as '00'</xd:param>
        <xd:param name="dateT">Optional parameter. The T-date for which a relativeDate must be calculated. If not given a Touchstone like parameterised string is outputted</xd:param>
    </xd:doc>
    <xsl:template name="format2ADADate">
        <xsl:param name="dateTime" as="xs:string?"/>
        <xsl:param name="precision">second</xsl:param>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:variable name="picture" as="xs:string?">
            <xsl:choose>
                <xsl:when test="upper-case($precision) = ('DAY', 'DAG', 'DAYS', 'DAGEN', 'D')">[Y0001]-[M01]-[D01]</xsl:when>
                <xsl:when test="upper-case($precision) = ('MINUTE', 'MINUUT', 'MINUTES', 'MINUTEN', 'MIN', 'M')">[Y0001]-[M01]-[D01]T[H01]:[m01]:00[Z]</xsl:when>
                <xsl:otherwise>[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01][Z]</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="normalize-space($dateTime) castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime(nf:add-Amsterdam-timezone-to-dateTimeString(normalize-space($dateTime))), $picture)"/>
            </xsl:when>
            <xsl:when test="concat(normalize-space($dateTime), ':00') castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime(nf:add-Amsterdam-timezone-to-dateTimeString(concat(normalize-space($dateTime), ':00'))), $picture)"/>
            </xsl:when>
            <xsl:when test="normalize-space($dateTime) castable as xs:date">
                <xsl:value-of select="format-date(xs:date(normalize-space($dateTime)), '[Y0001]-[M01]-[D01]')"/>
            </xsl:when>
            <!-- there may be a relative date(time) like "${DATE, T, D, -20}T12:34:45+02:00" in the input -->
            <xsl:when test="matches($dateTime, '\$\{DATE, T, [YMD], ([+\-]\d+(\.\d+)?)\}')">
                <xsl:variable name="sign">
                    <xsl:variable name="temp" select="replace($dateTime, '\$\{DATE, T, [YMD], (([+\-])\d+(\.\d+)?)\}.*', '$2')"/>
                    <xsl:choose>
                        <xsl:when test="string-length($temp) gt 0">
                            <xsl:value-of select="$temp"/>
                        </xsl:when>
                        <!-- default -->
                        <xsl:otherwise>+</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="amount">
                    <xsl:variable name="temp" select="replace($dateTime, '\$\{DATE, T, [YMD], ([+\-](\d+(\.\d+)?))\}.*', '$2')"/>
                    <xsl:choose>
                        <xsl:when test="string-length($temp) gt 0">
                            <xsl:value-of select="$temp"/>
                        </xsl:when>
                        <!-- default -->
                        <xsl:otherwise>0</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="yearMonthDay">
                    <xsl:variable name="temp" select="replace($dateTime, '\$\{DATE, T, ([YMD]), ([+\-](\d+(\.\d+)?))\}.*', '$1')"/>
                    <xsl:choose>
                        <xsl:when test="string-length($temp) gt 0">
                            <xsl:value-of select="$temp"/>
                        </xsl:when>
                        <!-- default -->
                        <xsl:otherwise>D</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="timePart" select="replace($dateTime, '\$\{DATE, T, ([YMD]), ([+\-](\d+(\.\d+)?))\}T(.+)[+\-].*', '$5')"/>
                <xsl:variable name="time">
                    <xsl:choose>
                        <xsl:when test="string-length($timePart) = 5">
                            <!-- time given in minutes, let's add 0 seconds -->
                            <xsl:value-of select="concat($timePart, ':00')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$timePart"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$dateT castable as xs:date">
                        <xsl:variable name="newDate" select="nf:calculate-t-date($dateTime, $dateT)"/>
                        <xsl:choose>
                            <xsl:when test="$newDate castable as xs:dateTime">
                                <!-- in an ada relative datetime the timezone is not permitted (or known), let's add the timezon -->
                                <xsl:value-of select="nf:add-Amsterdam-timezone-to-dateTimeString($newDate)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$newDate"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('T',$sign,$amount,$yearMonthDay)"/>
                        <xsl:if test="$time castable as xs:time">
                            <!-- Neglects timezone. Impact? -->
                            <xsl:value-of select="concat('{', $time, '}')"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!-- let's try if the input is HL7 date or dateTime, should not be since input is ada -->
                <xsl:variable name="newDateTime" select="replace(concat(normalize-space($dateTime), '00000000000000'), '^(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})', '$1-$2-$3T$4:$5:$6')"/>
                <xsl:variable name="newDate" select="replace(normalize-space($dateTime), '^(\d{4})(\d{2})(\d{2})', '$1-$2-$3')"/>
                <xsl:choose>
                    <xsl:when test="$newDateTime castable as xs:dateTime">
                        <xsl:value-of select="format-dateTime(xs:dateTime($newDateTime), $picture)"/>
                    </xsl:when>
                    <xsl:when test="$newDate castable as xs:date">
                        <xsl:value-of select="format-date(xs:date($newDateTime), '[Y0001]-[M01]-[D01]')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$dateTime"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Get the ada OID from FHIR System URI</xd:desc>
        <xd:param name="uri">input FHIR System URI</xd:param>
    </xd:doc>
    <xsl:function name="local:getOid" as="xs:string?">
        <xsl:param name="uri" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="$oidMap[@uri = $uri][@oid]">
                <xsl:value-of select="$oidMap[@uri = $uri]/@oid"/>
            </xsl:when>
            <xsl:when test="starts-with($uri,'urn:oid:')">
                <xsl:value-of select="substring-after($uri,'urn:oid:')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$uri"/>
                <xsl:message>WARNING: local:getOid() expects a FHIR System URI, but got "<xsl:value-of select="$uri"/>"</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Get the ada displayName from input OID</xd:desc>
        <xd:param name="oid">input OID from ada</xd:param>
    </xd:doc>
    <xsl:function name="local:getDisplayName" as="xs:string?">
        <xsl:param name="oid" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="$oidMap[@oid = $oid][@displayName]">
                <xsl:value-of select="$oidMap[@oid = $oid]/@displayName"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$oid"/>
                <xsl:message>WARNING: local:getDisplayName() expects an OID, but got "<xsl:value-of select="$oid"/>" OR cannot find the matching displayName</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Converts an UCUM unit as used in FHIR to ada time unit</xd:desc>
        <xd:param name="UCUMFHIR">The UCUM unit string</xd:param>
    </xd:doc>
    <xsl:function name="nf:convertTime_UCUM_FHIR2ADA_unit" as="xs:string?">
        <xsl:param name="UCUMFHIR" as="xs:string?"/>
        <xsl:if test="$UCUMFHIR">
            <xsl:choose>
                <xsl:when test="$UCUMFHIR = 's'"><xsl:value-of select="$ada-unit-second[1]"/></xsl:when>
                <xsl:when test="$UCUMFHIR = 'min'"><xsl:value-of select="$ada-unit-minute[1]"/></xsl:when>
                <xsl:when test="$UCUMFHIR = 'h'"><xsl:value-of select="$ada-unit-hour[1]"/></xsl:when>
                <xsl:when test="$UCUMFHIR = 'd'"><xsl:value-of select="$ada-unit-day[1]"/></xsl:when>
                <xsl:when test="$UCUMFHIR = 'wk'"><xsl:value-of select="$ada-unit-week[1]"/></xsl:when>
                <xsl:when test="$UCUMFHIR = 'mo'"><xsl:value-of select="$ada-unit-month[1]"/></xsl:when>
                <xsl:when test="$UCUMFHIR = 'a'"><xsl:value-of select="$ada-unit-year[1]"/></xsl:when>
                <!--<xsl:otherwise>
                    <!-\- If all else fails: wrap in {} to make it an annotation -\->
                    <xsl:value-of select="concat('{', $ADAtime, '}')"/>
                </xsl:otherwise>-->
            </xsl:choose>
        </xsl:if>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Remove comments</xd:desc>
    </xd:doc>
    <xsl:template match="comment()"/>
    
    <xd:doc>
        <xd:desc>Remove unhandled text nodes</xd:desc>
    </xd:doc>
    <xsl:template match="text()"/>
    
    <!--<xd:doc>
        <xd:desc>Identity transformation</xd:desc>
    </xd:doc>
    <xsl:template match="node()|@*" priority="-1">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xd:doc>
        <xd:desc>Throw process if an unhandled FHIR element is matched.</xd:desc>
    </xd:doc>
    <xsl:template match="f:*" mode="#all" priority="-1">
        <xsl:message terminate="yes">Unhandled FHIR element: <xsl:value-of select="local-name()"/></xsl:message>
    </xsl:template>-->
    
</xsl:stylesheet>