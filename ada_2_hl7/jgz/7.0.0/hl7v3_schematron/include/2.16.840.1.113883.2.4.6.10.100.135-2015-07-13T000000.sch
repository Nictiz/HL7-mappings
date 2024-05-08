<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.135
Name: R_PatientNL_JGZ Informal [optional BSN]
Description: COCT_RM050000NL02: Patiënt/persoonsgegevens. Deze template verschilt van R_PatientNL_JGZ Informal [informal/identified] doordat het patiënt/kind id niet verplicht is en zelfs iets anders kan zijn dan BSN.
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000">
   <title>R_PatientNL_JGZ Informal [optional BSN]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.135
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]
Item: (R_PatientNL-JGZ-Informal-optional-BSN)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.135
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]
Item: (R_PatientNL-JGZ-Informal-optional-BSN)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]"
         id="d41e44049-false-d811625e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="string(@classCode) = ('PAT') or not(@classCode)">(R_PatientNL-JGZ-Informal-optional-BSN): de waarde van classCode MOET 'PAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']) &gt;= 1">(R_PatientNL-JGZ-Informal-optional-BSN): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']) &lt;= 1">(R_PatientNL-JGZ-Informal-optional-BSN): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135'] komt te vaak voor [max 1x].</assert>
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.20'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="$elmcount &lt;= 2">(R_PatientNL-JGZ-Informal-optional-BSN): keuze (hl7:id[@root = '2.16.840.1.113883.2.4.6.3']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.20']) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.3']) &lt;= 1">(R_PatientNL-JGZ-Informal-optional-BSN): element hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.20']) &lt;= 1">(R_PatientNL-JGZ-Informal-optional-BSN): element hl7:id[@root = '2.16.840.1.113883.2.4.6.20'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="count(hl7:addr) &gt;= 1">(R_PatientNL-JGZ-Informal-optional-BSN): element hl7:addr is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="count(hl7:addr) &lt;= 2">(R_PatientNL-JGZ-Informal-optional-BSN): element hl7:addr komt te vaak voor [max 2x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="count(hl7:statusCode[@code = 'active']) &gt;= 1">(R_PatientNL-JGZ-Informal-optional-BSN): element hl7:statusCode[@code = 'active'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="count(hl7:statusCode[@code = 'active']) &lt;= 1">(R_PatientNL-JGZ-Informal-optional-BSN): element hl7:statusCode[@code = 'active'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="count(hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]) &gt;= 1">(R_PatientNL-JGZ-Informal-optional-BSN): element hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="count(hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]) &lt;= 1">(R_PatientNL-JGZ-Informal-optional-BSN): element hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.135
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']
Item: (R_PatientNL-JGZ-Informal-optional-BSN)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']"
         id="d41e44094-false-d811748e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-Informal-optional-BSN): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.135')">(R_PatientNL-JGZ-Informal-optional-BSN): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.135' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.135
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']
Item: (R_PatientNL-JGZ-Informal-optional-BSN)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']"
         id="d41e44104-false-d811767e0">
      <extends rule="II.NL.BSN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-Informal-optional-BSN): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.3')">(R_PatientNL-JGZ-Informal-optional-BSN): de waarde van root MOET '2.16.840.1.113883.2.4.6.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.135
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.20']
Item: (R_PatientNL-JGZ-Informal-optional-BSN)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.20']"
         id="d41e44112-false-d811786e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-JGZ-Informal-optional-BSN): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.20')">(R_PatientNL-JGZ-Informal-optional-BSN): de waarde van root MOET '2.16.840.1.113883.2.4.6.20' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr"
         id="d811799e6-false-d811809e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:streetName
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:streetName"
         id="d811799e49-false-d811930e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:houseNumber
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:houseNumber"
         id="d811799e55-false-d811943e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:buildingNumberSuffix
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:buildingNumberSuffix"
         id="d811799e62-false-d811956e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:additionalLocator
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:additionalLocator"
         id="d811799e109-false-d811969e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:postalCode
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:postalCode"
         id="d811799e119-false-d811990e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:county
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:county"
         id="d811799e132-false-d812003e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:city
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:city"
         id="d811799e145-false-d812016e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10222
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:country
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:country"
         id="d811799e151-false-d812029e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:desc
Item: (AdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:desc"
         id="d811799e165-false-d812042e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(AdresJeugdige): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10251
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:useablePeriod
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:useablePeriod"
         id="d812049e6-false-d812057e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:useablePeriod/hl7:low
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:useablePeriod/hl7:low"
         id="d812049e43-false-d812122e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:useablePeriod/hl7:high
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:useablePeriod/hl7:high"
         id="d812049e62-false-d812145e0">
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
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:useablePeriod/hl7:width
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10251
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:useablePeriod/hl7:center
Item: (PeriodeGeldigheidAdresJeugdige)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.135
Context: *[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:statusCode[@code = 'active']
Item: (R_PatientNL-JGZ-Informal-optional-BSN)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:statusCode[@code = 'active']"
         id="d41e44124-false-d812186e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(R_PatientNL-JGZ-Informal-optional-BSN): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.135-2015-07-13T000000.html"
              test="@nullFlavor or (@code='active')">(R_PatientNL-JGZ-Informal-optional-BSN): de elementwaarde MOET een zijn van 'code 'active''.</assert>
   </rule>
</pattern>
