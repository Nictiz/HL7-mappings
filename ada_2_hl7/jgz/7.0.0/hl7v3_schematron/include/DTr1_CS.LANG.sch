<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 CS - Coded Simple Language Code
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      abstract="true"
      id="CS.LANG">
   <extends rule="CS"/>
   <!--<assert role="error" test="@nullFlavor or matches(@code, '^[a-z]{2}(-[A-Z]{2})?$')"
        >dtr1-1-CS.LANG: @code SHALL be of format ss-CC with ss for language code (conform ISO-639-1) and optional CC for country code (conform ISO-3166 alpha-2)</assert>-->
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
           test="not(@code) or matches(@code,$RFC3066,'i')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CS.LANG">dtr1-2-CS.LANG: @code SHALL conform to RFC 3066. This usually has format sss?-CC with sss? for language code (ISO-639-1 / ISO-639-2) and optional CC for country code (conform ISO-3166 alpha-2)</assert>
</rule>
