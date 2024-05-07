<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 TS.DATE.MIN - Timestamp
:   TS Flavor .DATE.MIN, shall be at least YYYYMMDD
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="TS.DATE.MIN">
   <extends rule="TS"/>
   <assert role="error"
           test="@nullFlavor or matches(@value, '^[0-9]{8,8}')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TS.DATE.MIN">dtr1-1-TS.DATE.MIN: null or date precision of time stamp shall be at least YYYYMMDD.</assert>
</rule>
