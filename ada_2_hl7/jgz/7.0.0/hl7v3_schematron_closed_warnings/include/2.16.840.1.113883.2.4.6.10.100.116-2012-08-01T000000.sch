<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.116
Name: A_Rijksvaccinatie [universal]
Description: COCT_RM900916NL02: Gegevens van rijksvaccinaties en andere vaccinaties
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000">
   <title>A_Rijksvaccinatie [universal]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]
Item: (A_Rijksvaccinatie-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]"
         id="d41e31908-false-d1447276e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@classCode) = ('SBADM') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'SBADM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="not(@negationInd) or string(@negationInd)=('true','false')">(A_Rijksvaccinatie-universal): attribuut @negationInd MOET datatype 'bl' hebben  - '<value-of select="@negationInd"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="not(@negationInd='true') or hl7:authorization">(A_Rijksvaccinatie-universal): als <name/>/@negationInd 'true' is, dan MOET er bezwaar zijn in authorization</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="@negationInd='true' or not(hl7:authorization)">(A_Rijksvaccinatie-universal): als <name/>/@negationInd 'false' is of afwezig, dan MAG er GEEN er bezwaar zijn in authorization</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="not(.//hl7:lotNumberText and hl7:authorization)">(A_Rijksvaccinatie-universal): lotNumberText KAN GEEN waarde bevatten, als er sprake is van bezwaar</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test=".//hl7:lotNumberText or hl7:authorization">(A_Rijksvaccinatie-universal): lotNumberText bevat geen waarde, terwijl er geen sprake van bezwaar is</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:effectiveTime[not(@nullFlavor)]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:effectiveTime[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:effectiveTime[not(@nullFlavor)]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:effectiveTime[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:medication]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:consumable[not(@nullFlavor)][hl7:medication] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:medication]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:consumable[not(@nullFlavor)][hl7:medication] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']"
         id="d41e32160-false-d1447436e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.116')">(A_Rijksvaccinatie-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.116' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]"
         id="d41e32170-false-d1447455e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="@nullFlavor or (@code='IMMUNIZ' and @codeSystem='2.16.840.1.113883.5.4')">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van 'code 'IMMUNIZ' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:effectiveTime[not(@nullFlavor)]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:effectiveTime[not(@nullFlavor)]"
         id="d41e32180-false-d1447475e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="not(*)">(A_Rijksvaccinatie-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="matches(@value,'^[0-9]{8}')">(A_Rijksvaccinatie-universal): 
                        <name path=".."/>/<name/> moet tenminste tot op de dag nauwkeurig worden opgegeven</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]"
         id="d41e32201-false-d1447492e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@typeCode) = ('CSM') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'CSM' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:medication[not(@nullFlavor)][hl7:administrableMedicine] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:medication[not(@nullFlavor)][hl7:administrableMedicine] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]"
         id="d41e32221-false-d1447522e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@classCode) = ('ADMM') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'ADMM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]"
         id="d41e32227-false-d1447552e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@classCode) = ('MMAT') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'MMAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@determinerCode) = ('KIND') or not(@determinerCode)">(A_Rijksvaccinatie-universal): de waarde van determinerCode MOET 'KIND' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:lotNumberText) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:lotNumberText komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']"
         id="d41e32235-false-d1447593e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.422 W0422 Soort vaccinatie (HL7) (2016-12-09T00:00:00)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:lotNumberText
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:lotNumberText"
         id="d41e32243-false-d1447615e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('NI') or not(@nullFlavor)">(A_Rijksvaccinatie-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@typeCode) = ('PRF') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'PRF' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e32275-false-d1447658e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@typeCode) = ('RSON') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'RSON' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e32284-false-d1447688e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e32295-false-d1447741e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="@nullFlavor or (@code='686' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van 'code '686' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e32306-false-d1447763e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.417 W0417 Reden van enting (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_Rijksvaccinatie-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.417 W0417 Reden van enting (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e32323-false-d1447792e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@typeCode) = ('CAUS') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'CAUS' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e32332-false-d1447826e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:value) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:value is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:value) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:value komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e32343-false-d1447901e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="@nullFlavor or (@code='874' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van 'code '874' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10266
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime
Item: (PeriodeReactie)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime"
         id="d1447915e6-false-d1447923e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10266-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeReactie): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10266-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeReactie): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10266-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeReactie): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10266-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeReactie): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10266-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeReactie): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10266-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeReactie): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10266-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeReactie): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10266
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime/hl7:low
Item: (PeriodeReactie)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime/hl7:low"
         id="d1447915e43-false-d1447988e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10266-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeReactie): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10266-2012-08-01T000000.html"
              test="not(*)">(PeriodeReactie): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10266-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeReactie): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10266
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime/hl7:high
Item: (PeriodeReactie)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime/hl7:high"
         id="d1447915e62-false-d1448011e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10266-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeReactie): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10266-2012-08-01T000000.html"
              test="not(*)">(PeriodeReactie): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10266-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeReactie): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10266
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime/hl7:width
Item: (PeriodeReactie)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10266
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime/hl7:center
Item: (PeriodeReactie)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value"
         id="d41e32358-false-d1448052e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e32366-false-d1448065e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@typeCode) = ('SUBJ') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'SUBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e32375-false-d1448095e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@classCode) = ('INFO') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'INFO' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e32386-false-d1448149e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="@nullFlavor or (@code='875' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van 'code '875' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime"
         id="d41e32397-false-d1448169e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="not(*)">(A_Rijksvaccinatie-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]"
         id="d41e32405-false-d1448186e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@typeCode) = ('PRF')">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'PRF' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:assignedPerson[not(@nullFlavor)]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:assignedPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:assignedPerson[not(@nullFlavor)]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:assignedPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]"
         id="d41e32414-false-d1448220e0">
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.1'] | hl7:id[@root = '2.16.528.1.1007.5.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = 'NI'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(A_Rijksvaccinatie-universal): keuze (hl7:id[@root = '2.16.528.1.1007.3.1']  of  hl7:id[@root = '2.16.528.1.1007.5.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = 'NI']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="$elmcount &lt;= 3">(A_Rijksvaccinatie-universal): keuze (hl7:id[@root = '2.16.528.1.1007.3.1']  of  hl7:id[@root = '2.16.528.1.1007.5.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = 'NI']) bevat te veel elementen [max 3x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.3.1']) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:id[@root = '2.16.528.1.1007.3.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.5.1']) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:id[@root = '2.16.528.1.1007.5.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.1']) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:id[@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@root = '2.16.528.1.1007.3.1']
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@root = '2.16.528.1.1007.3.1']"
         id="d41e32426-false-d1448285e0">
      <extends rule="II.NL.UZI"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@root) = ('2.16.528.1.1007.3.1')">(A_Rijksvaccinatie-universal): de waarde van root MOET '2.16.528.1.1007.3.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@root = '2.16.528.1.1007.5.1']
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@root = '2.16.528.1.1007.5.1']"
         id="d41e32434-false-d1448304e0">
      <extends rule="II.NL.BIG"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@root) = ('2.16.528.1.1007.5.1')">(A_Rijksvaccinatie-universal): de waarde van root MOET '2.16.528.1.1007.5.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']"
         id="d41e32442-false-d1448323e0">
      <extends rule="II.NL.AGB"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.1')">(A_Rijksvaccinatie-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@nullFlavor = 'NI']
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@nullFlavor = 'NI']"
         id="d41e32450-false-d1448342e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('NI')">(A_Rijksvaccinatie-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]"
         id="d41e32469-false-d1448361e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@typeCode) = ('AUTH') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'AUTH' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]"
         id="d41e32480-false-d1448391e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@classCode) = ('CONS') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'CONS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@negationInd) = ('true')">(A_Rijksvaccinatie-universal): de waarde van negationInd MOET 'true' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]"
         id="d41e32498-false-d1448437e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="@nullFlavor or (@code='IMMUNIZ' and @codeSystem='2.16.840.1.113883.5.4')">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van 'code 'IMMUNIZ' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e32508-false-d1448457e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@typeCode) = ('RSON') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'RSON' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e32517-false-d1448487e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e32528-false-d1448540e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="@nullFlavor or (@code='683' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van 'code '683' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e32539-false-d1448562e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.323 W0323 Bezwaar (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_Rijksvaccinatie-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.323 W0323 Bezwaar (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40608
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement0608)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40608
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement0608)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40608-2019-11-28T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0608): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40608-2019-11-28T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0608): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40608-2019-11-28T000000.html"
              test="count(hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0608): element hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40608-2019-11-28T000000.html"
              test="count(hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0608): element hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40608-2019-11-28T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(obsElement0608): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40608-2019-11-28T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(obsElement0608): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40608
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0608)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40608-2019-11-28T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0608): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40608-2019-11-28T000000.html"
              test="@nullFlavor or (@code='608' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0608): de elementwaarde MOET een zijn van 'code '608' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40608
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (obsElement0608)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40608-2019-11-28T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(obsElement0608): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.416 W0416 Type oproepkaart (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40608-2019-11-28T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(obsElement0608): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.416 W0416 Type oproepkaart (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40608-2019-11-28T000000.html"
              test="@xsi:type">(obsElement0608): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40608-2019-11-28T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(obsElement0608): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40872
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement0872)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40872
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement0872)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40872-2019-11-28T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0872): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40872-2019-11-28T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0872): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40872-2019-11-28T000000.html"
              test="count(hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0872): element hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40872-2019-11-28T000000.html"
              test="count(hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0872): element hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40872-2019-11-28T000000.html"
              test="count(hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(obsElement0872): element hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40872-2019-11-28T000000.html"
              test="count(hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(obsElement0872): element hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40872
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0872)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40872-2019-11-28T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0872): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40872-2019-11-28T000000.html"
              test="@nullFlavor or (@code='872' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0872): de elementwaarde MOET een zijn van 'code '872' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40872
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (obsElement0872)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40872-2019-11-28T000000.html"
              test="@xsi:type">(obsElement0872): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40872-2019-11-28T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(obsElement0872): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <extends rule="d1448875e0-false-d1448881e0"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41589
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement1589)
-->
   <rule fpi="RULC-1" id="d1448875e0-false-d1448881e0" abstract="true">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="count(hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(obsElement1589): element hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="count(hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(obsElement1589): element hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41589
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement1589)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="count(hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement1589): element hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="count(hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement1589): element hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(obsElement1589): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(obsElement1589): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41589
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement1589)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement1589): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="@nullFlavor or (@code='1589' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement1589): de elementwaarde MOET een zijn van 'code '1589' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41589
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (obsElement1589)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="@xsi:type">(obsElement1589): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
</pattern>
