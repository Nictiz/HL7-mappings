<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    AD - Address
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="AD">
   <extends rule="ANY"/>
   <!-- Test mixed content and empty address parts -->
   <assert role="error"
           test="@nullFlavor or (count(*)&gt;0 and not(text()[string-length(normalize-space())&gt;0])) or (count(*)=0 and text()[string-length(normalize-space())&gt;0])">dtr1-1-AD: address shall be null or text only or element only (no mixed content)</assert>
   <assert role="error"
           test="not(@nullFlavor) or (not(hl7:thumbnail) or hl7:useablePeriod/@nullFlavor)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD">dtr1-2-AD: no useablePeriod if null</assert>
   <assert role="error"
           test="count(*[self::hl7:useablePeriod][@updateMode])=0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD">dtr1-3-AD: updateMode shall not be used on address elements</assert>
   <assert role="error"
           test="not(hl7:useablePeriod/hl7:low/@value and hl7:useablePeriod/hl7:high/@value) or          string-length(hl7:useablePeriod/hl7:low/@value) = string-length(hl7:useablePeriod/hl7:high/@value)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD">dtr1-5-AD: useablePeriod/low/@value must have the same precision as useablePeriod/high/@value</assert>
   <assert role="error"
           test="not(hl7:useablePeriod/hl7:low/@value and hl7:useablePeriod/hl7:high/@value) or         number(substring(concat(hl7:useablePeriod/hl7:low/@value,'00000000000000'),1,14)) &lt; number(substring(concat(hl7:useablePeriod/hl7:high/@value,'00000000000000'),1,14))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD">dtr1-6-AD: useablePeriod/low/@value must be before useablePeriod/high/@value</assert>
   <!-- for width only us (microseconds),	ms (milliseconds),	s (seconds), min (minute), h (hours), d (day), wk (week), mo (month) and a (year) are allowed. -->
   <let name="tum" value="'^(us|ms|s|min|h|d|wk|mo|a|)$'"/>
   <assert role="error"
           test="matches(hl7:useablePeriod/hl7:width/@unit, $tum)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD">dtr1-7-AD: for useablePeriod/width only us (microseconds), ms (milliseconds), s (seconds), min (minute), h (hours), d (day), wk (week), mo (month) or a (year) are allowed</assert>
   <report role="warning"
           test="*[not(@nullFlavor or self::hl7:useablePeriod)][normalize-space(.)='']"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD">dtr1-8-AD: empty address particles should not be present.</report>
   <!-- http://gazelle.ihe.net/cda/cda-basic-req.pdf -->
   <let name="name" value="local-name()"/>
   <let name="value" value="string-join((.//@use|.//text()),'')"/>
   <let name="set_other"
        value="preceding-sibling::*[local-name()=$name] | following-sibling::*[local-name()=$name]"/>
   <assert role="error"
           test="not(@nullFlavor and $set_other[not(@nullFlavor)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD">dtr1-9-AD: [RIM-001] <value-of select="$name"/> SHALL NOT have nullFlavor, if there are other <value-of select="$name"/> elements which are not null</assert>
   <assert role="error"
           test="not($set_other[string-join((.//@use|.//text()),'')=$value])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD">dtr1-10-AD: [RIM-002] <value-of select="$name"/> (<value-of select="$value"/>) SHALL be distinct</assert>
</rule>
