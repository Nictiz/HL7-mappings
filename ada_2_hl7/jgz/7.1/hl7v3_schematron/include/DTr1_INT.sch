<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 INT - Integer
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="INT">
   <extends rule="QTY"/>
   <assert role="error"
           test="(@nullFlavor or @value or *) and not(@nullFlavor and @value)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_INT">dtr1-1-INT: null or value or child element in case of extension</assert>
   <assert role="error"
           test="not(hl7:uncertainty)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_INT">dtr1-2-INT: no uncertainty</assert>
</rule>
