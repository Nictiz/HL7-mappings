<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.116
Name: A_Rijksvaccinatie [universal]
Description: COCT_RM900916NL04: Gegevens van rijksvaccinaties en andere vaccinaties. Verschillen met de voorgaande versie zijn:  
                     
                     InformationControlActEvent.performer is nu CMET AssignedPerson zodat naam, functie, organisatie kunnen worden ondersteund 
                     substanceAdministration.medication.administrableMedicine.code bevat nu een verduidelijking voor het gebruik van de nullFlavor 'OTH' 
                     substanceAdministration.performer is niet meer verplicht om buitenlandse vaccinaties, waarvan de uitvoerende organisatie/persoon kan ontbreken, te ondersteunen 
                     substanceAdministration.authorization is uitgebreid met conformance 'R' (required) 
                     substanceAdministration.authorization.consentEvent.reasonOf heeft nu een maximum van 1 en conformance 'C' (conditioneel), zodat er maximaal 1 bezwaar gekoppeld kan worden per vaccinatie 
                     substanceAdministration.component bevat een aan
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000">
   <title>A_Rijksvaccinatie [universal]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]
Item: (A_Rijksvaccinatie-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]"
         id="d41e31253-false-d1445440e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@classCode) = ('SBADM') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'SBADM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="not(@negationInd) or string(@negationInd)=('true','false')">(A_Rijksvaccinatie-universal): attribuut @negationInd MOET datatype 'bl' hebben  - '<value-of select="@negationInd"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="not(@negationInd='true') or hl7:authorization">(A_Rijksvaccinatie-universal): als <name/>/@negationInd 'true' is, dan MOET er bezwaar zijn in authorization</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="@negationInd='true' or not(hl7:authorization)">(A_Rijksvaccinatie-universal): als <name/>/@negationInd 'false' is of afwezig, dan MAG er GEEN er bezwaar zijn in authorization</assert>
      <report role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="@moodCode='RMD' and ancestor::hl7:CareProvisionRequest">(A_Rijksvaccinatie-universal): 
                    <name/>/@moodCode='RMD' is een te-verwachten-vaccinatie. Deze worden opgeleverd door het RIVM en horen niet in dossieroverdracht.</report>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="not(.//hl7:lotNumberText and hl7:authorization)">(A_Rijksvaccinatie-universal): lotNumberText KAN GEEN waarde bevatten, als er sprake is van bezwaar</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test=".//hl7:lotNumberText or hl7:authorization">(A_Rijksvaccinatie-universal): lotNumberText bevat geen waarde, terwijl er geen sprake van bezwaar is</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:effectiveTime[not(@nullFlavor)]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:effectiveTime[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:effectiveTime[not(@nullFlavor)]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:effectiveTime[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:medication]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:consumable[not(@nullFlavor)][hl7:medication] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:medication]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:consumable[not(@nullFlavor)][hl7:medication] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']"
         id="d41e31413-false-d1445594e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.116')">(A_Rijksvaccinatie-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.116' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]"
         id="d41e31423-false-d1445613e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="@nullFlavor or (@code='IMMUNIZ' and @codeSystem='2.16.840.1.113883.5.4')">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van 'code 'IMMUNIZ' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:effectiveTime[not(@nullFlavor)]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:effectiveTime[not(@nullFlavor)]"
         id="d41e31434-false-d1445633e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="not(*)">(A_Rijksvaccinatie-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="matches(@value,'^[0-9]{8}')">(A_Rijksvaccinatie-universal): 
                        <name path=".."/>/<name/> moet tenminste tot op de dag nauwkeurig worden opgegeven</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]"
         id="d41e31454-false-d1445650e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@typeCode) = ('CSM') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'CSM' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:medication[not(@nullFlavor)][hl7:administrableMedicine] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:medication[not(@nullFlavor)][hl7:administrableMedicine] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]"
         id="d41e31474-false-d1445680e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@classCode) = ('ADMM') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'ADMM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]"
         id="d41e31480-false-d1445710e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@classCode) = ('MMAT') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'MMAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@determinerCode) = ('KIND') or not(@determinerCode)">(A_Rijksvaccinatie-universal): de waarde van determinerCode MOET 'KIND' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:lotNumberText) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:lotNumberText komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']"
         id="d41e31488-false-d1445751e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.422 W0422 Soort vaccinatie (HL7) (2016-12-09T00:00:00)'.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="(@code and @displayName) or (@nullFlavor and hl7:originalText)">(A_Rijksvaccinatie-universal): 
                                    <name/> MOET @code en @displayName bevatten OF @nullFlavor en originalText</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:lotNumberText
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:lotNumberText"
         id="d41e31514-false-d1445773e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('NI') or not(@nullFlavor)">(A_Rijksvaccinatie-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@typeCode) = ('PRF') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'PRF' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e31556-false-d1445816e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@typeCode) = ('RSON') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'RSON' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e31565-false-d1445846e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e31576-false-d1445899e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="@nullFlavor or (@code='686' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van 'code '686' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:reason[hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationReason[hl7:code[(@code = '686' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e31587-false-d1445921e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.417 W0417 Reden van enting (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.417-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_Rijksvaccinatie-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.417 W0417 Reden van enting (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e31603-false-d1445950e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@typeCode) = ('CAUS') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'CAUS' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e31612-false-d1445984e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:value) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:value is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:value) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:value komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e31623-false-d1446059e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="@nullFlavor or (@code='874' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van 'code '874' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10266
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime
Item: (PeriodeReactie)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime"
         id="d1446073e6-false-d1446081e0">
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
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime/hl7:low
Item: (PeriodeReactie)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime/hl7:low"
         id="d1446073e43-false-d1446146e0">
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
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime/hl7:high
Item: (PeriodeReactie)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime/hl7:high"
         id="d1446073e62-false-d1446169e0">
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
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime/hl7:width
Item: (PeriodeReactie)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10266
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime/hl7:center
Item: (PeriodeReactie)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value"
         id="d41e31638-false-d1446210e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e31646-false-d1446223e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@typeCode) = ('SUBJ') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'SUBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e31655-false-d1446253e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@classCode) = ('INFO') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'INFO' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e31666-false-d1446307e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="@nullFlavor or (@code='875' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van 'code '875' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime"
         id="d41e31677-false-d1446327e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="not(*)">(A_Rijksvaccinatie-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]"
         id="d41e31685-false-d1446344e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@typeCode) = ('PRF')">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'PRF' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:assignedPerson[not(@nullFlavor)]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:assignedPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:assignedPerson[not(@nullFlavor)]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:assignedPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]"
         id="d41e31694-false-d1446378e0">
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.1'] | hl7:id[@root = '2.16.528.1.1007.5.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = 'NI'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="$elmcount &gt;= 1">(A_Rijksvaccinatie-universal): keuze (hl7:id[@root = '2.16.528.1.1007.3.1']  of  hl7:id[@root = '2.16.528.1.1007.5.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = 'NI']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="$elmcount &lt;= 3">(A_Rijksvaccinatie-universal): keuze (hl7:id[@root = '2.16.528.1.1007.3.1']  of  hl7:id[@root = '2.16.528.1.1007.5.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = 'NI']) bevat te veel elementen [max 3x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.3.1']) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:id[@root = '2.16.528.1.1007.3.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.5.1']) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:id[@root = '2.16.528.1.1007.5.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.1']) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:id[@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@root = '2.16.528.1.1007.3.1']
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@root = '2.16.528.1.1007.3.1']"
         id="d41e31706-false-d1446452e0">
      <extends rule="II.NL.UZI"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@root) = ('2.16.528.1.1007.3.1')">(A_Rijksvaccinatie-universal): de waarde van root MOET '2.16.528.1.1007.3.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@root = '2.16.528.1.1007.5.1']
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@root = '2.16.528.1.1007.5.1']"
         id="d41e31714-false-d1446471e0">
      <extends rule="II.NL.BIG"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@root) = ('2.16.528.1.1007.5.1')">(A_Rijksvaccinatie-universal): de waarde van root MOET '2.16.528.1.1007.5.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']"
         id="d41e31722-false-d1446490e0">
      <extends rule="II.NL.AGB"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.1')">(A_Rijksvaccinatie-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@nullFlavor = 'NI']
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:id[@nullFlavor = 'NI']"
         id="d41e31730-false-d1446509e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('NI')">(A_Rijksvaccinatie-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']"
         id="d41e31741-false-d1446528e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@classCode) = ('PSN')">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(A_Rijksvaccinatie-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']/hl7:name[not(@nullFlavor)]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:causeOf2[hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:adverseReaction[hl7:code[(@code = '874' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:informationControlActEvent[hl7:code[(@code = '875' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:performer[@typeCode = 'PRF'][hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']/hl7:name[not(@nullFlavor)]"
         id="d41e31752-false-d1446564e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]"
         id="d41e31770-false-d1446577e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@typeCode) = ('AUTH') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'AUTH' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]"
         id="d41e31781-false-d1446607e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@classCode) = ('CONS') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'CONS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@negationInd) = ('true')">(A_Rijksvaccinatie-universal): de waarde van negationInd MOET 'true' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]"
         id="d41e31799-false-d1446658e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="@nullFlavor or (@code='IMMUNIZ' and @codeSystem='2.16.840.1.113883.5.4')">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van 'code 'IMMUNIZ' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e31809-false-d1446678e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@typeCode) = ('RSON') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'RSON' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e31821-false-d1446708e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Rijksvaccinatie-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_Rijksvaccinatie-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_Rijksvaccinatie-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e31832-false-d1446761e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="@nullFlavor or (@code='683' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van 'code '683' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e31843-false-d1446783e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Rijksvaccinatie-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.323 W0323 Bezwaar (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_Rijksvaccinatie-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.323 W0323 Bezwaar (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.116
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40608
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement0608)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40608
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement0608)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
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
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0608)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
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
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (obsElement0608)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '608' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.416-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]">
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
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40872
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement0872)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40872
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement0872)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
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
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0872)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
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
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (obsElement0872)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '872' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]">
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
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <extends rule="d1447096e0-false-d1447102e0"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.116-2020-05-27T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_Rijksvaccinatie-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41589
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement1589)
-->
   <rule fpi="RULC-1" id="d1447096e0-false-d1447102e0" abstract="true">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="count(hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(obsElement1589): element hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="count(hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(obsElement1589): element hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41589
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement1589)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
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
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement1589)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
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
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (obsElement1589)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.116']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="@xsi:type">(obsElement1589): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
</pattern>