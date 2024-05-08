<?xml version="1.0" encoding="UTF-8"?>
<!-- 
:   PN.CA  Person Names (BC constraints)
:   Names are encoded as a sequence of Name Parts such as given name, family name, prefixes and suffixes.  Constraints for names are consistent with the requirements set out in the Pan Canadian Data Type Specification for the data type flavor PN.BASIC, with some additional constraints described below.

    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="PN.CA">
   <extends rule="PN"/>
   <assert role="error"
           test="not(hl7:given) or hl7:given/@qualifier"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.CA">dtr1-1-PN.CA: given/@qualifier property is required</assert>
   <assert role="error"
           test="not(hl7:given) or hl7:given[@qualifier='IN']"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.CA">dtr1-2-PN.CA: at present, the only value for name/given/@qualifier is IN (initial), indicating that the name part is just an initial</assert>
   <assert role="error"
           test="@nullFlavor or count(* except (hl7:family | hl7:given | hl7:prefix | hl7:suffix)) = 0"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.CA">dtr1-3-PN.CA: supported name parts (part types) are family, given, prefix, suffix</assert>
   <assert role="error"
           test="@nullFlavor or count(hl7:family) = 1"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.CA">dtr1-4-PN.CA: Exactly one [1..1] name/family part SHALL be present</assert>
   <assert role="error"
           test="@nullFlavor or count(hl7:given) &gt;= 1"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.CA">dtr1-5-PN.CA: One or more  [1..*] name/given parts SHALL be present</assert>
   <assert role="error"
           test="@nullFlavor or count(hl7:prefix) &lt;= 1"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.CA">dtr1-6-PN.CA: Zero or 1 [0..1] name/prefix name parts may be provided</assert>
   <assert role="error"
           test="@nullFlavor or count(hl7:suffix) &lt;= 1"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.CA">dtr1-7-PN.CA: Zero or 1 [0..1] name/suffix name parts may be provided</assert>
   <assert role="error"
           test="@nullFlavor or count(*) &lt;= 7"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.CA">dtr1-8-PN.CA: At most seven name parts may be present; since a family name part and at least one given name are mandatory, the cardinality for name parts is [2..7]</assert>
   <assert role="error"
           test="@nullFlavor or @use = ('L', 'P', 'ASGN', 'C', 'HC')"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PN.CA">dtr1-9-AD.CA: @use must be drawn from 'L', 'P', 'ASGN', 'C', 'HC'</assert>
</rule>
