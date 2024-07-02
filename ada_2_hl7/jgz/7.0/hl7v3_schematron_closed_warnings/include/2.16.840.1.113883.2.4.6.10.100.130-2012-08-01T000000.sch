<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.130
Name: Bericht 5 Hielprikverzoek (payload)
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000">
   <title>Bericht 5 Hielprikverzoek (payload)</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]"
         id="d41e37250-false-d1467880e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]"
         id="d41e37258-false-d1467929e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@classCode) = ('SPECCOLLECT')">(VersturenHielprikverzoek-payload): de waarde van classCode MOET 'SPECCOLLECT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@moodCode) = ('RQO')">(VersturenHielprikverzoek-payload): de waarde van moodCode MOET 'RQO' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:realmCode[@code = 'NL']) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:realmCode[@code = 'NL'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:realmCode[@code = 'NL']) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:realmCode[@code = 'NL'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:statusCode[@code = 'active']) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:statusCode[@code = 'active'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:statusCode[@code = 'active']) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:statusCode[@code = 'active'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:recordTarget[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:recordTarget[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:recordTarget[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:recordTarget[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:realmCode[@code = 'NL']
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:realmCode[@code = 'NL']"
         id="d41e37354-false-d1468084e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(VersturenHielprikverzoek-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="@nullFlavor or (@code='NL')">(VersturenHielprikverzoek-payload): de elementwaarde MOET een zijn van 'code 'NL''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']"
         id="d41e37364-false-d1468104e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(VersturenHielprikverzoek-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.130')">(VersturenHielprikverzoek-payload): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.130' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:id[not(@nullFlavor)]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:id[not(@nullFlavor)]"
         id="d41e37374-false-d1468123e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(VersturenHielprikverzoek-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d41e37383-false-d1468138e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(VersturenHielprikverzoek-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(VersturenHielprikverzoek-payload): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.316 W0316 Type hielprik (HL7) (2012-05-21T01:26:54)'.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="not(@code='01' and @codeSystem='2.16.840.1.113883.2.4.4.40.66' and ../hl7:reason)">(VersturenHielprikverzoek-payload): reason kan niet aanwezig aanwezig zijn bij een verzoek voor de eerste hielprik</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="(@code='01' and @codeSystem='2.16.840.1.113883.2.4.4.40.66') or ../hl7:reason">(VersturenHielprikverzoek-payload): reason moet de reden bevatten bij een verzoek voor een herhaalde of tweede hielprik</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="not(@code='01' and @codeSystem='2.16.840.1.113883.2.4.4.40.66' and ../hl7:pertinentInformation)">(VersturenHielprikverzoek-payload): pertinentInformation kan niet aanwezig aanwezig zijn bij een verzoek voor de eerste hielprik</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="(@code='01' and @codeSystem='2.16.840.1.113883.2.4.4.40.66') or ../hl7:pertinentInformation">(VersturenHielprikverzoek-payload): pertinentInformation moet het setnummer vorige hielprik bevatten bij een verzoek voor een herhaalde of tweede hielprik</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="not((@code='01' or @code='02') and @codeSystem='2.16.840.1.113883.2.4.4.40.66' and ../hl7:subjectOf6)">(VersturenHielprikverzoek-payload): subjectOf6 kan niet aanwezig aanwezig zijn bij een verzoek voor de eerste hielprik</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:statusCode[@code = 'active']
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:statusCode[@code = 'active']"
         id="d41e37411-false-d1468160e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(VersturenHielprikverzoek-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="@nullFlavor or (@code='active')">(VersturenHielprikverzoek-payload): de elementwaarde MOET een zijn van 'code 'active''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:recordTarget[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:recordTarget[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@typeCode) = ('RCT') or not(@typeCode)">(VersturenHielprikverzoek-payload): de waarde van typeCode MOET 'RCT' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <let name="patRoot" value="'2.16.840.1.113883.2.4.6.3'"/>
      <let name="patExt"
           value="(hl7:patient/hl7:id[@root=$patRoot])[1]/@extension"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="not(ancestor::*/hl7:attentionLine) or not(hl7:patient/hl7:id[@root=$patRoot and @extension]) or ancestor::*/hl7:attentionLine/hl7:value[@extension=$patExt and @root=$patRoot]">(VersturenHielprikverzoek-payload): De patiënt in de Payload (BSN '<value-of select="$patExt"/>') moet overeen komen met de patient in de attentionLine (BSN '<value-of select="ancestor::*/hl7:attentionLine/hl7:value/@extension"/>')</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]"
         id="d41e37447-false-d1468217e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@typeCode) = ('RSON') or not(@typeCode)">(VersturenHielprikverzoek-payload): de waarde van typeCode MOET 'RSON' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@contextConductionInd) = ('false')">(VersturenHielprikverzoek-payload): de waarde van contextConductionInd MOET 'false' zijn. Gevonden: "<value-of select="@contextConductionInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]"
         id="d41e37464-false-d1468257e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@classCode) = ('ALRT')">(VersturenHielprikverzoek-payload): de waarde van classCode MOET 'ALRT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN')">(VersturenHielprikverzoek-payload): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e37475-false-d1468297e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(VersturenHielprikverzoek-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(VersturenHielprikverzoek-payload): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.317 W0317 Reden herhaling/tweede hielprik (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(VersturenHielprikverzoek-payload): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.317 W0317 Reden herhaling/tweede hielprik (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="@displayName or not(@code)">(VersturenHielprikverzoek-payload): @displayName is verplicht</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]"
         id="d41e37490-false-d1468324e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@typeCode) = ('REFR')">(VersturenHielprikverzoek-payload): de waarde van typeCode MOET 'REFR' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@contextConductionInd) = ('false')">(VersturenHielprikverzoek-payload): de waarde van contextConductionInd MOET 'false' zijn. Gevonden: "<value-of select="@contextConductionInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]/hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]/hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]"
         id="d41e37507-false-d1468360e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@classCode) = ('DOC')">(VersturenHielprikverzoek-payload): de waarde van classCode MOET 'DOC' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN')">(VersturenHielprikverzoek-payload): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]/hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]/hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]/hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]/hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']"
         id="d41e37518-false-d1468411e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(VersturenHielprikverzoek-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.3.36.100.2')">(VersturenHielprikverzoek-payload): de waarde van root MOET '2.16.840.1.113883.2.4.3.36.100.2' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]/hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]/hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]/hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]/hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]"
         id="d41e37529-false-d1468430e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(VersturenHielprikverzoek-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1432' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(VersturenHielprikverzoek-payload): de elementwaarde MOET een zijn van 'code '1432' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]"
         id="d41e37541-false-d1468450e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@typeCode) = ('SUBJ') or not(@typeCode)">(VersturenHielprikverzoek-payload): de waarde van typeCode MOET 'SUBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@contextConductionInd) = ('false')">(VersturenHielprikverzoek-payload): de waarde van contextConductionInd MOET 'false' zijn. Gevonden: "<value-of select="@contextConductionInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:seperatableInd[not(@nullFlavor)]) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:seperatableInd[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:seperatableInd[not(@nullFlavor)]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:seperatableInd[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:annotation[hl7:statusCode[@code = 'completed']]) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:annotation[hl7:statusCode[@code = 'completed']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:annotation[hl7:statusCode[@code = 'completed']]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:annotation[hl7:statusCode[@code = 'completed']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:seperatableInd[not(@nullFlavor)]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:seperatableInd[not(@nullFlavor)]"
         id="d41e37579-false-d1468501e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(VersturenHielprikverzoek-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@value) = ('false')">(VersturenHielprikverzoek-payload): de waarde van value MOET 'false' zijn. Gevonden: "<value-of select="@value"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]"
         id="d41e37588-false-d1468520e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@classCode) = ('ACT')">(VersturenHielprikverzoek-payload): de waarde van classCode MOET 'ACT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN')">(VersturenHielprikverzoek-payload): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:text[not(@nullFlavor)]) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:text[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:text[not(@nullFlavor)]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:text[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:statusCode[@code = 'completed']) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:statusCode[@code = 'completed'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:statusCode[@code = 'completed']) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:statusCode[@code = 'completed'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:author[hl7:assignedEntity[@classCode = 'ASSIGNED']]) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:author[hl7:assignedEntity[@classCode = 'ASSIGNED']] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:author[hl7:assignedEntity[@classCode = 'ASSIGNED']]) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:author[hl7:assignedEntity[@classCode = 'ASSIGNED']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:text[not(@nullFlavor)]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:text[not(@nullFlavor)]"
         id="d41e37598-false-d1468586e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(VersturenHielprikverzoek-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:statusCode[@code = 'completed']
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:statusCode[@code = 'completed']"
         id="d41e37607-false-d1468599e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(VersturenHielprikverzoek-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="@nullFlavor or (@code='completed')">(VersturenHielprikverzoek-payload): de elementwaarde MOET een zijn van 'code 'completed''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:author[hl7:assignedEntity[@classCode = 'ASSIGNED']]
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:author[hl7:assignedEntity[@classCode = 'ASSIGNED']]"
         id="d41e37617-false-d1468619e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@typeCode) = ('AUT') or not(@typeCode)">(VersturenHielprikverzoek-payload): de waarde van typeCode MOET 'AUT' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:assignedEntity[@classCode = 'ASSIGNED']) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:assignedEntity[@classCode = 'ASSIGNED'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:assignedEntity[@classCode = 'ASSIGNED']) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:assignedEntity[@classCode = 'ASSIGNED'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:author[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[@classCode = 'ASSIGNED']
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:author[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[@classCode = 'ASSIGNED']"
         id="d41e37626-false-d1468649e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@classCode) = ('ASSIGNED')">(VersturenHielprikverzoek-payload): de waarde van classCode MOET 'ASSIGNED' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:id) &gt;= 1">(VersturenHielprikverzoek-payload): element hl7:id is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="count(hl7:id) &lt;= 1">(VersturenHielprikverzoek-payload): element hl7:id komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.130
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:author[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[@classCode = 'ASSIGNED']/hl7:id
Item: (VersturenHielprikverzoek-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.130']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:author[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[@classCode = 'ASSIGNED']/hl7:id"
         id="d41e37635-false-d1468679e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(VersturenHielprikverzoek-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.130-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('NI') or not(@nullFlavor)">(VersturenHielprikverzoek-payload): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
</pattern>
