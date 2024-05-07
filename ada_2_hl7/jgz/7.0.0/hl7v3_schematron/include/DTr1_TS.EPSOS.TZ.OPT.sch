<?xml version="1.0" encoding="UTF-8"?>
<!-- 
:   SHALL be precise at least to the year, SHOULD be precise to the day, and MAY omit time zone.
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="TS.EPSOS.TZ.OPT"
      see="https://art-decor.org/mediawiki/index.php/DTr1_TS.EPSOS.TZ.OPT">
   <extends rule="TS"/>
   <assert role="error"
           test="not(@value) or matches(@value,'^[0-9]{4}')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TS.EPSOS.TZ.OPT">dtr1-1-TS.EPSOS.TZ.OPT: time SHALL be precise to at least the year</assert>
   <assert role="warning"
           test="not(@value) or matches(@value,'^[0-9]{8}')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TS.EPSOS.TZ.OPT">dtr1-2-TS.EPSOS.TZ.OPT: time SHOULD be precise to the day</assert>
</rule>
