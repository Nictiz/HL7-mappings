<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:functx="http://www.functx.com" xmlns:nf="http://www.nictiz.nl/functions"  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
   <xd:doc>
       <xd:desc>Contains some generic dateTime functions</xd:desc>
   </xd:doc>
    
    <xd:doc>
        <xd:desc>sets CET timezone, also taking into account Daylight Saving Time (DST)</xd:desc>
        <xd:param name="dateTimeIn">datetime without timezone for which to add timezone assuming it was generated in CET</xd:param>
    </xd:doc>
    <xsl:function name="nf:set-CET-timezone" as="xs:dateTime">
        <xsl:param name="dateTimeIn" as="xs:dateTime"/>
        <!-- Since 1996 DST starts last sunday of March 02:00 and ends last sunday of October at 03:00/02:00 (clock is set backwards) -->
        <!-- There is one hour in october (from 02 - 03) for which we can't be sure if no timezone is provided in the input, 
            we default to standard time (+01:00), the correct time will be represented if a timezone was in the input, 
            otherwise we cannot know in which hour it occured (DST or standard time) -->
        <xsl:variable name="maart31" select="xs:date(concat(year-from-dateTime($dateTimeIn), '-03-31'))"/>
        <xsl:variable name="datumtijd-start-zomertijd" select="xs:dateTime(concat(year-from-dateTime($dateTimeIn), '-03-', (31 - functx:day-of-week($maart31)), 'T02:00:00Z'))"/>
        <xsl:variable name="oktober31" select="xs:date(concat(year-from-dateTime($dateTimeIn), '-10-31'))"/>
        <xsl:variable name="datumtijd-eind-zomertijd" select="xs:dateTime(concat(year-from-dateTime($dateTimeIn), '-10-', (31 - functx:day-of-week($oktober31)), 'T02:00:00Z'))"/>
        <xsl:choose>
            <xsl:when test="$dateTimeIn ge $datumtijd-start-zomertijd and $dateTimeIn lt $datumtijd-eind-zomertijd">
                <!--return UTC +2 in summer-->
                <xsl:value-of select="adjust-dateTime-to-timezone($dateTimeIn, xs:dayTimeDuration('PT2H'))"/>
            </xsl:when>
            <xsl:otherwise>
                <!--return UTC +1 in winter -->
                <xsl:value-of select="adjust-dateTime-to-timezone($dateTimeIn, xs:dayTimeDuration('PT1H'))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xd:doc>
        <xd:desc>returns day of week of a certain date as integer. Sunday = 0, Saturday = 6.</xd:desc>
        <xd:param name="date">date for which the day of week needs to be returned</xd:param>
    </xd:doc>
    <xsl:function name="functx:day-of-week" as="xs:integer?">
        <xsl:param name="date" as="xs:anyAtomicType?"/>        
        <xsl:if test="not(empty($date))">
            <xsl:value-of select="xs:integer((xs:date($date) - xs:date('1901-01-06')) div xs:dayTimeDuration('P1D')) mod 7"/>
        </xsl:if>
    </xsl:function>
</xsl:stylesheet>
