<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 TEL - Telecommunication Address
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="TEL.NL.EXTENDED">
   <extends rule="URL.NL.EXTENDED"/>
   <assert role="error"
           test="not(@nullFlavor and hl7:usablePeriod)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TEL.NL.EXTENDED">dtr1-1-TEL.NL.EXTENDED: not null and usablePeriod</assert>
</rule>
