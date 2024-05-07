<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 TS - Timestamp
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      abstract="true"
      id="TS">
   <extends rule="QTY"/>
   <assert role="error"
           test="(@nullFlavor or @value or *) and not(@nullFlavor and @value)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TS">dtr1-1-TS: null or value or child element in case of extension</assert>
   <let name="theTS" value="@value"/>
   <let name="theBC" value="if (starts-with($theTS,'-')) then '-' else ()"/>
   <let name="theTZ" value="replace($theTS,'^-?[^+-]+([+-]\d{1,4})?$','$1')"/>
   <let name="theTZh"
        value="if (string-length($theTZ) gt 0) then substring(concat($theTZ, '0000'), 1, 3) else ()"/>
   <let name="theTZm"
        value="if (string-length($theTZ) gt 0) then substring(concat($theTZ, '0000'), 4, 2) else ()"/>
   <let name="theBaseTS" value="replace($theTS,'^-?([^+-]+)([+-].*)?','$1')"/>
   <let name="theCentury"
        value="if (substring($theBaseTS,1,2) castable as xs:integer) then substring($theBaseTS,1,2) else ()"/>
   <let name="theYear"
        value="if (substring($theBaseTS,3,2) castable as xs:integer) then substring($theBaseTS,3,2) else ()"/>
   <let name="theMonth"
        value="if (substring($theBaseTS,5,2) castable as xs:integer) then substring($theBaseTS,5,2) else ()"/>
   <let name="theDay"
        value="if (substring($theBaseTS,7,2) castable as xs:integer) then substring($theBaseTS,7,2) else ()"/>
   <let name="theHour"
        value="if (substring($theBaseTS,9,2) castable as xs:integer) then substring($theBaseTS,9,2) else ()"/>
   <let name="theMinute"
        value="if (substring($theBaseTS,11,2) castable as xs:integer) then substring($theBaseTS,11,2) else ()"/>
   <let name="theSecond"
        value="if (substring($theBaseTS,13,2) castable as xs:integer) then substring($theBaseTS,13,2) else ()"/>
   <let name="theSubSecond"
        value="if (substring($theBaseTS,16) castable as xs:integer) then substring($theBaseTS,15) else ()"/>
   <let name="cCentury"
        value="if (empty($theCentury)) then '00' else $theCentury"/>
   <let name="cYear" value="if (empty($theYear)) then '00' else $theYear"/>
   <let name="cMonth" value="if (empty($theMonth)) then '01' else $theMonth"/>
   <let name="cDay" value="if (empty($theDay)) then '01' else $theDay"/>
   <let name="cHour" value="if (empty($theHour)) then '00' else $theHour"/>
   <let name="cMinute" value="if (empty($theMinute)) then '00' else $theMinute"/>
   <let name="cSecond" value="if (empty($theSecond)) then '00' else $theSecond"/>
   <let name="cTZ" value="string-join(($theTZh, $theTZm),':')"/>
   <let name="theTSString"
        value="string-join(($theBC,$theCentury,$theYear,$theMonth,$theDay,$theHour,$theMinute,$theSecond,$theSubSecond,$theTZ),'')"/>
   <let name="theDateTime"
        value="concat($theBC,$cCentury,$cYear,'-',$cMonth,'-',$cDay,'T',$cHour,':',$cMinute,':',$cSecond,$theSubSecond,$cTZ)"/>
   <assert role="error"
           test="empty($theTS) or ($theTS=$theTSString and $theDateTime castable as xs:dateTime)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TS">dtr1-2-TS: <value-of select="local-name()"/> "<value-of select="$theTS"/>" is not a valid timestamp.</assert>
</rule>
