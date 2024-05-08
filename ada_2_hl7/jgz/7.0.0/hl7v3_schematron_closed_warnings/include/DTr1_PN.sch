<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 PN - Person Name
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="PN">
   <extends rule="EN"/>
   <assert role="error"
           test="not(*[tokenize(@qualifier,'\s')='LS'])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN">dtr1-1-PN: Person names SHALL NOT contain a name part qualified with 'LS' (Legal status for organizations)</assert>
</rule>
