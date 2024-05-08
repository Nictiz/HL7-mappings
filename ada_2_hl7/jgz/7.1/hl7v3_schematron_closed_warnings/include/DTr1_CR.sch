<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTR1 CR - Concept Qualifier
    Status: draft
    TODO: check for codes/codesystems in translations
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="CR">
   <extends rule="ANY"/>
   <assert role="error"
           test="(@nullFlavor or *) and not(@nullFlavor and *)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_CR">dtr1-1-CR: null or value</assert>
   <!-- Abstract datatypes 2.15.1
        The literal form for the UUID is defined according to the original specification of the UUID. However, because the HL7 UIDs are case sensitive, 
        for use with HL7, the hexadecimal digits A-F in UUIDs must be converted to upper case.
        
        This being said: if we were to hold current implementations to this idea, then a lot would be broken and not even the official 
        HL7 datatypes check this requirement. Hence we knowingly allow lower-case a-f.
    -->
   <!--<let name="UUIDpattern" value="'^[A-Fa-f\d]{8}-[A-Fa-f\d]{4}-[A-Fa-f\d]{4}-[A-Fa-f\d]{4}-[A-Fa-f\d]{12}$'"/>
    <assert role="error" test="not(@codeSystem) or not(matches(@codeSystem,$UUIDpattern) and matches(@codeSystem,'[a-z]'))" see="https://art-decor.org/mediawiki/index.php?title=DTr1_CR"
        >dtr1-2-CR: When UUID is used, the hexadecimal digits A-F SHALL be in upper case</assert>-->
</rule>
