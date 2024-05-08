<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.41167
Name: obs Papieren dossier aanwezig
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000">
   <title>obs Papieren dossier aanwezig</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41167
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]]
Item: (obsElement1167)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]]"
         id="d41e116482-false-d1756846e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="count(hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]) &gt;= 1">(obsElement1167): element hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="count(hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]) &lt;= 1">(obsElement1167): element hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41167
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]
Item: (obsElement1167)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]"
         id="d41e116490-false-d1756869e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement1167): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement1167): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']) &gt;= 1">(obsElement1167): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']) &lt;= 1">(obsElement1167): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1167' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement1167): element hl7:code[(@code = '1167' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1167' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement1167): element hl7:code[(@code = '1167' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(obsElement1167): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(obsElement1167): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41167
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']
Item: (obsElement1167)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']"
         id="d41e116514-false-d1756935e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement1167): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.41167')">(obsElement1167): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.41167' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41167
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]/hl7:code[(@code = '1167' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement1167)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]/hl7:code[(@code = '1167' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e116524-false-d1756954e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement1167): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1167' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement1167): de elementwaarde MOET een zijn van 'code '1167' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41167
Context: *[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (obsElement1167)
-->
   <rule fpi="RULC-1"
         context="*[hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]]/hl7:annotationObsEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41167']]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]"
         id="d41e116534-false-d1756974e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="@xsi:type">(obsElement1167): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41167-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(obsElement1167): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
</pattern>
