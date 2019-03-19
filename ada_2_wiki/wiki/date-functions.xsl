<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:strip-space elements="*"/>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:datetime-2-timestring" as="xs:string?">
        <xsl:param name="in" as="xs:string?"/>

        <xsl:choose>
            <xsl:when test="$in castable as xs:dateTime">
                <xsl:value-of select="substring(substring-after($in, 'T'), 1, 5)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$in"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="xs-datetime"/>
    </xd:doc>
    <xsl:function name="nf:getTime" as="xs:time?">
        <xsl:param name="xs-datetime" as="xs:string?"/>

        <xsl:if test="substring-after($xs-datetime, 'T') castable as xs:time">
            <xsl:value-of select="xs:time(substring-after($xs-datetime, 'T'))"/>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>Takes an xml inputdate(time) as a string in inputDate and outputs the date in format '3 jun 2018'</xd:desc>
        <xd:param name="inputDate"/>
    </xd:doc>
    <xsl:function name="nf:formatDate" as="xs:string?">
        <xsl:param name="inputDate" as="xs:string?"/>
        <xsl:variable name="date" select="
                if ($inputDate) then
                    substring($inputDate, 1, 10)
                else
                    ()"/>
        <xsl:if test="$date castable as xs:date">
            <!-- Please note that with the HE Saxon version, only english output for format-date is supported (making the replace below obsolete,
		        the PE version however uses the localisation of your system, making sure Dutch output for March is 'mrt'
		        which may be my very personal preference over 'maa' (apologies), for all other months the first three characters are fine, but I don't like 'maa' -->
            <xsl:value-of select="replace(format-date(xs:date($date), '[D] [Mn,*-3] [Y]'), 'maa', 'mrt')"/>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>takes an inputTime as string or time and outputs the time in format '14:32'</xd:desc>
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
