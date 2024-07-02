<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 TS.DATETIME.MIN - Timestamp
:   TS Flavor .DATETIME.MIN, shall be at least YYYYMMDDhhmmss
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="TS.DATETIME.MIN">
   <extends rule="TS"/>
   <assert role="error"
           test="@nullFlavor or matches(@value, '^[0-9]{14,14}')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TS.DATETIME.MIN">dtr1-1-TS.DATETIME.MIN: null or date precision of time stamp shall be at least YYYYMMDDhhmmss.</assert>
</rule>
