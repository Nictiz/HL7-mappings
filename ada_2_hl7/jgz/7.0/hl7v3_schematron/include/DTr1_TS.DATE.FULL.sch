<?xml version="1.0" encoding="UTF-8"?>
<!-- 
:   TS Flavor .DATE.FULL, shall contain reference to a particular day, format YYYYMMDD
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="TS.DATE.FULL">
   <extends rule="TS"/>
   <assert role="error"
           test="@nullFlavor or matches(@value, '^[0-9]{8,8}$')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TS.DATE.FULL">dtr1-1-TS.DATE.FULL: null or date precision of time stamp shall be YYYYMMDD.</assert>
</rule>
