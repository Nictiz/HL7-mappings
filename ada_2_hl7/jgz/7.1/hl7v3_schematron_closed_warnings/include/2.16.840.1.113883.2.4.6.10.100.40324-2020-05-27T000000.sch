<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.40324
Name: obs Zindelijkheid
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000">
   <title>obs Zindelijkheid</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40324
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]]
Item: (obsElement0324)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]]"
         id="d40e34624-false-d642298e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]) &gt;= 1">(obsElement0324): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]) &lt;= 1">(obsElement0324): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40324
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]
Item: (obsElement0324)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]"
         id="d40e34632-false-d642325e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0324): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0324): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="string(@negationInd) = ('false') or not(@negationInd)">(obsElement0324): de waarde van negationInd MOET 'false' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']) &gt;= 1">(obsElement0324): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']) &lt;= 1">(obsElement0324): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0324): element hl7:code[(@code = '324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0324): element hl7:code[(@code = '324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(obsElement0324): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(obsElement0324): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40324
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']
Item: (obsElement0324)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']"
         id="d40e34658-false-d642409e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement0324): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.40324')">(obsElement0324): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.40324' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40324
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]/hl7:code[(@code = '324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0324)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]/hl7:code[(@code = '324' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e34668-false-d642428e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0324): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="@nullFlavor or (@code='324' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0324): de elementwaarde MOET een zijn van 'code '324' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40324
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (obsElement0324)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e34678-false-d642450e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(obsElement0324): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.209 W0209 Ontlasten/plassen/zindelijkheid (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(obsElement0324): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.209 W0209 Ontlasten/plassen/zindelijkheid (HL7) (2012-05-21T01:26:54).</assert>
      <report fpi="CD-DEPR-BSP"
              role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.209-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept[@type='D'][@code = $theCode][@codeSystem = $theCodeSystem])">(obsElement0324): element hl7:value is gecodeerd met bindingssterkte 'required' en bevat een code die verouderd is.</report>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="@xsi:type">(obsElement0324): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40324-2020-05-27T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(obsElement0324): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40324
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]
Item: (obsElement0324)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40324
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40324']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]
Item: (obsElement0324)
-->
</pattern>