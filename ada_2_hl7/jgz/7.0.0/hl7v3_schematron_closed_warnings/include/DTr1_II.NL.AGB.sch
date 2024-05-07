<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 - Instance Identifier, NL flavor AGB
:   II Flavor .NL The Netherlands .AGB  Nederland, fixed OID 2.16.840.1.113883.2.4.6.1
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="II.NL.AGB">
   <extends rule="II"/>
   <assert role="error"
           test="@nullFlavor or @root='2.16.840.1.113883.2.4.6.1'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II.NL.AGB">dtr1-1-II.NL.AGB: AGB-code @root MOET 2.16.840.1.113883.2.4.6.1 zijn indien niet null. Gevonden: "<value-of select="@root"/>"</assert>
   <assert role="error"
           test="not(@root='2.16.840.1.113883.2.4.6.1') or matches(@extension,'^[0-9]{8}$')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II.NL.AGB">dtr1-2-II.NL.AGB: AGB-code moet 8 cijfers lang zijn. Gevonden: "<value-of select="@extension"/>"</assert>
</rule>
