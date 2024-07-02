<?xml version="1.0" encoding="UTF-8"?>
<!-- 
:   SHALL be precise to the day, SHALL include a time zone if more precise than to the day 
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="TS.CH.TZ">
   <extends rule="TS"/>
   <assert role="error"
           test="@nullFlavor or matches(@value,'^[0-9]{4}$|^[0-9]{6}$|^[0-9]{8}$') or contains(@value,'+') or contains(@value,'-')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TS.CH.TZ">dtr1-1-TS.CH.TZ: time SHALL include a time zone if more precise than to the day</assert>
</rule>
