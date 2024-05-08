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
         id="d41e32925-false-d1449688e0">
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
         id="d41e32936-false-d1449725e0">
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
         id="d41e33017-false-d1449966e0">
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
         id="d41e33027-false-d1449985e0">
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
         id="d41e33037-false-d1450007e0">
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
         id="d41e33044-false-d1450041e0">
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
         id="d41e33055-false-d1450101e0">
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
         id="d1450115e6-false-d1450123e0">
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
         id="d1450115e43-false-d1450188e0">
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
         id="d1450115e62-false-d1450211e0">
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
         id="d41e33070-false-d1450252e0">
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
         id="d41e33090-false-d1450282e0">
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
         id="d41e33099-false-d1450321e0">
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
         id="d41e33110-false-d1450341e0">
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
         id="d41e33122-false-d1450371e0">
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
         id="d41e33137-false-d1450413e0">
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
         id="d41e33154-false-d1450433e0">
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
         id="d41e33163-false-d1450463e0">
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
         id="d41e33183-false-d1450505e0">
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
         id="d41e33192-false-d1450535e0">
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
         id="d41e33203-false-d1450565e0">
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
         id="d41e33216-false-d1450601e0">
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
         id="d41e33244-false-d1450628e0">
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
         id="d41e33251-false-d1450664e0">
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
         id="d1450715e9-false-d1450723e0">
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
         id="d1450715e20-false-d1450743e0">
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
         id="d41e33266-false-d1450757e0">
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
         id="d41e33276-false-d1450787e0">
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
         id="d41e33291-false-d1450838e0">
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
         id="d41e33301-false-d1450858e0">
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
         id="d41e33316-false-d1450890e0">
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
         id="d41e33323-false-d1450920e0">
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
         id="d41e33334-false-d1450971e0">
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
         id="d41e33345-false-d1450991e0">
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
         id="d41e33359-false-d1451036e0">
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
         id="d41e33366-false-d1451066e0">
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
         id="d41e33377-false-d1451117e0">
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
         id="d41e33388-false-d1451137e0">
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
         id="d41e33402-false-d1451182e0">
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
         id="d41e33409-false-d1451212e0">
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
         id="d41e33420-false-d1451263e0">
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
         id="d41e33431-false-d1451283e0">
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
         id="d41e33446-false-d1451328e0">
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
         id="d41e33453-false-d1451358e0">
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
         id="d41e33464-false-d1451409e0">
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
         id="d41e33475-false-d1451429e0">
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
         id="d41e33493-false-d1451474e0">
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
         id="d41e33500-false-d1451504e0">
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
         id="d41e33511-false-d1451555e0">
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
         id="d41e33522-false-d1451575e0">
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
         id="d41e33535-false-d1451589e0">
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
         id="d41e33542-false-d1451619e0">
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
         id="d41e33553-false-d1451670e0">
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
         id="d41e33564-false-d1451690e0">
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
         id="d41e33578-false-d1451722e0">
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
         id="d41e33585-false-d1451752e0">
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
         id="d41e33596-false-d1451803e0">
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
         id="d41e33607-false-d1451823e0">
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
         id="d41e33621-false-d1451855e0">
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
         id="d41e33628-false-d1451885e0">
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
         id="d41e33639-false-d1451936e0">
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
         id="d41e33650-false-d1451956e0">
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
         id="d41e33663-false-d1451970e0">
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
         id="d41e33670-false-d1452000e0">
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
         id="d41e33681-false-d1452051e0">
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
         id="d41e33692-false-d1452071e0">
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
         id="d41e33704-false-d1452085e0">
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
         id="d41e33711-false-d1452115e0">
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
         id="d41e33722-false-d1452166e0">
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
         id="d41e33733-false-d1452186e0">
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
         id="d41e33745-false-d1452200e0">
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
         id="d41e33752-false-d1452230e0">
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
         id="d41e33763-false-d1452281e0">
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
         id="d41e33774-false-d1452301e0">
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
         id="d41e33787-false-d1452315e0">
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
         id="d41e33794-false-d1452345e0">
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
         id="d41e33805-false-d1452396e0">
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
         id="d41e33816-false-d1452416e0">
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
         id="d41e33828-false-d1452430e0">
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
         id="d41e33835-false-d1452460e0">
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
         id="d41e33846-false-d1452511e0">
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
         id="d41e33857-false-d1452531e0">
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
         id="d41e33869-false-d1452545e0">
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
         id="d41e33876-false-d1452575e0">
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
         id="d41e33887-false-d1452628e0">
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
         id="d41e33898-false-d1452650e0">
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
         id="d41e33913-false-d1452678e0">
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
         id="d41e33920-false-d1452708e0">
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
         id="d41e33931-false-d1452761e0">
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
         id="d41e33942-false-d1452783e0">
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
         id="d41e33956-false-d1452813e0">
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
         id="d41e33963-false-d1452847e0">
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
         id="d41e33974-false-d1452904e0">
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
         id="d1452918e6-false-d1452926e0">
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
         id="d1452918e43-false-d1452991e0">
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
         id="d1452918e62-false-d1453014e0">
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
         id="d41e33991-false-d1453055e0">
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
         id="d41e33998-false-d1453085e0">
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
         id="d41e34009-false-d1453138e0">
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
         id="d41e34020-false-d1453160e0">
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
         id="d41e34035-false-d1453188e0">
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
         id="d41e34042-false-d1453218e0">
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
         id="d41e34053-false-d1453271e0">
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
         id="d41e34064-false-d1453293e0">
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
