<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 CO - Coded Ordinal
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="CO">
   <extends rule="CV"/>
   <assert role="error"
           test="not(hl7:translation)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CO">dtr1-1-CO: cannot have translation</assert>
</rule>
