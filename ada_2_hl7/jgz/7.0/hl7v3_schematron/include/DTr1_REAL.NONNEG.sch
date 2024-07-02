<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 REAL.NONNEG - Real Not Negative
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="REAL.NONNEG">
   <extends rule="REAL"/>
   <assert role="error"
           test="@nullFlavor or @value &gt;= 0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_REAL.NONNEG">dtr1-1-REAL.NONNEG: null or value &gt;= 0</assert>
</rule>
