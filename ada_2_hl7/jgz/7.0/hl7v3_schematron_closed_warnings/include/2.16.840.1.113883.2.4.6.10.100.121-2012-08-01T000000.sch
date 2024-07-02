<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.121
Name: A_Zwangerschap [universal]
Description: COCT_RM900914NL: Zwangerschaps- en bevallingsgegevens
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000">
   <title>A_Zwangerschap [universal]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]"
         id="d41e35071-false-d1456129e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]) &gt;= 1">(A_Zwangerschap-universal): element hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]) &lt;= 1">(A_Zwangerschap-universal): element hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]"
         id="d41e35082-false-d1456152e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('COND') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'COND' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']) &gt;= 1">(A_Zwangerschap-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']) &lt;= 1">(A_Zwangerschap-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'R014' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = 'R014' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'R014' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = 'R014' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:subject[hl7:personalRelationship][not(@nullFlavor)]) &gt;= 1">(A_Zwangerschap-universal): element hl7:subject[hl7:personalRelationship][not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:subject[hl7:personalRelationship][not(@nullFlavor)]) &lt;= 1">(A_Zwangerschap-universal): element hl7:subject[hl7:personalRelationship][not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]) &lt;= 1">(A_Zwangerschap-universal): element hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:sequelTo) = 0">(A_Zwangerschap-universal): element hl7:sequelTo MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']"
         id="d41e35134-false-d1456239e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.121')">(A_Zwangerschap-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.121' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:code[(@code = 'R014' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:code[(@code = 'R014' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]"
         id="d41e35144-false-d1456258e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='R014' and @codeSystem='2.16.840.1.113883.2.4.4.40.391')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code 'R014' codeSystem '2.16.840.1.113883.2.4.4.40.391''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]"
         id="d41e35154-false-d1456276e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:patient | hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(A_Zwangerschap-universal): keuze (hl7:patient  of  hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(A_Zwangerschap-universal): keuze (hl7:patient  of  hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]) bevat te veel elementen [max 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:patient
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:patient"
         id="d41e35187-false-d1456311e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('PAT') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'PAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]"
         id="d41e35202-false-d1456326e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('PRS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'PRS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']) &gt;= 1">(A_Zwangerschap-universal): element hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']) &lt;= 1">(A_Zwangerschap-universal): element hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]/hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]/hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]"
         id="d41e35221-false-d1456371e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='NMTH' and @codeSystem='2.16.840.1.113883.5.111')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code 'NMTH' codeSystem '2.16.840.1.113883.5.111''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]/hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]/hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']"
         id="d41e35232-false-d1456391e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('PSN')">(A_Zwangerschap-universal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(A_Zwangerschap-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('NI')">(A_Zwangerschap-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]"
         id="d41e35252-false-d1456422e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('OUTC') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'OUTC' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]) &gt;= 1">(A_Zwangerschap-universal): element hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]) &lt;= 1">(A_Zwangerschap-universal): element hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]"
         id="d41e35302-false-d1456452e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('PROC') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'PROC' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]"
         id="d41e35313-false-d1456490e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='R015' and @codeSystem='2.16.840.1.113883.2.4.4.40.391')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code 'R015' codeSystem '2.16.840.1.113883.2.4.4.40.391''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]"
         id="d41e35324-false-d1456508e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(A_Zwangerschap-universal): keuze (hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(A_Zwangerschap-universal): keuze (hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]) bevat te veel elementen [max 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35335-false-d1456537e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '97' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '97' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '97' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '97' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '97' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '97' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35346-false-d1456588e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='97' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '97' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]"
         id="d41e35357-false-d1456608e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="(@nullFlavor or (@unit='min'))">(A_Zwangerschap-universal): value MOET eenheid 'min' gebruiken </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(A_Zwangerschap-universal): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(A_Zwangerschap-universal): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35370-false-d1456645e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '98' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '98' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '98' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '98' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '98' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '98' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35381-false-d1456696e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='98' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '98' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]"
         id="d41e35392-false-d1456716e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="(@nullFlavor or (@unit='min'))">(A_Zwangerschap-universal): value MOET eenheid 'min' gebruiken </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(A_Zwangerschap-universal): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(A_Zwangerschap-universal): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35406-false-d1456753e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '100' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '100' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '100' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '100' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '100' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '100' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35417-false-d1456806e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='100' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '100' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e35428-false-d1456828e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.153 W0153 Ligging bij geboorte (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_Zwangerschap-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.153 W0153 Ligging bij geboorte (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]"
         id="d41e35441-false-d1456859e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '38386-9' and @codeSystem = '2.16.840.1.113883.6.1')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '38386-9' and @codeSystem = '2.16.840.1.113883.6.1')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '38386-9' and @codeSystem = '2.16.840.1.113883.6.1')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '38386-9' and @codeSystem = '2.16.840.1.113883.6.1')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]/hl7:code[(@code = '38386-9' and @codeSystem = '2.16.840.1.113883.6.1')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]/hl7:code[(@code = '38386-9' and @codeSystem = '2.16.840.1.113883.6.1')]"
         id="d41e35452-false-d1456912e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='38386-9' and @codeSystem='2.16.840.1.113883.6.1')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '38386-9' codeSystem '2.16.840.1.113883.6.1''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e35463-false-d1456934e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.158 W0158 Kleur vruchtwater (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_Zwangerschap-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.158 W0158 Kleur vruchtwater (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35476-false-d1456965e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '105' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '105' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '105' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '105' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '105' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '105' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35487-false-d1457016e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='105' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '105' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d41e35498-false-d1457036e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35508-false-d1457047e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1323' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1323' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1323' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1323' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1323' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1323' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35519-false-d1457098e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1323' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '1323' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d41e35530-false-d1457118e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35539-false-d1457129e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '106' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '106' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '106' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '106' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '106' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '106' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35550-false-d1457180e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='106' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '106' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d41e35561-false-d1457200e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35572-false-d1457217e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '107' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '107' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '107' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '107' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '107' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '107' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35583-false-d1457268e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='107' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '107' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d41e35594-false-d1457288e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35608-false-d1457305e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35619-false-d1457356e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1324' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '1324' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d41e35630-false-d1457376e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]"
         id="d41e35645-false-d1457393e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(A_Zwangerschap-universal): keuze (hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(A_Zwangerschap-universal): keuze (hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]) bevat te veel elementen [max 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35656-false-d1457422e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '82' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '82' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '82' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '82' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '82' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '82' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35667-false-d1457481e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='82' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '82' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]"
         id="d41e35678-false-d1457501e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="(@nullFlavor or (@unit='d'))">(A_Zwangerschap-universal): value MOET eenheid 'd' gebruiken </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(A_Zwangerschap-universal): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(A_Zwangerschap-universal): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component
Item: (A_Zwangerschap-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35695-false-d1457547e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '91' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '91' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '91' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '91' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '91' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '91' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35706-false-d1457606e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='91' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '91' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d41e35717-false-d1457626e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component
Item: (A_Zwangerschap-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35733-false-d1457652e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '92' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '92' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '92' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '92' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '92' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '92' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35744-false-d1457711e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='92' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '92' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d41e35755-false-d1457731e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component
Item: (A_Zwangerschap-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35770-false-d1457757e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '93' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '93' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '93' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '93' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '93' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '93' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35802-false-d1457812e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='93' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '93' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d41e35812-false-d1457832e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e35822-false-d1457851e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_Zwangerschap-universal): element hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_Zwangerschap-universal): element hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e35831-false-d1457881e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.147-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.147-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.147-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.147-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35842-false-d1457934e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='745' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '745' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.147-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.147-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d41e35853-false-d1457956e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.147-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.147 W0147 Type drugs (HL7) (2012-05-21T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35866-false-d1457976e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '619' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '619' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '619' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '619' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '619' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '619' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35877-false-d1458035e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='619' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '619' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d41e35888-false-d1458055e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component
Item: (A_Zwangerschap-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35904-false-d1458081e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '740' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '740' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '740' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '740' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '740' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '740' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35926-false-d1458140e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='740' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '740' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]"
         id="d41e35936-false-d1458160e0">
      <extends rule="INT"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="(@nullFlavor or (number(@value)&gt;=1))">(A_Zwangerschap-universal): value MOET in bereik [1..] liggen  </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(A_Zwangerschap-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component
Item: (A_Zwangerschap-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e35953-false-d1458204e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '741' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '741' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '741' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '741' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '741' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '741' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35975-false-d1458263e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='741' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '741' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]"
         id="d41e35985-false-d1458283e0">
      <extends rule="INT"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="(@nullFlavor or (number(@value)&gt;=1))">(A_Zwangerschap-universal): value MOET in bereik [1..] liggen  </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(A_Zwangerschap-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component
Item: (A_Zwangerschap-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e36002-false-d1458327e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1579' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1579' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1579' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1579' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1579' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1579' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e36013-false-d1458386e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1579' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '1579' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d41e36024-false-d1458406e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component
Item: (A_Zwangerschap-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e36040-false-d1458432e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1581' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1581' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1581' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1581' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1581' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1581' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e36062-false-d1458491e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1581' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '1581' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d41e36072-false-d1458511e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component
Item: (A_Zwangerschap-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]"
         id="d41e36089-false-d1458539e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]) &gt;= 1">(A_Zwangerschap-universal): element hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]) &lt;= 1">(A_Zwangerschap-universal): element hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]"
         id="d41e36098-false-d1458569e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('SBADM') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'SBADM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:medication]) &gt;= 1">(A_Zwangerschap-universal): element hl7:consumable[not(@nullFlavor)][hl7:medication] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:medication]) &lt;= 1">(A_Zwangerschap-universal): element hl7:consumable[not(@nullFlavor)][hl7:medication] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]"
         id="d41e36127-false-d1458605e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('CSM') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'CSM' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]) &gt;= 1">(A_Zwangerschap-universal): element hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]) &lt;= 1">(A_Zwangerschap-universal): element hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]"
         id="d41e36136-false-d1458639e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('ADMM') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'ADMM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]) &gt;= 1">(A_Zwangerschap-universal): element hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]) &lt;= 1">(A_Zwangerschap-universal): element hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]"
         id="d41e36145-false-d1458673e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('MMAT') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'MMAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@determinerCode) = ('KIND') or not(@determinerCode)">(A_Zwangerschap-universal): de waarde van determinerCode MOET 'KIND' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e36153-false-d1458713e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.134 W0134 Medicijnen soort (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_Zwangerschap-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.134 W0134 Medicijnen soort (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:sequelTo
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:sequelTo"
         id="d41e36169-false-d1458740e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:sequenceNumber) &lt;= 1">(A_Zwangerschap-universal): element hl7:sequenceNumber komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:sequelTo/hl7:sequenceNumber
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:sequelTo/hl7:sequenceNumber"
         id="d41e36178-false-d1458764e0">
      <extends rule="INT"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:INT" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="(@nullFlavor or (number(@value)&gt;=1))">(A_Zwangerschap-universal): value MOET in bereik [1..] liggen  </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(A_Zwangerschap-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
   </rule>
</pattern>
