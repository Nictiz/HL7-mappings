<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 IVL_TS - Interval of Timestamp
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      abstract="true"
      id="hl7nl-IVL_TS">
   <extends rule="SXCM_TS"/>
   <!--<assert role="error" test="(@nullFlavor and not(@value|@unit|hl7:*)) or (not(@nullFlavor) and (@value|hl7:*))" see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS"
        >DTr2-1-hl7nl-IVL_TS: null violation. Cannot have @nullFlavor and @value or child elements, or the other way around</assert>-->
   <assert role="error"
           test="not(descendant-or-self::*[@nullFlavor and (@value|@unit|hl7:low|hl7:center|hl7:high|hl7:width)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">DTr2-2-hl7nl-IVL_TS: null violation. Cannot have @nullFlavor and @value or other child elements</assert>
   <assert role="error"
           test="not(@value and hl7:*)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">DTr2-3-hl7nl-IVL_TS: co-occurence violation. Cannot have @value and other child elements</assert>
   <!-- unsure where this rule comes from KH 2016-07-22
    <assert role="error" test="@nullFlavor or descendant-or-self::*[@value]" see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS"
        >dtr1-4-1-IVL_TS: co-occurence violation. Must have @nullFlavor or @value or child elements with @value</assert>
        -->
   <assert role="error"
           test="not(@value and (hl7:low|hl7:center|hl7:high|hl7:width))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">dtr1-4-2-IVL_TS: co-occurence violation. Cannot have @value and child elements</assert>
   <assert role="error"
           test="not(hl7:center and (hl7:low|hl7:high|hl7:width))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">dtr1-4-3-IVL_TS: co-occurence violation. Cannot have center and other elements</assert>
   <assert role="error"
           test="not(hl7:width and hl7:low and hl7:high)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">dtr1-4-4-IVL_TS: co-occurence violation. Cannot have width and have both low and high elements</assert>
   <assert role="error"
           test="not(hl7:*[@updateMode])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">DTr2-5-hl7nl-IVL_TS: no updateMode on IVL attributes</assert>
   <assert role="error"
           test="not(hl7:low/@value = hl7:high/@value)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">DTr2-6-hl7nl-IVL_TS: low/@value must not be equal to high/@value</assert>
   <!-- width has datatype PQR, which extends CV ((){1}(((0[1-9])|([12]\d)|(3[01]))?)?)? -->
   <assert role="error"
           test="not(hl7:width[@unit][not(@value)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">dtr1-1-PQR: width element: no unit without value</assert>
   <assert role="error"
           test="not(hl7:width/hl7:translation)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">dtr1-2-PQR: width element: no translation</assert>
   <assert role="error"
           test="not(hl7:low[@nullFlavor='PINF'])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">dtr1-7-1-IVL_TS: low must be lower than or equal to high. Found low boundary PINF (Positive Infinity)</assert>
   <assert role="error"
           test="not(hl7:high[@nullFlavor='NINF'])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">dtr1-7-2-IVL_TS: low must be lower than or equal to high. Found high boundary NINF (Negative Infinity)</assert>
   <!-- for width only us (microseconds),	ms (milliseconds),	s (seconds), min (minute), h (hours), d (day), wk (week), mo (month) and a (year) are allowed.
    -->
   <let name="tum" value="'^(us|ms|s|min|h|d|wk|mo|a|)$'"/>
   <assert role="error"
           test="matches(hl7:width/@unit, $tum)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">DTr2-8-hl7nl-IVL_TS: for width only us (microseconds), ms (milliseconds), s (seconds), min (minute), h (hours), d (day), wk (week), mo (month) or a (year) are allowed</assert>
   <let name="theTSLow" value="hl7:low/@value"/>
   <let name="theBCLow"
        value="if (starts-with($theTSLow,'-')) then '-' else ()"/>
   <let name="theTZLow" value="replace($theTSLow,'-?[^+-]+([+-].*)?$','$1')"/>
   <let name="theTZhLow"
        value="if (string-length($theTZLow)&gt;0) then substring($theTZLow,1,3) else ()"/>
   <let name="theTZmLow"
        value="if (string-length($theTZLow)&gt;3) then substring($theTZLow,4) else ()"/>
   <let name="theBaseTSLow"
        value="replace($theTSLow,'^-?([^+-]+)([+-].*)?','$1')"/>
   <let name="theCenturyLow"
        value="if (substring($theBaseTSLow,1,2) castable as xs:integer) then substring($theBaseTSLow,1,2) else ()"/>
   <let name="theYearLow"
        value="if (substring($theBaseTSLow,3,2) castable as xs:integer) then substring($theBaseTSLow,3,2) else ()"/>
   <let name="theMonthLow"
        value="if (substring($theBaseTSLow,5,2) castable as xs:integer) then substring($theBaseTSLow,5,2) else ()"/>
   <let name="theDayLow"
        value="if (substring($theBaseTSLow,7,2) castable as xs:integer) then substring($theBaseTSLow,7,2) else ()"/>
   <let name="theHourLow"
        value="if (substring($theBaseTSLow,9,2) castable as xs:integer) then substring($theBaseTSLow,9,2) else ()"/>
   <let name="theMinuteLow"
        value="if (substring($theBaseTSLow,11,2) castable as xs:integer) then substring($theBaseTSLow,11,2) else ()"/>
   <let name="theSecondLow"
        value="if (substring($theBaseTSLow,13,2) castable as xs:integer) then substring($theBaseTSLow,13,2) else ()"/>
   <let name="theSubSecondLow"
        value="if (substring($theBaseTSLow,16) castable as xs:integer) then substring($theBaseTSLow,15) else ()"/>
   <let name="cCenturyLow"
        value="if (empty($theCenturyLow)) then '00' else $theCenturyLow"/>
   <let name="cYearLow"
        value="if (empty($theYearLow)) then '00' else $theYearLow"/>
   <let name="cMonthLow"
        value="if (empty($theMonthLow)) then '01' else $theMonthLow"/>
   <let name="cDayLow" value="if (empty($theDayLow)) then '01' else $theDayLow"/>
   <let name="cHourLow"
        value="if (empty($theHourLow)) then '00' else $theHourLow"/>
   <let name="cMinuteLow"
        value="if (empty($theMinuteLow)) then '00' else $theMinuteLow"/>
   <let name="cSecondLow"
        value="if (empty($theSecondLow)) then '00' else $theSecondLow"/>
   <let name="cTZLow" value="string-join(($theTZhLow,$theTZmLow),':')"/>
   <let name="theTSStringLow"
        value="string-join(($theBCLow,$theCenturyLow,$theYearLow,$theMonthLow,$theDayLow,$theHourLow,$theMinuteLow,$theSecondLow,$theSubSecondLow,$theTZLow),'')"/>
   <let name="theLowDateTime"
        value="concat($theBCLow,$cCenturyLow,$cYearLow,'-',$cMonthLow,'-',$cDayLow,'T',$cHourLow,':',$cMinuteLow,':',$cSecondLow,$theSubSecondLow,$cTZLow)"/>
   <assert role="error"
           test="empty($theTSLow) or ($theTSLow=$theTSStringLow and $theLowDateTime castable as xs:dateTime)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">DTr2-9-hl7nl-IVL_TS: <value-of select="local-name()"/>/low "<value-of select="$theTSLow"/>" is not a valid timestamp.</assert>
   <let name="theTSCenter" value="hl7:center/@value"/>
   <let name="theBCCenter"
        value="if (starts-with($theTSCenter,'-')) then '-' else ()"/>
   <let name="theTZCenter"
        value="replace($theTSCenter,'-?[^+-]+([+-].*)?$','$1')"/>
   <let name="theTZhCenter"
        value="if (string-length($theTZCenter)&gt;0) then substring($theTZCenter,1,3) else ()"/>
   <let name="theTZmCenter"
        value="if (string-length($theTZCenter)&gt;3) then substring($theTZCenter,4) else ()"/>
   <let name="theBaseTSCenter"
        value="replace($theTSCenter,'^-?([^+-]+)([+-].*)?','$1')"/>
   <let name="theCenturyCenter"
        value="if (substring($theBaseTSCenter,1,2) castable as xs:integer) then substring($theBaseTSCenter,1,2) else ()"/>
   <let name="theYearCenter"
        value="if (substring($theBaseTSCenter,3,2) castable as xs:integer) then substring($theBaseTSCenter,3,2) else ()"/>
   <let name="theMonthCenter"
        value="if (substring($theBaseTSCenter,5,2) castable as xs:integer) then substring($theBaseTSCenter,5,2) else ()"/>
   <let name="theDayCenter"
        value="if (substring($theBaseTSCenter,7,2) castable as xs:integer) then substring($theBaseTSCenter,7,2) else ()"/>
   <let name="theHourCenter"
        value="if (substring($theBaseTSCenter,9,2) castable as xs:integer) then substring($theBaseTSCenter,9,2) else ()"/>
   <let name="theMinuteCenter"
        value="if (substring($theBaseTSCenter,11,2) castable as xs:integer) then substring($theBaseTSCenter,11,2) else ()"/>
   <let name="theSecondCenter"
        value="if (substring($theBaseTSCenter,13,2) castable as xs:integer) then substring($theBaseTSCenter,13,2) else ()"/>
   <let name="theSubSecondCenter"
        value="if (substring($theBaseTSCenter,16) castable as xs:integer) then substring($theBaseTSCenter,15) else ()"/>
   <let name="cCenturyCenter"
        value="if (empty($theCenturyCenter)) then '00' else $theCenturyCenter"/>
   <let name="cYearCenter"
        value="if (empty($theYearCenter)) then '00' else $theYearCenter"/>
   <let name="cMonthCenter"
        value="if (empty($theMonthCenter)) then '01' else $theMonthCenter"/>
   <let name="cDayCenter"
        value="if (empty($theDayCenter)) then '01' else $theDayCenter"/>
   <let name="cHourCenter"
        value="if (empty($theHourCenter)) then '00' else $theHourCenter"/>
   <let name="cMinuteCenter"
        value="if (empty($theMinuteCenter)) then '00' else $theMinuteCenter"/>
   <let name="cSecondCenter"
        value="if (empty($theSecondCenter)) then '00' else $theSecondCenter"/>
   <let name="cTZCenter" value="string-join(($theTZhCenter,$theTZmCenter),':')"/>
   <let name="theTSStringCenter"
        value="string-join(($theBCCenter,$theCenturyCenter,$theYearCenter,$theMonthCenter,$theDayCenter,$theHourCenter,$theMinuteCenter,$theSecondCenter,$theSubSecondCenter,$theTZCenter),'')"/>
   <let name="theCenterDateTime"
        value="concat($theBCCenter,$cCenturyCenter,$cYearCenter,'-',$cMonthCenter,'-',$cDayCenter,'T',$cHourCenter,':',$cMinuteCenter,':',$cSecondCenter,$theSubSecondCenter,$cTZCenter)"/>
   <assert role="error"
           test="empty($theTSCenter) or ($theTS=$theTSStringCenter and $theCenterDateTime castable as xs:dateTime)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">DTr2-9-hl7nl-IVL_TS: <value-of select="local-name()"/>/center "<value-of select="$theTSCenter"/>" is not a valid timestamp.</assert>
   <let name="theTSHigh" value="hl7:high/@value"/>
   <let name="theBCHigh"
        value="if (starts-with($theTSHigh,'-')) then '-' else ()"/>
   <let name="theTZHigh" value="replace($theTSHigh,'-?[^+-]+([+-].*)?$','$1')"/>
   <let name="theTZhHigh"
        value="if (string-length($theTZHigh)&gt;0) then substring($theTZHigh,1,3) else ()"/>
   <let name="theTZmHigh"
        value="if (string-length($theTZHigh)&gt;3) then substring($theTZHigh,4) else ()"/>
   <let name="theBaseTSHigh"
        value="replace($theTSHigh,'^-?([^+-]+)([+-].*)?','$1')"/>
   <let name="theCenturyHigh"
        value="if (substring($theBaseTSHigh,1,2) castable as xs:integer) then substring($theBaseTSHigh,1,2) else ()"/>
   <let name="theYearHigh"
        value="if (substring($theBaseTSHigh,3,2) castable as xs:integer) then substring($theBaseTSHigh,3,2) else ()"/>
   <let name="theMonthHigh"
        value="if (substring($theBaseTSHigh,5,2) castable as xs:integer) then substring($theBaseTSHigh,5,2) else ()"/>
   <let name="theDayHigh"
        value="if (substring($theBaseTSHigh,7,2) castable as xs:integer) then substring($theBaseTSHigh,7,2) else ()"/>
   <let name="theHourHigh"
        value="if (substring($theBaseTSHigh,9,2) castable as xs:integer) then substring($theBaseTSHigh,9,2) else ()"/>
   <let name="theMinuteHigh"
        value="if (substring($theBaseTSHigh,11,2) castable as xs:integer) then substring($theBaseTSHigh,11,2) else ()"/>
   <let name="theSecondHigh"
        value="if (substring($theBaseTSHigh,13,2) castable as xs:integer) then substring($theBaseTSHigh,13,2) else ()"/>
   <let name="theSubSecondHigh"
        value="if (substring($theBaseTSHigh,16) castable as xs:integer) then substring($theBaseTSHigh,15) else ()"/>
   <let name="cCenturyHigh"
        value="if (empty($theCenturyHigh)) then '00' else $theCenturyHigh"/>
   <let name="cYearHigh"
        value="if (empty($theYearHigh)) then '00' else $theYearHigh"/>
   <let name="cMonthHigh"
        value="if (empty($theMonthHigh)) then '01' else $theMonthHigh"/>
   <let name="cDayHigh"
        value="if (empty($theDayHigh)) then '01' else $theDayHigh"/>
   <let name="cHourHigh"
        value="if (empty($theHourHigh)) then '00' else $theHourHigh"/>
   <let name="cMinuteHigh"
        value="if (empty($theMinuteHigh)) then '00' else $theMinuteHigh"/>
   <let name="cSecondHigh"
        value="if (empty($theSecondHigh)) then '00' else $theSecondHigh"/>
   <let name="cTZHigh" value="string-join(($theTZhHigh,$theTZmHigh),':')"/>
   <let name="theTSStringHigh"
        value="string-join(($theBCHigh,$theCenturyHigh,$theYearHigh,$theMonthHigh,$theDayHigh,$theHourHigh,$theMinuteHigh,$theSecondHigh,$theSubSecondHigh,$theTZHigh),'')"/>
   <let name="theHighDateTime"
        value="concat($theBCHigh,$cCenturyHigh,$cYearHigh,'-',$cMonthHigh,'-',$cDayHigh,'T',$cHourHigh,':',$cMinuteHigh,':',$cSecondHigh,$theSubSecondHigh,$cTZHigh)"/>
   <assert role="error"
           test="empty($theTSHigh) or ($theTSHigh=$theTSStringHigh and $theHighDateTime castable as xs:dateTime)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:IVL_TS">DTr2-9-hl7nl-IVL_TS: <value-of select="local-name()"/>/high "<value-of select="$theTSHigh"/>" is not a valid timestamp.</assert>
</rule>
