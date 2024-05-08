<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 - URL
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="URL">
   <extends rule="ANY"/>
   <assert role="error"
           test="@nullFlavor or @value"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL">dtr1-1-URL: elements of type URL SHALL have a @value attribute.</assert>
   <assert role="error"
           test="@nullFlavor or @value=iri-to-uri(@value)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL">dtr1-2-URL: @value must be a valid URI, e.g. '<value-of select="iri-to-uri(@value)"/>'.</assert>
   <!--
    <assert role="error" test="@nullFlavor or matches(@value,'^[a-z\d+\.-]+:')" see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL"
        >dtr1-3-URL: @value must be a valid URI with a scheme.</assert>
    -->
   <!-- http://gazelle.ihe.net/cda/cda-basic-req.pdf -->
   <let name="name" value="local-name()"/>
   <let name="use" value="@use"/>
   <let name="value" value="@value"/>
   <let name="set_other"
        value="preceding-sibling::*[local-name()=$name] | following-sibling::*[local-name()=$name]"/>
   <assert role="error"
           test="not(@nullFlavor and $set_other[not(@nullFlavor)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL">dtr1-4-URL: [RIM-001] <value-of select="$name"/> SHALL NOT have nullFlavor, if there are other <value-of select="$name"/> elements which are not null</assert>
   <assert role="error"
           test="not($set_other[@use=$use][@value=$value])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL">dtr1-5-URL: [RIM-002] <value-of select="$name"/> (<value-of select="$value"/>) SHALL be distinct</assert>
   <!-- Note: ignoring set_cs here... -->
   <!--<assert role="error" test="not($set_other[@use=$use])" see="https://art-decor.org/mediawiki/index.php?title=DTr1_URL"
        >dtr1-6-URL: <value-of select="$name"/>/@use (<value-of select="$use"/>) SHALL be distinct</assert>-->
</rule>
