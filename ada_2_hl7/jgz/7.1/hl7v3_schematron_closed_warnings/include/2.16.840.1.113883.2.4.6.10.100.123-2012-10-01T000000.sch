<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.123
Name: A_Rijksvaccinatie [informational/all]
Description: COCT_RM900916NL03: Gegevens van rijksvaccinaties en andere vaccinaties. Verschillen met versie 2 zijn:  
                     SubstanceAdministration.moodCode was "EVN", is nu D:ActMood om "nog te geven vaccinaties" toe te staan  "EVN" was en is een werkelijke vaccinatie "RMD" is de aanbeveling tot geven van een vaccinatie Vanwege de naamconventies is hierdoor ook SubstanceAdministrationEvent veranderd in SubstanceAdministration 
                     SubstanceAdministration.effectiveTime gewijzigd in [0..1] O t.b.v. te-verwachten-vaccinaties 
                     SubstanceAdministration.limitation is toegevoegd t.b.v. "Minimale vaccinatiedatum" 
                     SubstanceAdministration.location toegevoegd t.b.v. "Toedieningslocatie" 
                 
            
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000">
   <title>A_Rijksvaccinatie [informational/all]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]"
         id="d40e21279-false-d541310e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@classCode) = ('SBADM') or not(@classCode)">(A_Rijksvaccinatie-informational-all): de waarde van classCode MOET 'SBADM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="@moodCode">(A_Rijksvaccinatie-informational-all): attribute @moodCode MOET aanwezig zijn.</assert>
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@moodCode),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="not(@moodCode) or empty($theAttValue[not(. = (('EVN','RMD')))])">(A_Rijksvaccinatie-informational-all): de waarde van moodCode MOET 'code EVN of code RMD' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="not(@negationInd) or string(@negationInd)=('true','false')">(A_Rijksvaccinatie-informational-all): attribuut @negationInd MOET datatype 'bl' hebben  - '<value-of select="@negationInd"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="not(@negationInd='true') or hl7:authorization">(A_Rijksvaccinatie-informational-all): Als <name/>/@negationInd 'true' is, dan MOET er bezwaar zijn in authorization</assert>
      <report role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="not(@negationInd='true') and hl7:authorization">(A_Rijksvaccinatie-informational-all): Als <name/>/@negationInd 'false' is of afwezig, dan MAG er GEEN er bezwaar zijn in authorization</report>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="not(@moodCode='RMD' and hl7:effectiveTime)">(A_Rijksvaccinatie-informational-all): 
                    <name/>/@moodCode='RMD' is een te-verwachten-vaccinatie. Alle datumspecificaties MOETEN onder het element limitation</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="not(@moodCode='RMD' and hl7:performer)">(A_Rijksvaccinatie-informational-all): 
                    <name/>/@moodCode='RMD' is een te-verwachten-vaccinatie. Deze KUNNEN GEEN uitvoerende partij hebben</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="not(.//hl7:lotNumberText and hl7:authorization)">(A_Rijksvaccinatie-informational-all): lotNumberText KAN GEEN waarde bevatten, als er sprake is van bezwaar</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:medication]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:consumable[not(@nullFlavor)][hl7:medication] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:medication]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:consumable[not(@nullFlavor)][hl7:medication] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:location[hl7:serviceDeliveryLocation[@classCode = 'SDLOC']]) = 0">(A_Rijksvaccinatie-informational-all): element hl7:location[hl7:serviceDeliveryLocation[@classCode = 'SDLOC']] MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']"
         id="d40e21558-false-d541456e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_Rijksvaccinatie-informational-all): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.123')">(A_Rijksvaccinatie-informational-all): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.123' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]"
         id="d40e21569-false-d541475e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-informational-all): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="@nullFlavor or (@code='IMMUNIZ' and @codeSystem='2.16.840.1.113883.5.4')">(A_Rijksvaccinatie-informational-all): de elementwaarde MOET een zijn van 'code 'IMMUNIZ' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:effectiveTime
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:effectiveTime"
         id="d40e21579-false-d541495e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(A_Rijksvaccinatie-informational-all): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="not(*)">(A_Rijksvaccinatie-informational-all): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:consumable[not(@nullFlavor)][hl7:medication]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:consumable[not(@nullFlavor)][hl7:medication]"
         id="d40e21595-false-d541512e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@typeCode) = ('CSM') or not(@typeCode)">(A_Rijksvaccinatie-informational-all): de waarde van typeCode MOET 'CSM' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:medication[not(@nullFlavor)][hl7:administrableMedicine] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:medication[not(@nullFlavor)][hl7:administrableMedicine] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]"
         id="d40e21615-false-d541542e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@classCode) = ('ADMM') or not(@classCode)">(A_Rijksvaccinatie-informational-all): de waarde van classCode MOET 'ADMM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]"
         id="d40e21621-false-d541572e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@classCode) = ('MMAT') or not(@classCode)">(A_Rijksvaccinatie-informational-all): de waarde van classCode MOET 'MMAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@determinerCode) = ('KIND') or not(@determinerCode)">(A_Rijksvaccinatie-informational-all): de waarde van determinerCode MOET 'KIND' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:lotNumberText) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:lotNumberText komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']"
         id="d40e21629-false-d541613e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-informational-all): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Rijksvaccinatie-informational-all): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.422 W0422 Soort vaccinatie (HL7) (2016-12-09T00:00:00)'.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="(@code and @displayName) or (@nullFlavor and hl7:originalText)">(A_Rijksvaccinatie-informational-all): 
                                    <name/> MOET @code en @displayName bevatten OF @nullFlavor en originalText</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:lotNumberText
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:lotNumberText"
         id="d40e21655-false-d541635e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_Rijksvaccinatie-informational-all): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@nullFlavor) = ('NI') or not(@nullFlavor)">(A_Rijksvaccinatie-informational-all): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@typeCode) = ('PRF') or not(@typeCode)">(A_Rijksvaccinatie-informational-all): de waarde van typeCode MOET 'PRF' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:location[hl7:serviceDeliveryLocation[@classCode = 'SDLOC']]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:location[hl7:serviceDeliveryLocation[@classCode = 'SDLOC']]"
         id="d40e21691-false-d541678e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@typeCode) = ('LOC') or not(@typeCode)">(A_Rijksvaccinatie-informational-all): de waarde van typeCode MOET 'LOC' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:serviceDeliveryLocation[not(@nullFlavor)][@classCode = 'SDLOC']) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:serviceDeliveryLocation[not(@nullFlavor)][@classCode = 'SDLOC'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:serviceDeliveryLocation[not(@nullFlavor)][@classCode = 'SDLOC']) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:serviceDeliveryLocation[not(@nullFlavor)][@classCode = 'SDLOC'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:location[hl7:serviceDeliveryLocation[@classCode = 'SDLOC']]/hl7:serviceDeliveryLocation[not(@nullFlavor)][@classCode = 'SDLOC']
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:location[hl7:serviceDeliveryLocation[@classCode = 'SDLOC']]/hl7:serviceDeliveryLocation[not(@nullFlavor)][@classCode = 'SDLOC']"
         id="d40e21715-false-d541708e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@classCode) = ('SDLOC')">(A_Rijksvaccinatie-informational-all): de waarde van classCode MOET 'SDLOC' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]"
         id="d40e21726-false-d541723e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@typeCode) = ('AUTH') or not(@typeCode)">(A_Rijksvaccinatie-informational-all): de waarde van typeCode MOET 'AUTH' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]"
         id="d40e21737-false-d541753e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@classCode) = ('CONS') or not(@classCode)">(A_Rijksvaccinatie-informational-all): de waarde van classCode MOET 'CONS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-informational-all): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@negationInd) = ('true')">(A_Rijksvaccinatie-informational-all): de waarde van negationInd MOET 'true' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]"
         id="d40e21755-false-d541804e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-informational-all): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="@nullFlavor or (@code='IMMUNIZ' and @codeSystem='2.16.840.1.113883.5.4')">(A_Rijksvaccinatie-informational-all): de elementwaarde MOET een zijn van 'code 'IMMUNIZ' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e21765-false-d541824e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@typeCode) = ('RSON') or not(@typeCode)">(A_Rijksvaccinatie-informational-all): de waarde van typeCode MOET 'RSON' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d40e21777-false-d541854e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Rijksvaccinatie-informational-all): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-informational-all): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e21788-false-d541907e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-informational-all): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="@nullFlavor or (@code='683' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Rijksvaccinatie-informational-all): de elementwaarde MOET een zijn van 'code '683' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e21799-false-d541929e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-informational-all): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Rijksvaccinatie-informational-all): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.323 W0323 Bezwaar (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_Rijksvaccinatie-informational-all): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.323 W0323 Bezwaar (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="not(@nullFlavor or hl7:originalText)">(A_Rijksvaccinatie-informational-all): Uit privacyoverwegingen is het doorgeven van een bezwaarreden, anders dan "Medisch" of "Principieel", NIET toegestaan.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]]"
         id="d40e21817-false-d541956e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]"
         id="d40e21825-false-d541980e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]"
         id="d40e21830-false-d542019e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-informational-all): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="@nullFlavor or (@code='30981-5' and @codeSystem='2.16.840.1.113883.6.1')">(A_Rijksvaccinatie-informational-all): de elementwaarde MOET een zijn van 'code '30981-5' codeSystem '2.16.840.1.113883.6.1''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)]"
         id="d40e21848-false-d542039e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(A_Rijksvaccinatie-informational-all): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="not(*)">(A_Rijksvaccinatie-informational-all): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]]"
         id="d40e21858-false-d542056e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]"
         id="d40e21866-false-d542080e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(A_Rijksvaccinatie-informational-all): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]"
         id="d40e21871-false-d542119e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-informational-all): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="@nullFlavor or (@code='30980-7' and @codeSystem='2.16.840.1.113883.6.1')">(A_Rijksvaccinatie-informational-all): de elementwaarde MOET een zijn van 'code '30980-7' codeSystem '2.16.840.1.113883.6.1''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]/hl7:value[not(@nullFlavor)]"
         id="d40e21889-false-d542139e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(A_Rijksvaccinatie-informational-all): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.123-2012-10-01T000000.html"
              test="not(*)">(A_Rijksvaccinatie-informational-all): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.123
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-informational-all)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41589
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement1589)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="count(hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(obsElement1589): element hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="count(hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(obsElement1589): element hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41589
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement1589)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="count(hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement1589): element hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="count(hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement1589): element hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &gt;= 1">(obsElement1589): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]) &lt;= 1">(obsElement1589): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41589
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement1589)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement1589): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="@nullFlavor or (@code='1589' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement1589): de elementwaarde MOET een zijn van 'code '1589' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41589
Context: *[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]
Item: (obsElement1589)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')]">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41589-2019-11-28T000000.html"
              test="@xsi:type">(obsElement1589): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
</pattern>
