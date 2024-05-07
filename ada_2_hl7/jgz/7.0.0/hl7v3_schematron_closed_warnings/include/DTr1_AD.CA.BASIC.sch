<?xml version="1.0" encoding="UTF-8"?>
<!-- 
:   AD.CA.BASIC  Basic Address (CA constraints)
:   Used to communicate addresses for simple display, mailing and contact purposes. The data type is not generally suitable for registries

    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="AD.CA.BASIC">
   <extends rule="AD"/>
   <assert role="error"
           test="@nullFlavor or not(hl7:useablePeriod)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.CA.BASIC">dtr1-1-AD.CA.BASIC: useablePeriod property is not permitted</assert>
   <assert role="error"
           test="@nullFlavor or not(hl7:isNotOrdered)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.CA.BASIC">dtr1-2-AD.CA.BASIC: isNotOrdered property is not permitted</assert>
   <assert role="error"
           test="@nullFlavor or @use"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.CA.BASIC">dtr1-3-AD.CA.BASIC: @use is required</assert>
   <assert role="error"
           test="@nullFlavor or (translate(concat(' ', @use, ' '), '(H|PHYS|PST|TMP|WP|CONF|DIR) ', '') = '' and (count(tokenize (@use, ' '))&lt;=3))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.CA.BASIC">dtr1-4-AD.CA.BASIC: @use may have up to three codes and must be drawn from 'H', 'PHYS', 'PST', 'TMP', 'WP', 'CONF', 'DIR'</assert>
   <assert role="error"
           test="@nullFlavor or count(* except (hl7:country | hl7:city | hl7:state | hl7:postalCode | hl7:addressLine))=0 or count(hl7:delimiter)&lt;=4"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.CA.BASIC">dtr1-5-AD.CA.BASIC: supported address parts (part types) are country, city, state, postalCode, addressLine and up to four delimiter</assert>
   <assert role="error"
           test="not(*[string-length()&gt;80])"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.CA.BASIC">dtr1-6-AD.CA.BASIC: address parts and delimiter-separated text has each a maximum length of 80 characters</assert>
</rule>
