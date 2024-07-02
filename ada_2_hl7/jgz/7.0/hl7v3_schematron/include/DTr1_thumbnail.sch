<?xml version="1.0" encoding="UTF-8"?>
<!--
    DTr1 thumbnail - Thumbnail on an ED datatype
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="thumbnail">
   <extends rule="ED"/>
   <assert role="error"
           test="not(@integrityCheck) or @integrityCheckAlgorithm"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_thumbnail">dtr1-2-thumbnail: integrityCheckAlgorithm required if integrityCheck</assert>
   <assert role="error"
           test="not(@nullFlavor and hl7:reference)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_thumbnail">dtr1-3-thumbnail: no reference if null</assert>
   <assert role="error"
           test="not(hl7:thumbnail)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_thumbnail">dtr1-4-thumbnail: thumbnails do not have thumbnails</assert>
   <assert role="error"
           test="(@compression and (hl7:reference/@value or (@representation='B64' and text()))) or not(@compression)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_thumbnail">dtr1-5-thumbnail: compression only on binary</assert>
   <assert role="error"
           test="not(@value) or (@value and (not(@mediaType) or @mediaType='text/plain'))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_thumbnail">dtr1-6-thumbnail: value implies mediaType is text/plain</assert>
   <assert role="error"
           test="not(hl7:reference[@validTimeLow or @validTimeHigh or @updateMode])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_thumbnail">dtr1-7-thumbnail: no history or updateMode</assert>
   <assert role="error"
           test="not(@value or xml) or not(@charset)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_thumbnail">dtr1-8-thumbnail: no charset for value or xml</assert>
   <assert role="error"
           test="not(@nullFlavor and @mediaType) or @mediaType = 'text/plain'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_thumbnail">dtr1-10-thumbnail: no mediaType if null</assert>
   <assert role="error"
           test="not(@nullFlavor and @charset)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_thumbnail">dtr1-11-thumbnail: no charset if null</assert>
   <assert role="error"
           test="not(@nullFlavor and @language)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_thumbnail">dtr1-12-thumbnail: no language if null</assert>
   <assert role="error"
           test="not(@nullFlavor and @compression)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_thumbnail">dtr1-13-thumbnail: no compression if null</assert>
   <assert role="error"
           test="not(@nullFlavor and @integrityCheck)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_thumbnail">dtr1-14-thumbnail: no integrityCheck if null</assert>
   <assert role="error"
           test="not(@nullFlavor and @integrityCheckAlgorithm) or @integrityCheckAlgorithm = 'SHA-1'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_thumbnail">dtr1-15-thumbnail: no integrityCheckAlgorithm if null</assert>
</rule>
