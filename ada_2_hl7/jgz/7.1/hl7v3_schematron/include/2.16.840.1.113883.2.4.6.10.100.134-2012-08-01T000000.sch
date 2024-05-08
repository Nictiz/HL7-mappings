<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.134
Name: Hielprikverzoek (geen patiënt)
Description: Hielprikverzoekgegevens
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000">
   <title>Hielprikverzoek (geen patiënt)</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]"
         id="d40e25649-false-d318870e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]) &gt;= 1">(Hielprikverzoek): element hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]) &lt;= 1">(Hielprikverzoek): element hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]"
         id="d40e25660-false-d318893e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@classCode) = ('SPECCOLLECT')">(Hielprikverzoek): de waarde van classCode MOET 'SPECCOLLECT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@moodCode) = ('RQO')">(Hielprikverzoek): de waarde van moodCode MOET 'RQO' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:realmCode[@code = 'NL']) &gt;= 1">(Hielprikverzoek): element hl7:realmCode[@code = 'NL'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:realmCode[@code = 'NL']) &lt;= 1">(Hielprikverzoek): element hl7:realmCode[@code = 'NL'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']) &gt;= 1">(Hielprikverzoek): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']) &lt;= 1">(Hielprikverzoek): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(Hielprikverzoek): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(Hielprikverzoek): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(Hielprikverzoek): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(Hielprikverzoek): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:statusCode[@code = 'active']) &gt;= 1">(Hielprikverzoek): element hl7:statusCode[@code = 'active'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:statusCode[@code = 'active']) &lt;= 1">(Hielprikverzoek): element hl7:statusCode[@code = 'active'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]) &lt;= 1">(Hielprikverzoek): element hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]) &lt;= 1">(Hielprikverzoek): element hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]) &lt;= 1">(Hielprikverzoek): element hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:realmCode[@code = 'NL']
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:realmCode[@code = 'NL']"
         id="d40e25740-false-d319020e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(Hielprikverzoek): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="@nullFlavor or (@code='NL')">(Hielprikverzoek): de elementwaarde MOET een zijn van 'code 'NL''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']"
         id="d40e25750-false-d319040e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(Hielprikverzoek): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.134')">(Hielprikverzoek): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.134' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:id[not(@nullFlavor)]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:id[not(@nullFlavor)]"
         id="d40e25760-false-d319059e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(Hielprikverzoek): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d40e25769-false-d319074e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(Hielprikverzoek): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(Hielprikverzoek): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.316 W0316 Type hielprik (HL7) (2012-05-21T01:26:54)'.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="not((@code='01' or @code='02') and @codeSystem='2.16.840.1.113883.2.4.4.40.66' and ../hl7:reason)">(Hielprikverzoek): reason kan niet aanwezig aanwezig zijn bij een verzoek voor de eerste hielprik</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="(@code='01' and @codeSystem='2.16.840.1.113883.2.4.4.40.66') or ../hl7:reason">(Hielprikverzoek): reason moet de reden bevatten bij een verzoek voor een herhaalde of tweede hielprik</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="not((@code='01' or @code='02') and @codeSystem='2.16.840.1.113883.2.4.4.40.66' and ../hl7:pertinentInformation)">(Hielprikverzoek): pertinentInformation kan niet aanwezig aanwezig zijn bij een verzoek voor de eerste hielprik</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="not(@code='01' and @codeSystem='2.16.840.1.113883.2.4.4.40.66') or ../hl7:pertinentInformation">(Hielprikverzoek): pertinentInformation moet het setnummer vorige hielprik bevatten bij een verzoek voor een herhaalde of tweede hielprik</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="not((@code='01' or @code='02') and @codeSystem='2.16.840.1.113883.2.4.4.40.66' and ../hl7:subjectOf6)">(Hielprikverzoek): subjectOf6 kan niet aanwezig aanwezig zijn bij een verzoek voor de eerste hielprik</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:statusCode[@code = 'active']
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:statusCode[@code = 'active']"
         id="d40e25795-false-d319096e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(Hielprikverzoek): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="@nullFlavor or (@code='active')">(Hielprikverzoek): de elementwaarde MOET een zijn van 'code 'active''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]"
         id="d40e25805-false-d319118e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@typeCode) = ('RSON') or not(@typeCode)">(Hielprikverzoek): de waarde van typeCode MOET 'RSON' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@contextConductionInd) = ('false')">(Hielprikverzoek): de waarde van contextConductionInd MOET 'false' zijn. Gevonden: "<value-of select="@contextConductionInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]) &gt;= 1">(Hielprikverzoek): element hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]) &lt;= 1">(Hielprikverzoek): element hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]"
         id="d40e25822-false-d319158e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@classCode) = ('ALRT')">(Hielprikverzoek): de waarde van classCode MOET 'ALRT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN')">(Hielprikverzoek): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(Hielprikverzoek): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(Hielprikverzoek): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:reason[hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:act[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e25833-false-d319198e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(Hielprikverzoek): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(Hielprikverzoek): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.317 W0317 Reden herhaling/tweede hielprik (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.317-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(Hielprikverzoek): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.317 W0317 Reden herhaling/tweede hielprik (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="@displayName or not(@code)">(Hielprikverzoek): @displayName is verplicht</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]"
         id="d40e25849-false-d319225e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@typeCode) = ('REFR')">(Hielprikverzoek): de waarde van typeCode MOET 'REFR' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@contextConductionInd) = ('false')">(Hielprikverzoek): de waarde van contextConductionInd MOET 'false' zijn. Gevonden: "<value-of select="@contextConductionInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]) &gt;= 1">(Hielprikverzoek): element hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]) &lt;= 1">(Hielprikverzoek): element hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]/hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]/hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]"
         id="d40e25866-false-d319261e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@classCode) = ('DOC')">(Hielprikverzoek): de waarde van classCode MOET 'DOC' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN')">(Hielprikverzoek): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']) &gt;= 1">(Hielprikverzoek): element hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']) &lt;= 1">(Hielprikverzoek): element hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]) &gt;= 1">(Hielprikverzoek): element hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]) &lt;= 1">(Hielprikverzoek): element hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]/hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]/hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]/hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]/hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']"
         id="d40e25877-false-d319312e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(Hielprikverzoek): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.3.36.100.2')">(Hielprikverzoek): de waarde van root MOET '2.16.840.1.113883.2.4.3.36.100.2' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]/hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]/hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:pertinentInformation[hl7:act[hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]]]/hl7:act[hl7:id[@root = '2.16.840.1.113883.2.4.3.36.100.2']]/hl7:code[(@code = '1432' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or @nullFlavor]"
         id="d40e25888-false-d319331e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(Hielprikverzoek): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1432' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(Hielprikverzoek): de elementwaarde MOET een zijn van 'code '1432' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]"
         id="d40e25900-false-d319351e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@typeCode) = ('SUBJ') or not(@typeCode)">(Hielprikverzoek): de waarde van typeCode MOET 'SUBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@contextConductionInd) = ('false')">(Hielprikverzoek): de waarde van contextConductionInd MOET 'false' zijn. Gevonden: "<value-of select="@contextConductionInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:seperatableInd[not(@nullFlavor)]) &gt;= 1">(Hielprikverzoek): element hl7:seperatableInd[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:seperatableInd[not(@nullFlavor)]) &lt;= 1">(Hielprikverzoek): element hl7:seperatableInd[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:annotation[hl7:statusCode[@code = 'completed']]) &gt;= 1">(Hielprikverzoek): element hl7:annotation[hl7:statusCode[@code = 'completed']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:annotation[hl7:statusCode[@code = 'completed']]) &lt;= 1">(Hielprikverzoek): element hl7:annotation[hl7:statusCode[@code = 'completed']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:seperatableInd[not(@nullFlavor)]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:seperatableInd[not(@nullFlavor)]"
         id="d40e25938-false-d319402e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(Hielprikverzoek): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@value) = ('false')">(Hielprikverzoek): de waarde van value MOET 'false' zijn. Gevonden: "<value-of select="@value"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]"
         id="d40e25947-false-d319421e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@classCode) = ('ACT')">(Hielprikverzoek): de waarde van classCode MOET 'ACT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN')">(Hielprikverzoek): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:text[not(@nullFlavor)]) &gt;= 1">(Hielprikverzoek): element hl7:text[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:text[not(@nullFlavor)]) &lt;= 1">(Hielprikverzoek): element hl7:text[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:statusCode[@code = 'completed']) &gt;= 1">(Hielprikverzoek): element hl7:statusCode[@code = 'completed'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:statusCode[@code = 'completed']) &lt;= 1">(Hielprikverzoek): element hl7:statusCode[@code = 'completed'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:author[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]) &gt;= 1">(Hielprikverzoek): element hl7:author[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:author[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]) &lt;= 1">(Hielprikverzoek): element hl7:author[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:text[not(@nullFlavor)]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:text[not(@nullFlavor)]"
         id="d40e25957-false-d319487e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(Hielprikverzoek): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:statusCode[@code = 'completed']
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:statusCode[@code = 'completed']"
         id="d40e25966-false-d319500e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(Hielprikverzoek): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="@nullFlavor or (@code='completed')">(Hielprikverzoek): de elementwaarde MOET een zijn van 'code 'completed''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:author[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:author[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]"
         id="d40e25976-false-d319520e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@typeCode) = ('AUT') or not(@typeCode)">(Hielprikverzoek): de waarde van typeCode MOET 'AUT' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']) &gt;= 1">(Hielprikverzoek): element hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']) &lt;= 1">(Hielprikverzoek): element hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:author[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:author[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']"
         id="d40e25985-false-d319550e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="string(@classCode) = ('ASSIGNED')">(Hielprikverzoek): de waarde van classCode MOET 'ASSIGNED' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(Hielprikverzoek): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(Hielprikverzoek): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.134
Context: *[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:author[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[not(@nullFlavor)]
Item: (Hielprikverzoek)
-->
   <rule fpi="RULC-1"
         context="*[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]/hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]/hl7:subjectOf6[@contextConductionInd = 'false'][hl7:annotation[@classCode = 'ACT'][@moodCode = 'EVN']]/hl7:annotation[hl7:statusCode[@code = 'completed']]/hl7:author[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[not(@nullFlavor)]"
         id="d40e25994-false-d319580e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.134-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(Hielprikverzoek): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
</pattern>
