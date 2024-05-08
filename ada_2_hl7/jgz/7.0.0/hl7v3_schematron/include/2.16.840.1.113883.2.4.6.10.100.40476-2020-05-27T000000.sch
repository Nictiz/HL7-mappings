<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.40476
Name: obs Informatie verstrekt over werkwijze JGZ
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000">
   <title>obs Informatie verstrekt over werkwijze JGZ</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40476
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]]
Item: (obsElement0476)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]]"
         id="d41e64947-false-d931332e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="count(hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]) &gt;= 1">(obsElement0476): element hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="count(hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]) &lt;= 1">(obsElement0476): element hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40476
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]
Item: (obsElement0476)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]"
         id="d41e64955-false-d931355e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0476): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0476): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']) &gt;= 1">(obsElement0476): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']) &lt;= 1">(obsElement0476): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '476' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0476): element hl7:code[(@code = '476' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '476' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0476): element hl7:code[(@code = '476' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="count(hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(obsElement0476): element hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="count(hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(obsElement0476): element hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40476
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']
Item: (obsElement0476)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']"
         id="d41e64979-false-d931421e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement0476): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.40476')">(obsElement0476): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.40476' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40476
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]/hl7:code[(@code = '476' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0476)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]/hl7:code[(@code = '476' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e64989-false-d931440e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0476): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="@nullFlavor or (@code='476' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0476): de elementwaarde MOET een zijn van 'code '476' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40476
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (obsElement0476)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40476']]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d41e64999-false-d931460e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="@xsi:type">(obsElement0476): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40476-2020-05-27T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(obsElement0476): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
</pattern>
