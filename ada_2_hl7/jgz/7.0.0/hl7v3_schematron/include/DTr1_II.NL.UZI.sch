<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 - Instance Identifier, NL flavor UZI
:   II Flavor .NL The Netherlands .UZI  Nederland, fixed OID 2.16.528.1.1007.3.1 (person) or 2.16.528.1.1007.3.2 (system)
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="II.NL.UZI">
   <extends rule="II"/>
   <assert role="error"
           test="@nullFlavor or @root='2.16.528.1.1007.3.1' or @root='2.16.528.1.1007.3.2'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II.NL.UZI">dtr1-1-II.NL.UZI: UZI-nummer @root MOET 2.16.528.1.1007.3.1 (Personen) of 2.16.528.1.1007.3.2 (Systemen) zijn indien niet null. Gevonden: "<value-of select="@root"/>"</assert>
   <assert role="error"
           test="not(@root='2.16.528.1.1007.3.1') or matches(@extension,'^[0-9]{9}$')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II.NL.UZI">dtr1-2-II.NL.UZI: UZI-nummer persoon MOET 9 cijfers lang zijn. Gevonden: "<value-of select="@extension"/>"</assert>
   <assert role="error"
           test="not(@root='2.16.528.1.1007.3.2') or matches(@extension,'^[0-9]{9}$')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II.NL.UZI">dtr1-3-II.NL.UZI: UZI-nummer systeem MOET 9 cijfers lang zijn. Gevonden: "<value-of select="@extension"/>"</assert>
</rule>
