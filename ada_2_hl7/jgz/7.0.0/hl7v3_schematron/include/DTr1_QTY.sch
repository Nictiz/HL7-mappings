<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 QTY - Quantity
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="QTY">
   <extends rule="ANY"/>
   <assert role="error"
           test="not(hl7:uncertainty/@expression) and not(hl7:uncertainty/@uncertainty) and not(hl7:uncertainty/@originalText)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_QTY">dtr1-1-QTY: no uncertainty</assert>
   <assert role="error"
           test="count(*[self::hl7:originalText or self::hl7:uncertainty or self::hl7:expression][@validTimeLow or @validTimeHigh or @updateMode])=0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_QTY">dtr1-2-QTY: no history or updateMode</assert>
   <!-- http://gazelle.ihe.net/cda/cda-basic-req.pdf -->
   <let name="name" value="local-name()"/>
   <let name="set_other"
        value="preceding-sibling::*[local-name()=$name] | following-sibling::*[local-name()=$name]"/>
   <assert role="error"
           test="not(@nullFlavor and $set_other[not(@nullFlavor)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_QTY">dtr1-3-QTY: [RIM-001] <value-of select="$name"/> SHALL NOT have nullFlavor, if there are other <value-of select="$name"/> elements which are not null</assert>
   <let name="value" value="@value"/>
   <let name="unit" value="@unit"/>
   <assert role="error"
           test="not($set_other[@value=$value][@unit=$unit])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_QTY">dtr1-4-QTY: [RIM-002] <value-of select="$name"/> (@value=<value-of select="$value"/> @unit=<value-of select="$unit"/>) SHALL be distinct</assert>
</rule>
