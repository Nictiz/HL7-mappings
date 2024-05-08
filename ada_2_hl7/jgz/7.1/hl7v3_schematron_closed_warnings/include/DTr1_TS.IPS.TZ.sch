<?xml version="1.0" encoding="UTF-8"?>
<!-- 
:   SHALL be precise to the day, SHALL include a time zone if more precise than to the day, and SHOULD be precise to the second. 
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="TS.IPS.TZ"
      see="https://art-decor.org/mediawiki/index.php/DTr1_TS.IPS.TZ">
   <extends rule="TS"/>
   <assert role="error"
           test="not(@value) or matches(@value,'^[0-9]{8}')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TS.IPS.TZ">dtr1-1-TS.IPS.TZ: time SHALL be precise to the day</assert>
   <assert role="warning"
           test="not(@value) or matches(@value,'^[0-9]{14}')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TS.IPS.TZ">dtr1-2-TS.IPS.TZ: time SHOULD be precise to the second</assert>
   <assert role="error"
           test="not(matches(@value,'^[0-9]{10}')) or contains(@value,'+') or contains(@value,'-')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TS.IPS.TZ">dtr1-3-TS.IPS.TZ: time SHALL include a time zone if more precise than to the day</assert>
</rule>
