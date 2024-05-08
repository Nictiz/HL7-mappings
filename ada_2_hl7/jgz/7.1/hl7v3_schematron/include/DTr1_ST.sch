<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 ST - String
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      abstract="true"
      id="ST">
   <extends rule="ED"/>
   <!--<assert role="error" test="not(hl7:translation) or hl7:thumbnail[not(hl7:translation)]" see="https://art-decor.org/mediawiki/index.php?title=DTr1_ST">dtr1-1-ST: no nested translations</assert>-->
   <!--<assert role="error" test="@nullFlavor or string-length(string-join(text(),''))>0" see="https://art-decor.org/mediawiki/index.php?title=DTr1_ST"
        >dtr1-1-ST: null or content</assert>-->
   <assert role="error"
           test="not(hl7:reference)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ST">dtr1-3-ST: no reference</assert>
   <assert role="error"
           test="not(hl7:thumbnail)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ST">dtr1-4-ST: no thumbnail</assert>
   <assert role="error"
           test="not(@representation) or @representation='TXT'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ST">dtr1-5-ST: @representation SHALL be 'TXT' if present.</assert>
   <assert role="error"
           test="not(@mediaType) or @mediaType='text/plain'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ST">dtr1-6-ST: @mediaType SHALL be 'text/plain' if present.</assert>
   <assert role="error"
           test="not(@compression)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ST">dtr1-7-ST: @compression SHALL NOT be used on ST.</assert>
   <assert role="error"
           test="not(@integrityCheck)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ST">dtr1-8-ST: @integrityCheck SHALL NOT be used on ST.</assert>
   <!-- SHA-1 is the XML schema default. Latest versions of Saxon 9.7.0.19 will assume this schema default if the instance doesn't carry it and bark even without the instance carrying the attribute. -->
   <assert role="error"
           test="not(@integrityCheckAlgorithm) or @integrityCheckAlgorithm = 'SHA-1'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ST">dtr1-9-ST: @integrityCheckAlgorithm SHALL NOT be used on ST.</assert>
</rule>
