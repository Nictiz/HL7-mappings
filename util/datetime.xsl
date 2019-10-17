<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:functx="http://www.functx.com" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xd:doc>
       <xd:desc>Contains some generic dateTime functions</xd:desc>
    </xd:doc>
   
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
                <!-- Since 1996 DST starts last sunday of March 02:00 and ends last sunday of October at 03:00/02:00 (clock is set backwards) -->
                <!-- There is one hour in october (from 02 - 03) for which we can't be sure if no timezone is provided in the input, 
                    we default to standard time (+01:00), the correct time will be represented if a timezone was in the input, 
                    otherwise we cannot know in which hour it occured (DST or standard time) -->
                <xsl:variable name="March21" select="xs:date(concat(year-from-dateTime($in), '-03-31'))"/>
                <xsl:variable name="DateTime-Start-SummerTime" select="xs:dateTime(concat(year-from-dateTime($in), '-03-', (31 - functx:day-of-week($March21)), 'T02:00:00Z'))"/>
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
        <xd:param name="inputDateT" as="xs:date">The T date</xd:param>
    </xd:doc>
    <xsl:function name="nf:calculate-t-date" as="xs:string">
        <xsl:param name="in" as="xs:string?"/>
        <xsl:param name="inputDateT" as="xs:date?"/>
        
        <xsl:choose>
            <xsl:when test="(string-length($in) gt 0) and exists($inputDateT)">
                <xsl:variable name="sign" select="replace($in, 'T([+\-]).*', '$1')"/>
                <xsl:variable name="amount" select="replace($in, 'T[+\-](\d+(\.\d+)?)[YMD].*', '$1')"/>
                <xsl:variable name="yearMonthDay" select="replace($in, 'T[+\-]\d+(\.\d+)?([YMD]).*', '$2')"/>
                <xsl:variable name="xsDurationString" select="replace($in, 'T[+\-](\d+(\.\d+)?)([YMD]).*', 'P$1$3')"/>
                <xsl:variable name="timePart" select="replace($in, 'T[+\-]\d+(\.\d+)?[YMD](\{(.*)})?', '$3')"/>
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
                <xsl:variable name="newDate">
                    <xsl:choose>
                        <xsl:when test="$sign = '-'">
                            <xsl:choose>
                                <xsl:when test="$yearMonthDay = ('Y', 'M')">
                                    <xsl:value-of select="xs:date($inputDateT) - xs:yearMonthDuration($xsDurationString)"/>
                                </xsl:when>
                                <xsl:when test="$yearMonthDay = 'D'">
                                    <xsl:value-of select="xs:date($inputDateT) - xs:dayTimeDuration($xsDurationString)"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when test="$sign = '+'">
                            <xsl:choose>
                                <xsl:when test="$yearMonthDay = ('Y', 'M')">
                                    <xsl:value-of select="xs:date($inputDateT) + xs:yearMonthDuration($xsDurationString)"/>
                                </xsl:when>
                                <xsl:when test="$yearMonthDay = 'D'">
                                    <xsl:value-of select="xs:date($inputDateT) + xs:dayTimeDuration($xsDurationString)"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="newDateTime">
                    <xsl:choose>
                        <xsl:when test="string-length($time) gt 0">
                            <xsl:value-of select="xs:dateTime(concat(format-date($newDate, '[Y0001]-[M01]-[D01]'), 'T', $time))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- we get a timezone, which is the current timezone of the system which does not make sense -->
                            <!-- so we strip the timezone -->
                            <xsl:value-of select="substring($newDate,1, 10)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:value-of select="$newDateTime"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- we cannot calculate anything -->
                <xsl:value-of select="$in"/>
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
            <xsl:value-of select="xs:integer((xs:date($date) - xs:date('1901-01-06')) div xs:dayTimeDuration('P1D')) mod 7"/>
        </xsl:if>
    </xsl:function>
</xsl:stylesheet>
