<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.160
Name: Bericht 7 Vaccinatiesoproeplijst (payload)
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000">
   <title>Bericht 7 Vaccinatiesoproeplijst (payload)</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]"
         id="d40e27018-false-d347958e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@classCode) = ('LIST') or not(@classCode)">(VersturenVaccinatiesoproeplijst-payload): de waarde van classCode MOET 'LIST' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(VersturenVaccinatiesoproeplijst-payload): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']) &gt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']) &lt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &lt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:component[hl7:organizer]) &gt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:component[hl7:organizer] is required [min 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']"
         id="d40e27024-false-d348031e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(VersturenVaccinatiesoproeplijst-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.160')">(VersturenVaccinatiesoproeplijst-payload): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.160' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]"
         id="d40e27032-false-d348050e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(VersturenVaccinatiesoproeplijst-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="@nullFlavor or (@code='IMMUNIZ' and @codeSystem='2.16.840.1.113883.5.4')">(VersturenVaccinatiesoproeplijst-payload): de elementwaarde MOET een zijn van 'code 'IMMUNIZ' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]"
         id="d40e27040-false-d348082e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(VersturenVaccinatiesoproeplijst-payload): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:organizer) &gt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:organizer is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:organizer) &lt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:organizer komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer"
         id="d40e27044-false-d348136e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@classCode) = ('ACT') or not(@classCode)">(VersturenVaccinatiesoproeplijst-payload): de waarde van classCode MOET 'ACT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(VersturenVaccinatiesoproeplijst-payload): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]) &gt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]) &lt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]) &gt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]] is required [min 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(VersturenVaccinatiesoproeplijst-payload): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]"
         id="d40e27055-false-d348228e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(VersturenVaccinatiesoproeplijst-payload): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]) &gt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]) &lt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]"
         id="d40e27059-false-d348258e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@classCode) = ('SBADM') or not(@classCode)">(VersturenVaccinatiesoproeplijst-payload): de waarde van classCode MOET 'SBADM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@moodCode) = ('INT') or not(@moodCode)">(VersturenVaccinatiesoproeplijst-payload): de waarde van moodCode MOET 'INT' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@negationInd) = ('false') or not(@negationInd)">(VersturenVaccinatiesoproeplijst-payload): de waarde van negationInd MOET 'false' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &lt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:consumable[hl7:medication]) &gt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:consumable[hl7:medication] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:consumable[hl7:medication]) &lt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:consumable[hl7:medication] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]"
         id="d40e27067-false-d348324e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(VersturenVaccinatiesoproeplijst-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="@nullFlavor or (@code='IMMUNIZ' and @codeSystem='2.16.840.1.113883.5.4')">(VersturenVaccinatiesoproeplijst-payload): de elementwaarde MOET een zijn van 'code 'IMMUNIZ' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:effectiveTime"
         id="d40e27075-false-d348344e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(VersturenVaccinatiesoproeplijst-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="not(*)">(VersturenVaccinatiesoproeplijst-payload): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="matches(@value,'^[0-9]{8}')">(VersturenVaccinatiesoproeplijst-payload): 
                                        <name path=".."/>/<name/> moet tenminste tot op de dag nauwkeurig worden opgegeven</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:consumable[hl7:medication]
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:consumable[hl7:medication]"
         id="d40e27094-false-d348361e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@typeCode) = ('CSM') or not(@typeCode)">(VersturenVaccinatiesoproeplijst-payload): de waarde van typeCode MOET 'CSM' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]) &gt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]) &lt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:consumable[hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:consumable[hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]"
         id="d40e27112-false-d348395e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@classCode) = ('ADMM') or not(@classCode)">(VersturenVaccinatiesoproeplijst-payload): de waarde van classCode MOET 'ADMM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]) &gt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]) &lt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:consumable[hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:consumable[hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]"
         id="d40e27116-false-d348429e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@classCode) = ('MMAT') or not(@classCode)">(VersturenVaccinatiesoproeplijst-payload): de waarde van classCode MOET 'MMAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="string(@determinerCode) = ('KIND') or not(@determinerCode)">(VersturenVaccinatiesoproeplijst-payload): de waarde van determinerCode MOET 'KIND' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <report fpi="CD-UNKN-BSP"
              role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt; 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:code is gecodeerd met bindingssterkte 'CWE' en bevat een code buiten de gespecificeerde set.</report>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="count(hl7:lotNumberText) &lt;= 1">(VersturenVaccinatiesoproeplijst-payload): element hl7:lotNumberText komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:consumable[hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:consumable[hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d40e27122-false-d348477e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(VersturenVaccinatiesoproeplijst-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(VersturenVaccinatiesoproeplijst-payload): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.422 W0422 Soort vaccinatie (HL7) (2016-12-09T00:00:00)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.160
Context: *[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:consumable[hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:lotNumberText
Item: (VersturenVaccinatiesoproeplijst-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:consumable[hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:lotNumberText"
         id="d40e27130-false-d348499e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.160-2015-06-29T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(VersturenVaccinatiesoproeplijst-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
</pattern>
