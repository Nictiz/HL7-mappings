<?xml version="1.0" encoding="UTF-8"?>
<!-- 
:   Implementatiehandleiding HL7v3 Basiscomponenten, v2.2 - Datatype 1.0 MO - Monetary Amount
    Status: in behandeling
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="MO">
   <extends rule="QTY"/>
   <assert role="error"
           test="(@nullFlavor or (@value and @currency) or *) and not(@nullFlavor and @value)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_MO">dtr1-1-MO: null or value or child element in case of extension</assert>
</rule>
