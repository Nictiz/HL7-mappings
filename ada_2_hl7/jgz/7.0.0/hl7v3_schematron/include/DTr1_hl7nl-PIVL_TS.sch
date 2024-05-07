<?xml version="1.0" encoding="UTF-8"?>
<!-- 
:   Periodic Interval of Timestamp - Datatypes Release 2 - Dutch extension import
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      xmlns:hl7nl="urn:hl7-nl:v3"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      abstract="true"
      id="hl7nl-PIVL_TS">
   <extends rule="SXCM_TS"/>
   <!-- period or frequency -->
   <assert role="error"
           test="@nullFlavor | *:period | *:frequency"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PIVL_TS">DTr2-1-hl7nl-PIVL_TS: PIVL_TS, in datatypes release 2, SHALL have at least a period or frequency, or SHALL have @nullFlavor</assert>
   <!-- count: positive -->
   <assert role="error"
           test="not(*:count/@value) or *:count[@value castable as xs:integer][xs:integer(@value) &gt; 0]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PIVL_TS">DTr2-2-hl7nl-PIVL_TS: count/@value SHALL, if present, be a positive integer. Found <value-of select="*:count/@value"/>
   </assert>
   <assert role="error"
           test="not(*:frequency) or *:frequency[@nullFlavor or (*:numerator[not(@nullFlavor)] and *:denominator[not(@nullFlavor)])]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PIVL_TS">DTr2-3-hl7nl-PIVL_TS: frequency SHALL have @nullFlavor or both numerator AND denominator without @nullFlavor</assert>
   <assert role="error"
           test="not(*:frequency) or *:frequency[not(*:uncertainty)]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PIVL_TS">DTr2-4-hl7nl-PIVL_TS: frequency SHALL NOT have uncertainty</assert>
   <assert role="error"
           test="not(*:frequency) or *:frequency[not(*:numerator/@xsi:type[matches(.,'(^|:)TS')]) and not(*:denominator/@xsi:type[matches(.,'(^|:)TS')])]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PIVL_TS">DTr2-5-hl7nl-PIVL_TS: frequency SHALL NOT have a numerator AND a denonimator with datatype TS. Found numerator "<value-of select="*:numerator/@xsi:type"/>" and denominator "<value-of select="*:denominator/@xsi:type"/>"</assert>
   <!-- === original PIVL rules start here === -->
   <assert role="error"
           test="not(*:phase[@updateMode] | *:period[@updateMode])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PIVL_TS">dtr1/2-1-hl7nl-PIVL_TS: Datatype PIVL_TS: no updateMode on PIVL attributes</assert>
   <assert role="error"
           test="descendant-or-self::*[(@nullFlavor and not(@value|@unit|*)) or (not(@nullFlavor) and (@value|@unit|*))]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PIVL_TS">dtr1/2-2-hl7nl-PIVL_TS: null violation. Cannot have @nullFlavor and @value or child elements, or the other way round</assert>
   <assert role="error"
           test="not(*:period[string-length(substring-after(@value,'.')) &gt; 4])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PIVL_TS">dtr1/2-5-hl7nl-PIVL_TS: period/@value must be rounded to 4 digits or less</assert>
   <!-- width has datatype PQR, which extends CV ((){1}(((0[1-9])|([12]\d)|(3[01]))?)?)? -->
   <assert role="error"
           test="not(descendant-or-self::*:width[@unit][not(@value)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PIVL_TS">dtr1/2-6-hl7nl-PIVL_TS: width element: no unit without value</assert>
   <assert role="error"
           test="not(descendant-or-self::*:width[*:translation])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl:PIVL_TS">dtr1/2-7-hl7nl-PIVL_TS: width element: no translation</assert>
</rule>
