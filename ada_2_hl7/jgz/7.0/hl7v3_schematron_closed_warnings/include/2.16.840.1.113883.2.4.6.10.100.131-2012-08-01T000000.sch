<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.131
Name: R_PatientNL_JGZ [universal]
Description: COCT_RM050000NL02: Patiëntkenmerken
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000">
   <title>R_PatientNL_JGZ [universal]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]"
         id="d41e40173-false-d1475389e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('PAT') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.3']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.3']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:statusCode[@code = 'active' or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:statusCode[@code = 'active' or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:confidentialityCode) = 0">(R_PatientNL-JGZ-universal): element hl7:confidentialityCode MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:patientPerson[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:patientPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:patientPerson[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:patientPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']"
         id="d41e40558-false-d1475579e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.131')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.131' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']"
         id="d41e40569-false-d1475598e0">
      <extends rule="II.NL.BSN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.3')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr"
         id="d1475611e6-false-d1475621e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(AdresJeugdige): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:streetName) &lt;= 1">(AdresJeugdige): element hl7:streetName komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:houseNumber) &lt;= 1">(AdresJeugdige): element hl7:houseNumber komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:buildingNumberSuffix) &lt;= 1">(AdresJeugdige): element hl7:buildingNumberSuffix komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:additionalLocator) &lt;= 1">(AdresJeugdige): element hl7:additionalLocator komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:postalCode) &gt;= 1">(AdresJeugdige): element hl7:postalCode is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:postalCode) &lt;= 1">(AdresJeugdige): element hl7:postalCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:county) &lt;= 1">(AdresJeugdige): element hl7:county komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:city) &lt;= 1">(AdresJeugdige): element hl7:city komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:country) &lt;= 1">(AdresJeugdige): element hl7:country komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:desc) &lt;= 1">(AdresJeugdige): element hl7:desc komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="count(hl7:useablePeriod) &lt;= 1">(AdresJeugdige): element hl7:useablePeriod komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:streetName
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:streetName"
         id="d1475611e49-false-d1475742e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:houseNumber
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:houseNumber"
         id="d1475611e55-false-d1475755e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:buildingNumberSuffix
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:buildingNumberSuffix"
         id="d1475611e62-false-d1475768e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:additionalLocator
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:additionalLocator"
         id="d1475611e109-false-d1475781e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="text()='to' or text()='by'">(AdresJeugdige): de elementinhoud van hl7:additionalLocator MOET ''to' of 'by'' zijn. Gevonden: "<value-of select="."/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:postalCode
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:postalCode"
         id="d1475611e119-false-d1475802e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="string-length(text())=7">(AdresJeugdige): 
                        <name path=".."/>/<name/> MOET formaat 'nnnn AA' zijn (met spatie)</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:county
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:county"
         id="d1475611e132-false-d1475815e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.6.14'">(AdresJeugdige): 
                        <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP-tabel 33</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:city
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:city"
         id="d1475611e145-false-d1475828e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:country
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:country"
         id="d1475611e151-false-d1475841e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.4.16.34'">(AdresJeugdige): 
                        <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP tabel 34 Landen</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:desc
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:desc"
         id="d1475611e165-false-d1475854e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10251
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:useablePeriod
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:useablePeriod"
         id="d1475861e6-false-d1475869e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeGeldigheidAdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidAdresJeugdige): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidAdresJeugdige): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidAdresJeugdige): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidAdresJeugdige): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidAdresJeugdige): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidAdresJeugdige): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10251
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:useablePeriod/hl7:low
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:useablePeriod/hl7:low"
         id="d1475861e43-false-d1475934e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidAdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidAdresJeugdige): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidAdresJeugdige): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10251
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:useablePeriod/hl7:high
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:useablePeriod/hl7:high"
         id="d1475861e62-false-d1475957e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidAdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidAdresJeugdige): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidAdresJeugdige): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10251
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:useablePeriod/hl7:width
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10251
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:useablePeriod/hl7:center
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:telecom
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:telecom"
         id="d41e40588-false-d1475998e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-JGZ-universal): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:statusCode[@code = 'active' or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:statusCode[@code = 'active' or @nullFlavor]"
         id="d41e40612-false-d1476017e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or (@code='active')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code 'active''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:confidentialityCode
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:confidentialityCode"
         id="d41e40624-false-d1476037e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]"
         id="d41e40632-false-d1476074e0">
      <let name="elmcount" value="count(hl7:name[@use='OR'] | hl7:name[@use='L'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:name[@use='OR']  of  hl7:name[@use='L']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(R_PatientNL-JGZ-universal): keuze (hl7:name[@use='OR']  of  hl7:name[@use='L']) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:birthTime) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthTime is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:birthTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:deceasedInd) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:deceasedInd komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:deceasedTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:deceasedTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:multipleBirthInd) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:multipleBirthInd komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:multipleBirthOrderNumber) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:multipleBirthOrderNumber komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:asEmployee) = 0">(R_PatientNL-JGZ-universal): element hl7:asEmployee MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:asOtherIds) = 0">(R_PatientNL-JGZ-universal): element hl7:asOtherIds MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:careGiver) = 0">(R_PatientNL-JGZ-universal): element hl7:careGiver MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:birthPlace) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthPlace komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:guarantorRole) = 0">(R_PatientNL-JGZ-universal): element hl7:guarantorRole MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10232
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']"
         id="d1476254e9-false-d1476260e0">
      <extends rule="PN.NL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(NaamKindOfficieel): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="string(@use) = ('OR')">(NaamKindOfficieel): de waarde van use MOET 'OR' zijn. Gevonden: "<value-of select="@use"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="count(hl7:given) &lt;= 1">(NaamKindOfficieel): element hl7:given komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="count(hl7:prefix) &lt;= 1">(NaamKindOfficieel): element hl7:prefix komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="count(hl7:family[not(@nullFlavor)]) &gt;= 1">(NaamKindOfficieel): element hl7:family[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="count(hl7:family[not(@nullFlavor)]) &lt;= 1">(NaamKindOfficieel): element hl7:family[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10232
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']/hl7:given
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']/hl7:given"
         id="d1476254e52-false-d1476312e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindOfficieel): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="string(@qualifier) = ('BR') or not(@qualifier)">(NaamKindOfficieel): de waarde van qualifier MOET 'BR' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10232
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']/hl7:prefix
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']/hl7:prefix"
         id="d1476254e61-false-d1476331e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindOfficieel): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="@qualifier">(NaamKindOfficieel): attribute @qualifier MOET aanwezig zijn.</assert>
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@qualifier),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="not(@qualifier) or empty($theAttValue[not(. = (('VV','BR')))])">(NaamKindOfficieel): de waarde van qualifier MOET 'code VV of code BR' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10232
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']/hl7:family[not(@nullFlavor)]
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']/hl7:family[not(@nullFlavor)]"
         id="d1476254e74-false-d1476364e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindOfficieel): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="string(@qualifier) = ('BR')">(NaamKindOfficieel): de waarde van qualifier MOET 'BR' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10233
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']"
         id="d1476377e9-false-d1476383e0">
      <extends rule="PN.NL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="string(@use) = ('L')">(NaamKindZoalsBekendBijInstelling): de waarde van use MOET 'L' zijn. Gevonden: "<value-of select="@use"/>"</assert>
      <let name="elmcount"
           value="count(hl7:given | hl7:prefix | hl7:family | hl7:delimiter | hl7:suffix)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(NaamKindZoalsBekendBijInstelling): keuze (hl7:given  of  hl7:prefix  of  hl7:family  of  hl7:delimiter  of  hl7:suffix) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="count(hl7:given) &lt;= 2">(NaamKindZoalsBekendBijInstelling): element hl7:given komt te vaak voor [max 2x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="count(hl7:prefix) &lt;= 1">(NaamKindZoalsBekendBijInstelling): element hl7:prefix komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="count(hl7:family) &lt;= 1">(NaamKindZoalsBekendBijInstelling): element hl7:family komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="count(hl7:delimiter) &lt;= 1">(NaamKindZoalsBekendBijInstelling): element hl7:delimiter komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="count(hl7:suffix) &lt;= 1">(NaamKindZoalsBekendBijInstelling): element hl7:suffix komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10233
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:given
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:given"
         id="d1476377e30-false-d1476463e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="string(@qualifier) = ('CL') or not(@qualifier)">(NaamKindZoalsBekendBijInstelling): de waarde van qualifier MOET 'CL' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10233
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:prefix
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:prefix"
         id="d1476377e42-false-d1476482e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="@qualifier">(NaamKindZoalsBekendBijInstelling): attribute @qualifier MOET aanwezig zijn.</assert>
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@qualifier),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="not(@qualifier) or empty($theAttValue[not(. = (('VV','BR')))])">(NaamKindZoalsBekendBijInstelling): de waarde van qualifier MOET 'code VV of code BR' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10233
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:family
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:family"
         id="d1476377e59-false-d1476515e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="string(@qualifier) = ('BR') or not(@qualifier)">(NaamKindZoalsBekendBijInstelling): de waarde van qualifier MOET 'BR' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10233
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:delimiter
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:delimiter"
         id="d1476377e69-false-d1476534e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10233
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:suffix
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:suffix"
         id="d1476377e75-false-d1476547e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e40656-false-d1476562e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthTime
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthTime"
         id="d41e40667-false-d1476589e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:deceasedInd
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:deceasedInd"
         id="d41e40677-false-d1476612e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:deceasedTime
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:deceasedTime"
         id="d41e40685-false-d1476625e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:multipleBirthInd
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:multipleBirthInd"
         id="d41e40694-false-d1476642e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:multipleBirthOrderNumber
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:multipleBirthOrderNumber"
         id="d41e40705-false-d1476655e0">
      <extends rule="INT.POS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:INT" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(R_PatientNL-JGZ-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="preceding-sibling::hl7:multipleBirthInd/@value='true'">(R_PatientNL-JGZ-universal): 
                            <name/> kan alleen een waarde hebben bij meerlingen</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]"
         id="d41e40726-false-d1476684e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('PAT') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]"
         id="d41e40746-false-d1476738e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ')">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]"
         id="d41e40755-false-d1476792e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('PCPR') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PCPR' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@negationInd) or string(@negationInd)=('true','false')">(R_PatientNL-JGZ-universal): attribuut @negationInd MOET datatype 'bl' hebben  - '<value-of select="@negationInd"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')] komt te vaak voor [max 1x].</assert>
      <let name="elmcount"
           value="count(hl7:effectiveTime[@xsi:type='IVL_TS'] | hl7:effectiveTime[@xsi:type='IVL_TS'] | hl7:effectiveTime[@xsi:type='IVL_TS'] | hl7:effectiveTime[@xsi:type='SXPR_TS'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:effectiveTime[@xsi:type='IVL_TS']  of  hl7:effectiveTime[@xsi:type='IVL_TS']  of  hl7:effectiveTime[@xsi:type='IVL_TS']  of  hl7:effectiveTime[@xsi:type='SXPR_TS']) bevat te veel elementen [max 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:performer[not(@nullFlavor)][hl7:assignedProvider]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:performer[not(@nullFlavor)][hl7:assignedProvider] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:performer[not(@nullFlavor)][hl7:assignedProvider]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:performer[not(@nullFlavor)][hl7:assignedProvider] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]"
         id="d41e40775-false-d1476864e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.11.17449-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]]) or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.11.17449 ActMedicalServiceCode (2012-05-21T01:26:54) of 2.16.840.1.113883.2.4.3.11.60.100.11.2.72 W0072 Soort voorschoolse voorzieningen (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.11.17449-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008']) or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.11.17449 ActMedicalServiceCode (2012-05-21T01:26:54) of 2.16.840.1.113883.2.4.3.11.60.100.11.2.72 W0072 Soort voorschoolse voorzieningen (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@codeSystem">(R_PatientNL-JGZ-universal): attribute @codeSystem MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@codeSystem) or matches(@codeSystem,'^[0-2](\.(0|[1-9]\d*))*$')">(R_PatientNL-JGZ-universal): attribuut @codeSystem MOET datatype 'oid' hebben  - '<value-of select="@codeSystem"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10255
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']
Item: (PeriodeGeldigheidHuisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']"
         id="d1476899e6-false-d1476905e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="@xsi:type">(PeriodeGeldigheidHuisarts): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(PeriodeGeldigheidHuisarts): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidHuisarts): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidHuisarts): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidHuisarts): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidHuisarts): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidHuisarts): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidHuisarts): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10255
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low
Item: (PeriodeGeldigheidHuisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low"
         id="d1476899e45-false-d1476976e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidHuisarts): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidHuisarts): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidHuisarts): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10255
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high
Item: (PeriodeGeldigheidHuisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high"
         id="d1476899e64-false-d1476999e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidHuisarts): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidHuisarts): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidHuisarts): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10255
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:width
Item: (PeriodeGeldigheidHuisarts)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10255
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:center
Item: (PeriodeGeldigheidHuisarts)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10256
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']
Item: (PeriodeGeldigheidAndereOrganisatiesHulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']"
         id="d1477034e6-false-d1477040e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="@xsi:type">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10256
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low
Item: (PeriodeGeldigheidAndereOrganisatiesHulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low"
         id="d1477034e45-false-d1477111e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10256
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high
Item: (PeriodeGeldigheidAndereOrganisatiesHulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high"
         id="d1477034e64-false-d1477134e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10256
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:width
Item: (PeriodeGeldigheidAndereOrganisatiesHulpverleners)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10256
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:center
Item: (PeriodeGeldigheidAndereOrganisatiesHulpverleners)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10259
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']
Item: (PeriodeGeldigheidVSVofBSV)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']"
         id="d1477169e6-false-d1477175e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10259-2012-08-01T000000.html"
              test="@xsi:type">(PeriodeGeldigheidVSVofBSV): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10259-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(PeriodeGeldigheidVSVofBSV): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10259-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidVSVofBSV): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10259-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidVSVofBSV): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10259-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidVSVofBSV): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10259-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidVSVofBSV): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10259-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidVSVofBSV): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10259-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidVSVofBSV): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10259
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low
Item: (PeriodeGeldigheidVSVofBSV)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low"
         id="d1477169e45-false-d1477246e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10259-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidVSVofBSV): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10259-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidVSVofBSV): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10259-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidVSVofBSV): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10259
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high
Item: (PeriodeGeldigheidVSVofBSV)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high"
         id="d1477169e64-false-d1477269e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10259-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidVSVofBSV): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10259-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidVSVofBSV): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10259-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidVSVofBSV): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10259
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:width
Item: (PeriodeGeldigheidVSVofBSV)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10259
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:center
Item: (PeriodeGeldigheidVSVofBSV)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']"
         id="d1477304e6-false-d1477310e0">
      <extends rule="SXPR_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="@xsi:type">(PeriodeGeldigheidVSVofBSVMetDagdelen): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(PeriodeGeldigheidVSVofBSVMetDagdelen): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]) &gt;= 1">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]) &lt;= 1">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]) &gt;= 1">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]) &lt;= 1">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]"
         id="d1477304e42-false-d1477353e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="@xsi:type">(PeriodeGeldigheidVSVofBSVMetDagdelen): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(PeriodeGeldigheidVSVofBSVMetDagdelen): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]/hl7:low
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]/hl7:low"
         id="d1477304e48-false-d1477396e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidVSVofBSVMetDagdelen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidVSVofBSVMetDagdelen): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidVSVofBSVMetDagdelen): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]/hl7:high
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]/hl7:high"
         id="d1477304e67-false-d1477419e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidVSVofBSVMetDagdelen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidVSVofBSVMetDagdelen): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidVSVofBSVMetDagdelen): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]/hl7:width
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]/hl7:center
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]"
         id="d1477304e94-false-d1477458e0">
      <extends rule="PIVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="@xsi:type">(PeriodeGeldigheidVSVofBSVMetDagdelen): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(PeriodeGeldigheidVSVofBSVMetDagdelen): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:phase[not(@nullFlavor)]) &gt;= 1">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:phase[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:phase[not(@nullFlavor)]) &lt;= 1">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:phase[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:period[not(@nullFlavor)]) &gt;= 1">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:period[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:period[not(@nullFlavor)]) &lt;= 1">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:period[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:phase[not(@nullFlavor)]
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:phase[not(@nullFlavor)]"
         id="d1477304e103-false-d1477507e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeGeldigheidVSVofBSVMetDagdelen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:width[not(@nullFlavor)]) &gt;= 1">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:width[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:width[not(@nullFlavor)]) &lt;= 1">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:width[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:low) = 0">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:low MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:high) = 0">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:high MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidVSVofBSVMetDagdelen): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:phase[not(@nullFlavor)]/hl7:width[not(@nullFlavor)]
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:phase[not(@nullFlavor)]/hl7:width[not(@nullFlavor)]"
         id="d1477304e110-false-d1477559e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')">(PeriodeGeldigheidVSVofBSVMetDagdelen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PQ" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="(@nullFlavor or (@unit='h'))">(PeriodeGeldigheidVSVofBSVMetDagdelen): value MOET eenheid 'h' gebruiken </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(PeriodeGeldigheidVSVofBSVMetDagdelen): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(PeriodeGeldigheidVSVofBSVMetDagdelen): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:phase[not(@nullFlavor)]/hl7:low
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:phase[not(@nullFlavor)]/hl7:high
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:phase[not(@nullFlavor)]/hl7:center
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:period[not(@nullFlavor)]
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:period[not(@nullFlavor)]"
         id="d1477304e126-false-d1477619e0">
      <extends rule="PQ"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PQ')">(PeriodeGeldigheidVSVofBSVMetDagdelen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PQ" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="(@nullFlavor or (@unit='wk'))">(PeriodeGeldigheidVSVofBSVMetDagdelen): value MOET eenheid 'wk' gebruiken </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^[-+]?\d*\.?[0-9]+([eE][-+]?\d+)?$')">(PeriodeGeldigheidVSVofBSVMetDagdelen): @value is geen geldig PQ getal <value-of select="@value"/>
      </assert>
      <let name="theUnit" value="@unit"/>
      <let name="UCUMtest"
           value="doc('include/voc-UCUM.xml')/*/ucum[@unit=$theUnit]/@message"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="$UCUMtest='OK' or string-length($UCUMtest)=0">(PeriodeGeldigheidVSVofBSVMetDagdelen): value/@unit (PQ) MOET een geldige UCUM-eenheid zijn (<value-of select="$UCUMtest"/>).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10267-2012-08-01T000000.html"
              test="string(@value) = ('1')">(PeriodeGeldigheidVSVofBSVMetDagdelen): de waarde van value MOET '1' zijn. Gevonden: "<value-of select="@value"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]"
         id="d41e40811-false-d1477662e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@typeCode) = ('PRF') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'PRF' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(parent::hl7:*/@negationInd='true') or (@xsi:nil='true' and @nullFlavor='NA')">(R_PatientNL-JGZ-universal): 
                                        <name/> MOET @xsi:nil='true' en @nullFlavor='NA' bevatten als <name path=".."/>/@negationInd='true'.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:assignedProvider[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:assignedProvider[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:assignedProvider[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:assignedProvider[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]"
         id="d41e40864-false-d1477700e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('ASSIGNED') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ASSIGNED' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.1'] | hl7:id[@root = '2.16.528.1.1007.5.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = ('NI', 'UNK', 'NA')])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:id[@root = '2.16.528.1.1007.3.1']  of  hl7:id[@root = '2.16.528.1.1007.5.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = ('NI', 'UNK', 'NA')]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="$elmcount &lt;= 3">(R_PatientNL-JGZ-universal): keuze (hl7:id[@root = '2.16.528.1.1007.3.1']  of  hl7:id[@root = '2.16.528.1.1007.5.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = ('NI', 'UNK', 'NA')]) bevat te veel elementen [max 3x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.3.1']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.528.1.1007.3.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.5.1']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.528.1.1007.5.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.1']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = ('NI', 'UNK', 'NA')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@nullFlavor = ('NI', 'UNK', 'NA')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:effectiveTime) = 0">(R_PatientNL-JGZ-universal): element hl7:effectiveTime MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:id[@root = '2.16.528.1.1007.3.1']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:id[@root = '2.16.528.1.1007.3.1']"
         id="d41e40875-false-d1477792e0">
      <extends rule="II.NL.UZI"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@root) = ('2.16.528.1.1007.3.1')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.528.1.1007.3.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:id[@root = '2.16.528.1.1007.5.1']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:id[@root = '2.16.528.1.1007.5.1']"
         id="d41e40883-false-d1477811e0">
      <extends rule="II.NL.BIG"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@root) = ('2.16.528.1.1007.5.1')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.528.1.1007.5.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']"
         id="d41e40891-false-d1477830e0">
      <extends rule="II.NL.AGB"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.1')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:id[@nullFlavor = ('NI', 'UNK', 'NA')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:id[@nullFlavor = ('NI', 'UNK', 'NA')]"
         id="d41e40899-false-d1477849e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor">(R_PatientNL-JGZ-universal): attribute @nullFlavor MOET aanwezig zijn.</assert>
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@nullFlavor),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@nullFlavor) or empty($theAttValue[not(. = (('NI','UNK','NA')))])">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'code NI of code UNK of code NA' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:effectiveTime
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']"
         id="d41e40926-false-d1477900e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('ORG')">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = ('NI', 'UNK')])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(R_PatientNL-JGZ-universal): keuze (hl7:id[@root = '2.16.528.1.1007.3.3']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = ('NI', 'UNK')]) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.3.3']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.528.1.1007.3.3'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.1']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = ('NI', 'UNK')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@nullFlavor = ('NI', 'UNK')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[@codeSystem = '2.16.840.1.113883.2.4.15.1060' or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@codeSystem = '2.16.840.1.113883.2.4.15.1060' or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:name) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactParty[@classCode = 'CON'][hl7:contactPerson] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.528.1.1007.3.3']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.528.1.1007.3.3']"
         id="d41e40942-false-d1477993e0">
      <extends rule="II.NL.URA"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@root) = ('2.16.528.1.1007.3.3')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.528.1.1007.3.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']"
         id="d41e40950-false-d1478012e0">
      <extends rule="II.NL.AGB"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.1')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@nullFlavor = ('NI', 'UNK')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@nullFlavor = ('NI', 'UNK')]"
         id="d41e40958-false-d1478031e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor">(R_PatientNL-JGZ-universal): attribute @nullFlavor MOET aanwezig zijn.</assert>
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@nullFlavor),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@nullFlavor) or empty($theAttValue[not(. = (('NI','UNK')))])">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'code NI of code UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:code[@codeSystem = '2.16.840.1.113883.2.4.15.1060' or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:code[@codeSystem = '2.16.840.1.113883.2.4.15.1060' or @nullFlavor]"
         id="d41e40975-false-d1478064e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or (@codeSystem='2.16.840.1.113883.2.4.15.1060')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'codeSystem '2.16.840.1.113883.2.4.15.1060''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:name
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:name"
         id="d41e40985-false-d1478084e0">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]"
         id="d41e40993-false-d1478101e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('CON')">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'CON' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <let name="elmcount" value="count(hl7:effectiveTime | hl7:effectiveTime)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:effectiveTime  of  hl7:effectiveTime) bevat te veel elementen [max 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']"
         id="d41e41002-false-d1478161e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d41e41009-false-d1478195e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:telecom
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:telecom"
         id="d41e41019-false-d1478208e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-JGZ-universal): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10257
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime
Item: (PeriodeGeldigheidContactpersoonOrganisatieHulpverl)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime"
         id="d1478221e6-false-d1478229e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10257
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:low
Item: (PeriodeGeldigheidContactpersoonOrganisatieHulpverl)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:low"
         id="d1478221e45-false-d1478294e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10257
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:high
Item: (PeriodeGeldigheidContactpersoonOrganisatieHulpverl)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:high"
         id="d1478221e64-false-d1478317e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10257
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:width
Item: (PeriodeGeldigheidContactpersoonOrganisatieHulpverl)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10257
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:center
Item: (PeriodeGeldigheidContactpersoonOrganisatieHulpverl)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10260
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime
Item: (PeriodeGeldigheidContactpersoonVoorOfBuitenschools)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime"
         id="d1478352e6-false-d1478360e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10260-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeGeldigheidContactpersoonVoorOfBuitenschools): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10260-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidContactpersoonVoorOfBuitenschools): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10260-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidContactpersoonVoorOfBuitenschools): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10260-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidContactpersoonVoorOfBuitenschools): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10260-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidContactpersoonVoorOfBuitenschools): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10260-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidContactpersoonVoorOfBuitenschools): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10260-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidContactpersoonVoorOfBuitenschools): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10260
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:low
Item: (PeriodeGeldigheidContactpersoonVoorOfBuitenschools)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:low"
         id="d1478352e45-false-d1478425e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10260-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidContactpersoonVoorOfBuitenschools): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10260-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidContactpersoonVoorOfBuitenschools): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10260-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidContactpersoonVoorOfBuitenschools): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10260
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:high
Item: (PeriodeGeldigheidContactpersoonVoorOfBuitenschools)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:high"
         id="d1478352e64-false-d1478448e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10260-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidContactpersoonVoorOfBuitenschools): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10260-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidContactpersoonVoorOfBuitenschools): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10260-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidContactpersoonVoorOfBuitenschools): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10260
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:width
Item: (PeriodeGeldigheidContactpersoonVoorOfBuitenschools)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10260
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:center
Item: (PeriodeGeldigheidContactpersoonVoorOfBuitenschools)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]"
         id="d41e41038-false-d1478489e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[hl7:subjectOf[@typeCode = 'SBJ']]/hl7:subjectOf[not(@nullFlavor)][@typeCode = 'SBJ'][hl7:careProvision]/hl7:careProvision[hl7:code[@nullFlavor or @codeSystem=('2.16.840.1.113883.5.4','2.16.840.1.113883.2.4.4.40.2')]]/hl7:performer[not(@nullFlavor)][hl7:assignedProvider]/hl7:assignedProvider[not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]"
         id="d41e41049-false-d1478525e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asEmployee
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]"
         id="d41e41069-false-d1478547e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('CIT') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'CIT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.20371-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.11.20371-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.20371-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.11.20371-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.20371-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.11.20371-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.20371-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.11.20371-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e41091-false-d1478590e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.11.20371-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.11.20371 CitizenRoleType (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.11.20371-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.11.20371 CitizenRoleType (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]"
         id="d41e41106-false-d1478617e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('NAT') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'NAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:name) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]/hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]/hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']"
         id="d41e41117-false-d1478658e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.29-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.29 W0029 Nationaliteit (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.29-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.29 W0029 Nationaliteit (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]/hl7:name
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]/hl7:name"
         id="d41e41128-false-d1478685e0">
      <extends rule="TN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TN')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]"
         id="d41e41139-false-d1478702e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('STD') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'STD' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = 'UNC']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@nullFlavor = 'UNC'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = 'UNC']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@nullFlavor = 'UNC'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code) = 0">(R_PatientNL-JGZ-universal): element hl7:code MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:addr) = 0">(R_PatientNL-JGZ-universal): element hl7:addr MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:telecom) = 0">(R_PatientNL-JGZ-universal): element hl7:telecom MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:statusCode) = 0">(R_PatientNL-JGZ-universal): element hl7:statusCode MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:quantity) = 0">(R_PatientNL-JGZ-universal): element hl7:quantity MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:id[@nullFlavor = 'UNC']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:id[@nullFlavor = 'UNC']"
         id="d41e41198-false-d1478804e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNC')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'UNC' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:code
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:addr
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:telecom
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:statusCode
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10261
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:effectiveTime
Item: (PeriodeGeldigheidSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:effectiveTime"
         id="d1478853e6-false-d1478861e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeGeldigheidSchool): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidSchool): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidSchool): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidSchool): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidSchool): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidSchool): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidSchool): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10261
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:effectiveTime/hl7:low
Item: (PeriodeGeldigheidSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:effectiveTime/hl7:low"
         id="d1478853e43-false-d1478926e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidSchool): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidSchool): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidSchool): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10261
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:effectiveTime/hl7:high
Item: (PeriodeGeldigheidSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:effectiveTime/hl7:high"
         id="d1478853e62-false-d1478949e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidSchool): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidSchool): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidSchool): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10261
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:effectiveTime/hl7:width
Item: (PeriodeGeldigheidSchool)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10261
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:effectiveTime/hl7:center
Item: (PeriodeGeldigheidSchool)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:quantity
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]"
         id="d41e41234-false-d1479001e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.15']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.15'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.15']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.15'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.3']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.3'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.3']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.3'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:name) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactParty[not(@nullFlavor)][hl7:contactPerson] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactParty[not(@nullFlavor)][hl7:contactPerson] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:organizationContains[hl7:partOrganization]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:organizationContains[hl7:partOrganization] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.15']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.15']"
         id="d41e41245-false-d1479085e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.15')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.15' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.3']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.3']"
         id="d41e41256-false-d1479102e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.81 W0081 Soort onderwijs (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.81 W0081 Soort onderwijs (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:name
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:name"
         id="d41e41266-false-d1479129e0">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]"
         id="d41e41274-false-d1479144e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('ECON') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ECON' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']"
         id="d41e41283-false-d1479202e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d41e41290-false-d1479236e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:telecom
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:telecom"
         id="d41e41300-false-d1479249e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-JGZ-universal): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10262
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:effectiveTime
Item: (PeriodeGeldigheidContactpersoonSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:effectiveTime"
         id="d1479262e6-false-d1479270e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeGeldigheidContactpersoonSchool): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidContactpersoonSchool): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidContactpersoonSchool): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidContactpersoonSchool): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidContactpersoonSchool): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidContactpersoonSchool): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidContactpersoonSchool): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10262
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:effectiveTime/hl7:low
Item: (PeriodeGeldigheidContactpersoonSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:effectiveTime/hl7:low"
         id="d1479262e45-false-d1479335e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidContactpersoonSchool): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidContactpersoonSchool): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidContactpersoonSchool): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10262
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:effectiveTime/hl7:high
Item: (PeriodeGeldigheidContactpersoonSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:effectiveTime/hl7:high"
         id="d1479262e64-false-d1479358e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidContactpersoonSchool): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidContactpersoonSchool): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidContactpersoonSchool): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10262
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:effectiveTime/hl7:width
Item: (PeriodeGeldigheidContactpersoonSchool)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10262
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:effectiveTime/hl7:center
Item: (PeriodeGeldigheidContactpersoonSchool)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]"
         id="d41e41314-false-d1479399e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[not(@nullFlavor)][hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]"
         id="d41e41325-false-d1479435e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]"
         id="d41e41336-false-d1479448e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('PART') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PART' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:partOrganization[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:partOrganization[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:partOrganization[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:partOrganization[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]"
         id="d41e41345-false-d1479478e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@nullFlavor = 'NI'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:id[@nullFlavor = 'NI']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:id[@nullFlavor = 'NI']"
         id="d41e41356-false-d1479538e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('NI')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:code[@nullFlavor = 'OTH']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:code[@nullFlavor = 'OTH']"
         id="d41e41367-false-d1479557e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d41e41374-false-d1479591e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]"
         id="d41e41383-false-d1479604e0">
      <extends rule="TN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TN')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]"
         id="d41e41395-false-d1479619e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('MBR') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'MBR' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id) = 0">(R_PatientNL-JGZ-universal): element hl7:id MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code) = 0">(R_PatientNL-JGZ-universal): element hl7:code MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:statusCode) = 0">(R_PatientNL-JGZ-universal): element hl7:statusCode MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:effectiveTime) = 0">(R_PatientNL-JGZ-universal): element hl7:effectiveTime MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:subjectOf) = 0">(R_PatientNL-JGZ-universal): element hl7:subjectOf MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:id
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:code
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:statusCode
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:effectiveTime
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:subjectOf
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]"
         id="d41e41446-false-d1479738e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:desc) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:desc komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:member) = 0">(R_PatientNL-JGZ-universal): element hl7:member MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:id[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:id[not(@nullFlavor)]"
         id="d41e41457-false-d1479808e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d41e41466-false-d1479823e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.94 W0094 Woonsituatie (HL7) (2012-05-21T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:desc
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:desc"
         id="d41e41476-false-d1479845e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:member
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asOtherIds
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]"
         id="d41e41499-false-d1479878e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('CON') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'CON' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']"
         id="d41e41533-false-d1479936e0">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d41e41540-false-d1479970e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:telecom
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:telecom"
         id="d41e41550-false-d1479983e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-JGZ-universal): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10252
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime
Item: (PeriodeGeldigheidContactpersoon)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime"
         id="d1479996e6-false-d1480004e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeGeldigheidContactpersoon): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidContactpersoon): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidContactpersoon): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidContactpersoon): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidContactpersoon): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidContactpersoon): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidContactpersoon): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10252
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:low
Item: (PeriodeGeldigheidContactpersoon)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:low"
         id="d1479996e43-false-d1480069e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidContactpersoon): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidContactpersoon): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidContactpersoon): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10252
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:high
Item: (PeriodeGeldigheidContactpersoon)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:high"
         id="d1479996e62-false-d1480092e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidContactpersoon): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidContactpersoon): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidContactpersoon): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10252
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:width
Item: (PeriodeGeldigheidContactpersoon)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10252
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:center
Item: (PeriodeGeldigheidContactpersoon)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]"
         id="d41e41564-false-d1480133e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]"
         id="d41e41571-false-d1480157e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]"
         id="d41e41581-false-d1480170e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('GUARD') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'GUARD' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id) = 0">(R_PatientNL-JGZ-universal): element hl7:id MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:addr) = 0">(R_PatientNL-JGZ-universal): element hl7:addr MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:telecom) = 0">(R_PatientNL-JGZ-universal): element hl7:telecom MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:statusCode) = 0">(R_PatientNL-JGZ-universal): element hl7:statusCode MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:effectiveTime) = 0">(R_PatientNL-JGZ-universal): element hl7:effectiveTime MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:guardianPerson) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:guardianPerson is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:guardianPerson) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:guardianPerson komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:guardianOrganization) = 0">(R_PatientNL-JGZ-universal): element hl7:guardianOrganization MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:id
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]"
         id="d41e41605-false-d1480270e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.31 W0031 Indicatie gezag minderjarige (HL7) (2012-05-21T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:addr
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:telecom
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:statusCode
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:effectiveTime
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:guardianPerson
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:guardianPerson"
         id="d41e41644-false-d1480328e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('NI') or not(@nullFlavor)">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@xsi:nil) = ('true')">(R_PatientNL-JGZ-universal): de waarde van xsi:nil MOET 'true' zijn. Gevonden: "<value-of select="@xsi:nil"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:guardianOrganization
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]"
         id="d41e41666-false-d1480360e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('PRS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PRS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:relationshipHolder1[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:relationshipHolder1[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:relationshipHolder1[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:relationshipHolder1[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:relationshipHolder2) = 0">(R_PatientNL-JGZ-universal): element hl7:relationshipHolder2 MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']"
         id="d41e41915-false-d1480425e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]]) or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]]) or exists(doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.96 W0096 Relatie tot jeugdige ouder/verzorger (HL7) (2012-05-21T01:26:54) of 2.16.840.1.113883.2.4.3.11.60.100.11.2.108 W0108 Relatie tot jeugdige broer/zus (HL7) (2012-05-21T01:26:54) of 2.16.840.1.113883.11.16360 Child (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008']) or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.96 W0096 Relatie tot jeugdige ouder/verzorger (HL7) (2012-05-21T01:26:54) of 2.16.840.1.113883.2.4.3.11.60.100.11.2.108 W0108 Relatie tot jeugdige broer/zus (HL7) (2012-05-21T01:26:54) of 2.16.840.1.113883.11.16360 Child (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr"
         id="d1480454e6-false-d1480462e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(AdresOuderVerzorger): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:streetName) &lt;= 1">(AdresOuderVerzorger): element hl7:streetName komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:houseNumber) &lt;= 1">(AdresOuderVerzorger): element hl7:houseNumber komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:buildingNumberSuffix) &lt;= 1">(AdresOuderVerzorger): element hl7:buildingNumberSuffix komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:additionalLocator) &lt;= 1">(AdresOuderVerzorger): element hl7:additionalLocator komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:postalCode) &lt;= 1">(AdresOuderVerzorger): element hl7:postalCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:county) &lt;= 1">(AdresOuderVerzorger): element hl7:county komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:city) &lt;= 1">(AdresOuderVerzorger): element hl7:city komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:country) &lt;= 1">(AdresOuderVerzorger): element hl7:country komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:desc) &lt;= 1">(AdresOuderVerzorger): element hl7:desc komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:streetName
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:streetName"
         id="d1480454e49-false-d1480562e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:houseNumber
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:houseNumber"
         id="d1480454e55-false-d1480575e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:buildingNumberSuffix
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:buildingNumberSuffix"
         id="d1480454e62-false-d1480588e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:additionalLocator
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:additionalLocator"
         id="d1480454e109-false-d1480601e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="text()=('to','by')">(AdresOuderVerzorger): 
                        <name path=".."/>/<name/> MOET 'to' of 'by' zijn</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:postalCode
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:postalCode"
         id="d1480454e122-false-d1480614e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="string-length(text())=7">(AdresOuderVerzorger): 
                        <name path=".."/>/<name/> MOET formaat 'nnnn AA' zijn (met spatie)</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:county
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:county"
         id="d1480454e135-false-d1480627e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.6.14'">(AdresOuderVerzorger): 
                        <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP-tabel 33</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:city
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:city"
         id="d1480454e148-false-d1480640e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:country
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:country"
         id="d1480454e154-false-d1480653e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.4.16.34'">(AdresOuderVerzorger): 
                        <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP tabel 34 Landen</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:desc
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:addr/hl7:desc"
         id="d1480454e168-false-d1480666e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:telecom
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:telecom"
         id="d41e41973-false-d1480679e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-JGZ-universal): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]"
         id="d41e41992-false-d1480698e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.3']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:name) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:name is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:name) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:birthTime) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthTime is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:birthTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:deceasedInd) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:deceasedInd komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:deceasedTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:deceasedTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:educationLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:educationLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:religiousAffiliationCode[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:religiousAffiliationCode[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:birthPlace) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthPlace komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']"
         id="d41e42062-false-d1480835e0">
      <extends rule="II.NL.BSN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.3')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name"
         id="d41e42080-false-d1480854e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@use">(R_PatientNL-JGZ-universal): attribute @use MOET aanwezig zijn.</assert>
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@use),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@use) or empty($theAttValue[not(. = (('L','OR')))])">(R_PatientNL-JGZ-universal): de waarde van use MOET 'code L of code OR' zijn. Gevonden: "<value-of select="@use"/>"</assert>
      <let name="elmcount"
           value="count(hl7:given | hl7:prefix | hl7:family | hl7:delimiter | hl7:suffix)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:given  of  hl7:prefix  of  hl7:family  of  hl7:delimiter  of  hl7:suffix) bevat te weinig elementen [min 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:given
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:given"
         id="d41e42120-false-d1480908e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:prefix
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:prefix"
         id="d41e42141-false-d1480921e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@qualifier">(R_PatientNL-JGZ-universal): 
                                            <name path=".."/>/<name/>/@qualifier ontbreekt. Deze prefix zal als titel worden geïnterpreteerd.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:family
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:family"
         id="d41e42165-false-d1480934e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:delimiter
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:delimiter"
         id="d41e42173-false-d1480947e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:suffix
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:suffix"
         id="d41e42179-false-d1480960e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e42189-false-d1480975e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthTime
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthTime"
         id="d41e42200-false-d1481002e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:deceasedInd
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:deceasedInd"
         id="d41e42210-false-d1481025e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:deceasedTime
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:deceasedTime"
         id="d41e42218-false-d1481038e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:educationLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:educationLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e42227-false-d1481057e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.658 W0658 Opleiding ouder/verzorger (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.658 W0658 Opleiding ouder/verzorger (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:religiousAffiliationCode[@nullFlavor = 'OTH']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:religiousAffiliationCode[@nullFlavor = 'OTH']"
         id="d41e42242-false-d1481084e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:religiousAffiliationCode[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:religiousAffiliationCode[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d41e42259-false-d1481118e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]"
         id="d41e42268-false-d1481131e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('EMP')">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'EMP' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]"
         id="d41e42304-false-d1481174e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.104 W0104 Werk ouder/verzorger (HL7) (2012-05-21T01:26:54)'.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@nullFlavor) or @nullFlavor=('OTH')">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.104 W0104 Werk ouder/verzorger (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]/hl7:originalText[not(@nullFlavor)]"
         id="d41e42315-false-d1481217e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']"
         id="d41e42324-false-d1481230e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('ORG')">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('NI')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@xsi:nil) = ('true')">(R_PatientNL-JGZ-universal): de waarde van xsi:nil MOET 'true' zijn. Gevonden: "<value-of select="@xsi:nil"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]"
         id="d41e42350-false-d1481263e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('MBR') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'MBR' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id) = 0">(R_PatientNL-JGZ-universal): element hl7:id MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code) = 0">(R_PatientNL-JGZ-universal): element hl7:code MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:statusCode) = 0">(R_PatientNL-JGZ-universal): element hl7:statusCode MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:effectiveTime) = 0">(R_PatientNL-JGZ-universal): element hl7:effectiveTime MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:subjectOf) = 0">(R_PatientNL-JGZ-universal): element hl7:subjectOf MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:group[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:group[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:group[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:group[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:id
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:code
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:statusCode
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:effectiveTime
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:subjectOf
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]"
         id="d41e42401-false-d1481378e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:desc) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:desc komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:member) = 0">(R_PatientNL-JGZ-universal): element hl7:member MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]/hl7:id[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]/hl7:id[not(@nullFlavor)]"
         id="d41e42412-false-d1481442e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]"
         id="d41e42421-false-d1481457e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.94 W0094 Woonsituatie (HL7) (2012-05-21T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]/hl7:desc
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]/hl7:desc"
         id="d41e42429-false-d1481479e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]/hl7:member
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace"
         id="d41e42447-false-d1481501e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:addr) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:addr komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace/hl7:addr
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace/hl7:addr"
         id="d41e42466-false-d1481519e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:country[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:country[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:country[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:country[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace/hl7:addr/hl7:country[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace/hl7:addr/hl7:country[not(@nullFlavor)]"
         id="d41e42471-false-d1481547e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.4.16.34'">(R_PatientNL-JGZ-universal): 
                                            <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP tabel 34 Landen</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:languageCommunication[hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:languageCommunication[hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]"
         id="d41e42488-false-d1481562e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:languageCommunication[hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:languageCommunication[hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d41e42503-false-d1481590e0">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.50 W0050 Taal (HL7) (2013-10-02T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:relationshipHolder2
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]"
         id="d41e42523-false-d1481619e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]) bevat te veel elementen [max 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e42542-false-d1481648e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e42565-false-d1481699e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1322' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '1322' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d41e42575-false-d1481719e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e42584-false-d1481730e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e42607-false-d1481781e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1367' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '1367' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d41e42617-false-d1481801e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e42627-false-d1481812e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e42650-false-d1481863e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or (@code='78' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '78' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d41e42660-false-d1481883e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e42669-false-d1481894e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e42692-false-d1481945e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1374' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '1374' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d41e42702-false-d1481965e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e42711-false-d1481976e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e42733-false-d1482027e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or (@code='72' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '72' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d41e42743-false-d1482047e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e42753-false-d1482062e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e42775-false-d1482113e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or (@code='670' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '670' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.5.111']]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d41e42785-false-d1482133e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:careGiver
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace"
         id="d41e42802-false-d1482159e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:addr[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:addr[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:addr[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:addr[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]"
         id="d41e42824-false-d1482183e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="hl7:county or hl7:country">(R_PatientNL-JGZ-universal): Tenminste geboorteplaats of geboorteland is verplicht</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:county) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:county komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:country) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:country komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:county
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:county"
         id="d41e42834-false-d1482214e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.6.14'">(R_PatientNL-JGZ-universal): 
                                    <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP-tabel 33 Gemeenten</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:country
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:country"
         id="d41e42850-false-d1482227e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.4.16.34'">(R_PatientNL-JGZ-universal): 
                                    <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP tabel 34 Landen</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guarantorRole
Item: (R_PatientNL-JGZ-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]"
         id="d41e42872-false-d1482251e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:modeCode[(@code = 'LTRC' and @codeSystem = '2.16.840.1.113883.5.60') or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:modeCode[(@code = 'LTRC' and @codeSystem = '2.16.840.1.113883.5.60') or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:modeCode[(@code = 'LTRC' and @codeSystem = '2.16.840.1.113883.5.60') or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:modeCode[(@code = 'LTRC' and @codeSystem = '2.16.840.1.113883.5.60') or @nullFlavor]"
         id="d41e42894-false-d1482286e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or (@code='LTRC' and @codeSystem='2.16.840.1.113883.5.60')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code 'LTRC' codeSystem '2.16.840.1.113883.5.60''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d41e42904-false-d1482308e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.644 W0644 Laag- of niet geletterd (HL7) (2012-05-21T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40026
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement0026)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40026
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement0026)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0026): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0026): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0026): element hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0026): element hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(obsElement0026): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(obsElement0026): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40026
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0026)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0026): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="@nullFlavor or (@code='26' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0026): de elementwaarde MOET een zijn van 'code '26' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40026
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (obsElement0026)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0026): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(obsElement0026): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.14 W0014 Land (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(obsElement0026): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.14 W0014 Land (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40027
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement0027)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40027
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement0027)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0027): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0027): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0027): element hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0027): element hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(obsElement0027): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(obsElement0027): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40027
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0027)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0027): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="@nullFlavor or (@code='27' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0027): de elementwaarde MOET een zijn van 'code '27' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40027
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]
Item: (obsElement0027)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(obsElement0027): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="not(*)">(obsElement0027): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40029
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement0029)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40029
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement0029)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0029): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0029): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0029): element hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0029): element hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(obsElement0029): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(obsElement0029): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40029
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0029)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0029): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="@nullFlavor or (@code='29' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0029): de elementwaarde MOET een zijn van 'code '29' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40029
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]
Item: (obsElement0029)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(obsElement0029): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="not(*)">(obsElement0029): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40714
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement0714)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40714
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement0714)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0714): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0714): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0714): element hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0714): element hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(obsElement0714): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(obsElement0714): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40714
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0714)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0714): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="@nullFlavor or (@code='714' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0714): de elementwaarde MOET een zijn van 'code '714' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40714
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]
Item: (obsElement0714)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(obsElement0714): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41417
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement1417)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41417
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement1417)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement1417): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement1417): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement1417): element hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement1417): element hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(obsElement1417): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(obsElement1417): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41417
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement1417)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement1417): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1417' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement1417): de elementwaarde MOET een zijn van 'code '1417' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41417
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]
Item: (obsElement1417)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(obsElement1417): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41493
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement1493)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41493
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement1493)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement1493): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement1493): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement1493): element hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement1493): element hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(obsElement1493): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(obsElement1493): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41493
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement1493)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement1493): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1493' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement1493): de elementwaarde MOET een zijn van 'code '1493' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41493
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (obsElement1493)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement1493): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(obsElement1493): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.75 W0075 Reden geen psz/vve (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(obsElement1493): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.75 W0075 Reden geen psz/vve (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40716
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement0716)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40716
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement0716)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0716): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0716): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0716): element hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0716): element hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(obsElement0716): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(obsElement0716): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40716
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0716)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0716): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="@nullFlavor or (@code='716' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0716): de elementwaarde MOET een zijn van 'code '716' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40716
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (obsElement0716)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0716): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(obsElement0716): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.75 W0075 Reden geen psz/vve (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(obsElement0716): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.75 W0075 Reden geen psz/vve (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]"
         id="d41e42989-false-d1483237e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS')">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN')">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]"
         id="d41e43013-false-d1483307e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]"
         id="d41e43022-false-d1483341e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('DOC') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'DOC' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]/hl7:id[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]/hl7:id[not(@nullFlavor)]"
         id="d41e43046-false-d1483392e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]"
         id="d41e43064-false-d1483407e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.36 W0036 WID aard (HL7) (2012-05-21T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]/hl7:subjectOf[hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]/hl7:subjectOf[hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e43074-false-d1483429e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@typeCode) = ('SUBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SUBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]/hl7:subjectOf[hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]/hl7:subjectOf[hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e43106-false-d1483459e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@classCode) = ('VERIF') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'VERIF' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]/hl7:subjectOf[hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]/hl7:subjectOf[hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e43117-false-d1483519e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="@nullFlavor or (@code='700' and @codeSystem='2.16.840.1.113883.2.4.4.40.267') or (@code='1394' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '700' codeSystem '2.16.840.1.113883.2.4.4.40.267' of code '1394' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]/hl7:subjectOf[hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]/hl7:subjectOf[hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:effectiveTime"
         id="d41e43130-false-d1483541e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]/hl7:subjectOf[hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf2[hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]]/hl7:identityDocument[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.36-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]]/hl7:subjectOf[hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:verification[hl7:code[(@code = '700' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267') or (@code = '1394' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]"
         id="d41e43138-false-d1483558e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2012-08-01T000000.html"
              test="string(@typeCode) = ('COV') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'COV' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.132
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]
Item: (A_CoverageNL-minimal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.132
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]
Item: (A_CoverageNL-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@classCode) = ('COV') or not(@classCode)">(A_CoverageNL-minimal): de waarde van classCode MOET 'COV' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_CoverageNL-minimal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]) &gt;= 1">(A_CoverageNL-minimal): element hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]] is mandatory [min 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.132
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]
Item: (A_CoverageNL-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_CoverageNL-minimal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]) &gt;= 1">(A_CoverageNL-minimal): element hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]) &lt;= 1">(A_CoverageNL-minimal): element hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.132
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]
Item: (A_CoverageNL-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@classCode) = ('COV') or not(@classCode)">(A_CoverageNL-minimal): de waarde van classCode MOET 'COV' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_CoverageNL-minimal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(A_CoverageNL-minimal): element hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]) &lt;= 1">(A_CoverageNL-minimal): element hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.132
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]
Item: (A_CoverageNL-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(A_CoverageNL-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="@nullFlavor or (@code='HIP' and @codeSystem='2.16.840.1.113883.5.4')">(A_CoverageNL-minimal): de elementwaarde MOET een zijn van 'code 'HIP' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.132
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]
Item: (A_CoverageNL-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@typeCode) = ('COV') or not(@typeCode)">(A_CoverageNL-minimal): de waarde van typeCode MOET 'COV' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:coveredParty[hl7:id[@nullFlavor='NI']] | hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(A_CoverageNL-minimal): keuze (hl7:coveredParty[hl7:id[@nullFlavor='NI']]  of  hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(A_CoverageNL-minimal): keuze (hl7:coveredParty[hl7:id[@nullFlavor='NI']]  of  hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]) bevat te veel elementen [max 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.132
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='NI']]
Item: (A_CoverageNL-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='NI']]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@typeCode) = ('COVPTY') or not(@typeCode)">(A_CoverageNL-minimal): de waarde van typeCode MOET 'COVPTY' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &gt;= 1">(A_CoverageNL-minimal): element hl7:id[@nullFlavor = 'NI'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &lt;= 1">(A_CoverageNL-minimal): element hl7:id[@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.132
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='NI']]/hl7:id[@nullFlavor = 'NI']
Item: (A_CoverageNL-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='NI']]/hl7:id[@nullFlavor = 'NI']">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_CoverageNL-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('NI')">(A_CoverageNL-minimal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.132
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]
Item: (A_CoverageNL-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@typeCode) = ('COVPTY') or not(@typeCode)">(A_CoverageNL-minimal): de waarde van typeCode MOET 'COVPTY' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = 'UNC']) &gt;= 1">(A_CoverageNL-minimal): element hl7:id[@nullFlavor = 'UNC'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = 'UNC']) &lt;= 1">(A_CoverageNL-minimal): element hl7:id[@nullFlavor = 'UNC'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_CoverageNL-minimal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_CoverageNL-minimal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:underwritingOrganization[not(@nullFlavor)]) &gt;= 1">(A_CoverageNL-minimal): element hl7:underwritingOrganization[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:underwritingOrganization[not(@nullFlavor)]) &lt;= 1">(A_CoverageNL-minimal): element hl7:underwritingOrganization[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.132
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]/hl7:id[@nullFlavor = 'UNC']
Item: (A_CoverageNL-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]/hl7:id[@nullFlavor = 'UNC']">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_CoverageNL-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNC')">(A_CoverageNL-minimal): de waarde van nullFlavor MOET 'UNC' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="@extension">(A_CoverageNL-minimal): 
                                            <name path=".."/>/<name/>/@extension moet het polisnummer bevatten</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.132
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_CoverageNL-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_CoverageNL-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_CoverageNL-minimal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.18877 CoverageRoleTypeJGZ (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_CoverageNL-minimal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.18877 CoverageRoleTypeJGZ (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.132
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]/hl7:underwritingOrganization[not(@nullFlavor)]
Item: (A_CoverageNL-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]/hl7:underwritingOrganization[not(@nullFlavor)]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="hl7:id or hl7:name">(A_CoverageNL-minimal): 
                                            <name/> MOET tenminste een id of naam bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:id) &lt;= 1">(A_CoverageNL-minimal): element hl7:id komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:name) &lt;= 1">(A_CoverageNL-minimal): element hl7:name komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.132
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]/hl7:underwritingOrganization[not(@nullFlavor)]/hl7:id
Item: (A_CoverageNL-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]/hl7:underwritingOrganization[not(@nullFlavor)]/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_CoverageNL-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="@root='2.16.840.1.113883.2.4.6.4'">(A_CoverageNL-minimal): 
                                                <name path=".."/>/<name/> bevat geen UZOVI-nummer. Dat kan alleen voor niet-Nederlandse verzekeraars.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.132
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]/hl7:underwritingOrganization[not(@nullFlavor)]/hl7:name
Item: (A_CoverageNL-minimal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]/hl7:coverageRecord[hl7:component]/hl7:component[hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:coveredParty[hl7:coveredParty]/hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]/hl7:underwritingOrganization[not(@nullFlavor)]/hl7:name">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(A_CoverageNL-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
</pattern>
