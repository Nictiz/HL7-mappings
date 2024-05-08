<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 - Instance Identifier, AT flavor BLZ
:   II Flavor .AT Austria .BLZ Bankleitzahl (BLZ) Österreich, fixed OID 1.2.40.0.34.4.13
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="II.AT.BLZ">
   <extends rule="II"/>
   <assert role="error"
           test="@nullFlavor or @root = '1.2.40.0.34.4.13'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II.AT.BLZ">dtr1-1-II.AT.BLZ: @root SHALL be 1.2.40.0.34.4.13 if not null</assert>
</rule>
