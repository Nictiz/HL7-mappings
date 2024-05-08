<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.163
Name: PatientPerson [universal]
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000">
   <title>PatientPerson [universal]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]
Item: (PatientPerson-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]"
         id="d40e27158-false-d348544e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(PatientPerson-universal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(PatientPerson-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']) &gt;= 1">(PatientPerson-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']) &lt;= 1">(PatientPerson-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163'] komt te vaak voor [max 1x].</assert>
      <let name="elmcount" value="count(hl7:name[@use='OR'] | hl7:name[@use='L'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PatientPerson-universal): keuze (hl7:name[@use='OR']  of  hl7:name[@use='L']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(PatientPerson-universal): keuze (hl7:name[@use='OR']  of  hl7:name[@use='L']) bevat te veel elementen [max 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(PatientPerson-universal): element hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(PatientPerson-universal): element hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:birthTime[not(@nullFlavor)]) &gt;= 1">(PatientPerson-universal): element hl7:birthTime[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:birthTime[not(@nullFlavor)]) &lt;= 1">(PatientPerson-universal): element hl7:birthTime[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:multipleBirthInd) &lt;= 1">(PatientPerson-universal): element hl7:multipleBirthInd komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:multipleBirthOrderNumber) &lt;= 1">(PatientPerson-universal): element hl7:multipleBirthOrderNumber komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:contactParty) &lt;= 1">(PatientPerson-universal): element hl7:contactParty komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:birthPlace) &lt;= 1">(PatientPerson-universal): element hl7:birthPlace komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']"
         id="d40e27218-false-d348666e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(PatientPerson-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.163')">(PatientPerson-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.163' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10232
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='OR']
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='OR']"
         id="d348679e9-false-d348685e0">
      <extends rule="PN.NL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(NaamKindOfficieel): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="string(@use) = ('OR')">(NaamKindOfficieel): de waarde van use MOET 'OR' zijn. Gevonden: "<value-of select="@use"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="count(hl7:given) &lt;= 1">(NaamKindOfficieel): element hl7:given komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="count(hl7:prefix) &lt;= 1">(NaamKindOfficieel): element hl7:prefix komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="count(hl7:family[not(@nullFlavor)]) &gt;= 1">(NaamKindOfficieel): element hl7:family[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="count(hl7:family[not(@nullFlavor)]) &lt;= 1">(NaamKindOfficieel): element hl7:family[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10232
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='OR']/hl7:given
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='OR']/hl7:given"
         id="d348679e52-false-d348737e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindOfficieel): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="string(@qualifier) = ('BR') or not(@qualifier)">(NaamKindOfficieel): de waarde van qualifier MOET 'BR' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10232
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='OR']/hl7:prefix
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='OR']/hl7:prefix"
         id="d348679e61-false-d348756e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindOfficieel): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="@qualifier">(NaamKindOfficieel): attribute @qualifier MOET aanwezig zijn.</assert>
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@qualifier),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="not(@qualifier) or empty($theAttValue[not(. = (('VV','BR')))])">(NaamKindOfficieel): de waarde van qualifier MOET 'code VV of code BR' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10232
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='OR']/hl7:family[not(@nullFlavor)]
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='OR']/hl7:family[not(@nullFlavor)]"
         id="d348679e74-false-d348789e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindOfficieel): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="string(@qualifier) = ('BR')">(NaamKindOfficieel): de waarde van qualifier MOET 'BR' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10233
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='L']
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='L']"
         id="d348802e9-false-d348808e0">
      <extends rule="PN.NL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="string(@use) = ('L')">(NaamKindZoalsBekendBijInstelling): de waarde van use MOET 'L' zijn. Gevonden: "<value-of select="@use"/>"</assert>
      <let name="elmcount"
           value="count(hl7:given | hl7:prefix | hl7:family | hl7:delimiter | hl7:suffix)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(NaamKindZoalsBekendBijInstelling): keuze (hl7:given  of  hl7:prefix  of  hl7:family  of  hl7:delimiter  of  hl7:suffix) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="count(hl7:given) &lt;= 2">(NaamKindZoalsBekendBijInstelling): element hl7:given komt te vaak voor [max 2x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="count(hl7:prefix) &lt;= 1">(NaamKindZoalsBekendBijInstelling): element hl7:prefix komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="count(hl7:family) &lt;= 1">(NaamKindZoalsBekendBijInstelling): element hl7:family komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="count(hl7:delimiter) &lt;= 1">(NaamKindZoalsBekendBijInstelling): element hl7:delimiter komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="count(hl7:suffix) &lt;= 1">(NaamKindZoalsBekendBijInstelling): element hl7:suffix komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10233
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='L']/hl7:given
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='L']/hl7:given"
         id="d348802e30-false-d348888e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="string(@qualifier) = ('CL') or not(@qualifier)">(NaamKindZoalsBekendBijInstelling): de waarde van qualifier MOET 'CL' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10233
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='L']/hl7:prefix
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='L']/hl7:prefix"
         id="d348802e42-false-d348907e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="@qualifier">(NaamKindZoalsBekendBijInstelling): attribute @qualifier MOET aanwezig zijn.</assert>
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@qualifier),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="not(@qualifier) or empty($theAttValue[not(. = (('VV','BR')))])">(NaamKindZoalsBekendBijInstelling): de waarde van qualifier MOET 'code VV of code BR' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10233
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='L']/hl7:family
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='L']/hl7:family"
         id="d348802e59-false-d348940e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="string(@qualifier) = ('BR') or not(@qualifier)">(NaamKindZoalsBekendBijInstelling): de waarde van qualifier MOET 'BR' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10233
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='L']/hl7:delimiter
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='L']/hl7:delimiter"
         id="d348802e69-false-d348959e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10233
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='L']/hl7:suffix
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:name[@use='L']/hl7:suffix"
         id="d348802e75-false-d348972e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e27243-false-d348987e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(PatientPerson-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(PatientPerson-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(PatientPerson-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:birthTime[not(@nullFlavor)]
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:birthTime[not(@nullFlavor)]"
         id="d40e27253-false-d349014e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PatientPerson-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="not(*)">(PatientPerson-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:multipleBirthInd
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:multipleBirthInd"
         id="d40e27262-false-d349031e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(PatientPerson-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:multipleBirthOrderNumber
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:multipleBirthOrderNumber"
         id="d40e27273-false-d349044e0">
      <extends rule="INT.POS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')">(PatientPerson-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:INT" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(PatientPerson-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="preceding-sibling::hl7:multipleBirthInd/@value='true'">(PatientPerson-universal): 
                        <name/> kan alleen een waarde hebben bij meerlingen</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty"
         id="d40e27289-false-d349061e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:telecom[not(@nullFlavor)]) &gt;= 1">(PatientPerson-universal): element hl7:telecom[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(PatientPerson-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:contactPerson) &lt;= 1">(PatientPerson-universal): element hl7:contactPerson komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty/hl7:telecom[not(@nullFlavor)]
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty/hl7:telecom[not(@nullFlavor)]"
         id="d40e27298-false-d349098e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(PatientPerson-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(PatientPerson-universal): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty/hl7:effectiveTime
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty/hl7:effectiveTime"
         id="d40e27314-false-d349117e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PatientPerson-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="hl7:low or hl7:high">(PatientPerson-universal): template-2.16.840.1.113883.2.4.6.10.100.163: low en/of high is verplicht</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PatientPerson-universal): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PatientPerson-universal): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PatientPerson-universal): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PatientPerson-universal): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty/hl7:effectiveTime/hl7:low
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty/hl7:effectiveTime/hl7:low"
         id="d40e27324-false-d349164e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PatientPerson-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="not(*)">(PatientPerson-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty/hl7:effectiveTime/hl7:high
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty/hl7:effectiveTime/hl7:high"
         id="d40e27330-false-d349181e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PatientPerson-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="not(*)">(PatientPerson-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty/hl7:effectiveTime/hl7:width
Item: (PatientPerson-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty/hl7:effectiveTime/hl7:center
Item: (PatientPerson-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty/hl7:contactPerson
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty/hl7:contactPerson"
         id="d40e27344-false-d349216e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(PatientPerson-universal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(PatientPerson-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(PatientPerson-universal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(PatientPerson-universal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty/hl7:contactPerson/hl7:name[not(@nullFlavor)]
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:contactParty/hl7:contactPerson/hl7:name[not(@nullFlavor)]"
         id="d40e27355-false-d349252e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(PatientPerson-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:birthPlace
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:birthPlace"
         id="d40e27366-false-d349265e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:addr[not(@nullFlavor)]) &gt;= 1">(PatientPerson-universal): element hl7:addr[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:addr[not(@nullFlavor)]) &lt;= 1">(PatientPerson-universal): element hl7:addr[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]"
         id="d40e27388-false-d349289e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(PatientPerson-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="hl7:county or hl7:country">(PatientPerson-universal): Tenminste geboorteplaats of geboorteland is verplicht</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:county) &lt;= 1">(PatientPerson-universal): element hl7:county komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="count(hl7:country) &lt;= 1">(PatientPerson-universal): element hl7:country komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:county
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:county"
         id="d40e27398-false-d349320e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(PatientPerson-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.6.14'">(PatientPerson-universal): 
                                <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP-tabel 33 Gemeenten</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.163
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:country
Item: (PatientPerson-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:country"
         id="d40e27414-false-d349333e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(PatientPerson-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.163-2012-08-01T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.4.16.34'">(PatientPerson-universal): 
                                <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP tabel 34 Landen</assert>
   </rule>
</pattern>
