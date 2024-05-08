<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.11041
Name: Rubriek 41 Rijksvaccinatieprogramma en andere vaccinaties
Description: Vastleggen van niet toedieningsgebonden elementen uit rubriek 41 Rijksvaccinatieprogramma en andere vaccinaties.
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000">
   <title>Rubriek 41 Rijksvaccinatieprogramma en andere vaccinaties</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]
Item: (rubricCluster41)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]
Item: (rubricCluster41)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]"
         id="d41e25097-false-d746152e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="string(@classCode) = ('CLUSTER') or not(@classCode)">(rubricCluster41): de waarde van classCode MOET 'CLUSTER' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(rubricCluster41): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']) &gt;= 1">(rubricCluster41): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']) &lt;= 1">(rubricCluster41): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'R041' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &gt;= 1">(rubricCluster41): element hl7:code[(@code = 'R041' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'R041' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &lt;= 1">(rubricCluster41): element hl7:code[(@code = 'R041' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40869']]]) &lt;= 1">(rubricCluster41): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40869']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.45063']]]) &lt;= 1">(rubricCluster41): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.45063']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]) &lt;= 1">(rubricCluster41): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40870']]]) &lt;= 1">(rubricCluster41): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40870']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40871']]]) &lt;= 1">(rubricCluster41): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40871']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41587']]]) &lt;= 1">(rubricCluster41): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41587']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']
Item: (rubricCluster41)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']"
         id="d41e25182-false-d746302e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(rubricCluster41): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.11041')">(rubricCluster41): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.11041' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:code[(@code = 'R041' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]
Item: (rubricCluster41)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:code[(@code = 'R041' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]"
         id="d41e25193-false-d746321e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster41): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="@nullFlavor or (@code='R041' and @codeSystem='2.16.840.1.113883.2.4.4.40.391')">(rubricCluster41): de elementwaarde MOET een zijn van 'code 'R041' codeSystem '2.16.840.1.113883.2.4.4.40.391''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40869']]]
Item: (rubricCluster41)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.45063']]]
Item: (rubricCluster41)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]
Item: (rubricCluster41)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]"
         id="d41e25212-false-d746386e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]) &gt;= 1">(rubricCluster41): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]) &lt;= 1">(rubricCluster41): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]
Item: (rubricCluster41)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="string(@negationInd) = ('false') or not(@negationInd)">(rubricCluster41): de waarde van negationInd MOET 'false' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40870']]]
Item: (rubricCluster41)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40871']]]
Item: (rubricCluster41)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41587']]]
Item: (rubricCluster41)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]
Item: (rubricCluster41)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]"
         id="d41e25239-false-d746518e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &gt;= 1">(rubricCluster41): element hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &lt;= 1">(rubricCluster41): element hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]
Item: (rubricCluster41)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]"
         id="d41e25241-false-d746574e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &gt;= 1">(rubricCluster41): element hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &lt;= 1">(rubricCluster41): element hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41448']]]) &lt;= 1">(rubricCluster41): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41448']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]
Item: (rubricCluster41)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]"
         id="d41e25248-false-d746627e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster41): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="@nullFlavor or (@code='G094' and @codeSystem='2.16.840.1.113883.2.4.4.40.393')">(rubricCluster41): de elementwaarde MOET een zijn van 'code 'G094' codeSystem '2.16.840.1.113883.2.4.4.40.393''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41448']]]
Item: (rubricCluster41)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]
Item: (rubricCluster41)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]"
         id="d41e25263-false-d746679e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &gt;= 1">(rubricCluster41): element hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &lt;= 1">(rubricCluster41): element hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]
Item: (rubricCluster41)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]"
         id="d41e25265-false-d746727e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &gt;= 1">(rubricCluster41): element hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &lt;= 1">(rubricCluster41): element hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41449']]]) &gt;= 1">(rubricCluster41): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41449']]] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41449']]]) &lt;= 1">(rubricCluster41): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41449']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41450']]]) &lt;= 1">(rubricCluster41): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41450']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41451']]]) &lt;= 1">(rubricCluster41): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41451']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]
Item: (rubricCluster41)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]"
         id="d41e25272-false-d746796e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster41): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11041-2012-08-01T000000.html"
              test="@nullFlavor or (@code='G095' and @codeSystem='2.16.840.1.113883.2.4.4.40.393')">(rubricCluster41): de elementwaarde MOET een zijn van 'code 'G095' codeSystem '2.16.840.1.113883.2.4.4.40.393''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41449']]]
Item: (rubricCluster41)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41450']]]
Item: (rubricCluster41)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11041
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11041']]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G094' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]]/hl7:groupCluster[hl7:code[(@code = 'G095' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41451']]]
Item: (rubricCluster41)
-->
</pattern>
