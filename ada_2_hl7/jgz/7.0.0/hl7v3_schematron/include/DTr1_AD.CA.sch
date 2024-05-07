<?xml version="1.0" encoding="UTF-8"?>
<!-- 
:   AD.CA  Address (CA constraints)
:   Addresses are encoded with the street address sent as the value text of the address element, and additional address parts. Constraints for addresses are consistent with the requirements set out in the Pan Canadian Data Type Specification for the data type flavor AD.BASIC, with the exception of the fact that the pan Canadian Data Type specification pre-adopted coded state (province) and country elements from HL7’s release 2 Datatypes. Since CDA is fixed to release 1 datatypes, and the coded address parts are not available, the value for state and country address parts should be taken from the value sets assigned in the pan Canadian Datatype Specification.

    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="AD.CA">
   <extends rule="AD.CA.BASIC"/>
   <assert role="error"
           test="@nullFlavor or (translate(concat(' ', @use, ' '), '(H|PST|TMP|WP) ', '') = '' and (count(tokenize (@use, ' '))&lt;=3))"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.CA">dtr1-1-AD.CA: @use may have up to three codes and must be drawn from 'H', 'PST', 'TMP', 'WP'</assert>
   <assert role="error"
           test="@nullFlavor or count(* except (hl7:country | hl7:city | hl7:state | hl7:postalCode | hl7:streetAddressLine))=0 or count(hl7:delimiter)&lt;=4"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.CA">dtr1-2-AD.CA: supported address parts (part types) are country, city, state, postalCode, streetAddressLine and up to four delimiter</assert>
   <assert role="error"
           test="@nullFlavor or count(*[@code])=0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_AD.CA">dtr1-3-AD.CA: address parts SHALL NOT contain @code</assert>
</rule>
