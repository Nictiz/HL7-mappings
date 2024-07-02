<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 CE.IPS - Coded String with Equivalents
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="CE.IPS">
   <extends rule="CD.IPS"/>
   <assert role="error"
           test="not(hl7:qualifier)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD.IPS">dtr1-1-CE.IPS: cannot have qualifier</assert>
</rule>
