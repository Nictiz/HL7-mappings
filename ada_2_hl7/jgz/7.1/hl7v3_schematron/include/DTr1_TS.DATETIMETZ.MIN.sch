<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 TS.DATETIMETZ.MIN - Timestamp
:   TS Flavor .DATETIMETZ.MIN, shall be at least YYYYMMDDhhmmss[+-]nnnn
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="TS.DATETIMETZ.MIN">
   <extends rule="TS"/>
   <assert role="error"
           test="@nullFlavor or matches(@value, '^[0-9]{14,14}(\.\d*)?[+-]\d{4}$')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TS.DATETIMETZ.MIN">dtr1-1-TS.DATETIMETZ.MIN: null or date precision of time stamp shall be at least YYYYMMDDhhmmss[+-]nnnn where [+-]nnnn is the timezone.</assert>
</rule>
