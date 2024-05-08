<?xml version="1.0" encoding="UTF-8"?>
<!-- 
:   TEL.PHONE Phone Number (CA constraints)
:   Allows Allows phone and fax numbers to be communicated
:   Additional guidance for DIR: to be used for immediate direct communications between providers (e.g. pharmacist to physician for potential medication interaction issues)
:   Note 1: No constraints have been applied to the content to restrict it to Canadian country codes
:   Note 2: No constraints have been applied to the format. Best practice is to always include country code and area code when known.

    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron"
      abstract="true"
      id="TEL.CA.PHONE">
   <extends rule="TEL"/>
   <assert role="error"
           test="@nullFlavor or not(hl7:useablePeriod)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TEL.CA.PHONE">dtr1-1-TEL.CA.PHONE: useablePeriod property is not permitted</assert>
   <assert role="error"
           test="@nullFlavor or @use"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TEL.CA.PHONE">dtr1-2-TEL.CA.PHONE: @use is required</assert>
   <assert role="error"
           test="@nullFlavor or (translate(concat(' ', @use, ' '), '(EC|H|MC|PG|TMP|WP) ', '') = '' and (count(tokenize (@vauselue, ' '))&lt;=3))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TEL.CA.PHONE">dtr1-3-TEL.CA.PHONE: œuse may have up to three codes and must be drawn from 'EC', 'H', 'MC', 'PG', 'TMP', 'WP'</assert>
   <assert role="error"
           test="@nullFlavor or string-length(@value)&lt;=40"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TEL.CA.PHONE">dtr1-4-TEL.CA.PHONE: @value has maximum length of 40 characters</assert>
   <assert role="error"
           test="@nullFlavor or matches(@value,'^(fax | tel):')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_TEL.CA.PHONE">dtr1-5-TEL.CA.PHONE: telecommunication scheme supported is "fax:" or "tel:"</assert>
</rule>
