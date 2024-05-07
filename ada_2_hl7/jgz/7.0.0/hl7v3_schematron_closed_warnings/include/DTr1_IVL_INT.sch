<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 IVL_INT - Interval of Integers
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="IVL_INT">
   <extends rule="SXCM_INT"/>
   <!--<assert role="error" test="(@nullFlavor and not(@value|@unit|hl7:*)) or (not(@nullFlavor) and (@value|hl7:*))" see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_INT"
        >dtr1-1-IVL_INT: null violation. Cannot have @nullFlavor and @value or child elements, or the other way around</assert>-->
   <assert role="error"
           test="not(descendant-or-self::*[@nullFlavor and (@value|@unit|hl7:low|hl7:center|hl7:high|hl7:width)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_INT">dtr1-2-IVL_INT: null violation. Cannot have @nullFlavor and @value or other child elements</assert>
   <assert role="error"
           test="not(@value and hl7:*)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_INT">dtr1-3-IVL_INT: co-occurence violation. Cannot have @value and other child elements</assert>
   <!-- unsure where this rule comes from KH 2016-07-22
    <assert role="error" test="@nullFlavor or descendant-or-self::*[@value]" see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_INT"
        >dtr1-4-1-IVL_INT: co-occurence violation. Must have @nullFlavor or @value or child elements with @value</assert>
        -->
   <assert role="error"
           test="not(@value and (hl7:low|hl7:center|hl7:high|hl7:width))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_INT">dtr1-4-2-IVL_INT: co-occurence violation. Cannot have @value and child elements</assert>
   <assert role="error"
           test="not(hl7:center and (hl7:low|hl7:high|hl7:width))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_INT">dtr1-4-3-IVL_INT: co-occurence violation. Cannot have center and other elements</assert>
   <assert role="error"
           test="not(hl7:width and hl7:low and hl7:high)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_INT">dtr1-4-4-IVL_INT: co-occurence violation. Cannot have width and have both low and high elements</assert>
   <assert role="error"
           test="not(hl7:*[@updateMode])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_INT">dtr1-5-IVL_INT: no updateMode on IVL attributes</assert>
   <!--<assert role="error" test="not(hl7:low/@value = hl7:high/@value)" see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_INT"
        >dtr1-6-IVL_INT: low/@value must not be equal to high/@value</assert>-->
   <!-- width has datatype PQR, which extends CV ((){1}(((0[1-9])|([12]\d)|(3[01]))?)?)? -->
   <assert role="error"
           test="not(hl7:width[@unit][not(@value)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_INT">dtr1-1-PQR: width element: no unit without value</assert>
   <assert role="error"
           test="not(hl7:width/hl7:translation)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_INT">dtr1-2-PQR: width element: no translation</assert>
   <assert role="error"
           test="not(hl7:low/@value and hl7:high/@value) or hl7:low/number(@value) &lt;= hl7:high/number(@value)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_INT">dtr1-7-IVL_INT: low/@value must be lower than or equal to high/@value</assert>
   <assert role="error"
           test="not(hl7:low[@nullFlavor='PINF'])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_INT">dtr1-7-1-IVL_INT: low must be lower than or equal to high. Found low boundary PINF (Positive Infinity)</assert>
   <assert role="error"
           test="not(hl7:high[@nullFlavor='NINF'])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_IVL_INT">dtr1-7-2-IVL_INT: low must be lower than or equal to high. Found high boundary NINF (Negative Infinity)</assert>
</rule>
