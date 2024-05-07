<?xml version="1.0" encoding="UTF-8"?>
<!-- 
:   Interval of Timestamp. SHALL be precise to the day, SHALL include a time zone if more precise than to the day 
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="IVL_TS.CH.TZ">
   <extends rule="IVL_TS"/>
   <assert role="error"
           test="not(@value) or (matches(@value,'^[0-9]{4}$|^[0-9]{6}$|^[0-9]{8}$') or contains(@value,'+') or contains(@value,'-'))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.CH.TZ">dtr1-1-IVL_TS.CH.TZ: time value SHALL include a time zone if more precise than to the day</assert>
   <assert role="error"
           test="not(hl7:low/@value) or (matches(hl7:low/@value,'^[0-9]{4}$|^[0-9]{6}$|^[0-9]{8}$') or contains(hl7:low/@value,'+') or contains(hl7:low/@value,'-'))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.CH.TZ">dtr1-2-IVL_TS.CH.TZ: time low value SHALL include a time zone if more precise than to the day</assert>
   <assert role="error"
           test="not(hl7:center/@value) or (matches(hl7:center/@value,'^[0-9]{4}$|^[0-9]{6}$|^[0-9]{8}$') or contains(hl7:center/@value,'+') or contains(hl7:center/@value,'-'))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.CH.TZ">dtr1-3-IVL_TS.CH.TZ: time center value SHALL include a time zone if more precise than to the day</assert>
   <assert role="error"
           test="not(hl7:high/@value) or (matches(hl7:high/@value,'^[0-9]{4}$|^[0-9]{6}$|^[0-9]{8}$') or contains(hl7:high/@value,'+') or contains(hl7:high/@value,'-'))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.CH.TZ">dtr1-4-IVL_TS.CH.TZ: time high value SHALL include a time zone if more precise than to the day</assert>
</rule>
