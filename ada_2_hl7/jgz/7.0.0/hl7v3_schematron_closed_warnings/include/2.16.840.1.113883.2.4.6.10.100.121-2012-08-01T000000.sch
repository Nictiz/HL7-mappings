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
         id="d40e20041-false-d538376e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]) &gt;= 1">(A_Zwangerschap-universal): element hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]) &lt;= 1">(A_Zwangerschap-universal): element hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]"
         id="d40e20052-false-d538399e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('COND') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'COND' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']) &gt;= 1">(A_Zwangerschap-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']) &lt;= 1">(A_Zwangerschap-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'R014' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = 'R014' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'R014' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = 'R014' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:subject[hl7:personalRelationship][not(@nullFlavor)]) &gt;= 1">(A_Zwangerschap-universal): element hl7:subject[hl7:personalRelationship][not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:subject[hl7:personalRelationship][not(@nullFlavor)]) &lt;= 1">(A_Zwangerschap-universal): element hl7:subject[hl7:personalRelationship][not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]) &lt;= 1">(A_Zwangerschap-universal): element hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:sequelTo) = 0">(A_Zwangerschap-universal): element hl7:sequelTo MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']"
         id="d40e20104-false-d538486e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.121')">(A_Zwangerschap-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.121' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:code[(@code = 'R014' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:code[(@code = 'R014' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]"
         id="d40e20114-false-d538505e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='R014' and @codeSystem='2.16.840.1.113883.2.4.4.40.391')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code 'R014' codeSystem '2.16.840.1.113883.2.4.4.40.391''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]"
         id="d40e20124-false-d538523e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:patient | hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(A_Zwangerschap-universal): keuze (hl7:patient  of  hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(A_Zwangerschap-universal): keuze (hl7:patient  of  hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]) bevat te veel elementen [max 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:patient
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:patient"
         id="d40e20157-false-d538558e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('PAT') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'PAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]"
         id="d40e20172-false-d538573e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('PRS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'PRS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']) &gt;= 1">(A_Zwangerschap-universal): element hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']) &lt;= 1">(A_Zwangerschap-universal): element hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]/hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]/hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]"
         id="d40e20191-false-d538618e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='NMTH' and @codeSystem='2.16.840.1.113883.5.111')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code 'NMTH' codeSystem '2.16.840.1.113883.5.111''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]/hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:subject[hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[(@code = 'NMTH' and @codeSystem = '2.16.840.1.113883.5.111') or @nullFlavor]]/hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']"
         id="d40e20202-false-d538638e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('PSN')">(A_Zwangerschap-universal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(A_Zwangerschap-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('NI')">(A_Zwangerschap-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]"
         id="d40e20222-false-d538669e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('OUTC') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'OUTC' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]) &gt;= 1">(A_Zwangerschap-universal): element hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]) &lt;= 1">(A_Zwangerschap-universal): element hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]"
         id="d40e20272-false-d538699e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('PROC') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'PROC' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]"
         id="d40e20283-false-d538737e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='R015' and @codeSystem='2.16.840.1.113883.2.4.4.40.391')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code 'R015' codeSystem '2.16.840.1.113883.2.4.4.40.391''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]"
         id="d40e20294-false-d538755e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(A_Zwangerschap-universal): keuze (hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(A_Zwangerschap-universal): keuze (hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]) bevat te veel elementen [max 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e20305-false-d538784e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '97' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '97' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '97' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '97' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '97' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '97' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20316-false-d538835e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='97' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '97' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '97'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]"
         id="d40e20327-false-d538855e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="(@nullFlavor or (@unit='min'))">(A_Zwangerschap-universal): value MOET eenheid 'min' gebruiken </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(A_Zwangerschap-universal): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(A_Zwangerschap-universal): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e20340-false-d538892e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '98' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '98' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '98' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '98' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '98' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '98' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20351-false-d538943e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='98' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '98' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '98'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]"
         id="d40e20362-false-d538963e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="(@nullFlavor or (@unit='min'))">(A_Zwangerschap-universal): value MOET eenheid 'min' gebruiken </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(A_Zwangerschap-universal): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(A_Zwangerschap-universal): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e20376-false-d539000e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '100' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '100' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '100' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '100' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '100' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '100' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20387-false-d539053e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='100' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '100' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '100'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e20398-false-d539075e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.153 W0153 Ligging bij geboorte (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.153-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_Zwangerschap-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.153 W0153 Ligging bij geboorte (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]"
         id="d40e20411-false-d539106e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '38386-9' and @codeSystem = '2.16.840.1.113883.6.1')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '38386-9' and @codeSystem = '2.16.840.1.113883.6.1')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '38386-9' and @codeSystem = '2.16.840.1.113883.6.1')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '38386-9' and @codeSystem = '2.16.840.1.113883.6.1')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]/hl7:code[(@code = '38386-9' and @codeSystem = '2.16.840.1.113883.6.1')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]/hl7:code[(@code = '38386-9' and @codeSystem = '2.16.840.1.113883.6.1')]"
         id="d40e20422-false-d539159e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='38386-9' and @codeSystem='2.16.840.1.113883.6.1')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '38386-9' codeSystem '2.16.840.1.113883.6.1''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '38386-9'][@codeSystem = '2.16.840.1.113883.6.1']][not(@nullFlavor)]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e20433-false-d539181e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.158 W0158 Kleur vruchtwater (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.158-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_Zwangerschap-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.158 W0158 Kleur vruchtwater (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e20446-false-d539212e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '105' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '105' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '105' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '105' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '105' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '105' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20457-false-d539263e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='105' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '105' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '105'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d40e20468-false-d539283e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e20478-false-d539294e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1323' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1323' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1323' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1323' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1323' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1323' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20489-false-d539345e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1323' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '1323' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1323'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d40e20500-false-d539365e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e20509-false-d539376e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '106' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '106' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '106' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '106' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '106' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '106' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20520-false-d539427e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='106' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '106' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '106'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d40e20531-false-d539447e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e20542-false-d539464e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '107' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '107' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '107' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '107' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '107' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '107' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20553-false-d539515e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='107' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '107' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '107'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d40e20564-false-d539535e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e20578-false-d539552e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20589-false-d539603e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1324' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '1324' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:outcome[hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]]/hl7:delivery[hl7:code[(@code = 'R015' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]]/hl7:component[hl7:deliveryObservation]/hl7:deliveryObservation[hl7:code[@code = '1324'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d40e20600-false-d539623e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]"
         id="d40e20615-false-d539640e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(A_Zwangerschap-universal): keuze (hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(A_Zwangerschap-universal): keuze (hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]) bevat te veel elementen [max 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e20626-false-d539669e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '82' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '82' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '82' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '82' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '82' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '82' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20637-false-d539728e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='82' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '82' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '82'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]"
         id="d40e20648-false-d539748e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="(@nullFlavor or (@unit='d'))">(A_Zwangerschap-universal): value MOET eenheid 'd' gebruiken </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(A_Zwangerschap-universal): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(A_Zwangerschap-universal): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
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
         id="d40e20665-false-d539794e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '91' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '91' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '91' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '91' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '91' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '91' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20676-false-d539853e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='91' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '91' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '91'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d40e20687-false-d539873e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
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
         id="d40e20703-false-d539899e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '92' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '92' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '92' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '92' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '92' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '92' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20714-false-d539958e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='92' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '92' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '92'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d40e20725-false-d539978e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
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
         id="d40e20740-false-d540004e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '93' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '93' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '93' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '93' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '93' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '93' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20772-false-d540059e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='93' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '93' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d40e20782-false-d540079e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(A_Zwangerschap-universal): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e20792-false-d540098e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_Zwangerschap-universal): element hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_Zwangerschap-universal): element hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e20801-false-d540128e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.147-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.147-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.147-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.147-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20812-false-d540181e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='745' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '745' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.147-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '93'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:component[hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:detailPregnancyObservation[hl7:code[(@code = '745' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.147-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d40e20823-false-d540203e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.147-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.147 W0147 Type drugs (HL7) (2012-05-21T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e20836-false-d540223e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '619' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '619' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '619' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '619' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '619' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '619' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20847-false-d540282e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='619' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '619' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '619'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d40e20858-false-d540302e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
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
         id="d40e20874-false-d540328e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '740' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '740' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '740' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '740' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '740' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '740' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20896-false-d540387e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='740' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '740' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '740'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]"
         id="d40e20906-false-d540407e0">
      <extends rule="INT"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="(@nullFlavor or (number(@value)&gt;=1))">(A_Zwangerschap-universal): value MOET in bereik [1..] liggen  </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(A_Zwangerschap-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
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
         id="d40e20923-false-d540451e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '741' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '741' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '741' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '741' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '741' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '741' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20945-false-d540510e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='741' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '741' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '741'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]"
         id="d40e20955-false-d540530e0">
      <extends rule="INT"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="(@nullFlavor or (number(@value)&gt;=1))">(A_Zwangerschap-universal): value MOET in bereik [1..] liggen  </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(A_Zwangerschap-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
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
         id="d40e20972-false-d540574e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1579' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1579' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1579' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1579' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1579' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1579' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e20983-false-d540633e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1579' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '1579' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1579'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d40e20994-false-d540653e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
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
         id="d40e21010-false-d540679e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1581' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1581' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1581' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[(@code = '1581' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(A_Zwangerschap-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:component) = 0">(A_Zwangerschap-universal): element hl7:component MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1581' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1581' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e21032-false-d540738e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1581' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van 'code '1581' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component1[hl7:pregnancyObservations]/hl7:pregnancyObservations[hl7:code[@code = '1581'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d40e21042-false-d540758e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@xsi:type">(A_Zwangerschap-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
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
         id="d40e21059-false-d540786e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]) &gt;= 1">(A_Zwangerschap-universal): element hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]) &lt;= 1">(A_Zwangerschap-universal): element hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]"
         id="d40e21068-false-d540816e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('SBADM') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'SBADM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Zwangerschap-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:medication]) &gt;= 1">(A_Zwangerschap-universal): element hl7:consumable[not(@nullFlavor)][hl7:medication] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:medication]) &lt;= 1">(A_Zwangerschap-universal): element hl7:consumable[not(@nullFlavor)][hl7:medication] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]"
         id="d40e21097-false-d540852e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('CSM') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'CSM' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]) &gt;= 1">(A_Zwangerschap-universal): element hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]) &lt;= 1">(A_Zwangerschap-universal): element hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]"
         id="d40e21106-false-d540886e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('ADMM') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'ADMM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]) &gt;= 1">(A_Zwangerschap-universal): element hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]) &lt;= 1">(A_Zwangerschap-universal): element hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]"
         id="d40e21115-false-d540920e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@classCode) = ('MMAT') or not(@classCode)">(A_Zwangerschap-universal): de waarde van classCode MOET 'MMAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@determinerCode) = ('KIND') or not(@determinerCode)">(A_Zwangerschap-universal): de waarde van determinerCode MOET 'KIND' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_Zwangerschap-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_Zwangerschap-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e21123-false-d540960e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Zwangerschap-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.134 W0134 Medicijnen soort (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.134-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_Zwangerschap-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.134 W0134 Medicijnen soort (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:sequelTo
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:sequelTo"
         id="d40e21139-false-d540987e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Zwangerschap-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="count(hl7:sequenceNumber) &lt;= 1">(A_Zwangerschap-universal): element hl7:sequenceNumber komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.121
Context: *[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:sequelTo/hl7:sequenceNumber
Item: (A_Zwangerschap-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]]/hl7:pregnancyCondition[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.121']]/hl7:sequelTo/hl7:sequenceNumber"
         id="d40e21148-false-d541011e0">
      <extends rule="INT"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')">(A_Zwangerschap-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:INT" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="(@nullFlavor or (number(@value)&gt;=1))">(A_Zwangerschap-universal): value MOET in bereik [1..] liggen  </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.121-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(A_Zwangerschap-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
   </rule>
</pattern>
