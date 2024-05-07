<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 EIVL_TS - Event Related Interval of Timestamps
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="EIVL_TS">
   <extends rule="SXCM_TS"/>
   <assert role="error"
           test="@nullFlavor or (hl7:event)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-1-EIVL_TS: required attributes</assert>
   <assert role="error"
           test="count(*[self::hl7:offset][@updateMode])=0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-2-EIVL_TS: no updateMode on EIVL attributes</assert>
   <assert role="error"
           test="not(hl7:event) or not(hl7:event[@nullFlavor][@code]) or hl7:event[@nullFlavor or @code]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-3-EIVL_TS: null violation</assert>
   <!-- EIVL_TS.event codeSystem has default 2.16.840.1.113883.5.139 -->
   <assert role="error"
           test="not(hl7:event/@codeSystem) or hl7:event/@codeSystem = '2.16.840.1.113883.5.139'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-4-EIVL_TS: cannot have codeSystem</assert>
   <!-- EIVL_TS.event codeSystemName has default TimingEvent -->
   <assert role="error"
           test="not(hl7:event/@codeSystemName) or hl7:event/@codeSystemName = 'TimingEvent'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-5-EIVL_TS: cannot have codeSystemName</assert>
   <assert role="error"
           test="not(hl7:event/@codeSystemVersion)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-6-EIVL_TS: cannot have codeSystemVersion</assert>
   <assert role="error"
           test="not(hl7:event/@displayName)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-7-EIVL_TS: cannot have displayName</assert>
   <assert role="error"
           test="not(hl7:event/hl7:originalText)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-8-EIVL_TS: cannot have originalText</assert>
   <assert role="error"
           test="not(hl7:event/hl7:qualifier)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-9-EIVL_TS: cannot have qualifier</assert>
   <assert role="error"
           test="not(hl7:event/hl7:translation)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-10-EIVL_TS: cannot have translation</assert>
   <assert role="error"
           test="(not(hl7:offset)) or (hl7:offset/@nullFlavor and not(hl7:offset/@value|hl7:offset/@unit|hl7:offset/*)) or (not(hl7:offset/@nullFlavor) and (hl7:offset/@value|hl7:offset/@unit|hl7:offset/*))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-11-EIVL_TS: offset null violation. Cannot have @nullFlavor and @value or child elements, or the other way around</assert>
   <assert role="error"
           test="not(hl7:offset/*[@nullFlavor and (@value|@unit)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-12-EIVL_TS: offset null violation. Cannot have @nullFlavor and @value on any child elements</assert>
   <assert role="error"
           test="(not(hl7:offset)) or hl7:offset/@nullFlavor or         (not(hl7:offset/@nullFlavor) and hl7:offset/@value and not(hl7:offset/*)) or         (not(hl7:offset/@nullFlavor) and not(hl7:offset/@value) and (hl7:offset/hl7:low|hl7:offset/hl7:center|hl7:offset/hl7:high|hl7:offset/hl7:width)) or         (not(hl7:offset/@nullFlavor) and not(hl7:offset/@value) and (hl7:offset/hl7:*[not(@nullFlavor)])) or         (not(hl7:offset/@nullFlavor) and not(hl7:offset/@value) and hl7:center and not(hl7:low|hl7:high|hl7:width)) or         (not(hl7:offset/@nullFlavor) and not(hl7:offset/@value) and not(hl7:offset/hl7:center) and hl7:offset/hl7:width and not(hl7:offset/hl7:low and hl7:offset/hl7:high))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-13-EIVL_TS: offset co-occurence violation. Cannot have @value and other child elements, or missing @value and child elements with data, or center element with other elements, or width element with both low and high elements</assert>
   <assert role="error"
           test="count(hl7:offset/*[@updateMode])=0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-14-EIVL_TS: no updateMode on IVL attributes</assert>
   <assert role="error"
           test="not(hl7:offset/hl7:low/@value and hl7:offset/hl7:high/@value) or string-length(hl7:offset/hl7:low/@value) = string-length(hl7:offset/hl7:high/@value)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-15-EIVL_TS: value in offset/low/@value shall have same precision as offset/high/@value</assert>
   <!-- width has datatype PQR, which extends CV ((){1}(((0[1-9])|([12]\d)|(3[01]))?)?)? -->
   <!-- check for the presence of xsi:type and if present check correct data type requested -->
   <assert role="error"
           test="not(hl7:offset[@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS')]/hl7:width) or         hl7:offset[@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS')]/hl7:width[not(@unit)] or         hl7:offset[@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS')]/hl7:width[@value and @unit]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-16-EIVL_TS: width element: no unit without value</assert>
   <assert role="error"
           test="not(hl7:offset/hl7:width/hl7:translation)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EIVL_TS">dtr1-17-EIVL_TS: width element: no translation</assert>
</rule>
