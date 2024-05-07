<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 SXCM_INT - Integer
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="SXCM_INT">
   <extends rule="INT"/>
   <assert role="error"
           test="not(@nullFlavor and @operator) or @operator = 'I'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXCM_INT">dtr1-1-SXCM_INT: not operator if null</assert>
</rule>
