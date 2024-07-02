<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 INT - Integer
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      xmlns:hl7nl="urn:hl7-nl:v3"
      abstract="true"
      id="hl7nl-INT">
   <extends rule="QTY"/>
   <assert role="error"
           test="(@nullFlavor or @value or *) and not(@nullFlavor and @value)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:INT">DTr2-1-hl7nl-INT: null or value or child element in case of extension</assert>
   <assert role="error"
           test="not(hl7nl:uncertainty)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:INT">DTr2-2-hl7nl-INT: no uncertainty</assert>
   <assert role="error"
           test="not(@value and hl7nl:uncertainRange)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:INT">DTr2-3-hl7nl-INT: not @value and uncertainRange</assert>
   <assert role="error"
           test="@nullFlavor or @value or hl7nl:uncertainRange"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:INT">DTr2-4-hl7nl-INT: @nullFlavor or @value or uncertainRange</assert>
</rule>
