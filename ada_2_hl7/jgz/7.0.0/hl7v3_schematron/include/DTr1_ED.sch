<?xml version="1.0" encoding="UTF-8"?>
<!--
    DTr1 ED - Encapsulated Data
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      abstract="true"
      id="ED">
   <extends rule="BIN"/>
   <assert role="error"
           test="not(@integrityCheck) or @integrityCheckAlgorithm"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-2-ED: integrityCheckAlgorithm required if integrityCheck</assert>
   <assert role="error"
           test="not(hl7:thumbnail) or hl7:thumbnail[not(@nullFlavor and hl7:reference)]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-3-ED: thumbnails not null and reference</assert>
   <assert role="error"
           test="not(hl7:thumbnail) or hl7:thumbnail[not(hl7:thumbnail)]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-4-ED: thumbnails do not have thumbnails</assert>
   <assert role="error"
           test="(@compression and (hl7:reference/@value or (@representation='B64' and text()))) or not(@compression)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-5-ED: compression only on binary</assert>
   <assert role="error"
           test="not(@value) or (@value and (not(@mediaType) or @mediaType='text/plain'))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-6-ED: value implies mediaType is text/plain</assert>
   <assert role="error"
           test="count(*[self::hl7:reference or self::hl7:thumbnail][@validTimeLow or @validTimeHigh or @updateMode])=0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-7-ED: no history or updateMode</assert>
   <assert role="error"
           test="not(@value or xml) or not(@charset)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-8-ED: no charset for value or xml</assert>
   <assert role="error"
           test="not(hl7:translation) or hl7:thumbnail[not(hl7:translation)]"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-9-ED: no nested translations</assert>
   <assert role="error"
           test="not(@nullFlavor and @mediaType) or @mediaType = 'text/plain'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-10-ED: no mediaType if null</assert>
   <assert role="error"
           test="not(@nullFlavor and @charset)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-11-ED: no charset if null</assert>
   <assert role="error"
           test="not(@nullFlavor and @language)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-12-ED: no language if null</assert>
   <assert role="error"
           test="not(@nullFlavor and @compression)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-13-ED: no compression if null</assert>
   <assert role="error"
           test="not(@nullFlavor and @integrityCheck)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-14-ED: no integrityCheck if null</assert>
   <assert role="error"
           test="not(@nullFlavor and @integrityCheckAlgorithm) or @integrityCheckAlgorithm = 'SHA-1'"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-15-ED: no integrityCheckAlgorithm if null</assert>
   <assert role="error"
           test="not(@nullFlavor) or (not(hl7:thumbnail) or hl7:thumbnail/@nullFlavor)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-16-ED: no thumbnail if null</assert>
   <assert role="error"
           test="not(@nullFlavor and hl7:translation)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-17-ED: no translation if null</assert>
   <!-- http://www.ietf.org/rfc/rfc3066.txt
        Language-Tag = Primary-subtag *( "-" Subtag ) 
        Primary-subtag = 1*8ALPHA 
        Subtag = 1*8(ALPHA / DIGIT)
        
        Primary subtag: 
            - 2/3 letter codes are ISO-639, 
            - value 'i' reserved for IANA registrations, 
            - 'x' reserved for private use, 
            - other values not allowed
        Secondary subtag:
            - 2 letter codes are ISO-3166
            - 3-8 may be registered with IANA,
            - 1 letter not allowed
    -->
   <!--<assert role="error" test="not(@code) or @code castable as xs:language">dtr1-2-CS.LANG: @code SHALL conform to RFC 3066. This usually has format ss-CC with ss for language code (conform ISO-639-1) and optional CC for country code (conform ISO-3166 alpha-2)</assert>-->
   <let name="RFC3066" value="'^[a-z]{2,3}(-[a-z]{2})?|[ix](-[a-z\d]{2,8})+$'"/>
   <let name="RFC3066restricted" value="'^[a-z]{2,3}(-[a-z]{2})?$'"/>
   <assert role="error"
           test="not(@language) or matches(@language,$RFC3066,'i')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_ED">dtr1-18-ED: @language SHALL conform to RFC 3066. This usually has format sss?-CC with sss? for language code (ISO-639-1 / ISO-639-2) and optional CC for country code (conform ISO-3166 alpha-2)</assert>
</rule>
