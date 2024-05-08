<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.131
Name: R_PatientNL_JGZ [universal]
Description: COCT_RM050000NL02: Patiëntkenmerken. Wijzigingen:  
                     De patientPerson/asPatientOfOtherProvider relatie ten behoeve van rubriek 6, 7, en 8 die als 1 blok met scheiding per subelement was ogezet is nu opgedeeld. Rubriek 6, 7 en 8 staan nog steeds onder asPatientOfOtherProvider, maar elk met hun eigen definitie en eigen templateId (nieuw). Het templateId was nodig omdat ze anders niet goed van elkaar te onderscheiden bleken te zijn. Bij de opsplitsing zijn ook kleinere verbeteringen door gevoerd zoals dat er maar 1 contpersoon werd ondersteund in plaats van meerdere en de mapping van telefoonnummer en e-mailadres op hetzelfde element stonden. 
                     De mapping van element 714 Voor- of buitenschoolse voorzieningen is verplaatst naar subjectOf1/administrativeObservation. Dit vereenvoudigt patientPerson/asPatientOfOtherProvider aanzienlijk doordat @negationInd niet meer nodig is en dus ook onderliggende elementen niet meer apart hoeven worden behandeld in d
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000">
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
         id="d41e37676-false-d795147e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('PAT') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.3']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.3']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:statusCode[@code = 'active' or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:statusCode[@code = 'active' or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:confidentialityCode) = 0">(R_PatientNL-JGZ-universal): element hl7:confidentialityCode MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:patientPerson[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:patientPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:patientPerson[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:patientPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']"
         id="d41e38137-false-d795345e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.131')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.131' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']"
         id="d41e38148-false-d795364e0">
      <extends rule="II.NL.BSN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.3')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr"
         id="d795377e6-false-d795387e0">
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
         id="d795377e49-false-d795508e0">
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
         id="d795377e55-false-d795521e0">
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
         id="d795377e62-false-d795534e0">
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
         id="d795377e109-false-d795547e0">
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
         id="d795377e119-false-d795568e0">
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
         id="d795377e132-false-d795581e0">
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
         id="d795377e145-false-d795594e0">
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
         id="d795377e151-false-d795607e0">
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
         id="d795377e165-false-d795620e0">
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
         id="d795627e6-false-d795635e0">
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
         id="d795627e43-false-d795700e0">
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
         id="d795627e62-false-d795723e0">
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
         id="d41e38167-false-d795764e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-JGZ-universal): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:statusCode[@code = 'active' or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:statusCode[@code = 'active' or @nullFlavor]"
         id="d41e38191-false-d795783e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or (@code='active')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code 'active''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:confidentialityCode
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:confidentialityCode"
         id="d41e38203-false-d795803e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]"
         id="d41e38211-false-d795843e0">
      <let name="elmcount" value="count(hl7:name[@use='OR'] | hl7:name[@use='L'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="$elmcount &gt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:name[@use='OR']  of  hl7:name[@use='L']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="$elmcount &lt;= 2">(R_PatientNL-JGZ-universal): keuze (hl7:name[@use='OR']  of  hl7:name[@use='L']) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:birthTime) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthTime is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:birthTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:deceasedInd) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:deceasedInd komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:deceasedTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:deceasedTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:multipleBirthInd) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:multipleBirthInd komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:multipleBirthOrderNumber) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:multipleBirthOrderNumber komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:birthPlace) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthPlace komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10232
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']"
         id="d796002e9-false-d796008e0">
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
         id="d796002e52-false-d796060e0">
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
         id="d796002e61-false-d796079e0">
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
         id="d796002e74-false-d796112e0">
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
         id="d796125e9-false-d796131e0">
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
         id="d796125e30-false-d796211e0">
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
         id="d796125e42-false-d796230e0">
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
         id="d796125e59-false-d796263e0">
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
         id="d796125e69-false-d796282e0">
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
         id="d796125e75-false-d796295e0">
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
         id="d41e38235-false-d796310e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthTime
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthTime"
         id="d41e38246-false-d796337e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:deceasedInd
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:deceasedInd"
         id="d41e38256-false-d796360e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:deceasedTime
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:deceasedTime"
         id="d41e38264-false-d796373e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:multipleBirthInd
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:multipleBirthInd"
         id="d41e38273-false-d796390e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:multipleBirthOrderNumber
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:multipleBirthOrderNumber"
         id="d41e38284-false-d796403e0">
      <extends rule="INT.POS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:INT" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(R_PatientNL-JGZ-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="preceding-sibling::hl7:multipleBirthInd/@value='true'">(R_PatientNL-JGZ-universal): 
                            <name/> kan alleen een waarde hebben bij meerlingen</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[@classCode = 'PAT']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[@classCode = 'PAT']"
         id="d41e38309-false-d796435e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('PAT')">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]] | hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]] | hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="$elmcount &gt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]  of  hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]  of  hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="$elmcount &lt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]  of  hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]  of  hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]) bevat te veel elementen [max 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[@classCode = 'PAT']/hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[@classCode = 'PAT']/hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@typeCode) = ('SBJ')">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[@classCode = 'PAT']/hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[@classCode = 'PAT']/hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@typeCode) = ('SBJ')">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[@classCode = 'PAT']/hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asPatientOfOtherProvider[@classCode = 'PAT']/hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@typeCode) = ('SBJ')">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]"
         id="d41e38397-false-d796568e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('CIT') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'CIT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]"
         id="d41e38422-false-d796598e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('NAT') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'NAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]/hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]/hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']"
         id="d41e38433-false-d796630e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.29-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.29 W0029 Nationaliteit (HL7) (DYNAMISCH)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.29-DYNAMIC.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.29 W0029 Nationaliteit (HL7) (DYNAMISCH).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]"
         id="d41e38450-false-d796665e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('STD') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'STD' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:id[@nullFlavor = 'UNC']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@nullFlavor = 'UNC'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:id[@nullFlavor = 'UNC']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@nullFlavor = 'UNC'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:id[@nullFlavor = 'UNC']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:id[@nullFlavor = 'UNC']"
         id="d41e38509-false-d796727e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('UNC')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'UNC' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10261
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:effectiveTime
Item: (PeriodeGeldigheidSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:effectiveTime"
         id="d796740e6-false-d796748e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:effectiveTime/hl7:low
Item: (PeriodeGeldigheidSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:effectiveTime/hl7:low"
         id="d796740e43-false-d796813e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:effectiveTime/hl7:high
Item: (PeriodeGeldigheidSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:effectiveTime/hl7:high"
         id="d796740e62-false-d796836e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:effectiveTime/hl7:width
Item: (PeriodeGeldigheidSchool)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10261
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:effectiveTime/hl7:center
Item: (PeriodeGeldigheidSchool)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]"
         id="d41e38528-false-d796879e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.15']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.15'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.15']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.15'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:name) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:organizationContains[hl7:partOrganization]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:organizationContains[hl7:partOrganization] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.15']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.15']"
         id="d41e38539-false-d796956e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.15')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.15' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e38550-false-d796977e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.81 W0081 Soort onderwijs (HL7) (DYNAMISCH)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.81 W0081 Soort onderwijs (HL7) (DYNAMISCH).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:name
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:name"
         id="d41e38560-false-d797006e0">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]"
         id="d41e38568-false-d797021e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('CON') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'CON' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:telecom[not(contains(@value, '@'))]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:telecom[not(contains(@value, '@'))] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:telecom[contains(@value, '@')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:telecom[contains(@value, '@')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']"
         id="d41e38577-false-d797089e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d41e38584-false-d797123e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:telecom[not(contains(@value, '@'))]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:telecom[not(contains(@value, '@'))]"
         id="d41e38594-false-d797134e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:telecom[contains(@value, '@')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:telecom[contains(@value, '@')]"
         id="d41e38600-false-d797145e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10262
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime
Item: (PeriodeGeldigheidContactpersoonSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime"
         id="d797152e6-false-d797160e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:low
Item: (PeriodeGeldigheidContactpersoonSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:low"
         id="d797152e45-false-d797225e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:high
Item: (PeriodeGeldigheidContactpersoonSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:high"
         id="d797152e64-false-d797248e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:width
Item: (PeriodeGeldigheidContactpersoonSchool)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10262
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:center
Item: (PeriodeGeldigheidContactpersoonSchool)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]"
         id="d41e38612-false-d797289e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]"
         id="d41e38623-false-d797325e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]"
         id="d41e38634-false-d797338e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('PART') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PART' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:partOrganization[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:partOrganization[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:partOrganization[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:partOrganization[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]"
         id="d41e38643-false-d797368e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@nullFlavor = 'NI'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:id[@nullFlavor = 'NI']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:id[@nullFlavor = 'NI']"
         id="d41e38654-false-d797428e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('NI')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:code[@nullFlavor = 'OTH']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:code[@nullFlavor = 'OTH']"
         id="d41e38665-false-d797447e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d41e38672-false-d797481e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]"
         id="d41e38681-false-d797494e0">
      <extends rule="TN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TN')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]"
         id="d41e38693-false-d797509e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('MBR') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'MBR' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]"
         id="d41e38702-false-d797543e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:desc) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:desc komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:id[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:id[not(@nullFlavor)]"
         id="d41e38713-false-d797605e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d41e38722-false-d797620e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.94 W0094 Woonsituatie (HL7) (2012-05-21T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:desc
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:desc"
         id="d41e38732-false-d797642e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]"
         id="d41e38742-false-d797657e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('CON') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'CON' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']"
         id="d41e38776-false-d797715e0">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d41e38783-false-d797749e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:telecom
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:telecom"
         id="d41e38793-false-d797762e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-JGZ-universal): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10252
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime
Item: (PeriodeGeldigheidContactpersoon)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime"
         id="d797775e6-false-d797783e0">
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
         id="d797775e43-false-d797848e0">
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
         id="d797775e62-false-d797871e0">
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
         id="d41e38807-false-d797912e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]"
         id="d41e38814-false-d797936e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]"
         id="d41e38825-false-d797949e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('GUARD') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'GUARD' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:guardianPerson) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:guardianPerson is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:guardianPerson) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:guardianPerson komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]"
         id="d41e38844-false-d797992e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.31 W0031 Indicatie gezag minderjarige (HL7) (2012-05-21T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:guardianPerson
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:guardianPerson"
         id="d41e38855-false-d798014e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('NI') or not(@nullFlavor)">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@xsi:nil) = ('true')">(R_PatientNL-JGZ-universal): de waarde van xsi:nil MOET 'true' zijn. Gevonden: "<value-of select="@xsi:nil"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]"
         id="d41e38872-false-d798043e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('PRS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PRS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:relationshipHolder1[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:relationshipHolder1[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:relationshipHolder1[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:relationshipHolder1[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d41e39121-false-d798116e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]]) or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]]) or exists(doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.96 W0096 Relatie tot jeugdige ouder/verzorger (HL7) (2012-05-21T01:26:54) of 2.16.840.1.113883.2.4.3.11.60.100.11.2.108 W0108 Relatie tot jeugdige broer/zus (HL7) (2012-05-21T01:26:54) of 2.16.840.1.113883.11.16360 Child (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008']) or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.96 W0096 Relatie tot jeugdige ouder/verzorger (HL7) (2012-05-21T01:26:54) of 2.16.840.1.113883.2.4.3.11.60.100.11.2.108 W0108 Relatie tot jeugdige broer/zus (HL7) (2012-05-21T01:26:54) of 2.16.840.1.113883.11.16360 Child (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr"
         id="d798145e6-false-d798153e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:streetName
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:streetName"
         id="d798145e49-false-d798253e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:houseNumber
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:houseNumber"
         id="d798145e55-false-d798266e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:buildingNumberSuffix
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:buildingNumberSuffix"
         id="d798145e62-false-d798279e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:additionalLocator
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:additionalLocator"
         id="d798145e109-false-d798292e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:postalCode
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:postalCode"
         id="d798145e122-false-d798305e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:county
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:county"
         id="d798145e135-false-d798318e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:city
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:city"
         id="d798145e148-false-d798331e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:country
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:country"
         id="d798145e154-false-d798344e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:desc
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:desc"
         id="d798145e168-false-d798357e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:telecom
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:telecom"
         id="d41e39179-false-d798370e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-JGZ-universal): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]"
         id="d41e39198-false-d798389e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.3']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:name) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:name is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:name) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:birthTime) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthTime is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:birthTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:deceasedInd) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:deceasedInd komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:deceasedTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:deceasedTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:educationLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:educationLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:religiousAffiliationCode[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:religiousAffiliationCode[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:birthPlace) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthPlace komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']"
         id="d41e39268-false-d798526e0">
      <extends rule="II.NL.BSN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.3')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name"
         id="d41e39286-false-d798545e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@use">(R_PatientNL-JGZ-universal): attribute @use MOET aanwezig zijn.</assert>
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@use),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(@use) or empty($theAttValue[not(. = (('L','OR')))])">(R_PatientNL-JGZ-universal): de waarde van use MOET 'code L of code OR' zijn. Gevonden: "<value-of select="@use"/>"</assert>
      <let name="elmcount"
           value="count(hl7:given | hl7:prefix | hl7:family | hl7:delimiter | hl7:suffix)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="$elmcount &gt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:given  of  hl7:prefix  of  hl7:family  of  hl7:delimiter  of  hl7:suffix) bevat te weinig elementen [min 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:given
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:given"
         id="d41e39326-false-d798599e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:prefix
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:prefix"
         id="d41e39347-false-d798612e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@qualifier">(R_PatientNL-JGZ-universal): 
                                            <name path=".."/>/<name/>/@qualifier ontbreekt. Deze prefix zal als titel worden geïnterpreteerd.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:family
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:family"
         id="d41e39371-false-d798625e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:delimiter
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:delimiter"
         id="d41e39379-false-d798638e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:suffix
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:suffix"
         id="d41e39385-false-d798651e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e39395-false-d798666e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthTime
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthTime"
         id="d41e39406-false-d798693e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:deceasedInd
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:deceasedInd"
         id="d41e39416-false-d798716e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:deceasedTime
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:deceasedTime"
         id="d41e39424-false-d798729e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:educationLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:educationLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e39433-false-d798748e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.658 W0658 Opleiding ouder/verzorger (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.658 W0658 Opleiding ouder/verzorger (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:religiousAffiliationCode[@nullFlavor = 'OTH']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:religiousAffiliationCode[@nullFlavor = 'OTH']"
         id="d41e39448-false-d798775e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:religiousAffiliationCode[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:religiousAffiliationCode[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d41e39465-false-d798809e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]"
         id="d41e39474-false-d798822e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('EMP')">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'EMP' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]"
         id="d41e39510-false-d798865e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.104 W0104 Werk ouder/verzorger (HL7) (2012-05-21T01:26:54)'.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(@nullFlavor) or @nullFlavor=('OTH')">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.104 W0104 Werk ouder/verzorger (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]/hl7:originalText[not(@nullFlavor)]"
         id="d41e39521-false-d798908e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']"
         id="d41e39530-false-d798921e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('ORG')">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('NI')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@xsi:nil) = ('true')">(R_PatientNL-JGZ-universal): de waarde van xsi:nil MOET 'true' zijn. Gevonden: "<value-of select="@xsi:nil"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]"
         id="d41e39556-false-d798954e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('MBR') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'MBR' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:group[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:group[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:group[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:group[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]"
         id="d41e39565-false-d798984e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]/hl7:id[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]/hl7:id[not(@nullFlavor)]"
         id="d41e39576-false-d799020e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace"
         id="d41e39592-false-d799033e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:addr) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:addr komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace/hl7:addr
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace/hl7:addr"
         id="d41e39611-false-d799051e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:country[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:country[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:country[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:country[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace/hl7:addr/hl7:country[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace/hl7:addr/hl7:country[not(@nullFlavor)]"
         id="d41e39616-false-d799079e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.4.16.34'">(R_PatientNL-JGZ-universal): 
                                            <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP tabel 34 Landen</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:languageCommunication[hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:languageCommunication[hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]"
         id="d41e39633-false-d799094e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:languageCommunication[hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:languageCommunication[hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d41e39648-false-d799122e0">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.50 W0050 Taal (HL7) (2013-10-02T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]"
         id="d41e39660-false-d799142e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="$elmcount &gt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="$elmcount &lt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]) bevat te veel elementen [max 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e39679-false-d799171e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e39702-false-d799222e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or (@code='1322' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '1322' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d41e39712-false-d799242e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e39721-false-d799253e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e39744-false-d799304e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or (@code='1367' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '1367' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d41e39754-false-d799324e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e39764-false-d799335e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e39787-false-d799386e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or (@code='78' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '78' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d41e39797-false-d799406e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e39806-false-d799417e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e39829-false-d799468e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or (@code='1374' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '1374' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d41e39839-false-d799488e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e39848-false-d799499e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e39870-false-d799550e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or (@code='72' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '72' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d41e39880-false-d799570e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d41e39890-false-d799585e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e39912-false-d799636e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or (@code='670' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '670' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d41e39922-false-d799656e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace"
         id="d41e39934-false-d799673e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:addr[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:addr[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:addr[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:addr[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]"
         id="d41e39956-false-d799697e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="hl7:county or hl7:country">(R_PatientNL-JGZ-universal): Tenminste geboorteplaats of geboorteland is verplicht</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:county) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:county komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:country) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:country komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:county
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:county"
         id="d41e39966-false-d799728e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
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
         id="d41e39982-false-d799741e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="not(@codeSystem) or @codeSystem='2.16.840.1.113883.2.4.4.16.34'">(R_PatientNL-JGZ-universal): 
                                    <name path=".."/>/<name/> MOET, indien deze gecodeerd wordt, worden gecodeerd volgens BRP tabel 34 Landen</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]"
         id="d41e40000-false-d799756e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:modeCode[(@code = 'LTRC' and @codeSystem = '2.16.840.1.113883.5.60') or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:modeCode[(@code = 'LTRC' and @codeSystem = '2.16.840.1.113883.5.60') or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:modeCode[(@code = 'LTRC' and @codeSystem = '2.16.840.1.113883.5.60') or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:modeCode[(@code = 'LTRC' and @codeSystem = '2.16.840.1.113883.5.60') or @nullFlavor]"
         id="d41e40017-false-d799791e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="@nullFlavor or (@code='LTRC' and @codeSystem='2.16.840.1.113883.5.60')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code 'LTRC' codeSystem '2.16.840.1.113883.5.60''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d41e40028-false-d799813e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40028
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (obsElement0028)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40028
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (obsElement0028)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0028): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0028): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0028): element hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0028): element hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(obsElement0028): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(obsElement0028): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40028
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0028)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0028): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="@nullFlavor or (@code='28' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0028): de elementwaarde MOET een zijn van 'code '28' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40028
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]
Item: (obsElement0028)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(obsElement0028): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
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
         id="d41e40123-false-d800862e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="count(hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS')">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN')">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:coveredPartyOf[hl7:coverageRecord]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.131-2020-05-27T000000.html"
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
