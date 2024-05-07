<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.118
Name: A_NeonateData [universal]
Description: COCT_RM900913NL: Gegevens van de pasgeborene en eerste levensweken
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000">
   <title>A_NeonateData [universal]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]"
         id="d40e18139-false-d532610e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]"
         id="d40e18153-false-d532647e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('CATEGORY') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'CATEGORY' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']) &gt;= 1">(A_NeonateData-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']) &lt;= 1">(A_NeonateData-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = 'R016' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = 'R016' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = 'R016' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = 'R016' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']"
         id="d40e18234-false-d532897e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.118')">(A_NeonateData-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.118' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:code[(@code = 'R016' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:code[(@code = 'R016' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]"
         id="d40e18244-false-d532916e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='R016' and @codeSystem='2.16.840.1.113883.2.4.4.40.391')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code 'R016' codeSystem '2.16.840.1.113883.2.4.4.40.391''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]"
         id="d40e18254-false-d532938e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]) &gt;= 1">(A_NeonateData-universal): element hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]) &lt;= 1">(A_NeonateData-universal): element hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]"
         id="d40e18261-false-d532972e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('ENC') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'ENC' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(A_NeonateData-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]"
         id="d40e18272-false-d533032e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='IMP' and @codeSystem='2.16.840.1.113883.5.4')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code 'IMP' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10264
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime
Item: (PeriodeOpnameKinderafdeling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime"
         id="d533046e6-false-d533054e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeOpnameKinderafdeling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeOpnameKinderafdeling): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeOpnameKinderafdeling): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeOpnameKinderafdeling): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeOpnameKinderafdeling): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeOpnameKinderafdeling): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeOpnameKinderafdeling): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10264
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime/hl7:low
Item: (PeriodeOpnameKinderafdeling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime/hl7:low"
         id="d533046e43-false-d533119e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeOpnameKinderafdeling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="not(*)">(PeriodeOpnameKinderafdeling): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeOpnameKinderafdeling): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10264
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime/hl7:high
Item: (PeriodeOpnameKinderafdeling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime/hl7:high"
         id="d533046e62-false-d533142e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeOpnameKinderafdeling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
              test="not(*)">(PeriodeOpnameKinderafdeling): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10264-2012-08-01T000000.html"
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
         id="d40e18287-false-d533183e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('LOC') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'LOC' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]) &gt;= 1">(A_NeonateData-universal): element hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]) &lt;= 1">(A_NeonateData-universal): element hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]"
         id="d40e18307-false-d533213e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('SDLOC') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'SDLOC' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]"
         id="d40e18316-false-d533252e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='PEDICU' and @codeSystem='2.16.840.1.113883.5.111')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code 'PEDICU' codeSystem '2.16.840.1.113883.5.111''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e18327-false-d533272e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('LOC') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'LOC' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e18339-false-d533302e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('ACCM') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'ACCM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="not(@negationInd) or string(@negationInd)=('true','false')">(A_NeonateData-universal): attribuut @negationInd MOET datatype 'bl' hebben  - '<value-of select="@negationInd"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component1[hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:inPatientEncounter[hl7:code[(@code = 'IMP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:location[hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:serviceDeliveryLocation[hl7:code[(@code = 'PEDICU' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:locationOf[hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:incubatorAccommodation[hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '144' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e18354-false-d533344e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='144' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '144' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]"
         id="d40e18371-false-d533364e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]) &gt;= 1">(A_NeonateData-universal): element hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]) &lt;= 1">(A_NeonateData-universal): element hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]"
         id="d40e18380-false-d533394e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('SBADM') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'SBADM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="not(@negationInd) or string(@negationInd)=('true','false')">(A_NeonateData-universal): attribuut @negationInd MOET datatype 'bl' hebben  - '<value-of select="@negationInd"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]) &gt;= 1">(A_NeonateData-universal): element hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]) &lt;= 1">(A_NeonateData-universal): element hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]"
         id="d40e18400-false-d533436e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('CSM') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'CSM' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &gt;= 1">(A_NeonateData-universal): element hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_NeonateData-universal): element hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]/hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]/hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e18409-false-d533466e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('ADMM') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'ADMM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]/hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]/hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e18420-false-d533496e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('MAT') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'MAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@determinerCode) = ('KIND') or not(@determinerCode)">(A_NeonateData-universal): de waarde van determinerCode MOET 'KIND' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]/hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component2[hl7:substanceAdministrationEvent]/hl7:substanceAdministrationEvent[not(@nullFlavor)][hl7:consumable]/hl7:consumable[not(@nullFlavor)][hl7:administerableMaterial]/hl7:administerableMaterial[hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrableMaterialKind[hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '137' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '138' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '629' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e18433-false-d533532e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='137' and @codeSystem='2.16.840.1.113883.2.4.4.40.267') or (@code='138' and @codeSystem='2.16.840.1.113883.2.4.4.40.267') or (@code='629' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '137' codeSystem '2.16.840.1.113883.2.4.4.40.267' of code '138' codeSystem '2.16.840.1.113883.2.4.4.40.267' of code '629' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e18461-false-d533559e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e18468-false-d533595e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40108
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0108)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d533646e9-false-d533654e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40108-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0108): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40108-2012-08-01T000000.html"
              test="@nullFlavor or (@code='108' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0108): de elementwaarde MOET een zijn van 'code '108' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40108
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (obsElement0108)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d533646e20-false-d533674e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40108-2012-08-01T000000.html"
              test="@xsi:type">(obsElement0108): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e18483-false-d533688e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e18493-false-d533718e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="parent::hl7:component3/../hl7:component3[./*/hl7:code[@code='108' and @codeSystem='2.16.840.1.113883.2.4.4.40.267'] and ./*/hl7:value[@value='true']]">(A_NeonateData-universal): Als er sprake is van een volgnumer bij meerling dan MOET de meerlingindicator (BDS-element 108) op 'true' staan</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e18508-false-d533769e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='109' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '109' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '109' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]"
         id="d40e18518-false-d533789e0">
      <extends rule="INT"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="(@nullFlavor or (number(@value)&gt;=1))">(A_NeonateData-universal): value MOET in bereik [1..] liggen  </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(A_NeonateData-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]"
         id="d40e18533-false-d533821e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]"
         id="d40e18540-false-d533851e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]"
         id="d40e18551-false-d533902e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='8339-4' and @codeSystem='2.16.840.1.113883.6.1')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '8339-4' codeSystem '2.16.840.1.113883.6.1''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '8339-4' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]"
         id="d40e18562-false-d533922e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="(@nullFlavor or (@unit='g'))">(A_NeonateData-universal): value MOET eenheid 'g' gebruiken en </assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="(@nullFlavor or (number(@value)&lt;=999999 and (matches(string(@value), '^[-+]?\d*$'))))">(A_NeonateData-universal): value MOET in bereik [..999999] liggen  en exact op 0 decimalen nauwkeurig zijn </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(A_NeonateData-universal): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(A_NeonateData-universal): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e18576-false-d533967e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e18583-false-d533997e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e18594-false-d534048e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='111' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '111' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '111' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]"
         id="d40e18605-false-d534068e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="(@nullFlavor or (@unit='g'))">(A_NeonateData-universal): value MOET eenheid 'g' gebruiken en </assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="(@nullFlavor or (number(@value)&lt;=999999 and (matches(string(@value), '^[-+]?\d*$'))))">(A_NeonateData-universal): value MOET in bereik [..999999] liggen  en exact op 0 decimalen nauwkeurig zijn </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(A_NeonateData-universal): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(A_NeonateData-universal): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e18619-false-d534113e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e18626-false-d534143e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e18637-false-d534194e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='112' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '112' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '112' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]"
         id="d40e18648-false-d534214e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="(@nullFlavor or (@unit='mm'))">(A_NeonateData-universal): value MOET eenheid 'mm' gebruiken en </assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="(@nullFlavor or (number(@value)&lt;=9999 and (matches(string(@value), '^[-+]?\d*$'))))">(A_NeonateData-universal): value MOET in bereik [..9999] liggen  en exact op 0 decimalen nauwkeurig zijn </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(A_NeonateData-universal): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(A_NeonateData-universal): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e18663-false-d534259e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e18670-false-d534289e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e18681-false-d534340e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='113' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '113' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '113' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')]"
         id="d40e18692-false-d534360e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="(@nullFlavor or (@unit='mm'))">(A_NeonateData-universal): value MOET eenheid 'mm' gebruiken en </assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="(@nullFlavor or (number(@value)&lt;=999 and (matches(string(@value), '^[-+]?\d*$'))))">(A_NeonateData-universal): value MOET in bereik [..999] liggen  en exact op 0 decimalen nauwkeurig zijn </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(A_NeonateData-universal): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(A_NeonateData-universal): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e18710-false-d534405e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e18717-false-d534435e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e18728-false-d534486e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='115' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '115' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '115' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d40e18739-false-d534506e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]"
         id="d40e18752-false-d534520e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]"
         id="d40e18759-false-d534550e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]"
         id="d40e18770-false-d534601e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='9272-6' and @codeSystem='2.16.840.1.113883.6.1')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '9272-6' codeSystem '2.16.840.1.113883.6.1''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9272-6' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]"
         id="d40e18781-false-d534621e0">
      <extends rule="INT"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="(@nullFlavor or (number(@value)&gt;=0 and number(@value)&lt;=10))">(A_NeonateData-universal): value MOET in bereik [0..10] liggen  </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(A_NeonateData-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]"
         id="d40e18795-false-d534653e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]"
         id="d40e18802-false-d534683e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]"
         id="d40e18813-false-d534734e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='9274-2' and @codeSystem='2.16.840.1.113883.6.1')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '9274-2' codeSystem '2.16.840.1.113883.6.1''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:neonateObservations[hl7:code[(@code = '9274-2' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]"
         id="d40e18824-false-d534754e0">
      <extends rule="INT"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="(@nullFlavor or (number(@value)&gt;=0 and number(@value)&lt;=10))">(A_NeonateData-universal): value MOET in bereik [0..10] liggen  </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(A_NeonateData-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e18838-false-d534786e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e18845-false-d534816e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e18856-false-d534867e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='626' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '626' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '626' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d40e18867-false-d534887e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e18880-false-d534901e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e18887-false-d534931e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e18898-false-d534982e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='131' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '131' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '131' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d40e18909-false-d535002e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e18921-false-d535016e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e18928-false-d535046e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.695-2023-10-24T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.695-2023-10-24T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.695-2023-10-24T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.695-2023-10-24T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e18939-false-d535099e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='1609' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '1609' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.695-2023-10-24T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1609' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.695-2023-10-24T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d40e18950-false-d535121e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.695-2023-10-24T000000.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_NeonateData-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.695 W0695 Scrotale testes bij geboorte (HL7) (2023-10-24T00:00:00)'.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e18964-false-d535144e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e18971-false-d535174e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e18982-false-d535225e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='133' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '133' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '133' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d40e18993-false-d535245e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e19006-false-d535259e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e19013-false-d535289e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e19024-false-d535340e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='134' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '134' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '134' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d40e19035-false-d535360e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e19047-false-d535374e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e19054-false-d535404e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e19065-false-d535455e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='135' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '135' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '135' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d40e19076-false-d535475e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e19088-false-d535489e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e19095-false-d535519e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e19106-false-d535570e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='145' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '145' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '145' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d40e19117-false-d535590e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e19130-false-d535604e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e19137-false-d535634e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e19148-false-d535687e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='747' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '747' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '747' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e19159-false-d535709e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_NeonateData-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.177 W0177 Melkvoeding (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_NeonateData-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.177 W0177 Melkvoeding (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e19173-false-d535737e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e19180-false-d535767e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e19191-false-d535820e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='1340' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '1340' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '1340' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e19202-false-d535842e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_NeonateData-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.177 W0177 Melkvoeding (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.177-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_NeonateData-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.177 W0177 Melkvoeding (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e19216-false-d535872e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e19223-false-d535906e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(A_NeonateData-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e19234-false-d535963e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='139' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '139' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10263
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value
Item: (PeriodeGeelZien)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value"
         id="d535977e6-false-d535985e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeGeelZien): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeelZien): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeelZien): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeelZien): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeelZien): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeelZien): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeelZien): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10263
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value/hl7:low
Item: (PeriodeGeelZien)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value/hl7:low"
         id="d535977e43-false-d536050e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeelZien): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeelZien): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeelZien): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10263
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value/hl7:high
Item: (PeriodeGeelZien)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '139' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value/hl7:high"
         id="d535977e62-false-d536073e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeelZien): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeelZien): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10263-2012-08-01T000000.html"
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
         id="d40e19252-false-d536114e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e19259-false-d536144e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e19270-false-d536197e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='140' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '140' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '140' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e19281-false-d536219e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_NeonateData-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.183 W0183 Oorzaak geel zien (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.183-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_NeonateData-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.183 W0183 Oorzaak geel zien (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e19295-false-d536247e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_NeonateData-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_NeonateData-universal): element hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e19302-false-d536277e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_NeonateData-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_NeonateData-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_NeonateData-universal): element hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_NeonateData-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e19313-false-d536330e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_NeonateData-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or (@code='142' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_NeonateData-universal): de elementwaarde MOET een zijn van 'code '142' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.118
Context: *[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_NeonateData-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]]/hl7:neonateData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.118']]/hl7:component3[hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:neonateObservations[hl7:code[(@code = '142' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e19324-false-d536352e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_NeonateData-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.185 W0185 Therapie (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.185-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_NeonateData-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.185 W0185 Therapie (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.118-2023-10-24T000000.html"
              test="@xsi:type">(A_NeonateData-universal): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
</pattern>
