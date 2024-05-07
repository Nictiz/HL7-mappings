<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 PQ - Physical Quantity
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="PQ">
   <extends rule="QTY"/>
   <assert role="error"
           test="(@nullFlavor or @value or *) and not(@nullFlavor and @value)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PQ">dtr1-1-PQ: null or value or child element in case of extension</assert>
   <!--
    <assert role="error" test="not(@nullFlavor) or (@nullFlavor and not(hl7:translation))" see="https://art-decor.org/mediawiki/index.php?title=DTr1_PQ"
        >dtr1-2-PQ: no translation if null</assert>
    -->
   <let name="translations"
        value=".//hl7:translation/concat(@value,@code,@codeSystem)"/>
   <assert role="error"
           test="count($translations)=count(distinct-values($translations))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PQ">dtr1-3-PQ: [RIM-002] translations SHALL be distinct</assert>
</rule>
