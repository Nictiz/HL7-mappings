<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:f="http://hl7.org/fhir"
    xmlns:nf="http://www.nictiz.nl/functions" xmlns:nwf="http://www.nictiz.nl/wiki-functions"
    exclude-result-prefixes="xs math xd f nf nwf" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Aug 25, 2022</xd:p>
            <xd:p><xd:b>Author:</xd:b> helma</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <xsl:import href="../util/constants.xsl"/>
    <xsl:import href="../util/utilities.xsl"/>
    <xsl:import href="../util/datetime.xsl"/>
    <xsl:import href="../util/mp-functions.xsl"/>
    <xsl:import href="../ada_2_fhir/fhir/2_fhir_fhir_include.xsl"/>
    <xsl:import href="../ada_2_fhir-r4/fhir/2_fhir_fhir_include.xsl"/>
    <xsl:output indent="yes" omit-xml-declaration="yes"/>

    <xsl:variable name="dateT" select="xs:date('2022-01-01')"/>

    <xd:doc>
        <xd:desc>main template</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Replace uuid with a fixed value for id</xd:desc>
    </xd:doc>
    <xsl:template
        match="f:id[matches(@value, '[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}')]">
        <id value="urn:uuid:hetzelfde" xmlns="http://hl7.org/fhir"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Replace DUMMY with a fixed value for id</xd:desc>
    </xd:doc>
    <xsl:template match="f:id[matches(@value, 'DUMMY')]">
        <id value="urn:uuid:hetzelfde" xmlns="http://hl7.org/fhir"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Replace uuid with a fixed value for fullUrl</xd:desc>
    </xd:doc>
    <xsl:template match="f:fullUrl[matches(@value, '^urn:uuid:.*$')]">
        <fullUrl value="urn:uuid:hetzelfde" xmlns="http://hl7.org/fhir"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Replace uuid with a fixed value for reference</xd:desc>
    </xd:doc>
    <xsl:template match="f:reference[matches(@value, '^urn:uuid:.*$')]">
        <reference value="urn:uuid:hetzelfde" xmlns="http://hl7.org/fhir"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Replace Patient/id with a fixed value</xd:desc>
    </xd:doc>
    <xsl:template match="f:entry/f:resource/f:Patient/f:id">
        <id value="hetzelfde"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Replace RelatedPerson/id with a fixed value</xd:desc>
    </xd:doc>
    <xsl:template match="f:entry/f:resource/f:RelatedPerson/f:id">
        <id value="hetzelfde"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Fix template dates</xd:desc>
    </xd:doc>
    <xsl:template match="f:*[matches(@value, '\$\{DATE, T, [YMD], ([+\-]\d+(\.\d+)?)\}')]">
        <!-- <xsl:variable name="element_name" select="QName(namespace-uri(.), local-name(.))"/> -->
        <xsl:variable name="element_name" select="node-name(.)"/>
        <xsl:variable name="calculated_date">
            <xsl:call-template name="format2ADADate">
                <xsl:with-param name="dateTime" select="@value"/>
                <xsl:with-param name="precision" select="DAY"/>
                <xsl:with-param name="dateT">
                    <xsl:value-of select="$dateT"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:variable>

        <xsl:element name="{$element_name}" xmlns="http://hl7.org/fhir">
            <xsl:attribute name="value" select="$calculated_date"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Fix generated text</xd:desc>
    </xd:doc>
    <xsl:template
        match="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/ext-RenderedDosageInstruction']">
        <xsl:choose>
            <xsl:when test="matches(f:valueString/@value, '.*T\s?([+-])?.*?(dag)?.*,')">

                <xsl:variable name="dosage">
                    <xsl:variable name="tmp" select="tokenize(./f:valueString/@value, ',')"/>
                    <xsl:for-each select="$tmp">
                        <xsl:choose>
                            <xsl:when test="matches(., 'Vanaf .*')">
                                <xsl:value-of select="''"/>                                
                            </xsl:when>
                            <xsl:when test="matches(., '^\s?gedurende .*')">
                                <xsl:value-of select="''"/>
                            </xsl:when>
                            <xsl:when test="matches(., '\s?tot en met .*')">
                                <xsl:value-of select="''"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="."/>
                                <xsl:if test="position() &lt; last()">
                                    <xsl:value-of select="','"/>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="startValue">
                    <xsl:variable name="tmp">
                        <xsl:choose>
                            <xsl:when test="parent::. = 'MedicationRequest'">
                                <xsl:value-of select="../f:extension/f:valuePeriod/f:start/@value"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:call-template name="format2ADADate">
                        <xsl:with-param name="dateTime"
                            select="$tmp"/>
                        <xsl:with-param name="dateT" select="$dateT"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="endValue" as="xs:string">
                    <xsl:choose>
                        <xsl:when test="exists(../f:extension/f:valuePeriod/f:end)">
                            <xsl:call-template name="format2ADADate">
                                <xsl:with-param name="dateTime"
                                    select="../f:extension/f:valuePeriod/f:end/@value"/>
                                <xsl:with-param name="dateT" select="$dateT"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="''"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="tmp">
                    <xsl:call-template name="nf:periode-string">
                        <xsl:with-param name="start-date" select="$startValue"/>
                        <xsl:with-param name="end-date" select="$endValue"/>
                        <xsl:with-param name="periode" select="../f:extension/f:valuePeriod/f:extension/f:valueDuration/f:value"/>
                        <xsl:with-param name="periode-unit" select="../f:extension/f:valuePeriod/f:extension/f:valueDuration/f:unit"/>                            
                        <xsl:with-param name="dateT" select="$dateT"/>
                    </xsl:call-template>
                </xsl:variable>
                <extension
                    url="http://nictiz.nl/fhir/StructureDefinition/ext-RenderedDosageInstruction"
                    xmlns="http://hl7.org/fhir">
                    <valueString value="{$tmp},{$dosage}"/>
                </extension>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Formats FHIR date(Time) or ada normal or relativeDate(time) based on input
            precision</xd:desc>
        <xd:param name="dateTime">Input FHIR date(Time)</xd:param>
        <xd:param name="precision">Determines the precision of the output. Precision of minutes
            outputs seconds as '00'</xd:param>
        <xd:param name="dateT">Optional parameter. The T-date for which a relativeDate must be
            calculated. If not given a Touchstone like parameterised string is outputted</xd:param>
    </xd:doc>
    <xsl:template name="format2ADADate">
        <xsl:param name="dateTime" as="xs:string?"/>
        <xsl:param name="precision">second</xsl:param>
        <xsl:param name="dateT" as="xs:date"/>

        <xsl:variable name="picture" as="xs:string?">
            <xsl:choose>
                <xsl:when test="upper-case($precision) = ('DAY', 'DAG', 'DAYS', 'DAGEN', 'D')"
                    >[Y0001]-[M01]-[D01]</xsl:when>
                <xsl:when
                    test="upper-case($precision) = ('MINUTE', 'MINUUT', 'MINUTES', 'MINUTEN', 'MIN', 'M')"
                    >[Y0001]-[M01]-[D01]T[H01]:[m01]:00[Z]</xsl:when>
                <xsl:otherwise>[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01][Z]</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="normalize-space($dateTime) castable as xs:dateTime">
                <xsl:value-of
                    select="format-dateTime(xs:dateTime(nf:add-Amsterdam-timezone-to-dateTimeString(normalize-space($dateTime))), $picture)"
                />
            </xsl:when>
            <xsl:when test="concat(normalize-space($dateTime), ':00') castable as xs:dateTime">
                <xsl:value-of
                    select="format-dateTime(xs:dateTime(nf:add-Amsterdam-timezone-to-dateTimeString(concat(normalize-space($dateTime), ':00'))), $picture)"
                />
            </xsl:when>
            <xsl:when test="normalize-space($dateTime) castable as xs:date">
                <xsl:value-of
                    select="format-date(xs:date(normalize-space($dateTime)), '[Y0001]-[M01]-[D01]')"
                />
            </xsl:when>
            <!-- there may be a relative date(time) like "${DATE, T, D, -20}T12:34:45+02:00" in the input -->
            <xsl:when test="matches($dateTime, '\$\{DATE, T, [YMD], ([+\-]\d+(\.\d+)?)\}')">
                <xsl:variable name="sign">
                    <xsl:variable name="temp"
                        select="replace($dateTime, '\$\{DATE, T, [YMD], (([+\-])\d+(\.\d+)?)\}.*', '$2')"/>
                    <xsl:choose>
                        <xsl:when test="string-length($temp) gt 0">
                            <xsl:value-of select="$temp"/>
                        </xsl:when>
                        <!-- default -->
                        <xsl:otherwise>+</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="amount">
                    <xsl:variable name="temp"
                        select="replace($dateTime, '\$\{DATE, T, [YMD], ([+\-](\d+(\.\d+)?))\}.*', '$2')"/>
                    <xsl:choose>
                        <xsl:when test="string-length($temp) gt 0">
                            <xsl:value-of select="$temp"/>
                        </xsl:when>
                        <!-- default -->
                        <xsl:otherwise>0</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="yearMonthDay">
                    <xsl:variable name="temp"
                        select="replace($dateTime, '\$\{DATE, T, ([YMD]), ([+\-](\d+(\.\d+)?))\}.*', '$1')"/>
                    <xsl:choose>
                        <xsl:when test="string-length($temp) gt 0">
                            <xsl:value-of select="$temp"/>
                        </xsl:when>
                        <!-- default -->
                        <xsl:otherwise>D</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="timePart"
                    select="replace($dateTime, '\$\{DATE, T, ([YMD]), ([+\-](\d+(\.\d+)?))\}T(.+)[+\-].*', '$5')"/>
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
                <xsl:variable name="templateDate">
                    <xsl:value-of select="concat('T', $sign, $amount, $yearMonthDay)"/>
                    <xsl:if test="$time castable as xs:time">
                        <!-- Neglects timezone. Impact? -->
                        <xsl:value-of select="concat('{', $time, '}')"/>
                    </xsl:if>

                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$dateT castable as xs:date">
                        <xsl:variable name="newDate"
                            select="nf:calculate-t-date($templateDate, $dateT)"/>
                        <xsl:choose>
                            <xsl:when test="$newDate castable as xs:dateTime">
                                <!-- in an ada relative datetime the timezone is not permitted (or known), let's add the timezon -->
                                <xsl:value-of
                                    select="nf:add-Amsterdam-timezone-to-dateTimeString($newDate)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$newDate"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$templateDate"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!-- let's try if the input is HL7 date or dateTime, should not be since input is ada -->
                <xsl:variable name="newDateTime"
                    select="replace(concat(normalize-space($dateTime), '00000000000000'), '^(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})', '$1-$2-$3T$4:$5:$6')"/>
                <xsl:variable name="newDate"
                    select="replace(normalize-space($dateTime), '^(\d{4})(\d{2})(\d{2})', '$1-$2-$3')"/>
                <xsl:choose>
                    <xsl:when test="$newDateTime castable as xs:dateTime">
                        <xsl:value-of select="format-dateTime(xs:dateTime($newDateTime), $picture)"
                        />
                    </xsl:when>
                    <xsl:when test="$newDate castable as xs:date">
                        <xsl:value-of
                            select="format-date(xs:date($newDateTime), '[Y0001]-[M01]-[D01]')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$dateTime"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Outputs a human readable string for a period with a possible start, duration, end
            date. The actual dates may be replaced by a configurable "T"-date with an addition of
            subtraction of a given number of days.</xd:desc>
        <xd:param name="start-date">start date of the period</xd:param>
        <xd:param name="periode">duration of the period</xd:param>
        <xd:param name="periode-unit">unit of the period</xd:param>
        <xd:param name="end-date">end date of the period</xd:param>
        <xd:param name="dateT">Optional parameter. The T-date for which a relativeDate must be
            calculated. If not given a Touchstone like parameterised string is outputted</xd:param>
    </xd:doc>
    <xsl:template name="nf:periode-string" as="xs:string?">
        <xsl:param name="start-date"/>
        <xsl:param name="periode"/>
        <xsl:param name="periode-unit"/>
        <xsl:param name="end-date"/>
        <xsl:param name="dateT"/>

        <xsl:variable name="waarde" as="xs:string*">
            <xsl:if test="$start-date">Vanaf <xsl:value-of
                    select="nf:formatDate(nf:calculate-t-date($start-date, $dateT))"/></xsl:if>
            <xsl:if test="$start-date and ($periode/@value or $end-date)">
                <xsl:value-of select="', '"/>
            </xsl:if>
            <xsl:if test="$periode/@value">gedurende <xsl:value-of
                    select="concat($periode/@value, ' ', nwf:unit-string($periode/@value, $periode-unit/@value))"
                /></xsl:if>
            <xsl:if test="$end-date"> tot en met <xsl:value-of
                    select="nf:formatDate(nf:calculate-t-date($end-date, $dateT))"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="normalize-space(string-join($waarde, ''))"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>fall-back template to copy everything that is not changed</xd:desc>
    </xd:doc>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
