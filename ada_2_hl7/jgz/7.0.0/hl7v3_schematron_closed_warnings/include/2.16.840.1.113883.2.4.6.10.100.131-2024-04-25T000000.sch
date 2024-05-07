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
         id="template-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000">
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
         id="d40e22648-false-d551199e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('PAT') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.3']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.3']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:statusCode[@code = 'active' or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:statusCode[@code = 'active' or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:confidentialityCode) = 0">(R_PatientNL-JGZ-universal): element hl7:confidentialityCode MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:patientPerson[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:patientPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:patientPerson[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:patientPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:subjectOf1[hl7:administrativeObservation[hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']"
         id="d40e23109-false-d551397e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.131')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.131' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']"
         id="d40e23120-false-d551416e0">
      <extends rule="II.NL.BSN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.3')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr"
         id="d551429e6-false-d551439e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:streetName
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:streetName"
         id="d551429e49-false-d551560e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:houseNumber
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:houseNumber"
         id="d551429e55-false-d551573e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:buildingNumberSuffix
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:buildingNumberSuffix"
         id="d551429e62-false-d551586e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:additionalLocator
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:additionalLocator"
         id="d551429e109-false-d551599e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:postalCode
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:postalCode"
         id="d551429e119-false-d551620e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:county
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:county"
         id="d551429e132-false-d551633e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:city
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:city"
         id="d551429e145-false-d551646e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:country
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:country"
         id="d551429e151-false-d551659e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:desc
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:desc"
         id="d551429e165-false-d551672e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10251
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:useablePeriod
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:useablePeriod"
         id="d551679e6-false-d551687e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:useablePeriod/hl7:low
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:useablePeriod/hl7:low"
         id="d551679e43-false-d551752e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:useablePeriod/hl7:high
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:addr/hl7:useablePeriod/hl7:high"
         id="d551679e62-false-d551775e0">
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
         id="d40e23139-false-d551816e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-JGZ-universal): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:statusCode[@code = 'active' or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:statusCode[@code = 'active' or @nullFlavor]"
         id="d40e23163-false-d551835e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or (@code='active')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code 'active''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:confidentialityCode
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:confidentialityCode"
         id="d40e23175-false-d551855e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]"
         id="d40e23183-false-d551895e0">
      <let name="elmcount" value="count(hl7:name[@use='OR'] | hl7:name[@use='L'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="$elmcount &gt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:name[@use='OR']  of  hl7:name[@use='L']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="$elmcount &lt;= 2">(R_PatientNL-JGZ-universal): keuze (hl7:name[@use='OR']  of  hl7:name[@use='L']) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:birthTime) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthTime is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:birthTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:deceasedInd) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:deceasedInd komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:deceasedTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:deceasedTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:multipleBirthInd) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:multipleBirthInd komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:multipleBirthOrderNumber) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:multipleBirthOrderNumber komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:birthPlace) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthPlace komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10232
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']"
         id="d552054e9-false-d552060e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']/hl7:given
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']/hl7:given"
         id="d552054e52-false-d552112e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']/hl7:prefix
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']/hl7:prefix"
         id="d552054e61-false-d552131e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']/hl7:family[not(@nullFlavor)]
Item: (NaamKindOfficieel)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='OR']/hl7:family[not(@nullFlavor)]"
         id="d552054e74-false-d552164e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']"
         id="d552177e9-false-d552183e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:given
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:given"
         id="d552177e30-false-d552263e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:prefix
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:prefix"
         id="d552177e42-false-d552282e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:family
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:family"
         id="d552177e59-false-d552315e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:delimiter
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:delimiter"
         id="d552177e69-false-d552334e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10233
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:suffix
Item: (NaamKindZoalsBekendBijInstelling)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:name[@use='L']/hl7:suffix"
         id="d552177e75-false-d552347e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(NaamKindZoalsBekendBijInstelling): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e23207-false-d552362e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthTime
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthTime"
         id="d40e23218-false-d552389e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:deceasedInd
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:deceasedInd"
         id="d40e23228-false-d552412e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:deceasedTime
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:deceasedTime"
         id="d40e23236-false-d552425e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:multipleBirthInd
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:multipleBirthInd"
         id="d40e23245-false-d552442e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:multipleBirthOrderNumber
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:multipleBirthOrderNumber"
         id="d40e23256-false-d552455e0">
      <extends rule="INT.POS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:INT" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(R_PatientNL-JGZ-universal): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
         id="d40e23281-false-d552487e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('PAT')">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]] | hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]] | hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="$elmcount &gt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]  of  hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]  of  hl7:subjectOf[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@typeCode) = ('SBJ')">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]"
         id="d40e23369-false-d552620e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('CIT') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'CIT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]"
         id="d40e23394-false-d552650e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('NAT') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'NAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]/hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asCitizen[hl7:politicalNation]/hl7:politicalNation[hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']]/hl7:code[@nullFlavor or @codeSystem = '2.16.840.1.113883.2.4.4.16.32']"
         id="d40e23405-false-d552682e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.29-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.29 W0029 Nationaliteit (HL7) (DYNAMISCH)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.29-DYNAMIC.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.29 W0029 Nationaliteit (HL7) (DYNAMISCH).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]"
         id="d40e23422-false-d552717e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('STD') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'STD' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:id[@nullFlavor = 'UNC']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@nullFlavor = 'UNC'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:id[@nullFlavor = 'UNC']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@nullFlavor = 'UNC'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:id[@nullFlavor = 'UNC']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:id[@nullFlavor = 'UNC']"
         id="d40e23481-false-d552779e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@nullFlavor) = ('UNC')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'UNC' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10261
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:effectiveTime
Item: (PeriodeGeldigheidSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:effectiveTime"
         id="d552792e6-false-d552800e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeGeldigheidSchool): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidSchool): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidSchool): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidSchool): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidSchool): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidSchool): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidSchool): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10261
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:effectiveTime/hl7:low
Item: (PeriodeGeldigheidSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:effectiveTime/hl7:low"
         id="d552792e43-false-d552865e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidSchool): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidSchool): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidSchool): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10261
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:effectiveTime/hl7:high
Item: (PeriodeGeldigheidSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:effectiveTime/hl7:high"
         id="d552792e62-false-d552888e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidSchool): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidSchool): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10261-2012-08-01T000000.html"
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
         id="d40e23500-false-d552931e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.15']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.15'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.15']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.15'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:name) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:organizationContains[hl7:partOrganization]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:organizationContains[hl7:partOrganization] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.15']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.15']"
         id="d40e23511-false-d553008e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.15')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.15' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e23522-false-d553029e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.81 W0081 Soort onderwijs (HL7) (DYNAMISCH)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.81 W0081 Soort onderwijs (HL7) (DYNAMISCH).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:name
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:name"
         id="d40e23532-false-d553058e0">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]"
         id="d40e23540-false-d553073e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('CON') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'CON' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:telecom[not(contains(@value, '@'))]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:telecom[not(contains(@value, '@'))] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:telecom[contains(@value, '@')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:telecom[contains(@value, '@')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']"
         id="d40e23549-false-d553141e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d40e23556-false-d553175e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:telecom[not(contains(@value, '@'))]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:telecom[not(contains(@value, '@'))]"
         id="d40e23566-false-d553186e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:telecom[contains(@value, '@')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:telecom[contains(@value, '@')]"
         id="d40e23572-false-d553197e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10262
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime
Item: (PeriodeGeldigheidContactpersoonSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime"
         id="d553204e6-false-d553212e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeGeldigheidContactpersoonSchool): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidContactpersoonSchool): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidContactpersoonSchool): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidContactpersoonSchool): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidContactpersoonSchool): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidContactpersoonSchool): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidContactpersoonSchool): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10262
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:low
Item: (PeriodeGeldigheidContactpersoonSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:low"
         id="d553204e45-false-d553277e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidContactpersoonSchool): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidContactpersoonSchool): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidContactpersoonSchool): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10262
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:high
Item: (PeriodeGeldigheidContactpersoonSchool)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:high"
         id="d553204e64-false-d553300e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidContactpersoonSchool): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidContactpersoonSchool): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10262-2012-08-01T000000.html"
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
         id="d40e23584-false-d553341e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:contactParty[hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]"
         id="d40e23595-false-d553377e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]"
         id="d40e23606-false-d553390e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('PART') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PART' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:partOrganization[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:partOrganization[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:partOrganization[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:partOrganization[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]"
         id="d40e23615-false-d553420e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@nullFlavor = 'NI'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:id[@nullFlavor = 'NI']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:id[@nullFlavor = 'NI']"
         id="d40e23626-false-d553480e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@nullFlavor) = ('NI')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:code[@nullFlavor = 'OTH']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:code[@nullFlavor = 'OTH']"
         id="d40e23637-false-d553499e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d40e23644-false-d553533e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asStudent[hl7:schoolOrganization[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.81-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]]]/hl7:schoolOrganization[hl7:id[@root = '2.16.840.1.113883.2.4.6.15']]/hl7:organizationContains[hl7:partOrganization]/hl7:partOrganization[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]"
         id="d40e23653-false-d553546e0">
      <extends rule="TN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TN')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]"
         id="d40e23665-false-d553561e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('MBR') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'MBR' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]"
         id="d40e23674-false-d553595e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:desc) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:desc komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:id[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:id[not(@nullFlavor)]"
         id="d40e23685-false-d553657e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d40e23694-false-d553672e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.94 W0094 Woonsituatie (HL7) (2012-05-21T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:desc
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:asMember[hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:group[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.94-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:desc"
         id="d40e23704-false-d553694e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]"
         id="d40e23714-false-d553709e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('CON') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'CON' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:contactPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']"
         id="d40e23748-false-d553767e0">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d40e23755-false-d553801e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:telecom
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:telecom"
         id="d40e23765-false-d553814e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-JGZ-universal): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10252
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime
Item: (PeriodeGeldigheidContactpersoon)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime"
         id="d553827e6-false-d553835e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeGeldigheidContactpersoon): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidContactpersoon): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidContactpersoon): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidContactpersoon): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidContactpersoon): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidContactpersoon): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidContactpersoon): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10252
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:low
Item: (PeriodeGeldigheidContactpersoon)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:low"
         id="d553827e43-false-d553900e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidContactpersoon): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidContactpersoon): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidContactpersoon): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10252
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:high
Item: (PeriodeGeldigheidContactpersoon)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:effectiveTime/hl7:high"
         id="d553827e62-false-d553923e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidContactpersoon): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidContactpersoon): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10252-2012-08-01T000000.html"
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
         id="d40e23779-false-d553964e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:contactParty[hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]"
         id="d40e23786-false-d553988e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]"
         id="d40e23797-false-d554001e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('GUARD') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'GUARD' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:guardianPerson) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:guardianPerson is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:guardianPerson) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:guardianPerson komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]"
         id="d40e23816-false-d554044e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.31-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.31 W0031 Indicatie gezag minderjarige (HL7) (2012-05-21T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:guardianPerson
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:guardian[hl7:guardianPerson]/hl7:guardianPerson"
         id="d40e23827-false-d554066e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@nullFlavor) = ('NI') or not(@nullFlavor)">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@xsi:nil) = ('true')">(R_PatientNL-JGZ-universal): de waarde van xsi:nil MOET 'true' zijn. Gevonden: "<value-of select="@xsi:nil"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]"
         id="d40e23844-false-d554095e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('PRS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PRS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:relationshipHolder1[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:relationshipHolder1[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:relationshipHolder1[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:relationshipHolder1[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d40e24093-false-d554168e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]]) or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]]) or exists(doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.96 W0096 Relatie tot jeugdige ouder/verzorger (HL7) (2012-05-21T01:26:54) of 2.16.840.1.113883.2.4.3.11.60.100.11.2.108 W0108 Relatie tot jeugdige broer/zus (HL7) (2012-05-21T01:26:54) of 2.16.840.1.113883.11.16360 Child (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008']) or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.96 W0096 Relatie tot jeugdige ouder/verzorger (HL7) (2012-05-21T01:26:54) of 2.16.840.1.113883.2.4.3.11.60.100.11.2.108 W0108 Relatie tot jeugdige broer/zus (HL7) (2012-05-21T01:26:54) of 2.16.840.1.113883.11.16360 Child (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr"
         id="d554197e6-false-d554205e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(AdresOuderVerzorger): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:streetName) &lt;= 1">(AdresOuderVerzorger): element hl7:streetName komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:houseNumber) &lt;= 1">(AdresOuderVerzorger): element hl7:houseNumber komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:buildingNumberSuffix) &lt;= 1">(AdresOuderVerzorger): element hl7:buildingNumberSuffix komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:additionalLocator) &lt;= 1">(AdresOuderVerzorger): element hl7:additionalLocator komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:postalCode) &lt;= 1">(AdresOuderVerzorger): element hl7:postalCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:county) &lt;= 1">(AdresOuderVerzorger): element hl7:county komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:city) &lt;= 1">(AdresOuderVerzorger): element hl7:city komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:country) &lt;= 1">(AdresOuderVerzorger): element hl7:country komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="count(hl7:desc) &lt;= 1">(AdresOuderVerzorger): element hl7:desc komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:streetName
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:streetName"
         id="d554197e49-false-d554305e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:houseNumber
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:houseNumber"
         id="d554197e55-false-d554318e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:buildingNumberSuffix
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:buildingNumberSuffix"
         id="d554197e62-false-d554331e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:additionalLocator
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:additionalLocator"
         id="d554197e109-false-d554344e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
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
         id="d554197e122-false-d554357e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
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
         id="d554197e135-false-d554370e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
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
         id="d554197e148-false-d554383e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10223
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:country
Item: (AdresOuderVerzorger)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:addr/hl7:country"
         id="d554197e154-false-d554396e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
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
         id="d554197e168-false-d554409e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10223-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresOuderVerzorger): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:telecom
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:telecom"
         id="d40e24151-false-d554422e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-JGZ-universal): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]"
         id="d40e24170-false-d554441e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.3']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:name) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:name is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:name) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:name komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:birthTime) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthTime is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:birthTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:deceasedInd) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:deceasedInd komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:deceasedTime) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:deceasedTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:educationLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:educationLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:religiousAffiliationCode[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:religiousAffiliationCode[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:birthPlace) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:birthPlace komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']"
         id="d40e24240-false-d554578e0">
      <extends rule="II.NL.BSN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.3')">(R_PatientNL-JGZ-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name"
         id="d40e24258-false-d554597e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@use">(R_PatientNL-JGZ-universal): attribute @use MOET aanwezig zijn.</assert>
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@use),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(@use) or empty($theAttValue[not(. = (('L','OR')))])">(R_PatientNL-JGZ-universal): de waarde van use MOET 'code L of code OR' zijn. Gevonden: "<value-of select="@use"/>"</assert>
      <let name="elmcount"
           value="count(hl7:given | hl7:prefix | hl7:family | hl7:delimiter | hl7:suffix)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="$elmcount &gt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:given  of  hl7:prefix  of  hl7:family  of  hl7:delimiter  of  hl7:suffix) bevat te weinig elementen [min 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:given
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:given"
         id="d40e24298-false-d554651e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:prefix
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:prefix"
         id="d40e24319-false-d554664e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
         id="d40e24343-false-d554677e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:delimiter
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:delimiter"
         id="d40e24351-false-d554690e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:suffix
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:name/hl7:suffix"
         id="d40e24357-false-d554703e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e24367-false-d554718e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthTime
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthTime"
         id="d40e24378-false-d554745e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:deceasedInd
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:deceasedInd"
         id="d40e24388-false-d554768e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:deceasedTime
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:deceasedTime"
         id="d40e24396-false-d554781e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:educationLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:educationLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d40e24405-false-d554800e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.658 W0658 Opleiding ouder/verzorger (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.658-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.658 W0658 Opleiding ouder/verzorger (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:religiousAffiliationCode[@nullFlavor = 'OTH']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:religiousAffiliationCode[@nullFlavor = 'OTH']"
         id="d40e24420-false-d554827e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:religiousAffiliationCode[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:religiousAffiliationCode[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d40e24437-false-d554861e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]"
         id="d40e24446-false-d554874e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('EMP')">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'EMP' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]"
         id="d40e24482-false-d554917e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.104 W0104 Werk ouder/verzorger (HL7) (2012-05-21T01:26:54)'.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(@nullFlavor) or @nullFlavor=('OTH')">(R_PatientNL-JGZ-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.104 W0104 Werk ouder/verzorger (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:occupationCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.104-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]/hl7:originalText[not(@nullFlavor)]"
         id="d40e24493-false-d554960e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asEmployee[@classCode = 'EMP'][hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']]/hl7:employerOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']"
         id="d40e24502-false-d554973e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('ORG')">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@nullFlavor) = ('NI')">(R_PatientNL-JGZ-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@xsi:nil) = ('true')">(R_PatientNL-JGZ-universal): de waarde van xsi:nil MOET 'true' zijn. Gevonden: "<value-of select="@xsi:nil"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]"
         id="d40e24528-false-d555006e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('MBR') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'MBR' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:group[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:group[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:group[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:group[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]"
         id="d40e24537-false-d555036e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-JGZ-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]/hl7:id[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:asMember[hl7:group]/hl7:group[not(@nullFlavor)]/hl7:id[not(@nullFlavor)]"
         id="d40e24548-false-d555072e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace"
         id="d40e24564-false-d555085e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:addr) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:addr komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace/hl7:addr
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace/hl7:addr"
         id="d40e24583-false-d555103e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:country[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:country[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:country[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:country[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace/hl7:addr/hl7:country[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:birthPlace/hl7:addr/hl7:country[not(@nullFlavor)]"
         id="d40e24588-false-d555131e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
         id="d40e24605-false-d555146e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:languageCommunication[hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:relationshipHolder1[not(@nullFlavor)]/hl7:languageCommunication[hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:languageCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d40e24620-false-d555174e0">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.50-2013-10-02T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.50 W0050 Taal (HL7) (2013-10-02T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]"
         id="d40e24632-false-d555194e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)] | hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="$elmcount &gt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="$elmcount &lt;= 1">(R_PatientNL-JGZ-universal): keuze (hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]  of  hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]) bevat te veel elementen [max 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e24651-false-d555223e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1322' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e24674-false-d555274e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or (@code='1322' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '1322' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1322'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d40e24684-false-d555294e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e24693-false-d555305e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1367' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e24716-false-d555356e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or (@code='1367' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '1367' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1367'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d40e24726-false-d555376e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e24736-false-d555387e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '78' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e24759-false-d555438e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or (@code='78' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '78' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '78'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d40e24769-false-d555458e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e24778-false-d555469e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '1374' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e24801-false-d555520e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or (@code='1374' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '1374' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '1374'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d40e24811-false-d555540e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e24820-false-d555551e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '72' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e24842-false-d555602e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or (@code='72' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '72' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '72'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d40e24852-false-d555622e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]"
         id="d40e24862-false-d555637e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(R_PatientNL-JGZ-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:code[(@code = '670' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e24884-false-d555688e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or (@code='670' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code '670' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.96-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.108-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.11.16360-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:subjectOf[hl7:personalRelationshipObservation]/hl7:personalRelationshipObservation[hl7:code[@code = '670'][@codeSystem = '2.16.840.1.113883.2.4.4.40.267']][not(@nullFlavor)]/hl7:value[not(@nullFlavor)]"
         id="d40e24894-false-d555708e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="not(*)">(R_PatientNL-JGZ-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace"
         id="d40e24906-false-d555725e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:addr[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:addr[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:addr[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:addr[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]"
         id="d40e24928-false-d555749e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="hl7:county or hl7:country">(R_PatientNL-JGZ-universal): Tenminste geboorteplaats of geboorteland is verplicht</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:county) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:county komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:country) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:country komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:county
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/hl7:county"
         id="d40e24938-false-d555780e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
         id="d40e24954-false-d555793e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
         id="d40e24972-false-d555808e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:modeCode[(@code = 'LTRC' and @codeSystem = '2.16.840.1.113883.5.60') or @nullFlavor]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:modeCode[(@code = 'LTRC' and @codeSystem = '2.16.840.1.113883.5.60') or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(R_PatientNL-JGZ-universal): element hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:modeCode[(@code = 'LTRC' and @codeSystem = '2.16.840.1.113883.5.60') or @nullFlavor]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:modeCode[(@code = 'LTRC' and @codeSystem = '2.16.840.1.113883.5.60') or @nullFlavor]"
         id="d40e24989-false-d555843e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="@nullFlavor or (@code='LTRC' and @codeSystem='2.16.840.1.113883.5.60')">(R_PatientNL-JGZ-universal): de elementwaarde MOET een zijn van 'code 'LTRC' codeSystem '2.16.840.1.113883.5.60''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:patientPerson[not(@nullFlavor)]/hl7:languageCommunication[hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:proficiencyLevelCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.644-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d40e25000-false-d555865e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-JGZ-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0026): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0026): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0026): element hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0026): element hl7:code[(@code = '26' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(obsElement0026): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0026): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0026): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(obsElement0026): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.14 W0014 Land (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.14-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40026-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0027): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0027): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0027): element hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0027): element hl7:code[(@code = '27' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(obsElement0027): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0027): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(obsElement0027): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40027-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0029): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0029): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0029): element hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0029): element hl7:code[(@code = '29' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(obsElement0029): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0029): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(obsElement0029): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40029-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0028): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0028): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0028): element hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0028): element hl7:code[(@code = '28' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(obsElement0028): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0028): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40028-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0714): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0714): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0714): element hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0714): element hl7:code[(@code = '714' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(obsElement0714): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0714): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40714-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement1417): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement1417): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement1417): element hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement1417): element hl7:code[(@code = '1417' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(obsElement1417): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement1417): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41417-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement1493): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement1493): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement1493): element hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement1493): element hl7:code[(@code = '1493' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(obsElement1493): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement1493): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement1493): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(obsElement1493): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.75 W0075 Reden geen psz/vve (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41493-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0716): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0716): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0716): element hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0716): element hl7:code[(@code = '716' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(obsElement0716): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0716): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0716): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(obsElement0716): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.75 W0075 Reden geen psz/vve (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.75-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.40716-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(obsElement0716): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.75 W0075 Reden geen psz/vve (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.131
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]
Item: (R_PatientNL-JGZ-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.131']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]"
         id="d40e25095-false-d556914e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(R_PatientNL-JGZ-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="count(hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]) &gt;= 1">(R_PatientNL-JGZ-universal): element hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
              test="string(@classCode) = ('OBS')">(R_PatientNL-JGZ-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.131-2024-04-25T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@classCode) = ('COV') or not(@classCode)">(A_CoverageNL-minimal): de waarde van classCode MOET 'COV' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_CoverageNL-minimal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_CoverageNL-minimal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]]) &gt;= 1">(A_CoverageNL-minimal): element hl7:policyOrProgram[hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@classCode) = ('COV') or not(@classCode)">(A_CoverageNL-minimal): de waarde van classCode MOET 'COV' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_CoverageNL-minimal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(A_CoverageNL-minimal): element hl7:code[(@code = 'HIP' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(A_CoverageNL-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@typeCode) = ('COV') or not(@typeCode)">(A_CoverageNL-minimal): de waarde van typeCode MOET 'COV' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:coveredParty[hl7:id[@nullFlavor='NI']] | hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(A_CoverageNL-minimal): keuze (hl7:coveredParty[hl7:id[@nullFlavor='NI']]  of  hl7:coveredParty[hl7:id[@nullFlavor='UNC']][not(@nullFlavor)]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@typeCode) = ('COVPTY') or not(@typeCode)">(A_CoverageNL-minimal): de waarde van typeCode MOET 'COVPTY' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &gt;= 1">(A_CoverageNL-minimal): element hl7:id[@nullFlavor = 'NI'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_CoverageNL-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@typeCode) = ('COVPTY') or not(@typeCode)">(A_CoverageNL-minimal): de waarde van typeCode MOET 'COVPTY' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = 'UNC']) &gt;= 1">(A_CoverageNL-minimal): element hl7:id[@nullFlavor = 'UNC'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = 'UNC']) &lt;= 1">(A_CoverageNL-minimal): element hl7:id[@nullFlavor = 'UNC'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_CoverageNL-minimal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_CoverageNL-minimal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:underwritingOrganization[not(@nullFlavor)]) &gt;= 1">(A_CoverageNL-minimal): element hl7:underwritingOrganization[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_CoverageNL-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNC')">(A_CoverageNL-minimal): de waarde van nullFlavor MOET 'UNC' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_CoverageNL-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_CoverageNL-minimal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.18877 CoverageRoleTypeJGZ (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.18877-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="hl7:id or hl7:name">(A_CoverageNL-minimal): 
                                            <name/> MOET tenminste een id of naam bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="count(hl7:id) &lt;= 1">(A_CoverageNL-minimal): element hl7:id komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_CoverageNL-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.132-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(A_CoverageNL-minimal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
</pattern>
