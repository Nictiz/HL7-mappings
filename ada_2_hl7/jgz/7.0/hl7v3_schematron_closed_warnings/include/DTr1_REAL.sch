<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 REAL - Real
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="REAL">
   <extends rule="QTY"/>
   <assert role="error"
           test="(@nullFlavor or @value or *) and not(@nullFlavor and @value)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_REAL">dtr1-1-REAL: null or value or child element in case of extension</assert>
</rule>
