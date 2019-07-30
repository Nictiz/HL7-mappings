<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:strip-space elements="*"/>

    <xd:doc>
        <xd:desc>Takes an inputTime as string and outputs the time in format '14:32' (24 hour clock, hoours and minutes only)</xd:desc>
        <xd:param name="in">xs:dateTime or xs:time castable string</xd:param>
        <xd:return>HH:mm or nothing</xd:return>
    </xd:doc>
    <xsl:function name="nf:datetime-2-timestring" as="xs:string?">
        <xsl:param name="in" as="xs:string?"/>

        <xsl:choose>
            <xsl:when test="$in castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime($in), '[H01]:[m01]')"/>
            </xsl:when>
            <xsl:when test="$in castable as xs:time">
                <xsl:value-of select="format-time(xs:time($in), '[H01]:[m01]')"/>
            </xsl:when>
            <xsl:otherwise>
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
        <xd:desc>Takes an xml date(time) as a string in inputDate and outputs the date in format '3 jun 2018'</xd:desc>
        <xd:param name="inputDate">xs:date castable string</xd:param>
    </xd:doc>
    <xsl:function name="nf:formatDate" as="xs:string?">
        <xsl:param name="inputDate" as="xs:string?"/>
        <xsl:variable name="date" select="substring($inputDate, 1, 10)"/>
        
        <!-- Normally you would use format-date() using Dutch language/country, but Saxon-He and Saxon-PE both misbehave and return English month names regardless
                e.g. format-date(xs:date('2019-03-21'), '[D01] [Mn,*-3] [Y0001]', 'nl', AD', 'NL') -->
        <xsl:if test="$date castable as xs:date">
            <xsl:variable name="xsdate" select="xs:date($date)" as="xs:date"/>
            <xsl:variable name="daynum" select="day-from-date($xsdate)" as="xs:integer"/>
            <xsl:variable name="monthnum" select="month-from-date($xsdate)" as="xs:integer"/>
            <xsl:variable name="yearnum" select="year-from-date($xsdate)" as="xs:integer"/>
            
            <xsl:value-of select="concat($daynum, ' ', nf:getDutchMonthName($monthnum, 3, 'low'), ' ', $yearnum)"/>
        </xsl:if>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Return Dutch month name from month number (1-12)</xd:desc>
        <xd:param name="monthnum">xs:integer month number e.g. from month-from-date()</xd:param>
        <xd:param name="length">Max length of the name to return. Default 3</xd:param>
        <xd:param name="case">Casing of the name to return. 'low' (default), 'high', 'firstcap'</xd:param>
    </xd:doc>
    <xsl:function name="nf:getDutchMonthName" as="xs:string?">
        <xsl:param name="monthnum" as="xs:integer?"/>
        <xsl:param name="length" as="xs:integer?"/>
        <xsl:param name="case" as="xs:string"/>
        
        <xsl:variable name="fullMonthName" as="xs:string?">
            <xsl:choose>
                <xsl:when test="$monthnum = 1">Januari</xsl:when>
                <xsl:when test="$monthnum = 2">Februari</xsl:when>
                <xsl:when test="$monthnum = 3">Maart</xsl:when>
                <xsl:when test="$monthnum = 4">April</xsl:when>
                <xsl:when test="$monthnum = 5">Mei</xsl:when>
                <xsl:when test="$monthnum = 6">Juni</xsl:when>
                <xsl:when test="$monthnum = 7">Juli</xsl:when>
                <xsl:when test="$monthnum = 8">Augustus</xsl:when>
                <xsl:when test="$monthnum = 9">September</xsl:when>
                <xsl:when test="$monthnum = 10">Oktober</xsl:when>
                <xsl:when test="$monthnum = 11">November</xsl:when>
                <xsl:when test="$monthnum = 12">December</xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="casedMonthName" as="xs:string?">
            <xsl:choose>
                <xsl:when test="$case = 'high'"><xsl:value-of select="upper-case($fullMonthName)"/></xsl:when>
                <xsl:when test="$case = 'firstcap'"><xsl:value-of select="$fullMonthName"/></xsl:when>
                <xsl:otherwise><xsl:value-of select="lower-case($fullMonthName)"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="string-length($casedMonthName) = 0"/>
            <xsl:when test="$length gt 0"><xsl:value-of select="substring($casedMonthName, 1, $length)"/></xsl:when>
            <xsl:otherwise><xsl:value-of select="$casedMonthName"/></xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Takes an inputTime as string or time and outputs the time in format ' 14:32' (24 hour clock)</xd:desc>
        <xd:param name="inputTime"/>
        <xd:param name="output0time">boolean to either output the time smaller than or equal to 00:00:29 or not. Default = true = output the zero-time</xd:param>
    </xd:doc>
    <xsl:function name="nf:formatTime" as="xs:string?">
        <xsl:param name="inputTime"/>
        <xsl:param name="output0time" as="xs:boolean?"/>
        <xsl:if test="$inputTime castable as xs:time">
            <xsl:choose>
                <xsl:when test="not(exists($output0time)) or $output0time">
                    <xsl:value-of select="format-time(xs:time($inputTime), ' [H01]:[m01]')"/>
                </xsl:when>
                <xsl:when test="xs:time($inputTime) gt xs:time('00:00:29')">
                    <xsl:value-of select="format-time(xs:time($inputTime), ' [H01]:[m01]')"/>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:function>

</xsl:stylesheet>
