<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 SXPR_TS - Parenthetic Set Expression
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="SXPR_TS">
   <extends rule="SXCM_TS"/>
   <assert role="error"
           test="@nullFlavor or count(hl7:comp) &gt;= 2"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-1-SXPR_TS: null or at least two components</assert>
   <assert role="error"
           test="not(descendant::hl7:comp[(@xsi:type='SXPR_TS' or ends-with(@xsi:type,':SXPR_TS'))]) or          descendant::hl7:comp[(@xsi:type='SXPR_TS' or ends-with(@xsi:type,':SXPR_TS')) and @nullFlavor] or          descendant::hl7:comp[(@xsi:type='SXPR_TS' or ends-with(@xsi:type,':SXPR_TS')) and count(hl7:comp) &gt;= 2]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-2-SXPR_TS: null or at least two components</assert>
   <assert role="error"
           test="count(descendant::*[@updateMode])=0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-3-SXPR_TS: no updateMode on components or other subelements</assert>
   <!-- comp type IVL_TS -->
   <assert role="error"
           test="not(descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS'))]) or         (descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS')) and @nullFlavor and not(@value|@unit|*)]) or          (descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS')) and not(@nullFlavor) and (@value|@unit|*)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-4-SXPR_TS: null violation. Cannot have @nullFlavor and @value or child elements, or the other way around</assert>
   <assert role="error"
           test="         not(descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS'))]/*) or         descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS')) and @nullFlavor] or         descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS')) and not(@nullFlavor) and @value and not(*)] or         descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS')) and not(@nullFlavor) and not(@value)]/*[@nullFlavor] or         descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS')) and not(@nullFlavor) and not(@value)]/*[not(@nullFlavor) and not(*:center and (*:low|*:high|*:width))] or         descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS')) and not(@nullFlavor) and not(@value)]/*[not(@nullFlavor) and not(*:center) and not(*:width and (*:low|*:high))]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-5-SXPR_TS: co-occurence violation. Cannot have @value and other child elements, or missing @value and child elements with data, or center element with other elements, or width element with both low and high elements</assert>
   <assert role="error"
           test="         not(descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS')) and *:low/@value and *:high/@value]) or          descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS')) and string-length(*:low/@value) = string-length(*:high/@value)]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-6-SXPR_TS: comp/low/@value must have the same precision as comp/high/@value</assert>
   <!-- width has datatype PQR, which extends CV ((){1}(((0[1-9])|([12]\d)|(3[01]))?)?)? -->
   <assert role="error"
           test="not(descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS'))]/*:width) or         descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS'))]/*:width[not(@unit)] or         descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS'))]/*:width[@value and @unit]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-7-SXPR_TS: width element: no unit without value</assert>
   <assert role="error"
           test="not(descendant::hl7:comp[(@xsi:type='IVL_TS' or ends-with(@xsi:type,':IVL_TS'))]/*:width/*:translation)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-8-SXPR_TS: width element: no translation</assert>
   <!-- comp type PIVL_TS (frequency is DTr2 which is included in some national datatype variants -->
   <assert role="error"
           test="not(descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS'))]) or         descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS'))][*:period[@nullFlavor][not(@value)] | *:frequency] or         descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS'))][*:period[not(@nullFlavor)][@value] | *:frequency]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-9-SXPR_TS: null or value in period</assert>
   <assert role="error"
           test="not(descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS'))]) or         not(descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS'))]/*:period[@nullFlavor]/*:translation) or         descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS'))]/*:period[not(@nullFlavor)]/*:translation"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-10-SXPR_TS: no translation if null in period</assert>
   <assert role="error"
           test="not(descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS'))]) or         (descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS')) and @nullFlavor and not(@value|@unit|*)]) or          (descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS')) and not(@nullFlavor) and (@value|@unit|*)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-11-SXPR_TS: null violation. Cannot have @nullFlavor and @value or child elements, or the other way around</assert>
   <assert role="error"
           test="         not(descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS'))]/*) or         descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS')) and @nullFlavor] or         descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS')) and not(@nullFlavor) and @value and not(*)] or         descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS')) and not(@nullFlavor) and not(@value)]/*[@nullFlavor] or         descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS')) and not(@nullFlavor) and not(@value)]/*[not(@nullFlavor) and not(*:center and (*:low|*:high|*:width))] or         descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS')) and not(@nullFlavor) and not(@value)]/*[not(@nullFlavor) and not(*:center) and not(*:width and (*:low|*:high))]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-12-SXPR_TS: co-occurence violation. Cannot have @value and other child elements, or missing @value and child elements with data, or center element with other elements, or width element with both low and high elements</assert>
   <assert role="error"
           test="         not(descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS')) and *:low/@value and *:high/@value]) or          descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS')) and string-length(*:low/@value) = string-length(*:high/@value)]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-13-SXPR_TS: comp/low/@value must have the same precision as comp/high/@value</assert>
   <assert role="error"
           test="not(descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS'))]/*:period[string-length(substring-after(@value,'.')) &gt; 4])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-14-SXPR_TS: value in period/@value SHALL be rounded to 4 decimals or less</assert>
   <!-- width has datatype PQR, which extends CV ((){1}(((0[1-9])|([12]\d)|(3[01]))?)?)? -->
   <assert role="error"
           test="not(descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS'))]/*:width) or         descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS'))]/*:width[not(@unit)] or         descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS'))]/*:width[@value and @unit]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-15-SXPR_TS: width element: no unit without value</assert>
   <assert role="error"
           test="not(descendant::hl7:comp[(@xsi:type='PIVL_TS' or ends-with(@xsi:type,':PIVL_TS'))]/*:width/*:translation)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS">dtr1-16-SXPR_TS: width element: no translation</assert>
   <!-- EIVL_TS
    <assert role="error" test="not(descendant::hl7:comp[(@xsi:type='EIVL_TS' or ends-with(@xsi:type,':EIVL_TS'))])" see="https://art-decor.org/mediawiki/index.php?title=DTr1_SXPR_TS"
        >Datatype SXPR_TS/EIVL_TS: dit datatype is in Nederland nog niet toegestaan</assert>
    -->
</rule>
