<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.11025
Name: Rubriek 25 Bewegingsapparaat
Description: Vastleggen van het onderzoek naar de houding, de vorm en de functie van de wervelkolom en de extremiteiten.
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000">
   <title>Rubriek 25 Bewegingsapparaat</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]
Item: (rubricCluster25)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]
Item: (rubricCluster25)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]"
         id="d41e20773-false-d728403e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="string(@classCode) = ('CLUSTER') or not(@classCode)">(rubricCluster25): de waarde van classCode MOET 'CLUSTER' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(rubricCluster25): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']) &gt;= 1">(rubricCluster25): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']) &lt;= 1">(rubricCluster25): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'R025' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &gt;= 1">(rubricCluster25): element hl7:code[(@code = 'R025' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'R025' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &lt;= 1">(rubricCluster25): element hl7:code[(@code = 'R025' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40212']]]) &lt;= 1">(rubricCluster25): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40212']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40800']]]) &lt;= 1">(rubricCluster25): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40800']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40218']]]) &lt;= 1">(rubricCluster25): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40218']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41446']]]) &lt;= 1">(rubricCluster25): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41446']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40802']]]) &lt;= 1">(rubricCluster25): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40802']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41426']]]) &lt;= 1">(rubricCluster25): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41426']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41425']]]) &lt;= 1">(rubricCluster25): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41425']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40804']]]) &lt;= 1">(rubricCluster25): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40804']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']
Item: (rubricCluster25)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']"
         id="d41e20882-false-d728580e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(rubricCluster25): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.11025')">(rubricCluster25): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.11025' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:code[(@code = 'R025' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]
Item: (rubricCluster25)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:code[(@code = 'R025' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]"
         id="d41e20893-false-d728599e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster25): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="@nullFlavor or (@code='R025' and @codeSystem='2.16.840.1.113883.2.4.4.40.391')">(rubricCluster25): de elementwaarde MOET een zijn van 'code 'R025' codeSystem '2.16.840.1.113883.2.4.4.40.391''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40212']]]
Item: (rubricCluster25)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G024'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]
Item: (rubricCluster25)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G024'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]"
         id="d41e20907-false-d728637e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &gt;= 1">(rubricCluster25): element hl7:groupCluster[hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &lt;= 1">(rubricCluster25): element hl7:groupCluster[hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G024'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]
Item: (rubricCluster25)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G024'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]"
         id="d41e20912-false-d728669e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &gt;= 1">(rubricCluster25): element hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &lt;= 1">(rubricCluster25): element hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40217']]]) &gt;= 1">(rubricCluster25): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40217']]] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40217']]]) &lt;= 1">(rubricCluster25): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40217']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G024'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]
Item: (rubricCluster25)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G024'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]"
         id="d41e20919-false-d728712e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster25): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="@nullFlavor or (@code='G024' and @codeSystem='2.16.840.1.113883.2.4.4.40.393')">(rubricCluster25): de elementwaarde MOET een zijn van 'code 'G024' codeSystem '2.16.840.1.113883.2.4.4.40.393''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G024'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G024' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40217']]]
Item: (rubricCluster25)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40800']]]
Item: (rubricCluster25)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40218']]]
Item: (rubricCluster25)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G026'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]
Item: (rubricCluster25)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G026'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]"
         id="d41e20944-false-d728790e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &gt;= 1">(rubricCluster25): element hl7:groupCluster[hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &lt;= 1">(rubricCluster25): element hl7:groupCluster[hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G026'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]
Item: (rubricCluster25)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G026'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]"
         id="d41e20949-false-d728822e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &gt;= 1">(rubricCluster25): element hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &lt;= 1">(rubricCluster25): element hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40219']]]) &gt;= 1">(rubricCluster25): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40219']]] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40219']]]) &lt;= 1">(rubricCluster25): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40219']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G026'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]
Item: (rubricCluster25)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G026'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]"
         id="d41e20956-false-d728865e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster25): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="@nullFlavor or (@code='G026' and @codeSystem='2.16.840.1.113883.2.4.4.40.393')">(rubricCluster25): de elementwaarde MOET een zijn van 'code 'G026' codeSystem '2.16.840.1.113883.2.4.4.40.393''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G026'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G026' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40219']]]
Item: (rubricCluster25)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41446']]]
Item: (rubricCluster25)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40802']]]
Item: (rubricCluster25)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41426']]]
Item: (rubricCluster25)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41425']]]
Item: (rubricCluster25)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G028'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]
Item: (rubricCluster25)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G028'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]"
         id="d41e20996-false-d728983e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &gt;= 1">(rubricCluster25): element hl7:groupCluster[hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &lt;= 1">(rubricCluster25): element hl7:groupCluster[hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G028'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]
Item: (rubricCluster25)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G028'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]"
         id="d41e21001-false-d729015e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &gt;= 1">(rubricCluster25): element hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &lt;= 1">(rubricCluster25): element hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40221']]]) &gt;= 1">(rubricCluster25): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40221']]] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40221']]]) &lt;= 1">(rubricCluster25): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40221']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G028'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]
Item: (rubricCluster25)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G028'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]"
         id="d41e21008-false-d729058e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster25): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11025-2012-08-01T000000.html"
              test="@nullFlavor or (@code='G028' and @codeSystem='2.16.840.1.113883.2.4.4.40.393')">(rubricCluster25): de elementwaarde MOET een zijn van 'code 'G028' codeSystem '2.16.840.1.113883.2.4.4.40.393''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G028'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G028' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40221']]]
Item: (rubricCluster25)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40804']]]
Item: (rubricCluster25)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40223']]]
Item: (rubricCluster25)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11025
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11025']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40805']]]
Item: (rubricCluster25)
-->
</pattern>
