<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.11039
Name: Rubriek 39 Hartonderzoek
Description: Vastleggen van het onderzoek van het hart en het vaatstelsel conform de JGZ-richtlijn "Vroegtijdige opsporing van aangeboren hartafwijkingen 0-19 jaar".
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000">
   <title>Rubriek 39 Hartonderzoek</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]
Item: (rubricCluster39)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]
Item: (rubricCluster39)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]"
         id="d40e13167-false-d274660e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="string(@classCode) = ('CLUSTER') or not(@classCode)">(rubricCluster39): de waarde van classCode MOET 'CLUSTER' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(rubricCluster39): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']) &gt;= 1">(rubricCluster39): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']) &lt;= 1">(rubricCluster39): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'R039' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &gt;= 1">(rubricCluster39): element hl7:code[(@code = 'R039' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'R039' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &lt;= 1">(rubricCluster39): element hl7:code[(@code = 'R039' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40855']]]) &lt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40855']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40861']]]) &lt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40861']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40862']]]) &lt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40862']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]]) &lt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]]) &lt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40206']]]) &lt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40206']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40207']]]) &lt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40207']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40146']]]) &lt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40146']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40746']]]) &lt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40746']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40428']]]) &lt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40428']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']
Item: (rubricCluster39)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']"
         id="d40e13265-false-d274843e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(rubricCluster39): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.11039')">(rubricCluster39): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.11039' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:code[(@code = 'R039' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]
Item: (rubricCluster39)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:code[(@code = 'R039' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]"
         id="d40e13276-false-d274862e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster39): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="@nullFlavor or (@code='R039' and @codeSystem='2.16.840.1.113883.2.4.4.40.391')">(rubricCluster39): de elementwaarde MOET een zijn van 'code 'R039' codeSystem '2.16.840.1.113883.2.4.4.40.391''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40855']]]
Item: (rubricCluster39)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G044'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]
Item: (rubricCluster39)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G044'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]"
         id="d40e13290-false-d274900e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &gt;= 1">(rubricCluster39): element hl7:groupCluster[hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &lt;= 1">(rubricCluster39): element hl7:groupCluster[hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G044'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]
Item: (rubricCluster39)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G044'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]"
         id="d40e13295-false-d274956e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(distinct-values(.//hl7:methodCode/@code))&lt;=1">(rubricCluster39): Meer dan één meetmethode gevonden. Per voorkomen van groep 44 mag er maar 1 meetmethode worden gebruikt.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &gt;= 1">(rubricCluster39): element hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &lt;= 1">(rubricCluster39): element hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40856']]]) &gt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40856']]] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40856']]]) &lt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40856']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40858']]]) &lt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40858']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40859']]]) &lt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40859']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40860']]]) &lt;= 1">(rubricCluster39): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40860']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G044'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]
Item: (rubricCluster39)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G044'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]"
         id="d40e13308-false-d275038e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster39): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11039-2020-05-27T000000.html"
              test="@nullFlavor or (@code='G044' and @codeSystem='2.16.840.1.113883.2.4.4.40.393')">(rubricCluster39): de elementwaarde MOET een zijn van 'code 'G044' codeSystem '2.16.840.1.113883.2.4.4.40.393''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G044'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40856']]]
Item: (rubricCluster39)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G044'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40858']]]
Item: (rubricCluster39)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G044'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40859']]]
Item: (rubricCluster39)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G044'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G044' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40860']]]
Item: (rubricCluster39)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40861']]]
Item: (rubricCluster39)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40862']]]
Item: (rubricCluster39)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]]
Item: (rubricCluster39)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41486
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]]
Item: (obsElement1486)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41486
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]
Item: (obsElement1486)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement1486): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement1486): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="string(@negationInd) = ('false') or not(@negationInd)">(obsElement1486): de waarde van negationInd MOET 'false' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]) &gt;= 1">(obsElement1486): element hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]) &lt;= 1">(obsElement1486): element hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="count(hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(obsElement1486): element hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="count(hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(obsElement1486): element hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41486
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]
Item: (obsElement1486)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(obsElement1486): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="@nullFlavor or (@code='271649006' and @codeSystem='2.16.840.1.113883.6.96')">(obsElement1486): de elementwaarde MOET een zijn van 'code '271649006' codeSystem '2.16.840.1.113883.6.96''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41486
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (obsElement1486)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="(@nullFlavor or (@unit='mm[Hg]'))">(obsElement1486): value MOET eenheid 'mm[Hg]' gebruiken en </assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="(@nullFlavor or (number(@value)&gt;=0))">(obsElement1486): value MOET in bereik [0..] liggen  </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(obsElement1486): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(obsElement1486): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="@xsi:type">(obsElement1486): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41486-2020-05-27T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(obsElement1486): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41486
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]
Item: (obsElement1486)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41486
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271649006' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]
Item: (obsElement1486)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]]
Item: (rubricCluster39)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41487
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]]
Item: (obsElement1487)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41487
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]
Item: (obsElement1487)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement1487): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement1487): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="string(@negationInd) = ('false') or not(@negationInd)">(obsElement1487): de waarde van negationInd MOET 'false' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]) &gt;= 1">(obsElement1487): element hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]) &lt;= 1">(obsElement1487): element hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="count(hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(obsElement1487): element hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="count(hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(obsElement1487): element hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41487
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]
Item: (obsElement1487)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(obsElement1487): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="@nullFlavor or (@code='271650006' and @codeSystem='2.16.840.1.113883.6.96')">(obsElement1487): de elementwaarde MOET een zijn van 'code '271650006' codeSystem '2.16.840.1.113883.6.96''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41487
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (obsElement1487)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="(@nullFlavor or (@unit='mm[Hg]'))">(obsElement1487): value MOET eenheid 'mm[Hg]' gebruiken en </assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="(@nullFlavor or (number(@value)&gt;=0))">(obsElement1487): value MOET in bereik [0..] liggen  </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(obsElement1487): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(obsElement1487): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="@xsi:type">(obsElement1487): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41487-2020-05-27T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(obsElement1487): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41487
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]
Item: (obsElement1487)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41487
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:observation[hl7:code[(@code = '271650006' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]
Item: (obsElement1487)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40206']]]
Item: (rubricCluster39)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40207']]]
Item: (rubricCluster39)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40146']]]
Item: (rubricCluster39)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40746']]]
Item: (rubricCluster39)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11039
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11039']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40428']]]
Item: (rubricCluster39)
-->
</pattern>
