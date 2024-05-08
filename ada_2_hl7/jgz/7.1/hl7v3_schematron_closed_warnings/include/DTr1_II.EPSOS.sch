<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 - Instance Identifier
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="II.EPSOS">
   <extends rule="II"/>
   <assert role="error"
           test="not(@root) or string-length(@root) &lt;= 64"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II.EPSOS">dtr1-1-II.EPSOS: @root SHALL NOT exceed 64 characters</assert>
</rule>
