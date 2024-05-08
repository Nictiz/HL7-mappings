<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.10028
Name: Activities component1 NonBDSData
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000">
   <title>Activities component1 NonBDSData</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10028
Context: *[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]
Item: (activitiesComponent1NonBDSData)
-->
   <rule fpi="RULC-1"
         context="*[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]"
         id="d41e10801-false-d85348e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="count(hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]) &gt;= 1">(activitiesComponent1NonBDSData): element hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="count(hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]) &lt;= 1">(activitiesComponent1NonBDSData): element hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10028
Context: *[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]
Item: (activitiesComponent1NonBDSData)
-->
   <rule fpi="RULC-1"
         context="*[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]"
         id="d41e10809-false-d85371e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(activitiesComponent1NonBDSData): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(activitiesComponent1NonBDSData): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']) &gt;= 1">(activitiesComponent1NonBDSData): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']) &lt;= 1">(activitiesComponent1NonBDSData): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="count(hl7:code) &gt;= 1">(activitiesComponent1NonBDSData): element hl7:code is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="count(hl7:code) &lt;= 1">(activitiesComponent1NonBDSData): element hl7:code komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(activitiesComponent1NonBDSData): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(activitiesComponent1NonBDSData): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="count(hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]) &lt;= 1">(activitiesComponent1NonBDSData): element hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10028
Context: *[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']
Item: (activitiesComponent1NonBDSData)
-->
   <rule fpi="RULC-1"
         context="*[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']"
         id="d41e10872-false-d85446e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(activitiesComponent1NonBDSData): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.10028')">(activitiesComponent1NonBDSData): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.10028' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10028
Context: *[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:code
Item: (activitiesComponent1NonBDSData)
-->
   <rule fpi="RULC-1"
         context="*[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:code"
         id="d41e10882-false-d85465e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(activitiesComponent1NonBDSData): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('OTH') or not(@nullFlavor)">(activitiesComponent1NonBDSData): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="count(hl7:originalText) &lt;= 1">(activitiesComponent1NonBDSData): element hl7:originalText komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10028
Context: *[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:code/hl7:originalText
Item: (activitiesComponent1NonBDSData)
-->
   <rule fpi="RULC-1"
         context="*[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:code/hl7:originalText"
         id="d41e10891-false-d85493e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(activitiesComponent1NonBDSData): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10028
Context: *[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:value[not(@nullFlavor)]
Item: (activitiesComponent1NonBDSData)
-->
   <rule fpi="RULC-1"
         context="*[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:value[not(@nullFlavor)]"
         id="d41e10903-false-d85506e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(activitiesComponent1NonBDSData): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10028
Context: *[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]
Item: (activitiesComponent1NonBDSData)
-->
   <rule fpi="RULC-1"
         context="*[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]"
         id="d41e10986-false-d85519e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="string(@typeCode) = ('PERT') or not(@typeCode)">(activitiesComponent1NonBDSData): de waarde van typeCode MOET 'PERT' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="count(hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]) &gt;= 1">(activitiesComponent1NonBDSData): element hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="count(hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]) &lt;= 1">(activitiesComponent1NonBDSData): element hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10028
Context: *[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]/hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]
Item: (activitiesComponent1NonBDSData)
-->
   <rule fpi="RULC-1"
         context="*[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]/hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]"
         id="d41e10998-false-d85549e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="string(@classCode) = ('CLUSTER') or not(@classCode)">(activitiesComponent1NonBDSData): de waarde van classCode MOET 'CLUSTER' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="string(@moodCode) = ('DEF') or not(@moodCode)">(activitiesComponent1NonBDSData): de waarde van moodCode MOET 'DEF' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="count(hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']) &gt;= 1">(activitiesComponent1NonBDSData): element hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="count(hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']) &lt;= 1">(activitiesComponent1NonBDSData): element hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10028
Context: *[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]/hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]/hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']
Item: (activitiesComponent1NonBDSData)
-->
   <rule fpi="RULC-1"
         context="*[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]/hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]/hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']"
         id="d41e11009-false-d85585e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(activitiesComponent1NonBDSData): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10028-2012-08-01T000000.html"
              test="@nullFlavor or (@codeSystem='2.16.840.1.113883.2.4.4.40.391')">(activitiesComponent1NonBDSData): de elementwaarde MOET een zijn van 'codeSystem '2.16.840.1.113883.2.4.4.40.391''.</assert>
   </rule>
</pattern>
