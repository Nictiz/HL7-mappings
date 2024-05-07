<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    AD.EPSOS - Address
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="AD.EPSOS">
   <extends rule="AD"/>
   <assert role="error"
           test="@nullFlavor or hl7:*"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.EPSOS">dtr1-1-AD.EPSOS: if addr is not null at least one sub element has to be provided</assert>
</rule>
