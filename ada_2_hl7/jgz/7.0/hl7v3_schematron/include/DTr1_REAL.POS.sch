<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 REAL.POS - Real Positive
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="REAL.POS">
   <extends rule="REAL"/>
   <assert role="error"
           test="@nullFlavor or @value &gt; 0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_REAL.POS">dtr1-1-REAL.POS: null or value &gt; 0</assert>
</rule>
