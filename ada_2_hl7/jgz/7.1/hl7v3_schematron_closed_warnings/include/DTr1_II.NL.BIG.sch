<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 - Instance Identifier, NL flavor BSN
:   II Flavor .NL The Netherlands .BIG  beroepen in de individuele gezondheidszorg (BIG) Nederland, fixed OID 2.16.528.1.1007.5.1
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="II.NL.BIG">
   <extends rule="II"/>
   <assert role="error"
           test="@nullFlavor or @root='2.16.528.1.1007.5.1'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II.NL.BIG">dtr1-1-II.NL.BIG: BIG-nummer @root MOET 2.16.528.1.1007.5.1 zijn indien niet null. Gevonden: "<value-of select="@root"/>"</assert>
</rule>
