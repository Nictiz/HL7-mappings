<?xml version="1.0" encoding="UTF-8"?>
<!-- 
:   SHALL be precise to the year (YYYY), to the month (YYYYMM), to the day (YYYYMMDD) or precise to the second (YYYYMMDDhhmmss) without milliseconds.
:   SHALL include a time zone if more precise to the day (YYYYMMDDhhmmss[+/-]HHMM)
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="TS.AT.VAR">
   <extends rule="TS"/>
   <assert role="error"
           test="not(@value) or matches(@value,'^[0-9]{4}$') or matches(@value,'^[0-9]{6}$') or matches(@value,'^[0-9]{8}$') or matches(@value,'^[0-9]{14}[^\.]+')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TS.AT.TZ">dtr1-1-TS.AT.TZ: time if specified SHALL be precise to the year (YYYY), to the month (YYYYMM), to the day (YYYYMMDD) or precise to the second (YYYYMMDDhhmmss) without milliseconds. Found <value-of select="local-name()"/> "<value-of select="@value"/>"</assert>
   <let name="theTZ" value="replace(@value,'^-?[^+-]+([+-].*)?$','$1')"/>
   <assert role="error"
           test="not(@value) or matches(@value,'^[0-9]{0,8}$') or (not($theTZ = '' or $theTZ = @value))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TS.AT.TZ">dtr1-2-TS.AT.TZ: time SHALL include a time zone if more precise to the day (YYYYMMDDhhmmss[+/-]HHMM). Found <value-of select="local-name()"/> "<value-of select="@value"/>"</assert>
</rule>
