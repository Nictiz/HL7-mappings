<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.41179
Name: obs 7. Stoornis in vloeiendheid
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000">
   <title>obs 7. Stoornis in vloeiendheid</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41179
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]]
Item: (obsElement1179)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]]"
         id="d41e117621-false-d1759895e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]) &gt;= 1">(obsElement1179): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]) &lt;= 1">(obsElement1179): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41179
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]
Item: (obsElement1179)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]"
         id="d41e117629-false-d1759922e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement1179): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement1179): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="string(@negationInd) = ('false') or not(@negationInd)">(obsElement1179): de waarde van negationInd MOET 'false' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']) &gt;= 1">(obsElement1179): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']) &lt;= 1">(obsElement1179): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1179' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement1179): element hl7:code[(@code = '1179' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1179' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement1179): element hl7:code[(@code = '1179' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.635-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &gt;= 1">(obsElement1179): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.635-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.635-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(obsElement1179): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.635-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41179
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']
Item: (obsElement1179)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']"
         id="d41e117655-false-d1760006e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement1179): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.41179')">(obsElement1179): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.41179' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41179
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]/hl7:code[(@code = '1179' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement1179)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]/hl7:code[(@code = '1179' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e117665-false-d1760025e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement1179): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1179' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement1179): de elementwaarde MOET een zijn van 'code '1179' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41179
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.635-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (obsElement1179)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.635-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]"
         id="d41e117675-false-d1760047e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.635-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(obsElement1179): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.635 W0635 Stoornis in vloeiendheid (HL7) (2012-05-21T01:26:54)'.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="@xsi:type">(obsElement1179): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41179-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(obsElement1179): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41179
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]
Item: (obsElement1179)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41179
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41179']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]
Item: (obsElement1179)
-->
</pattern>