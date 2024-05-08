<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.136
Name: PatientPerson [minimal]
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000">
   <title>PatientPerson [minimal]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]
Item: (PatientPerson-minimal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]"
         id="d40e26125-false-d320258e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(PatientPerson-minimal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(PatientPerson-minimal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']) &gt;= 1">(PatientPerson-minimal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']) &lt;= 1">(PatientPerson-minimal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136'] komt te vaak voor [max 1x].</assert>
      <let name="elmcount" value="count(hl7:name[@use='OR'] | hl7:name[@use='L'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="$elmcount &gt;= 1">(PatientPerson-minimal): keuze (hl7:name[@use='OR']  of  hl7:name[@use='L']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="$elmcount &lt;= 1">(PatientPerson-minimal): keuze (hl7:name[@use='OR']  of  hl7:name[@use='L']) bevat te veel elementen [max 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(PatientPerson-minimal): element hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(PatientPerson-minimal): element hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:birthTime[not(@nullFlavor)]) &gt;= 1">(PatientPerson-minimal): element hl7:birthTime[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:birthTime[not(@nullFlavor)]) &lt;= 1">(PatientPerson-minimal): element hl7:birthTime[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:multipleBirthInd) &lt;= 1">(PatientPerson-minimal): element hl7:multipleBirthInd komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:multipleBirthOrderNumber) &lt;= 1">(PatientPerson-minimal): element hl7:multipleBirthOrderNumber komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:contactParty) &lt;= 1">(PatientPerson-minimal): element hl7:contactParty komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:birthPlace) &lt;= 1">(PatientPerson-minimal): element hl7:birthPlace komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']"
         id="d40e26153-false-d320380e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(PatientPerson-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.136')">(PatientPerson-minimal): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.136' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10232
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='OR']
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='OR']"
         id="d320393e9-false-d320399e0">
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
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='OR']/hl7:given
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='OR']/hl7:given"
         id="d320393e52-false-d320451e0">
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
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='OR']/hl7:prefix
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='OR']/hl7:prefix"
         id="d320393e61-false-d320470e0">
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
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='OR']/hl7:family[not(@nullFlavor)]
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='OR']/hl7:family[not(@nullFlavor)]"
         id="d320393e74-false-d320503e0">
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
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='L']
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='L']"
         id="d320516e9-false-d320522e0">
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
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='L']/hl7:given
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='L']/hl7:given"
         id="d320516e30-false-d320602e0">
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
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='L']/hl7:prefix
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='L']/hl7:prefix"
         id="d320516e42-false-d320621e0">
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
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='L']/hl7:family
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='L']/hl7:family"
         id="d320516e59-false-d320654e0">
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
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='L']/hl7:delimiter
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='L']/hl7:delimiter"
         id="d320516e69-false-d320673e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10233
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='L']/hl7:suffix
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='L']/hl7:suffix"
         id="d320516e75-false-d320686e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e26171-false-d320701e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(PatientPerson-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(PatientPerson-minimal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (DYNAMISCH)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(PatientPerson-minimal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (DYNAMISCH).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:birthTime[not(@nullFlavor)]
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:birthTime[not(@nullFlavor)]"
         id="d40e26179-false-d320730e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PatientPerson-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="not(*)">(PatientPerson-minimal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:multipleBirthInd
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:multipleBirthInd"
         id="d40e26187-false-d320747e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(PatientPerson-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:multipleBirthOrderNumber
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:multipleBirthOrderNumber"
         id="d40e26198-false-d320760e0">
      <extends rule="INT.POS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')">(PatientPerson-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:INT" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(PatientPerson-minimal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="preceding-sibling::hl7:multipleBirthInd/@value='true'">(PatientPerson-minimal): 
                        <name/> kan alleen een waarde hebben bij meerlingen</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty"
         id="d40e26213-false-d320777e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:telecom[not(@nullFlavor)]) &gt;= 1">(PatientPerson-minimal): element hl7:telecom[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(PatientPerson-minimal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:contactPerson) &lt;= 1">(PatientPerson-minimal): element hl7:contactPerson komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:telecom[not(@nullFlavor)]
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:telecom[not(@nullFlavor)]"
         id="d40e26220-false-d320814e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(PatientPerson-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(PatientPerson-minimal): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:effectiveTime
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:effectiveTime"
         id="d40e26233-false-d320833e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PatientPerson-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="hl7:low or hl7:high">(PatientPerson-minimal): template-2.16.840.1.113883.2.4.6.10.100.163: low en/of high is verplicht</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:low) &lt;= 1">(PatientPerson-minimal): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:high) &lt;= 1">(PatientPerson-minimal): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:width) = 0">(PatientPerson-minimal): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:center) = 0">(PatientPerson-minimal): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:effectiveTime/hl7:low
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:effectiveTime/hl7:low"
         id="d40e26243-false-d320880e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PatientPerson-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="not(*)">(PatientPerson-minimal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:effectiveTime/hl7:high
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:effectiveTime/hl7:high"
         id="d40e26249-false-d320897e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PatientPerson-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="not(*)">(PatientPerson-minimal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:effectiveTime/hl7:width
Item: (PatientPerson-minimal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:effectiveTime/hl7:center
Item: (PatientPerson-minimal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:contactPerson
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:contactPerson"
         id="d40e26261-false-d320932e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(PatientPerson-minimal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(PatientPerson-minimal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(PatientPerson-minimal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(PatientPerson-minimal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:contactPerson/hl7:name[not(@nullFlavor)]
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:contactPerson/hl7:name[not(@nullFlavor)]"
         id="d40e26270-false-d320968e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(PatientPerson-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:birthPlace
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:birthPlace"
         id="d40e26278-false-d320981e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:addr[not(@nullFlavor)]) &gt;= 1">(PatientPerson-minimal): element hl7:addr[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:addr[not(@nullFlavor)]) &lt;= 1">(PatientPerson-minimal): element hl7:addr[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]"
         id="d40e26298-false-d321005e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(PatientPerson-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="hl7:county or hl7:country">(PatientPerson-minimal): Tenminste geboorteplaats of geboorteland is verplicht</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:county) &lt;= 1">(PatientPerson-minimal): element hl7:county komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="count(hl7:country) &lt;= 1">(PatientPerson-minimal): element hl7:country komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:county
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:county"
         id="d40e26306-false-d321036e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(PatientPerson-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.6.14'">(PatientPerson-minimal): 
                                <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP-tabel 33 Gemeenten</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.136
Context: *[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:country
Item: (PatientPerson-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:country"
         id="d40e26319-false-d321049e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(PatientPerson-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.4.16.34'">(PatientPerson-minimal): 
                                <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP tabel 34 Landen</assert>
   </rule>
</pattern>
