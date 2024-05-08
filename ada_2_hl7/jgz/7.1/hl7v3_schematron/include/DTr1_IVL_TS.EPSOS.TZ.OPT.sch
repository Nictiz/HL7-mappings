<?xml version="1.0" encoding="UTF-8"?>
<!-- 
:   Interval of Timestamp. SHALL be precise to the day, SHALL include a time zone if more precise than to the day, and SHOULD be precise to the second. 
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="IVL_TS.EPSOS.TZ.OPT">
   <extends rule="IVL_TS"/>
   <assert role="error"
           test="not(@value) or matches(@value,'^[0-9]{4}')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.EPSOS.TZ.OPT">dtr1-1-IVL_TS.EPSOS.TZ.OPT.TZ: time SHALL be precise to at least the year</assert>
   <assert role="warning"
           test="not(@value) or matches(@value,'^[0-9]{8}')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.EPSOS.TZ.OPT">dtr1-2-IVL_TS.EPSOS.TZ.OPT.TZ: time SHOULD be precise to the day</assert>
   <!--<assert role="error" test="not(matches(@value,'^[0-9]{8}')) or contains(@value,'+') or contains(@value,'-')" see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.EPSOS.TZ.OPT"
        >dtr1-3-IVL_TS.EPSOS.TZ.OPT: time SHALL include a time zone if more precise than to the day</assert>-->
   <assert role="error"
           test="not(hl7:low/@value) or hl7:low[matches(@value,'^[0-9]{4}')]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.EPSOS.TZ.OPT">dtr1-4-IVL_TS.EPSOS.TZ.OPT: low boundary SHALL be precise to at least the year</assert>
   <assert role="warning"
           test="not(hl7:low/@value) or hl7:low[matches(@value,'^[0-9]{8}')]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.EPSOS.TZ.OPT">dtr1-5-IVL_TS.EPSOS.TZ.OPT: low boundary SHOULD be precise to the day</assert>
   <!--<assert role="error" test="not(hl7:low[matches(@value,'^[0-9]{8}')]) or hl7:low[contains(@value,'+') or contains(@value,'-')]" see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.EPSOS.TZ.OPT"
        >dtr1-6-IVL_TS.EPSOS.TZ.OPT: low boundary SHALL include a time zone if more precise than to the day</assert>-->
   <assert role="error"
           test="not(hl7:center/@value) or hl7:center[matches(@value,'^[0-9]{4}')]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.EPSOS.TZ.OPT">dtr1-7-IVL_TS.EPSOS.TZ.OPT: center value SHALL be precise to at least the year</assert>
   <assert role="warning"
           test="not(hl7:center/@value) or hl7:center[matches(@value,'^[0-9]{8}')]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.EPSOS.TZ.OPT">dtr1-8-IVL_TS.EPSOS.TZ.OPT: center value SHOULD be precise to the day</assert>
   <!--<assert role="error" test="not(hl7:center[matches(@value,'^[0-9]{8}')]) or hl7:center[contains(@value,'+') or contains(@value,'-')]" see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.EPSOS.TZ.OPT"
        >dtr1-9-IVL_TS.EPSOS.TZ.OPT: center value SHALL include a time zone if more precise than to the day</assert>-->
   <assert role="error"
           test="not(hl7:high/@value) or hl7:high[matches(@value,'^[0-9]{4}')]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.EPSOS.TZ.OPT">dtr1-10-IVL_TS.EPSOS.TZ.OPT: high boundary SHALL be precise to at least the year</assert>
   <assert role="warning"
           test="not(hl7:high/@value) or hl7:high[matches(@value,'^[0-9]{8}')]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.EPSOS.TZ.OPT">dtr1-11-IVL_TS.EPSOS.TZ.OPT: high boundary SHOULD be precise to the day</assert>
   <!--<assert role="error" test="not(hl7:high[matches(@value,'^[0-9]{8}')]) or hl7:high[contains(@value,'+') or contains(@value,'-')]" see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_TS.EPSOS.TZ.OPT"
        >dtr1-12-IVL_TS.EPSOS.TZ.OPT: high boundary SHALL include a time zone if more precise than to the day</assert>-->
</rule>
