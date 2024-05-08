<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 PQ - Physical Quantity
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="hl7nl-PQ">
   <extends rule="QTY"/>
   <assert role="error"
           test="(@nullFlavor or @value or *) and not(@nullFlavor and @value)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PQ">DTr2-1-hl7nl-PQ: null or value or child element in case of extension</assert>
   <!--
    <assert role="error" test="not(@nullFlavor) or (@nullFlavor and not(hl7:translation))" see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PQ"
        >DTr2-2-hl7nl-PQ: no translation if null</assert>
    -->
   <assert role="error"
           test="not(@value and hl7nl:uncertainRange)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PQ">DTr2-3-hl7nl-PQ: not @value and uncertainRange</assert>
   <assert role="error"
           test="@nullFlavor or @value or hl7nl:uncertainRange"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PQ">DTr2-4-hl7nl-PQ: @nullFlavor or @value or uncertainRange</assert>
   <let name="translations"
        value=".//hl7:translation/concat(@value,@code,@codeSystem)"/>
   <assert role="error"
           test="count($translations)=count(distinct-values($translations))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PQ">DTr2-5-hl7nl-PQ: [RIM-002] translations SHALL be distinct</assert>
</rule>
