<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 IVL_QTY - Interval of Quantity
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="hl7nl-IVL_QTY">
   <extends rule="hl7nl-QSET_QTY"/>
   <!--<assert role="error" test="(@nullFlavor and not(@value|@unit|*:*)) or (not(@nullFlavor) and (@value|*:*))" see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY"
        >dtr1-1-IVL_QTY: null violation. Cannot have @nullFlavor and @value or child elements, or the other way around</assert>-->
   <assert role="error"
           test="not(descendant-or-self::*[@nullFlavor][@value|@unit|*:any|*:low|*:center|*:high|*:width])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY">dtr1-2-IVL_QTY: null violation. Cannot have @nullFlavor and @value or other child elements</assert>
   <assert role="error"
           test="not(@value and * except *:translation)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY">dtr1-3-IVL_QTY: co-occurence violation. Cannot have @value and other child elements except translation</assert>
   <!-- unsure where this rule comes from KH 2016-07-22
    <assert role="error" test="@nullFlavor or descendant-or-self::*[@value]" see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY"
        >dtr1-4-1-IVL_QTY: co-occurence violation. Must have @nullFlavor or @value or child elements with @value</assert>
        -->
   <assert role="error"
           test="not(@value and (*:any|*:low|*:center|*:high|*:width))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY">dtr1-4-2-IVL_QTY: co-occurence violation. Cannot have @value and child elements</assert>
   <!--<assert role="error" test="not(*:center and (*:low|*:high|*:width))" see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY"
        >dtr1-4-3-IVL_QTY: co-occurence violation. Cannot have center and other elements</assert>-->
   <assert role="error"
           test="not(*:width and *:low and *:high)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY">dtr1-4-4-IVL_QTY: co-occurence violation. Cannot have width and have both low and high elements</assert>
   <assert role="error"
           test="not(*[@updateMode])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY">dtr1-5-IVL_QTY: no updateMode on IVL attributes</assert>
   <!--<assert role="error" test="not(*:low/@value = *:high/@value)" see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY"
        >dtr1-6-IVL_QTY: low/@value must not be equal to high/@value</assert>-->
   <!-- width has datatype PQR, which extends CV ((){1}(((0[1-9])|([12]\d)|(3[01]))?)?)? -->
   <assert role="error"
           test="not(*:width[@unit][not(@value)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY">dtr1-1-PQR: width element: no unit without value</assert>
   <assert role="error"
           test="not(*:width/*:translation)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY">dtr1-2-PQR: width element: no translation</assert>
   <assert role="error"
           test="not(*:low[@value castable as xs:decimal] and *:high[@value castable as xs:decimal]) or *:low/xs:decimal(@value) &lt;= *:high/xs:decimal(@value)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY">dtr1-7-IVL_QTY: low/@value must be lower than or equal to high/@value</assert>
   <assert role="error"
           test="not(*:low[@nullFlavor='PINF'])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY">dtr1-7-1-IVL_QTY: low must be lower than or equal to high. Found low boundary PINF (Positive Infinity)</assert>
   <assert role="error"
           test="not(*:high[@nullFlavor='NINF'])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY">dtr1-7-2-IVL_QTY: low must be lower than or equal to high. Found high boundary NINF (Negative Infinity)</assert>
   <assert role="warning"
           test="not(*:low/@unit and *:high/@unit) or *:low/@unit = *:high/@unit"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY">dtr1-8-IVL_QTY: units in low and high should be equal or comparable</assert>
   <assert role="error"
           test="not(*:translation and * except *:translation)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY">dtr1-9-IVL_QTY: co-occurence violation. Cannot have translation and other child elements except translation</assert>
   <assert role="error"
           test="not(*:low and @lowClosed) and not(*:high and @highClosed)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_hl7nl-IVL_QTY">dtr1-10-IVL_QTY: cannot have (@lowClosed and low) or (@highClosed and high)</assert>
</rule>
