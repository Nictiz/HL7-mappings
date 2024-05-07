<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 CD - Concept Descriptor
    Status: draft
    TODO: check for codes/codesystemen in translations
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      abstract="true"
      id="CD">
   <extends rule="ANY"/>
   <!-- A CD can be demoted into an ST value representing only the originalText of the CD value. -->
   <assert role="error"
           test="@nullFlavor or @code or (hl7:originalText and not(hl7:originalText/@nullFlavor))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-1-CD: null or code and/or originalText</assert>
   <!-- 
        A non-exceptional CD value (i.e. a CD value that has a non-null code property) has a non-NULL codeSystem specifying the system of concepts that defines the code. In other words whenever there is a code there is also a code system.
        
        An exceptional CD of NULL-flavor other indicates that a concept could not be coded in the coding system specified. Thus, for these coding exceptions, the code system that did not contain the appropriate concept must be provided in codeSystem. 
    -->
   <assert role="error"
           test="@codeSystem or not(@code)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-2-CD: code requires codeSystem</assert>
   <assert role="error"
           test="@codeSystem or not(@codeSystemName)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-3-CD: codeSystemName only if codeSystem</assert>
   <assert role="error"
           test="@codeSystem or not(@codeSystemVersion)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-4-CD: codeSystemVersion only if codeSystem</assert>
   <assert role="error"
           test="@code or not(@displayName)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-5-CD: displayName only if code</assert>
   <assert role="error"
           test="not(@nullFlavor and @code)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-6-CD: co-occurence violation. Cannot have code and null</assert>
   <assert role="error"
           test="not(@nullFlavor and @displayName)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-7-CD: co-occurence violation. Cannot have displayName and null</assert>
   <!--<assert role="error" test="not(.//hl7:translation/hl7:originalText)">dtr1-8-CD: no originalText on translations</assert>-->
   <!-- According to DTr1 abstract:
        Each translation may, however, also contain translations. Thus, when a code is translated multiple times the information 
        about which code served as the input to which translation will be preserved.
    -->
   <!--<assert role="error" test="not(hl7:translation/hl7:translation)">dtr1-9-CD: no translation on translations</assert>-->
   <assert role="error"
           test="not(.//hl7:translation/@nullFlavor)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-10-CD: no null on translations (Exceptional values (NULL-values) can not be elements of a set.)</assert>
   <assert role="error"
           test="not(.//hl7:translation[@codeSystem][not(@code)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-11-CD: translation code requires codeSystem</assert>
   <assert role="error"
           test="not(.//hl7:translation[@codeSystemName][not(@codeSystem)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-12-CD: translation codeSystemName only if codeSystem</assert>
   <assert role="error"
           test="not(.//hl7:translation[@codeSystemVersion][not(@codeSystem)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-13-CD: translation codeSystemVersion only if codeSystem</assert>
   <assert role="error"
           test="not(.//hl7:translation[@displayName][not(@code)])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-14-CD: translation displayName only if code</assert>
   <report role="warning"
           test="matches(@displayName,'[\r\n\t]')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-15-CD: it looks like there are formatting instructions in attribute @displayName. Please note that this may lead to interoperability problems.</report>
   <!-- Abstract datatypes 2.15.1
        The literal form for the UUID is defined according to the original specification of the UUID. However, because the HL7 UIDs are case sensitive, 
        for use with HL7, the hexadecimal digits A-F in UUIDs must be converted to upper case.
        
        This being said: if we were to hold current implementations to this idea, then a lot would be broken and not even the official 
        HL7 datatypes check this requirement. Hence we knowingly allow lower-case a-f.
    -->
   <!--<let name="UUIDpattern" value="'^[A-Fa-f\d]{8}-[A-Fa-f\d]{4}-[A-Fa-f\d]{4}-[A-Fa-f\d]{4}-[A-Fa-f\d]{12}$'"/>
    <assert role="error" test="not(@codeSystem) or not(matches(@codeSystem,$UUIDpattern) and matches(@codeSystem,'[a-z]'))"
        >dtr1-16-CD: When UUID is used, the hexadecimal digits A-F SHALL be in upper case</assert>-->
   <!-- http://gazelle.ihe.net/cda/cda-basic-req.pdf -->
   <let name="name" value="local-name()"/>
   <let name="set_other"
        value="preceding-sibling::*[local-name()=$name] | following-sibling::*[local-name()=$name]"/>
   <!--
    <assert role="error" test="not(@nullFlavor and $set_other[not(@nullFlavor)])" see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD"
        >dtr1-17-CD: [RIM-001] <value-of select="$name"/> SHALL NOT have nullFlavor, if there are other <value-of select="$name"/> elements which are not null</assert>
    -->
   <let name="code" value="@code"/>
   <let name="codeSystem" value="@codeSystem"/>
   <assert role="error"
           test="not($set_other[@code=$code][@codeSystem=$codeSystem])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-18-CD: [RIM-002] <value-of select="$name"/> (@code=<value-of select="$code"/> @codeSystem=<value-of select="$codeSystem"/>) SHALL be distinct</assert>
   <let name="translations"
        value=".//hl7:translation/concat(@code,@codeSystem)"/>
   <assert role="error"
           test="count($translations)=count(distinct-values($translations))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-19-CD: [RIM-002] translations SHALL be distinct</assert>
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
           test="not(.//hl7:originalText[@language and not(matches(@language,$RFC3066,'i'))])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CD">dtr1-20-CD: originalText/@language SHALL conform to RFC 3066. This usually has format sss?-CC with sss? for language code (ISO-639-1 / ISO-639-2) and optional CC for country code (conform ISO-3166 alpha-2)</assert>
</rule>
