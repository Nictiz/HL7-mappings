<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.172
Name: R_SubjectNL_JGZ Informal [identified/confirmable]
Description: COCT_MT560000NL/COCT_RM050000NL02: Patiënt/persoonsgegevens. Ten opzichte van R_PatientNL-JGZ-Informal-identified-confirmable bevat deze template alleen een extra templateId element. R_SubjectNL heeft geen eigen elementen, maar heeft alleen een keuze uit R_PatientNL [universal] (COCT_RM050000NL02) / R_Patient [clinical] (COCT_RM050004NL) en R_InvestigativeSubjectNL [universal] (COCT_RM550000NL). In dit template is alleen de eerste van belang.
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000">
   <title>R_SubjectNL_JGZ Informal [identified/confirmable]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.172
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]
Item: (R_SubjectNL-JGZ-Informal-identified-confirmable)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.172
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]
Item: (R_SubjectNL-JGZ-Informal-identified-confirmable)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]"
         id="d40e27594-false-d604995e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="string(@classCode) = ('PAT') or not(@classCode)">(R_SubjectNL-JGZ-Informal-identified-confirmable): de waarde van classCode MOET 'PAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172']) &gt;= 1">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172']) &lt;= 1">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']) &gt;= 1">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']) &lt;= 1">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:id) &gt;= 1">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:id is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:id) &lt;= 1">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:id komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:addr) &gt;= 1">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:addr is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:addr) &lt;= 2">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:addr komt te vaak voor [max 2x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:statusCode[@code = 'active']) &gt;= 1">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:statusCode[@code = 'active'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:statusCode[@code = 'active']) &lt;= 1">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:statusCode[@code = 'active'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]) &gt;= 1">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']]) &lt;= 1">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.163']] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.172
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172']
Item: (R_SubjectNL-JGZ-Informal-identified-confirmable)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172']"
         id="d40e27664-false-d605127e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_SubjectNL-JGZ-Informal-identified-confirmable): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.172')">(R_SubjectNL-JGZ-Informal-identified-confirmable): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.172' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.172
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']
Item: (R_SubjectNL-JGZ-Informal-identified-confirmable)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']"
         id="d40e27675-false-d605146e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_SubjectNL-JGZ-Informal-identified-confirmable): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.103')">(R_SubjectNL-JGZ-Informal-identified-confirmable): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.103' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.172
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:id
Item: (R_SubjectNL-JGZ-Informal-identified-confirmable)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:id"
         id="d40e27685-false-d605165e0">
      <extends rule="II.NL.BSN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_SubjectNL-JGZ-Informal-identified-confirmable): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('NA') or not(@nullFlavor)">(R_SubjectNL-JGZ-Informal-identified-confirmable): de waarde van nullFlavor MOET 'NA' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.3') or not(@root)">(R_SubjectNL-JGZ-Informal-identified-confirmable): de waarde van root MOET '2.16.840.1.113883.2.4.6.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr"
         id="d605184e6-false-d605194e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(AdresJeugdige): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:streetName) &lt;= 1">(AdresJeugdige): element hl7:streetName komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:houseNumber) &lt;= 1">(AdresJeugdige): element hl7:houseNumber komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:buildingNumberSuffix) &lt;= 1">(AdresJeugdige): element hl7:buildingNumberSuffix komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:additionalLocator) &lt;= 1">(AdresJeugdige): element hl7:additionalLocator komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:postalCode) &gt;= 1">(AdresJeugdige): element hl7:postalCode is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:postalCode) &lt;= 1">(AdresJeugdige): element hl7:postalCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:county) &lt;= 1">(AdresJeugdige): element hl7:county komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:city) &lt;= 1">(AdresJeugdige): element hl7:city komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:country) &lt;= 1">(AdresJeugdige): element hl7:country komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:desc) &lt;= 1">(AdresJeugdige): element hl7:desc komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:useablePeriod) &lt;= 1">(AdresJeugdige): element hl7:useablePeriod komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:streetName
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:streetName"
         id="d605184e49-false-d605315e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:houseNumber
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:houseNumber"
         id="d605184e55-false-d605328e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:buildingNumberSuffix
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:buildingNumberSuffix"
         id="d605184e62-false-d605341e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:additionalLocator
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:additionalLocator"
         id="d605184e109-false-d605354e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="text()='to' or text()='by'">(AdresJeugdige): de elementinhoud van hl7:additionalLocator MOET ''to' of 'by'' zijn. Gevonden: "<value-of select="."/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:postalCode
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:postalCode"
         id="d605184e119-false-d605375e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="string-length(text())=7">(AdresJeugdige): 
                        <name path=".."/>/<name/> MOET formaat 'nnnn AA' zijn (met spatie)</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:county
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:county"
         id="d605184e132-false-d605388e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.6.14'">(AdresJeugdige): 
                        <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP-tabel 33</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:city
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:city"
         id="d605184e145-false-d605401e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:country
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:country"
         id="d605184e151-false-d605414e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.4.16.34'">(AdresJeugdige): 
                        <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP tabel 34 Landen</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:desc
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:desc"
         id="d605184e165-false-d605427e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10251
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:useablePeriod
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:useablePeriod"
         id="d605434e6-false-d605442e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeGeldigheidAdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidAdresJeugdige): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidAdresJeugdige): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidAdresJeugdige): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidAdresJeugdige): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidAdresJeugdige): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidAdresJeugdige): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10251
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:useablePeriod/hl7:low
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:useablePeriod/hl7:low"
         id="d605434e43-false-d605507e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidAdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidAdresJeugdige): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidAdresJeugdige): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10251
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:useablePeriod/hl7:high
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:useablePeriod/hl7:high"
         id="d605434e62-false-d605530e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidAdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidAdresJeugdige): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidAdresJeugdige): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10251
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:useablePeriod/hl7:width
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10251
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:addr/hl7:useablePeriod/hl7:center
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.172
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:statusCode[@code = 'active']
Item: (R_SubjectNL-JGZ-Informal-identified-confirmable)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:statusCode[@code = 'active']"
         id="d40e27702-false-d605571e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(R_SubjectNL-JGZ-Informal-identified-confirmable): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="@nullFlavor or (@code='active')">(R_SubjectNL-JGZ-Informal-identified-confirmable): de elementwaarde MOET een zijn van 'code 'active''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.172
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (R_SubjectNL-JGZ-Informal-identified-confirmable)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d40e27714-false-d605594e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_SubjectNL-JGZ-Informal-identified-confirmable): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <report role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="ancestor::hl7:ControlActProcess/descendant::hl7:neonateData">(R_SubjectNL-JGZ-Informal-identified-confirmable): 
                        <name path=".."/>/<name/> niet gebruiken in berichten waar deze informatie al onder Rubriek 16 in element neonateData staat.</report>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="count(hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(R_SubjectNL-JGZ-Informal-identified-confirmable): element hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.172
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (R_SubjectNL-JGZ-Informal-identified-confirmable)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
      <extends rule="d605647e0-false-d605653e0"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS')">(R_SubjectNL-JGZ-Informal-identified-confirmable): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.172-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN')">(R_SubjectNL-JGZ-Informal-identified-confirmable): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40108
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement0108)
-->
   <rule fpi="RULC-1" id="d605647e0-false-d605653e0" abstract="true">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40108-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0108): element hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40108-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0108): element hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40108-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(obsElement0108): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40108-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(obsElement0108): element hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40108
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0108)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40108-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0108): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40108-2012-08-01T000000.html"
              test="@nullFlavor or (@code='108' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0108): de elementwaarde MOET een zijn van 'code '108' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40108
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (obsElement0108)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.172'] and hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.103']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '108' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40108-2012-08-01T000000.html"
              test="@xsi:type">(obsElement0108): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
</pattern>
