<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.40954
Name: obs 51. Begrijpt analogieën en tegenstellingen
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000">
   <title>obs 51. Begrijpt analogieën en tegenstellingen</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40954
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]]
Item: (obsElement0954)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]]"
         id="d41e94821-false-d1008426e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]) &gt;= 1">(obsElement0954): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]) &lt;= 1">(obsElement0954): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40954
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]
Item: (obsElement0954)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]"
         id="d41e94829-false-d1008453e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0954): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0954): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="string(@negationInd) = ('false') or not(@negationInd)">(obsElement0954): de waarde van negationInd MOET 'false' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']) &gt;= 1">(obsElement0954): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']) &lt;= 1">(obsElement0954): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '954' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0954): element hl7:code[(@code = '954' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '954' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0954): element hl7:code[(@code = '954' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.438-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &gt;= 1">(obsElement0954): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.438-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.438-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(obsElement0954): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.438-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40954
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']
Item: (obsElement0954)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']"
         id="d41e94857-false-d1008537e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement0954): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.40954')">(obsElement0954): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.40954' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40954
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]/hl7:code[(@code = '954' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0954)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]/hl7:code[(@code = '954' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e94867-false-d1008556e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0954): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="@nullFlavor or (@code='954' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0954): de elementwaarde MOET een zijn van 'code '954' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40954
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.438-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (obsElement0954)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.438-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]"
         id="d41e94877-false-d1008578e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.438-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(obsElement0954): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.438 W0438 Plus Min M (HL7) (2012-05-21T01:26:54)'.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="@xsi:type">(obsElement0954): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40954-2020-05-27T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(obsElement0954): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40954
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]
Item: (obsElement0954)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40954
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40954']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]
Item: (obsElement0954)
-->
</pattern>