<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:functx="http://www.functx.com" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xd:doc>
        <xd:desc>Contains some generic dateTime functions</xd:desc>
    </xd:doc>
    <!-- Uncomment for testing... -->
    <!--<xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/" exclude-result-prefixes="#all">
        <xsl:variable name="T" select="current-date()" as="xs:date"/>
        <x T="{$T}">
            <xsl:text>&#10;   </xsl:text>
            <xsl:comment>just T</xsl:comment>
            <x in="T"><xsl:value-of select="nf:calculate-t-date('T',$T)"/></x>
            <x in="T-0D"><xsl:value-of select="nf:calculate-t-date('T-0D',$T)"/></x>
            <xsl:comment>a date</xsl:comment>
            <x in="2020-06-22"><xsl:value-of select="nf:calculate-t-date('2020-06-22',$T)"/></x>
            <xsl:comment>year based</xsl:comment>
            <x in="T-1Y{{12:34:56}}"><xsl:value-of select="nf:calculate-t-date('T-1Y{12:34:56}',$T)"/></x>
            <x in="T-2Y{{12:34}}"><xsl:value-of select="nf:calculate-t-date('T-2Y{12:34}',$T)"/></x>
            <x in="T-3Y{{12}}"><xsl:value-of select="nf:calculate-t-date('T-3Y{12}',$T)"/></x>
            <x in="T-4Y"><xsl:value-of select="nf:calculate-t-date('T-4Y',$T)"/></x>
            <xsl:comment>month based</xsl:comment>
            <x in="T-1M{{12:34:56}}"><xsl:value-of select="nf:calculate-t-date('T-1M{12:34:56}',$T)"/></x>
            <x in="T-2M{{12:34}}"><xsl:value-of select="nf:calculate-t-date('T-2M{12:34}',$T)"/></x>
            <x in="T-3M{{12}}"><xsl:value-of select="nf:calculate-t-date('T-3M{12}',$T)"/></x>
            <x in="T-4M"><xsl:value-of select="nf:calculate-t-date('T-4M',$T)"/></x>
            <xsl:comment>day based</xsl:comment>
            <x in="T-20D{{00:00:00}}"><xsl:value-of select="nf:calculate-t-date('T-20D{00:00:00}',$T)"/></x>
            <x in="T-1D{{12:34:56}}"><xsl:value-of select="nf:calculate-t-date('T-1D{12:34:56}',$T)"/></x>
            <x in="T-2D{{12:34}}"><xsl:value-of select="nf:calculate-t-date('T-2D{12:34}',$T)"/></x>
            <x in="T-3D{{12}}"><xsl:value-of select="nf:calculate-t-date('T-3D{12}',$T)"/></x>
            <x in="T-4D"><xsl:value-of select="nf:calculate-t-date('T-4D',$T)"/></x>
            <xsl:comment>year/month based</xsl:comment>
            <x in="T-1Y2M{{12:34:56}}"><xsl:value-of select="nf:calculate-t-date('T-1Y2M{12:34:56}',$T)"/></x>
            <x in="T-2Y2M{{12:34}}"><xsl:value-of select="nf:calculate-t-date('T-2Y2M{12:34}',$T)"/></x>
            <x in="T-3Y2M{{12}}"><xsl:value-of select="nf:calculate-t-date('T-3Y2M{12}',$T)"/></x>
            <x in="T-4Y2M"><xsl:value-of select="nf:calculate-t-date('T-4Y2M',$T)"/></x>
            <xsl:comment>year/day based</xsl:comment>
            <x in="T-1Y2D{{12:34:56}}"><xsl:value-of select="nf:calculate-t-date('T-1Y2D{12:34:56}',$T)"/></x>
            <x in="T-2Y2D{{12:34}}"><xsl:value-of select="nf:calculate-t-date('T-2Y2D{12:34}',$T)"/></x>
            <x in="T-3Y2D{{12}}"><xsl:value-of select="nf:calculate-t-date('T-3Y2D{12}',$T)"/></x>
            <x in="T-4Y2D"><xsl:value-of select="nf:calculate-t-date('T-3Y2D',$T)"/></x>
            <xsl:comment>month/day based</xsl:comment>
            <x in="T-1M2D{{12:34:56}}"><xsl:value-of select="nf:calculate-t-date('T-1M2D{12:34:56}',$T)"/></x>
            <x in="T-2M2D{{12:34}}"><xsl:value-of select="nf:calculate-t-date('T-2M2D{12:34}',$T)"/></x>
            <x in="T-3M2D{{12}}"><xsl:value-of select="nf:calculate-t-date('T-3M2D{12}',$T)"/></x>
            <x in="T-4M2D"><xsl:value-of select="nf:calculate-t-date('T-3M2D',$T)"/></x>
            <xsl:comment>year/month/day based</xsl:comment>
            <x in="T-1Y2M{{12:34:56}}"><xsl:value-of select="nf:calculate-t-date('T-1Y2M2D{12:34:56}',$T)"/></x>
            <x in="T-2Y2M{{12:34}}"><xsl:value-of select="nf:calculate-t-date('T-2Y2M2D{12:34}',$T)"/></x>
            <x in="T-3Y2M{{12}}"><xsl:value-of select="nf:calculate-t-date('T-3Y2M2D{12}',$T)"/></x>
            <x in="T-4Y2M2D"><xsl:value-of select="nf:calculate-t-date('T-5Y2M2D',$T)"/></x>
            <xsl:comment>illegal time (just produces date and logs error)</xsl:comment>
            <x in="T-1D{{24}}"><xsl:value-of select="nf:calculate-t-date('T-1D{25}',$T)"/></x>
        </x>
    </xsl:template>-->

    <xd:doc>
        <xd:desc>Takes input string. If it is a dateTime, it checks if it has a timezone. If it is a dateTime without timezone the appropriate Amsterdam timezone will be set. In all other cases, the input string is returned.</xd:desc>
        <xd:param name="in">ISO 8601 formatted dateTimeString with or without timezone "yyyy-mm-ddThh:mm:ss" or "yyyy-mm-ddThh:mm:ss[+/-]nn:nn"</xd:param>
    </xd:doc>
    <xsl:function name="nf:add-Amsterdam-timezone-to-dateTimeString" as="xs:string?">
        <xsl:param name="in" as="xs:string?"/>

        <xsl:choose>
            <xsl:when test="$in castable as xs:dateTime">
                <xsl:value-of select="nf:add-Amsterdam-timezone(xs:dateTime($in))"/>
            </xsl:when>
            <!-- http://hl7.org/fhir/STU3/datatypes.html#datetime
                If hours and minutes are specified, a time zone SHALL be populated. 
                Seconds must be provided due to schema type constraints but may be zero-filled and may be ignored. -->
            <xsl:when test="concat($in, ':00') castable as xs:dateTime">
                <xsl:value-of select="nf:add-Amsterdam-timezone(xs:dateTime(concat($in, ':00')))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$in"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Add an Amsterdam timezone to an xs:dateTime without one. Return input unaltered otherwise.</xd:desc>
        <xd:param name="in">xs:dateTime with or without timezone</xd:param>
    </xd:doc>
    <xsl:function name="nf:add-Amsterdam-timezone" as="xs:dateTime">
        <xsl:param name="in" as="xs:dateTime"/>

        <xsl:choose>
            <xsl:when test="empty(timezone-from-dateTime($in))">
                <!-- Since 1996 DST starts last Sunday of March 02:00 and ends last Sunday of October at 03:00/02:00 (clock is set backwards) -->
                <!-- There is one hour in october (from 02 - 03) for which we can't be sure if no timezone is provided in the input, 
                    we default to standard time (+01:00), the correct time will be represented if a timezone was in the input, 
                    otherwise we cannot know in which hour it occured (DST or standard time) -->
                <xsl:variable name="March31" select="xs:date(concat(year-from-dateTime($in), '-03-31'))"/>
                <xsl:variable name="DateTime-Start-SummerTime" select="xs:dateTime(concat(year-from-dateTime($in), '-03-', (31 - functx:day-of-week($March31)), 'T02:00:00Z'))"/>
                <xsl:variable name="October31" select="xs:date(concat(year-from-dateTime($in), '-10-31'))"/>
                <xsl:variable name="DateTime-End-SummerTime" select="xs:dateTime(concat(year-from-dateTime($in), '-10-', (31 - functx:day-of-week($October31)), 'T02:00:00Z'))"/>
                <xsl:choose>
                    <xsl:when test="$in ge $DateTime-Start-SummerTime and $in lt $DateTime-End-SummerTime">
                        <!--return UTC +2 in summer-->
                        <xsl:value-of select="adjust-dateTime-to-timezone($in, xs:dayTimeDuration('PT2H'))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!--return UTC +1 in winter -->
                        <xsl:value-of select="adjust-dateTime-to-timezone($in, xs:dayTimeDuration('PT1H'))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$in"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Converts a T-12D{12:34:56} like string into a proper XML date or dateTime</xd:desc>
        <xd:param name="in">The input string to be converted</xd:param>
        <xd:param name="inputDateT" as="xs:date">The T date (if applicable) that <xd:ref name="in" type="parameter"/> is relative to</xd:param>
    </xd:doc>
    <xsl:function name="nf:calculate-t-date" as="xs:string?">
        <xsl:param name="in" as="xs:string?"/>
        <xsl:param name="inputDateT" as="xs:date?"/>

        <xsl:choose>
            <xsl:when test="(starts-with($in, 'T') or starts-with($in, 'DOB')) and $inputDateT castable as xs:date">
                <xsl:variable name="sign" select="replace($in, '^(T|DOB)([+-])?.*', '$2')"/>
                <xsl:variable name="amountYearMonth" as="xs:string*">
                    <!--<x>
                        <x1>DOB</x1>
                        <x2>-</x2>
                        <x3>8Y</x3>
                        <x4>8</x4>
                        <x5/>
                        <x6>Y</x6>
                        <x7>7.5M</x7>
                        <x8>7</x8>
                        <x9>.5</x9>
                        <x10>M</x10>
                    </x>-->
                    <xsl:analyze-string select="$in" regex="^(T|DOB)([+\-])((\d+)(\.\d+)?([YM]))((\d+)(\.\d+)?([YM]))?">
                        <xsl:matching-substring>
                            <xsl:if test="regex-group(6) = regex-group(10)">
                                <xsl:message>Variable dateTime "<xsl:value-of select="$in"/>" found with duplicate specification of <xsl:value-of select="regex-group(6)"/></xsl:message>
                            </xsl:if>
                            
                            <!--<x1><xsl:value-of select="regex-group(1)"/></x1>
                            <x2><xsl:value-of select="regex-group(2)"/></x2>
                            <x3><xsl:value-of select="regex-group(3)"/></x3>
                            <x4><xsl:value-of select="regex-group(4)"/></x4>
                            <x5><xsl:value-of select="regex-group(5)"/></x5>
                            <x6><xsl:value-of select="regex-group(6)"/></x6>
                            <x7><xsl:value-of select="regex-group(7)"/></x7>
                            <x8><xsl:value-of select="regex-group(8)"/></x8>
                            <x9><xsl:value-of select="regex-group(9)"/></x9>
                            <x10><xsl:value-of select="regex-group(10)"/></x10>
                            <x11><xsl:value-of select="regex-group(11)"/></x11>
                            <x12><xsl:value-of select="regex-group(12)"/></x12>
                            <x13><xsl:value-of select="regex-group(13)"/></x13>
                            <x14><xsl:value-of select="regex-group(14)"/></x14>
                            <x15><xsl:value-of select="regex-group(15)"/></x15>
                            <x16><xsl:value-of select="regex-group(16)"/></x16>-->
                            
                            <!-- If someone sends in 7.5 year, recalculate into months. round into full months -->
                            <xsl:variable name="partMonth" as="xs:integer?">
                                <xsl:choose>
                                    <xsl:when test="regex-group(6) = 'Y' and regex-group(6) = regex-group(10) and regex-group(5) castable as xs:double and regex-group(9) castable as xs:double">
                                        <xsl:value-of select="round(12 * (xs:double(regex-group(5)) + xs:double(regex-group(9))))"/>
                                    </xsl:when>
                                    <xsl:when test="regex-group(6) = 'Y' and regex-group(6) = regex-group(10) and regex-group(5) castable as xs:double">
                                        <xsl:value-of select="round(12 * xs:double(regex-group(5)))"/>
                                    </xsl:when>
                                    <xsl:when test="regex-group(6) = 'Y' and regex-group(6) = regex-group(10) and regex-group(10) castable as xs:double">
                                        <xsl:value-of select="round(12 * xs:double(regex-group(10)))"/>
                                    </xsl:when>
                                    <xsl:when test="regex-group(6) = 'Y' and regex-group(5) castable as xs:double">
                                        <xsl:value-of select="round(12 * xs:double(regex-group(5)))"/>
                                    </xsl:when>
                                    <xsl:when test="regex-group(10) = 'Y' and regex-group(9) castable as xs:double">
                                        <xsl:value-of select="round(12 * xs:double(regex-group(9)))"/>
                                    </xsl:when>
                                    <xsl:otherwise>0</xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            
                            <!--<xsl:text>P</xsl:text>
                            <xsl:if test="regex-group(2) = '-'">
                                <xsl:value-of select="regex-group(2)"/>
                            </xsl:if>-->
                            <xsl:choose>
                                <xsl:when test="regex-group(6) = regex-group(10) and regex-group(6) = 'Y'">
                                    <xsl:value-of select="xs:integer(regex-group(4)) + xs:integer(regex-group(8))"/>
                                    <xsl:value-of select="regex-group(6)"/>
                                </xsl:when>
                                <xsl:when test="regex-group(6) = regex-group(10) and regex-group(6) = 'M'">
                                    <xsl:value-of select="xs:integer(regex-group(4)) + xs:integer(regex-group(8)) + $partMonth"/>
                                    <xsl:value-of select="regex-group(6)"/>
                                </xsl:when>
                                <xsl:when test="regex-group(6) = 'Y'">
                                    <!-- year count -->
                                    <xsl:value-of select="regex-group(4)"/>
                                    <!-- year marker -->
                                    <xsl:value-of select="regex-group(6)"/>
                                    <xsl:choose>
                                        <xsl:when test="regex-group(10) = 'M'">
                                            <!-- month count -->
                                            <xsl:value-of select="xs:integer(regex-group(8)) + $partMonth"/>
                                            <!-- month marker -->
                                            <xsl:text>M</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="$partMonth">
                                            <!-- month count -->
                                            <xsl:value-of select="$partMonth"/>
                                            <!-- month marker -->
                                            <xsl:text>M</xsl:text>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:when test="regex-group(10) = 'Y'">
                                    <!-- year count -->
                                    <xsl:value-of select="regex-group(8)"/>
                                    <!-- year marker -->
                                    <xsl:value-of select="regex-group(10)"/>
                                    <xsl:choose>
                                        <xsl:when test="regex-group(6) = 'M'">
                                            <!-- month count -->
                                            <xsl:value-of select="xs:integer(regex-group(4)) + $partMonth"/>
                                            <!-- month marker -->
                                            <xsl:text>M</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="$partMonth gt 0">
                                            <!-- month count -->
                                            <xsl:value-of select="$partMonth"/>
                                            <!-- month marker -->
                                            <xsl:text>M</xsl:text>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!-- month count -->
                                    <xsl:value-of select="xs:integer(regex-group(4)) + $partMonth"/>
                                    <!-- month marker -->
                                    <xsl:text>M</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:matching-substring>
                    </xsl:analyze-string>
                </xsl:variable>
                <xsl:variable name="amountDay" as="xs:string*">
                    <!--<x>
                        <x1>DOB</x1>
                        <x2>-</x2>
                        <x3>0.75Y</x3>
                        <x4>0</x4>
                        <x5>.75</x5>
                        <x6>Y</x6>
                        <x7>5.5M</x7>
                        <x8>5</x8>
                        <x9>.5</x9>
                        <x10>M</x10>
                        <x11>12D</x11>
                        <x12>12</x12>
                        <x13/>
                        <x14>D</x14>
                        <x15/>
                        <x16/>
                    </x>-->
                    <xsl:analyze-string select="$in" regex="^(T|DOB)([+\-])((\d+)(\.\d+)?([YM]))?((\d+)(\.\d+)?([YM]))?((\d+)(\.\d+)?(D))">
                        <xsl:matching-substring>
                            <!--<x1><xsl:value-of select="regex-group(1)"/></x1>
                            <x2><xsl:value-of select="regex-group(2)"/></x2>
                            <x3><xsl:value-of select="regex-group(3)"/></x3>
                            <x4><xsl:value-of select="regex-group(4)"/></x4>
                            <x5><xsl:value-of select="regex-group(5)"/></x5>
                            <x6><xsl:value-of select="regex-group(6)"/></x6>
                            <x7><xsl:value-of select="regex-group(7)"/></x7>
                            <x8><xsl:value-of select="regex-group(8)"/></x8>
                            <x9><xsl:value-of select="regex-group(9)"/></x9>
                            <x10><xsl:value-of select="regex-group(10)"/></x10>
                            <x11><xsl:value-of select="regex-group(11)"/></x11>
                            <x12><xsl:value-of select="regex-group(12)"/></x12>
                            <x13><xsl:value-of select="regex-group(13)"/></x13>
                            <x14><xsl:value-of select="regex-group(14)"/></x14>
                            <x15><xsl:value-of select="regex-group(15)"/></x15>
                            <x16><xsl:value-of select="regex-group(16)"/></x16>-->
                            
                            <!-- If someone sends in .5 month, recalculate into day. round into full day -->
                            <xsl:variable name="partDay" as="xs:integer?">
                                <xsl:choose>
                                    <xsl:when test="regex-group(6) = 'M' and regex-group(6) = regex-group(10) and regex-group(5) castable as xs:double and regex-group(9) castable as xs:double">
                                        <xsl:value-of select="round(30 * (xs:double(regex-group(5)) + xs:double(regex-group(9))))"/>
                                    </xsl:when>
                                    <xsl:when test="regex-group(6) = 'M' and regex-group(6) = regex-group(10) and regex-group(5) castable as xs:double">
                                        <xsl:value-of select="round(30 * xs:double(regex-group(5)))"/>
                                    </xsl:when>
                                    <xsl:when test="regex-group(6) = 'M' and regex-group(6) = regex-group(10) and regex-group(10) castable as xs:double">
                                        <xsl:value-of select="round(30 * xs:double(regex-group(10)))"/>
                                    </xsl:when>
                                    <xsl:when test="regex-group(6) = 'M' and regex-group(5) castable as xs:double">
                                        <xsl:value-of select="round(30 * xs:double(regex-group(5)))"/>
                                    </xsl:when>
                                    <xsl:when test="regex-group(10) = 'M' and regex-group(9) castable as xs:double">
                                        <xsl:value-of select="round(30 * xs:double(regex-group(9)))"/>
                                    </xsl:when>
                                    <xsl:otherwise>0</xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            
                            <xsl:choose>
                                <xsl:when test="regex-group(6) = 'D'">
                                    <!-- day count -->
                                    <xsl:value-of select="xs:integer(regex-group(4)) + $partDay"/>
                                    <!-- day marker -->
                                    <xsl:text>D</xsl:text>
                                </xsl:when>
                                <xsl:when test="regex-group(10) = 'D'">
                                    <!-- day count -->
                                    <xsl:value-of select="xs:integer(regex-group(8)) + $partDay"/>
                                    <!-- day marker -->
                                    <xsl:text>D</xsl:text>
                                </xsl:when>
                                <xsl:when test="regex-group(14) = 'D'">
                                    <!-- day count -->
                                    <xsl:value-of select="xs:integer(regex-group(12)) + $partDay"/>
                                    <!-- day marker -->
                                    <xsl:text>D</xsl:text>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:matching-substring>
                    </xsl:analyze-string>
                </xsl:variable>

                <xsl:variable name="timePart" as="xs:string?">
                    <xsl:analyze-string select="$in" regex="^(T|DOB)[^\{{]*\{{([^\}}]+)\}}">
                        <xsl:matching-substring>
                            <xsl:value-of select="regex-group(2)"/>
                        </xsl:matching-substring>
                    </xsl:analyze-string>
                </xsl:variable>
                <xsl:variable name="time" as="xs:string?">
                    <xsl:choose>
                        <xsl:when test="string-length($timePart) = 2">
                            <!-- time given in hours, let's add 0 minutes/seconds -->
                            <xsl:value-of select="concat($timePart, ':00:00')"/>
                        </xsl:when>
                        <xsl:when test="string-length($timePart) = 5">
                            <!-- time given in minutes, let's add 0 seconds -->
                            <xsl:value-of select="concat($timePart, ':00')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$timePart"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="calculatedYearMonth" as="xs:date">
                    <xsl:choose>
                        <xsl:when test="$sign = '+' and string-length(string-join($amountYearMonth, '')) gt 0">
                            <xsl:value-of select="$inputDateT + xs:yearMonthDuration(concat('P', string-join($amountYearMonth, '')))"/>
                        </xsl:when>
                        <xsl:when test="$sign = '-' and string-length(string-join($amountYearMonth, '')) gt 0">
                            <xsl:value-of select="$inputDateT - xs:yearMonthDuration(concat('P', string-join($amountYearMonth, '')))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:copy-of select="$inputDateT"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="calculatedDay" as="xs:date">
                    <xsl:choose>
                        <xsl:when test="$sign = '+' and string-length(string-join($amountDay, '')) gt 0">
                            <xsl:value-of select="$calculatedYearMonth + xs:dayTimeDuration(concat('P', string-join($amountDay, '')))"/>
                        </xsl:when>
                        <xsl:when test="$sign = '-' and string-length(string-join($amountDay, '')) gt 0">
                            <xsl:value-of select="$calculatedYearMonth - xs:dayTimeDuration(concat('P', string-join($amountDay, '')))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:copy-of select="$calculatedYearMonth"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                
                <xsl:if test="string-length($time) gt 0 and not($time castable as xs:time)">
                    <xsl:message>Variable dateTime "<xsl:value-of select="$in"/>" found with illegal time string "<xsl:value-of select="$timePart"/>"</xsl:message>
                </xsl:if>
                <xsl:variable name="calculatedDateTime">
                    <xsl:choose>
                        <xsl:when test="string-length($time) gt 0 and $time castable as xs:time">
                            <xsl:value-of select="xs:dateTime(concat(format-date($calculatedDay, '[Y0001]-[M01]-[D01]'), 'T', $time))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- we sometimes get a timezone, which is the current timezone of the system which does not make sense -->
                            <!-- so we strip the timezone -->
                            <xsl:value-of select="format-date($calculatedDay, '[Y0001]-[M01]-[D01]')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:value-of select="nf:add-Amsterdam-timezone-to-dateTimeString($calculatedDateTime)"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- we cannot calculate anything -->
                <xsl:value-of select="nf:add-Amsterdam-timezone-to-dateTimeString($in)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>


    <xd:doc>
        <xd:desc>Returns the xs:time from a xs:dateTime formatted string. Could include timezone.</xd:desc>
        <xd:param name="xs-datetime"/>
        <xd:return>xs:time or nothing</xd:return>
    </xd:doc>
    <xsl:function name="nf:getTime" as="xs:time?">
        <xsl:param name="xs-datetime" as="xs:string?"/>

        <xsl:if test="substring-after($xs-datetime, 'T') castable as xs:time">
            <xsl:value-of select="xs:time(substring-after($xs-datetime, 'T'))"/>
        </xsl:if>
    </xsl:function>


    <xd:doc>
        <xd:desc>Returns day of week of a certain date as integer. Sunday = 0, Saturday = 6.</xd:desc>
        <xd:param name="date">xs:date for which the day of week needs to be returned</xd:param>
    </xd:doc>
    <xsl:function name="functx:day-of-week" as="xs:integer?">
        <xsl:param name="date" as="xs:date?"/>
        
        <xsl:if test="not(empty($date))">
            <!--<xsl:variable name="ancientSunday" select="xs:date('1901-01-06')"/>-->
            <xsl:variable name="ancientSunday" select="xs:date('0001-01-07')"/>
            <xsl:choose>
              <xsl:when test="xs:date($date) ge $ancientSunday">
                    <xsl:value-of select="xs:integer((xs:date($date) - $ancientSunday) div xs:dayTimeDuration('P1D')) mod 7"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="xs:integer(($ancientSunday - xs:date($date)) div xs:dayTimeDuration('P1D')) mod 7"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>Returns YEAR, MONTH, DAY, HOUR, MINUTE, SECOND or MILLISECOND depending on input string. Empty input -> no output.</xd:desc>
        <xd:param name="in">input ada (vague) (relative) date(time)</xd:param>
    </xd:doc>
    <xsl:function name="nf:determine_date_precision_from_ada_datetime" as="xs:string?">
        <xsl:param name="in" as="xs:string?"/>
        <xsl:for-each select="string-length($in) gt 0">
            <xsl:choose>
                <xsl:when test="(starts-with($in, 'T') or starts-with($in, 'DOB'))">
                    <!-- a relative date -->
                    <!-- let's look if there is a time present -->
                    <xsl:variable name="timePart" select="
                        if (matches($in, '^(T|DOB)[^\{]*\{([^\}]+)\}')) then
                        replace($in, '^(T|DOB)[^\{]*\{([^\}]+)\}', '$2')
                        else
                        ()"/>
                    <xsl:choose>
                        <xsl:when test="string-length($timePart) = 2">
                            <!-- time given in hours -->
                            <xsl:value-of select="'HOUR'"/>
                        </xsl:when>
                        <xsl:when test="string-length($timePart) = 5">
                            <!-- time given in minutes, let's add 0 seconds -->
                            <xsl:value-of select="'MINUTE'"/>
                        </xsl:when>
                        <!-- no support for milliseconds in relative ada datetime -->
                        <xsl:otherwise>SECOND</xsl:otherwise>
                    </xsl:choose>                    
                </xsl:when>
                <!-- date or dateTime, which may be vague -->
                <xsl:when test="string-length($in) = 4">YEAR</xsl:when>
                <xsl:when test="string-length($in) = 7">MONTH</xsl:when>
                <xsl:when test="string-length($in) = 10">DAY</xsl:when>
                <xsl:when test="string-length($in) = 13">HOUR</xsl:when>
                <xsl:when test="string-length($in) = 16">MINUTE</xsl:when>
                <xsl:when test="string-length($in) = 19">SECOND</xsl:when>
                <xsl:when test="string-length($in) gt 19">MILLISECOND</xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>
</xsl:stylesheet>
