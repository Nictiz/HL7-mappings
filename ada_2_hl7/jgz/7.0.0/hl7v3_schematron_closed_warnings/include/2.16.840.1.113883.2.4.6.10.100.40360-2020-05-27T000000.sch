<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.40360
Name: obs Zorg ontvangen in gezin
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000">
   <title>obs Zorg ontvangen in gezin</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40360
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]]
Item: (obsElement360)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]]"
         id="d40e35202-false-d643801e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="count(hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]) &gt;= 1">(obsElement360): element hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="count(hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]) &lt;= 1">(obsElement360): element hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40360
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]
Item: (obsElement360)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]"
         id="d40e35210-false-d643824e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement360): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement360): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']) &gt;= 1">(obsElement360): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']) &lt;= 1">(obsElement360): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '360' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement360): element hl7:code[(@code = '360' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '360' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement360): element hl7:code[(@code = '360' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(obsElement360): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(obsElement360): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40360
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']
Item: (obsElement360)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']"
         id="d40e35234-false-d643890e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement360): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.40360')">(obsElement360): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.40360' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40360
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]/hl7:code[(@code = '360' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement360)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]/hl7:code[(@code = '360' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e35244-false-d643909e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement360): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="@nullFlavor or (@code='360' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement360): de elementwaarde MOET een zijn van 'code '360' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40360
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (obsElement360)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40360']]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d40e35254-false-d643929e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="@xsi:type">(obsElement360): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40360-2020-05-27T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(obsElement360): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
</pattern>
