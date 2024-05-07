<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 - Instance Identifier
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="II">
   <extends rule="ANY"/>
   <assert role="error"
           test="@nullFlavor or (not(@nullFlavor) and @root)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II">dtr1-1-II: @root is required if @nullFlavor is not present</assert>
   <assert role="error"
           test="not(@nullFlavor) or (@nullFlavor and not(@root))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II">dtr1-2-II: @root may not be used if @nullFlavor is present</assert>
   <!--assert role="error" test="not(@nullFlavor) or (@nullFlavor and not(@extension))" see="https://art-decor.org/mediawiki/index.php?title=DTr1_II"
        >dtr1-3-II: no @extension if null</assert-->
   <assert role="error"
           test="not(@nullFlavor and @identifierName)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II">dtr1-4-II: @identifierName may not be used if @nullFlavor is present</assert>
   <assert role="error"
           test="not(@nullFlavor and @displayable)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II">dtr1-5-II: @displayable may not be used if @nullFlavor is present</assert>
   <assert role="error"
           test="not(@nullFlavor and @reliability)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II">dtr1-6-II: @reliability may not be used if @nullFlavor is present</assert>
   <assert role="error"
           test="not(@nullFlavor and @assigningAuthorityName)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II">dtr1-7-II: @assigningAuthorityName may not be used if @nullFlavor is present</assert>
   <!-- 
        Issue
        DICOM has a max of 64 chars in an OID
        Canada uses 200 chars for OIDs
    -->
   <report role="warning"
           test="not(string-length(@root) &lt;= 128)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II">dtr1-8-II: @root should not be longer than 128 characters. Found <value-of select="string-length(@root)"/> characters. Please write a note to the authors of this rule if this is found to be not sufficient</report>
   <report role="warning"
           test="not(string-length(@extension) &lt;= 64)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II">dtr1-9-II: @extension should not be longer than 64 characters. Found <value-of select="string-length(@extension)"/> characters. Please write a note to the authors of this rule if this is found to be not sufficient</report>
   <!-- Abstract datatypes 2.15.1
        The literal form for the UUID is defined according to the original specification of the UUID. However, because the HL7 UIDs are case sensitive, 
        for use with HL7, the hexadecimal digits A-F in UUIDs must be converted to upper case.
        
        This being said: if we were to hold current implementations to this idea, then a lot would be broken and not even the official 
        HL7 datatypes check this requirement. Hence we knowingly allow lower-case a-f.
    -->
   <let name="OIDpattern" value="'^[0-2](\.(0|[1-9]\d*))*$'"/>
   <let name="RUIDpattern" value="'^[A-Za-z][A-Za-z\d\-]*$'"/>
   <let name="UUIDpattern"
        value="'^[A-Fa-f\d]{8}-[A-Fa-f\d]{4}-[A-Fa-f\d]{4}-[A-Fa-f\d]{4}-[A-Fa-f\d]{12}$'"/>
   <assert role="error"
           test="not(@root) or matches(@root, $OIDpattern) or matches(@root, $UUIDpattern)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II">dtr1-10-II: @root SHALL be a syntactically correct OID or UUID.</assert>
   <assert role="error"
           test="not(matches(@root, $RUIDpattern) and not(matches(@root, $UUIDpattern)))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II">dtr1-10a-II: @root SHALL NOT be a RUID. Identifiers in this scheme are only defined by balloted HL7 specifications. Local communities or systems must never use such reserved identifiers based on bilateral negotiations.</assert>
   <!-- http://gazelle.ihe.net/cda/cda-basic-req.pdf -->
   <let name="name" value="local-name()"/>
   <let name="set_other"
        value="preceding-sibling::*[local-name()=$name] | following-sibling::*[local-name()=$name]"/>
   <!--
    <assert role="error" test="not(@nullFlavor and $set_other[not(@nullFlavor)])"
        >dtr1-11-II: [RIM-001] <value-of select="$name"/> SHALL NOT have nullFlavor, if there are other <value-of select="$name"/> elements which are not null</assert>
    -->
   <let name="root" value="@root"/>
   <let name="extension" value="@extension"/>
   <assert role="error"
           test="not($set_other[@root=$root][empty($extension)] or $set_other[@root=$root][@extension=$extension])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II">dtr1-12-II: [RIM-002] <value-of select="$name"/> SHALL be distinct</assert>
   <!-- Abstract datatypes 2.15.1
        The literal form for the UUID is defined according to the original specification of the UUID. However, because the HL7 UIDs are case sensitive, 
        for use with HL7, the hexadecimal digits A-F in UUIDs must be converted to upper case.
    -->
   <!--let name="UUIDpattern" value="'^[0-9a-fA-F]{8}-[0-9a-fA-f]{4}-[0-9a-fA-F]{4}-[0-9a-aA-F]{4}-[0-9a-fA-F]{12}$'"/-->
   <!-- 2018-01-19 HL7V3 DTr1 and DTr2 state that UUIDs shall be upper case. HL7 FHIR states that UUIDs shall be lower case
                    The RFC 4122 https://tools.ietf.org/html/rfc4122 appears to say that the display of a UUID only contains
                    lower-case characters. 
                    After discussion in the HL7 community and the ART-DECOR Expert Group, we agreed that we should NOT enforce 
                    the DTr1 and DTr2 requirement for upper-case characters, because it leads to real world mismatches.
                    (https://chat.fhir.org/#narrow/stream/implementers/subject/UUID.20to.20lower-case())
    -->
   <assert role="info"
           test="not(matches(@root, $UUIDpattern) and matches(@root, '[a-z]'))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_II">dtr1-13-II: Lower case UUID "<value-of select="@root"/>" found in @root. UUIDs SHALL, under official HL7 V3 Datatypes Release 1 (and 2) rules, have upper case hexadecimal digits A-F. RFC 4122 and HL7 FHIR state lower case UUID display.</assert>
</rule>
