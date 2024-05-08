<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 PIVL_TS - Periodic Interval of Timestamp
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="PIVL_TS">
   <extends rule="SXCM_TS"/>
   <assert role="error"
           test="count(hl7:*[self::hl7:phase or self::hl7:period][@updateMode])=0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PIVL_TS">dtr1-1-PIVL_TS: Datatype PIVL_TS: no updateMode on PIVL attributes</assert>
   <assert role="error"
           test="descendant-or-self::hl7:*[(@nullFlavor and not(@value|@unit|*)) or (not(@nullFlavor) and (@value|@unit|*))]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PIVL_TS">dtr1-2-PIVL_TS: null violation. Cannot have @nullFlavor and @value or child elements, or the other way round</assert>
   <assert role="error"
           test="         not(*) or         self::hl7:*[@nullFlavor] or         self::hl7:*[not(@nullFlavor) and @value and not(*)] or         self::hl7:*[not(@nullFlavor) and not(@value)]/*[@nullFlavor] or         self::hl7:*[not(@nullFlavor) and not(@value)]/*[not(@nullFlavor) and not(hl7:center and (hl7:low|hl7:high|hl7:width))] or         self::hl7:*[not(@nullFlavor) and not(@value)]/*[not(@nullFlavor) and not(hl7:center) and not(hl7:width and (hl7:low|hl7:high))]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PIVL_TS">dtr1-3-PIVL_TS: co-occurence violation. Cannot have @value and other child elements, or missing @value and child elements with data, or center element with other elements, or width element
        with both low and high elements</assert>
   <!--<assert role="error" test="
        not(self::hl7:*[hl7:low/@value and hl7:high/@value]) or 
        self::hl7:*[string-length(hl7:low/@value) = string-length(hl7:high/@value)]" see="https://art-decor.org/mediawiki/index.php?title=DTr1_PIVL_TS"
        >dtr1-4-PIVL_TS: low/@value must have the same precision as high/@value</assert>-->
   <assert role="error"
           test="not(hl7:period[string-length(substring-after(@value,'.')) &gt; 4])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PIVL_TS">dtr1-5-PIVL_TS: period/@value must be rounded to 4 digits or less</assert>
   <!-- width has datatype PQR, which extends CV ((){1}(((0[1-9])|([12]\d)|(3[01]))?)?)? -->
   <assert role="error"
           test="not(hl7:width) or hl7:width[not(@unit)] or hl7:width[@value and @unit]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PIVL_TS">dtr1-6-PIVL_TS: width element: no unit without value</assert>
   <assert role="error"
           test="not(hl7:width/hl7:translation)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PIVL_TS">dtr1-7-PIVL_TS: width element: no translation</assert>
</rule>
