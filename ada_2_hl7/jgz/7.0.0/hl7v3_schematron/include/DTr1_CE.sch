<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 CE - Coded String with Equivalents
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="CE">
   <extends rule="CD"/>
   <assert role="error"
           test="not(hl7:qualifier)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CE">dtr1-1-CE: cannot have qualifier</assert>
</rule>
