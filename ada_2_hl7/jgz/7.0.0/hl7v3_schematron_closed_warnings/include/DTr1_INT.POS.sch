<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 INT.POS - Integer, positive
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="INT.POS">
   <extends rule="INT"/>
   <assert role="error"
           test="@nullFlavor or @value &gt; 0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II.POS">dtr1-2-INT.POS: null or value &gt; 0</assert>
</rule>
