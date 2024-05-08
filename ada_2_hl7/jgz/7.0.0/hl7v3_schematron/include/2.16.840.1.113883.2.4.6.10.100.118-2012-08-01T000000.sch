<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.118
Name: A_NeonateData [universal]
Description: COCT_RM900913NL: Gegevens van de pasgeborene en eerste levensweken
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000">
   <title>A_NeonateData [universal]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]"
         id="d41e32925-false-d777195e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]"
         id="d41e32936-false-d777232e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('CATEGORY') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'CATEGORY' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']) &gt;= 1">(A_NeonateData-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']) &lt;= 1">(A_NeonateData-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'R016' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = 'R016' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'R016' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = 'R016' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']"
         id="d41e33017-false-d777473e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.118')">(A_NeonateData-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.118' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:code[(@code = 'R016' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:code[(@code = 'R016' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]"
         id="d41e33027-false-d777492e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='R016' and @codeSystem='2.16.840.1.113883.2.4.4.40.391')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code 'R016' codeSystem '2.16.840.1.113883.2.4.4.40.391''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]"
         id="d41e33037-false-d777514e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]) &gt;= 1">(A_NeonateData-universal): element hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]) &lt;= 1">(A_NeonateData-universal): element hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]"
         id="d41e33044-false-d777548e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('ENC') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'ENC' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(A_NeonateData-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]"
         id="d41e33055-false-d777608e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='IMP' and @codeSystem='2.16.840.1.113883.5.4')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code 'IMP' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10264
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime
Item: (PeriodeOpnameKinderafdeling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime"
         id="d777622e6-false-d777630e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeOpnameKinderafdeling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeOpnameKinderafdeling): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeOpnameKinderafdeling): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeOpnameKinderafdeling): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeOpnameKinderafdeling): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeOpnameKinderafdeling): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeOpnameKinderafdeling): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10264
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime/hl7:low
Item: (PeriodeOpnameKinderafdeling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime/hl7:low"
         id="d777622e43-false-d777695e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeOpnameKinderafdeling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="not(*)">(PeriodeOpnameKinderafdeling): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeOpnameKinderafdeling): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10264
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime/hl7:high
Item: (PeriodeOpnameKinderafdeling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime/hl7:high"
         id="d777622e62-false-d777718e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeOpnameKinderafdeling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="not(*)">(PeriodeOpnameKinderafdeling): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeOpnameKinderafdeling): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10264
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime/hl7:width
Item: (PeriodeOpnameKinderafdeling)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10264
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime/hl7:center
Item: (PeriodeOpnameKinderafdeling)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]"
         id="d41e33070-false-d777759e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('LOC') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'LOC' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]) &gt;= 1">(A_NeonateData-universal): element hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]) &lt;= 1">(A_NeonateData-universal): element hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]"
         id="d41e33090-false-d777789e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('SDLOC') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'SDLOC' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]"
         id="d41e33099-false-d777828e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='PEDICU' and @codeSystem='2.16.840.1.113883.5.111')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code 'PEDICU' codeSystem '2.16.840.1.113883.5.111''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33110-false-d777848e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('LOC') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'LOC' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33122-false-d777878e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('ACCM') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'ACCM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="not(@negationInd) or string(@negationInd)=('true','false')">(A_NeonateData-universal): attribuut @negationInd MOET datatype 'bl' hebben  - '<value-of select="@negationInd"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33137-false-d777920e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='144' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '144' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]"
         id="d41e33154-false-d777940e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]) &gt;= 1">(A_NeonateData-universal): element hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]) &lt;= 1">(A_NeonateData-universal): element hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]"
         id="d41e33163-false-d777970e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('SBADM') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'SBADM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="not(@negationInd) or string(@negationInd)=('true','false')">(A_NeonateData-universal): attribuut @negationInd MOET datatype 'bl' hebben  - '<value-of select="@negationInd"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]) &gt;= 1">(A_NeonateData-universal): element hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]) &lt;= 1">(A_NeonateData-universal): element hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]"
         id="d41e33183-false-d778012e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('CSM') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'CSM' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &gt;= 1">(A_NeonateData-universal): element hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]/hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]/hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33192-false-d778042e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('ADMM') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'ADMM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]/hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]/hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33203-false-d778072e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('MAT') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'MAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@determinerCode) = ('KIND') or not(@determinerCode)">(A_NeonateData-universal): de waarde van determinerCode MOET 'KIND' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]/hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]/hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33216-false-d778108e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='137' and @codeSystem='2.16.840.1.113883.2.4.4.40.267') or (@code='138' and @codeSystem='2.16.840.1.113883.2.4.4.40.267') or (@code='629' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '137' codeSystem '2.16.840.1.113883.2.4.4.40.267' of code '138' codeSystem '2.16.840.1.113883.2.4.4.40.267' of code '629' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33244-false-d778135e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33251-false-d778171e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40108
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0108)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d778222e9-false-d778230e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40108-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0108): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40108-2012-08-01T000000.html"
              test="@nullFlavor or (@code='108' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0108): de elementwaarde MOET een zijn van 'code '108' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40108
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (obsElement0108)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d778222e20-false-d778250e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40108-2012-08-01T000000.html"
              test="@xsi:type">(obsElement0108): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33266-false-d778264e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33276-false-d778294e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="parent::hl7:component3/../hl7:component3[./*/hl7:code[@code='108' and @codeSystem='2.16.840.1.113883.2.4.4.40.267'] and ./*/hl7:value[@value='true']]">(A_NeonateData-universal): Als er sprake is van een volgnumer bij meerling dan MOET de meerlingindicator (BDS-element 108) op 'true' staan</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33291-false-d778345e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='109' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '109' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]"
         id="d41e33301-false-d778365e0">
      <extends rule="INT"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="(@nullFlavor or (number(@value)&gt;=1))">(A_NeonateData-universal): value MOET in bereik [1..] liggen  </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(A_NeonateData-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]"
         id="d41e33316-false-d778397e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]"
         id="d41e33323-false-d778427e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]"
         id="d41e33334-false-d778478e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='8339-4' and @codeSystem='2.16.840.1.113883.6.1')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '8339-4' codeSystem '2.16.840.1.113883.6.1''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]"
         id="d41e33345-false-d778498e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="(@nullFlavor or (@unit='g'))">(A_NeonateData-universal): value MOET eenheid 'g' gebruiken en </assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="(@nullFlavor or (number(@value)&lt;=999999 and (matches(string(@value), '^[-+]?\d*$'))))">(A_NeonateData-universal): value MOET in bereik [..999999] liggen  en exact op 0 decimalen nauwkeurig zijn </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(A_NeonateData-universal): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(A_NeonateData-universal): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33359-false-d778543e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33366-false-d778573e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33377-false-d778624e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='111' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '111' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]"
         id="d41e33388-false-d778644e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="(@nullFlavor or (@unit='g'))">(A_NeonateData-universal): value MOET eenheid 'g' gebruiken en </assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="(@nullFlavor or (number(@value)&lt;=999999 and (matches(string(@value), '^[-+]?\d*$'))))">(A_NeonateData-universal): value MOET in bereik [..999999] liggen  en exact op 0 decimalen nauwkeurig zijn </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(A_NeonateData-universal): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(A_NeonateData-universal): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33402-false-d778689e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33409-false-d778719e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33420-false-d778770e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='112' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '112' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]"
         id="d41e33431-false-d778790e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="(@nullFlavor or (@unit='mm'))">(A_NeonateData-universal): value MOET eenheid 'mm' gebruiken en </assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="(@nullFlavor or (number(@value)&lt;=9999 and (matches(string(@value), '^[-+]?\d*$'))))">(A_NeonateData-universal): value MOET in bereik [..9999] liggen  en exact op 0 decimalen nauwkeurig zijn </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(A_NeonateData-universal): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(A_NeonateData-universal): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33446-false-d778835e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33453-false-d778865e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33464-false-d778916e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='113' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '113' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]"
         id="d41e33475-false-d778936e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="(@nullFlavor or (@unit='mm'))">(A_NeonateData-universal): value MOET eenheid 'mm' gebruiken en </assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="(@nullFlavor or (number(@value)&lt;=999 and (matches(string(@value), '^[-+]?\d*$'))))">(A_NeonateData-universal): value MOET in bereik [..999] liggen  en exact op 0 decimalen nauwkeurig zijn </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(A_NeonateData-universal): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(A_NeonateData-universal): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33493-false-d778981e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33500-false-d779011e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33511-false-d779062e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='115' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '115' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d41e33522-false-d779082e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]"
         id="d41e33535-false-d779096e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]"
         id="d41e33542-false-d779126e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]"
         id="d41e33553-false-d779177e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='9272-6' and @codeSystem='2.16.840.1.113883.6.1')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '9272-6' codeSystem '2.16.840.1.113883.6.1''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]"
         id="d41e33564-false-d779197e0">
      <extends rule="INT"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="(@nullFlavor or (number(@value)&gt;=0 and number(@value)&lt;=10))">(A_NeonateData-universal): value MOET in bereik [0..10] liggen  </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(A_NeonateData-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]"
         id="d41e33578-false-d779229e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]"
         id="d41e33585-false-d779259e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]"
         id="d41e33596-false-d779310e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='9274-2' and @codeSystem='2.16.840.1.113883.6.1')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '9274-2' codeSystem '2.16.840.1.113883.6.1''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]"
         id="d41e33607-false-d779330e0">
      <extends rule="INT"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="(@nullFlavor or (number(@value)&gt;=0 and number(@value)&lt;=10))">(A_NeonateData-universal): value MOET in bereik [0..10] liggen  </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(A_NeonateData-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33621-false-d779362e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33628-false-d779392e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33639-false-d779443e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='626' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '626' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d41e33650-false-d779463e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33663-false-d779477e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33670-false-d779507e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33681-false-d779558e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='131' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '131' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d41e33692-false-d779578e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33704-false-d779592e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33711-false-d779622e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33722-false-d779673e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='133' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '133' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d41e33733-false-d779693e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33745-false-d779707e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33752-false-d779737e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33763-false-d779788e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='134' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '134' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d41e33774-false-d779808e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33787-false-d779822e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33794-false-d779852e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33805-false-d779903e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='135' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '135' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d41e33816-false-d779923e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33828-false-d779937e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33835-false-d779967e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33846-false-d780018e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='145' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '145' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d41e33857-false-d780038e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33869-false-d780052e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33876-false-d780082e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33887-false-d780135e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='747' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '747' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e33898-false-d780157e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_NeonateData-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.177 W0177 Melkvoeding (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_NeonateData-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.177 W0177 Melkvoeding (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33913-false-d780185e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33920-false-d780215e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33931-false-d780268e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1340' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '1340' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e33942-false-d780290e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_NeonateData-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.177 W0177 Melkvoeding (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_NeonateData-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.177 W0177 Melkvoeding (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33956-false-d780320e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33963-false-d780354e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e33974-false-d780411e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='139' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '139' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10263
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value
Item: (PeriodeGeelZien)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value"
         id="d780425e6-false-d780433e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeGeelZien): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeelZien): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeelZien): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeelZien): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeelZien): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeelZien): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeelZien): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10263
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value/hl7:low
Item: (PeriodeGeelZien)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value/hl7:low"
         id="d780425e43-false-d780498e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeelZien): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeelZien): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeelZien): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10263
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value/hl7:high
Item: (PeriodeGeelZien)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value/hl7:high"
         id="d780425e62-false-d780521e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeelZien): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeelZien): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeelZien): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10263
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value/hl7:width
Item: (PeriodeGeelZien)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10263
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value/hl7:center
Item: (PeriodeGeelZien)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e33991-false-d780562e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e33998-false-d780592e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e34009-false-d780645e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='140' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '140' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e34020-false-d780667e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_NeonateData-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.183 W0183 Oorzaak geel zien (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_NeonateData-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.183 W0183 Oorzaak geel zien (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e34035-false-d780695e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e34042-false-d780725e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e34053-false-d780778e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or (@code='142' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '142' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e34064-false-d780800e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_NeonateData-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.185 W0185 Therapie (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_NeonateData-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.185 W0185 Therapie (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.118-2012-08-01T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
</pattern>
