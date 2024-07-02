<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 TEL - Telecommunication Address
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="TEL">
   <extends rule="URL"/>
   <assert role="error"
           test="not(@nullFlavor and hl7:useablePeriod)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TEL">dtr1-1-TEL: not null and useablePeriod</assert>
</rule>
