<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.182
Name: Bericht 2 Opleveren vaccinatiestatus (payload)
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.182-2012-09-01T000000">
   <title>Bericht 2 Opleveren vaccinatiestatus (payload)</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.182
Context: *[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]
Item: (OpleverenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]"
         id="d41e47006-false-d1554072e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.182-2012-09-01T000000.html"
              test="count(hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]) &gt;= 1">(OpleverenVaccinatiestatus-payload): element hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.182-2012-09-01T000000.html"
              test="count(hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]) &lt;= 1">(OpleverenVaccinatiestatus-payload): element hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.182
Context: *[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]
Item: (OpleverenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]"
         id="d41e47014-false-d1554127e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.182-2012-09-01T000000.html"
              test="string(@classCode) = ('LIST') or not(@classCode)">(OpleverenVaccinatiestatus-payload): de waarde van classCode MOET 'LIST' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.182-2012-09-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(OpleverenVaccinatiestatus-payload): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.182-2012-09-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']) &gt;= 1">(OpleverenVaccinatiestatus-payload): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.182-2012-09-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']) &lt;= 1">(OpleverenVaccinatiestatus-payload): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.182-2012-09-01T000000.html"
              test="count(hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]) &gt;= 1">(OpleverenVaccinatiestatus-payload): element hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.182-2012-09-01T000000.html"
              test="count(hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]) &lt;= 1">(OpleverenVaccinatiestatus-payload): element hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.182
Context: *[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']
Item: (OpleverenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']"
         id="d41e47040-false-d1554198e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.182-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(OpleverenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.182-2012-09-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.182')">(OpleverenVaccinatiestatus-payload): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.182' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.182
Context: *[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]
Item: (OpleverenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.182-2012-09-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(OpleverenVaccinatiestatus-payload): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.182
Context: *[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]
Item: (OpleverenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.182-2012-09-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(OpleverenVaccinatiestatus-payload): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
</pattern>
