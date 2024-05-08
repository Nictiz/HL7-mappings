<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 CS - Coded Simple
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="CS">
   <extends rule="ANY"/>
   <assert role="error"
           test="(@nullFlavor and not(@code or @typeCode)) or (not(@nullFlavor) and (@code or @typeCode))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CS">dtr1-1-CS: @code/@typeCode and @nullFlavor are mutually exclusive</assert>
   <!-- EIVL_TS.event codeSystem has default 2.16.840.1.113883.5.139 -->
   <assert role="error"
           test="not(@codeSystem) or @codeSystem = '2.16.840.1.113883.5.139'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CS">dtr1-2-CS: cannot have codeSystem</assert>
   <!-- EIVL_TS.event codeSystemName has default TimingEvent -->
   <assert role="error"
           test="not(@codeSystemName) or @codeSystemName = 'TimingEvent'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CS">dtr1-3-CS: cannot have codeSystemName</assert>
   <assert role="error"
           test="not(@codeSystemVersion)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CS">dtr1-4-CS: cannot have codeSystemVersion</assert>
   <assert role="error"
           test="not(@displayName)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CS">dtr1-5-CS: cannot have displayName</assert>
   <assert role="error"
           test="not(hl7:originalText)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CS">dtr1-6-CS: cannot have originalText</assert>
   <assert role="error"
           test="not(hl7:qualifier)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CS">dtr1-7-CS: cannot have qualifier</assert>
   <assert role="error"
           test="not(hl7:translation)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CS">dtr1-8-CS: cannot have translation</assert>
</rule>
