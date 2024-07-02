<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.117
Name: A_Rijksvaccinatie [informational/administered]
Description: COCT_RM900916NL02: Gegevens van rijksvaccinaties en andere vaccinaties
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000">
   <title>A_Rijksvaccinatie [informational/administered]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]"
         id="d41e32605-false-d1449017e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@classCode) = ('SBADM') or not(@classCode)">(A_Rijksvaccinatie-informational-administered): de waarde van classCode MOET 'SBADM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-informational-administered): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="not(@negationInd) or string(@negationInd)=('true','false')">(A_Rijksvaccinatie-informational-administered): attribuut @negationInd MOET datatype 'bl' hebben  - '<value-of select="@negationInd"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="not(@negationInd='true') or hl7:authorization">(A_Rijksvaccinatie-informational-administered): als <name/>/@negationInd 'true' is, dan MOET er bezwaar zijn in authorization</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="@negationInd='true' or not(hl7:authorization)">(A_Rijksvaccinatie-informational-administered): als <name/>/@negationInd 'false' is of afwezig, dan MAG er GEEN er bezwaar zijn in authorization</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']) &gt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:effectiveTime[not(@nullFlavor)]) &gt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:effectiveTime[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:effectiveTime[not(@nullFlavor)]) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:effectiveTime[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:medication]) &gt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:consumable[not(@nullFlavor)][hl7:medication] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:consumable[not(@nullFlavor)][hl7:medication]) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:consumable[not(@nullFlavor)][hl7:medication] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]) &gt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']"
         id="d41e32714-false-d1449125e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_Rijksvaccinatie-informational-administered): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.117')">(A_Rijksvaccinatie-informational-administered): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.117' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]"
         id="d41e32725-false-d1449144e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-informational-administered): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="@nullFlavor or (@code='IMMUNIZ' and @codeSystem='2.16.840.1.113883.5.4')">(A_Rijksvaccinatie-informational-administered): de elementwaarde MOET een zijn van 'code 'IMMUNIZ' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:effectiveTime[not(@nullFlavor)]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:effectiveTime[not(@nullFlavor)]"
         id="d41e32735-false-d1449164e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(A_Rijksvaccinatie-informational-administered): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="not(*)">(A_Rijksvaccinatie-informational-administered): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="matches(@value,'^[0-9]{8}')">(A_Rijksvaccinatie-informational-administered): 
                        <name path=".."/>/<name/> moet tenminste tot op de dag nauwkeurig worden opgegeven</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]"
         id="d41e32755-false-d1449181e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@typeCode) = ('CSM') or not(@typeCode)">(A_Rijksvaccinatie-informational-administered): de waarde van typeCode MOET 'CSM' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]) &gt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:medication[not(@nullFlavor)][hl7:administrableMedicine] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:medication[not(@nullFlavor)][hl7:administrableMedicine] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]"
         id="d41e32775-false-d1449211e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@classCode) = ('ADMM') or not(@classCode)">(A_Rijksvaccinatie-informational-administered): de waarde van classCode MOET 'ADMM' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]) &gt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]"
         id="d41e32781-false-d1449241e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@classCode) = ('MMAT') or not(@classCode)">(A_Rijksvaccinatie-informational-administered): de waarde van classCode MOET 'MMAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@determinerCode) = ('KIND') or not(@determinerCode)">(A_Rijksvaccinatie-informational-administered): de waarde van determinerCode MOET 'KIND' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="not(hl7:lotNumberText and ../../../hl7:authorization)">(A_Rijksvaccinatie-informational-administered): lotNumberText KAN GEEN waarde bevatten, als er sprake is van bezwaar</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="hl7:lotNumberText or ../../../hl7:authorization">(A_Rijksvaccinatie-informational-administered): lotNumberText MOET een waarde bevatten, voor vaccinaties zonder bezwaar</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']) &gt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:lotNumberText) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:lotNumberText komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']"
         id="d41e32796-false-d1449282e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-informational-administered): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Rijksvaccinatie-informational-administered): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.422 W0422 Soort vaccinatie (HL7) (2016-12-09T00:00:00)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:lotNumberText
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/hl7:lotNumberText"
         id="d41e32804-false-d1449304e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_Rijksvaccinatie-informational-administered): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('NI') or not(@nullFlavor)">(A_Rijksvaccinatie-informational-administered): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@typeCode) = ('PRF') or not(@typeCode)">(A_Rijksvaccinatie-informational-administered): de waarde van typeCode MOET 'PRF' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]"
         id="d41e32837-false-d1449347e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@typeCode) = ('AUTH') or not(@typeCode)">(A_Rijksvaccinatie-informational-administered): de waarde van typeCode MOET 'AUTH' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]) &gt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]"
         id="d41e32848-false-d1449377e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@classCode) = ('CONS') or not(@classCode)">(A_Rijksvaccinatie-informational-administered): de waarde van classCode MOET 'CONS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-informational-administered): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@negationInd) = ('true')">(A_Rijksvaccinatie-informational-administered): de waarde van negationInd MOET 'true' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]"
         id="d41e32866-false-d1449428e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-informational-administered): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="@nullFlavor or (@code='IMMUNIZ' and @codeSystem='2.16.840.1.113883.5.4')">(A_Rijksvaccinatie-informational-administered): de elementwaarde MOET een zijn van 'code 'IMMUNIZ' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e32876-false-d1449448e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@typeCode) = ('RSON') or not(@typeCode)">(A_Rijksvaccinatie-informational-administered): de waarde van typeCode MOET 'RSON' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e32887-false-d1449478e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_Rijksvaccinatie-informational-administered): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_Rijksvaccinatie-informational-administered): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(A_Rijksvaccinatie-informational-administered): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e32898-false-d1449531e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-informational-administered): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="@nullFlavor or (@code='683' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_Rijksvaccinatie-informational-administered): de elementwaarde MOET een zijn van 'code '683' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.117
Context: *[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (A_Rijksvaccinatie-informational-administered)
-->
   <rule fpi="RULC-1"
         context="*[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d41e32909-false-d1449553e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_Rijksvaccinatie-informational-administered): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_Rijksvaccinatie-informational-administered): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.323 W0323 Bezwaar (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.117-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_Rijksvaccinatie-informational-administered): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.323 W0323 Bezwaar (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
</pattern>
