<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 EN - Entity Name
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="EN">
   <extends rule="ANY"/>
   <!--<assert role="error" test="@nullFlavor or 
        (count(*)&gt;0 and string-length(normalize-space(string-join(text(),'')))=0) or 
        (count(*)=0 and string-length(normalize-space(string-join(text(),'')))&gt;0)"
        >dtr1-1-EN: entity name shall be null or have text only or element only (no mixed content)</assert>-->
   <assert role="error"
           test="not(@nullFlavor and (* or string-length(normalize-space(string-join(text(),'')))&gt;0))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EN">dtr1-1.1-EN: entity name shall not be null and have elements or text</assert>
   <assert role="error"
           test="not(* and string-length(normalize-space(string-join(text(),'')))&gt;0)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EN">dtr1-1.2-EN: entity name shall not have both elements and text (no mixed content)</assert>
   <assert role="error"
           test="@nullFlavor or * or string-length(normalize-space(string-join(text(),'')))&gt;0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EN">dtr1-1.3-EN: entity name that is not null shall not be empty</assert>
   <report role="warning"
           test="*[not(self::*:validTime | @nullFlavor)][normalize-space(.)='']"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EN">dtr1-3-EN: empty name particles should not be present.</report>
   <report role="warning"
           test="substring(normalize-space(.),1,1)='&#34;'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EN">dtr1-4-EN: Use of quotes at the beginning of a name are probably not correct.</report>
   <!-- http://gazelle.ihe.net/cda/cda-basic-req.pdf -->
   <let name="name" value="local-name()"/>
   <let name="value" value="string-join((.//@use|.//text()),'')"/>
   <let name="set_other"
        value="preceding-sibling::*[local-name()=$name] | following-sibling::*[local-name()=$name]"/>
   <assert role="error"
           test="not(@nullFlavor and $set_other[not(@nullFlavor)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EN">dtr1-5-EN: [RIM-001] <value-of select="$name"/> SHALL NOT have nullFlavor, if there are other <value-of select="$name"/> elements which are not null</assert>
   <assert role="error"
           test="not($set_other[string-join((.//@use|.//text()),'')=$value])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EN">dtr1-6-EN: [RIM-002] <value-of select="$name"/> (<value-of select="$value"/>) SHALL be distinct</assert>
   <assert role="error"
           test="not(hl7:*) or hl7:*[count(tokenize(@qualifier,'\s'))=count(distinct-values(tokenize(@qualifier,'\s')))]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_EN">dtr1-7-EN: enxp elements SHALL have distinct values in @qualifier</assert>
</rule>
