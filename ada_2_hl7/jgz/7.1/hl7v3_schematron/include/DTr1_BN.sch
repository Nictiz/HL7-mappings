<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 BN - Boolean not Null
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="BN"
      see="https://art-decor.org/mediawiki/index.php?title=DTr1_BN">
   <extends rule="ANY"/>
   <assert role="error" test="not(@nullFlavor)">dtr1-1-BN: cannot have null</assert>
</rule>
