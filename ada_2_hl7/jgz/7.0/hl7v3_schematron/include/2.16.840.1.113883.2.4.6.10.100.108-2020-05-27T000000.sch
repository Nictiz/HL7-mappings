<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.108
Name: R_PatientNL - Voor- of buitenschoolse voorzieningen
Description: Rubriek 8: Voor- of buitenschoolse voorzieningen
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000">
   <title>R_PatientNL - Voor- of buitenschoolse voorzieningen</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]"
         id="d41e16778-false-d89217e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]) &gt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]"
         id="d41e16789-false-d89252e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="string(@classCode) = ('PCPR')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de waarde van classCode MOET 'PCPR' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']) &gt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <let name="elmcount"
           value="count(hl7:effectiveTime[@xsi:type='IVL_TS'] | hl7:effectiveTime[@xsi:type='SXPR_TS'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="$elmcount &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): keuze (hl7:effectiveTime[@xsi:type='IVL_TS']  of  hl7:effectiveTime[@xsi:type='SXPR_TS']) bevat te veel elementen [max 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]) &gt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']"
         id="d41e16845-false-d89335e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.108')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.108' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e16855-false-d89356e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.72 W0072 Soort voorschoolse voorzieningen (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.72-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.72 W0072 Soort voorschoolse voorzieningen (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10259
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='IVL_TS']
Item: (PeriodeGeldigheidVSVofBSV)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='IVL_TS']"
         id="d89377e6-false-d89383e0">
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
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low
Item: (PeriodeGeldigheidVSVofBSV)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low"
         id="d89377e45-false-d89454e0">
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
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high
Item: (PeriodeGeldigheidVSVofBSV)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high"
         id="d89377e64-false-d89477e0">
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
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:width
Item: (PeriodeGeldigheidVSVofBSV)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10259
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:center
Item: (PeriodeGeldigheidVSVofBSV)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']"
         id="d89512e6-false-d89518e0">
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
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]"
         id="d89512e42-false-d89561e0">
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
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]/hl7:low
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]/hl7:low"
         id="d89512e48-false-d89604e0">
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
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]/hl7:high
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]/hl7:high"
         id="d89512e67-false-d89627e0">
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
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]/hl7:width
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='IVL_TS'][not(@nullFlavor)]/hl7:center
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]"
         id="d89512e94-false-d89666e0">
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
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:phase[not(@nullFlavor)]
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:phase[not(@nullFlavor)]"
         id="d89512e103-false-d89715e0">
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
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:phase[not(@nullFlavor)]/hl7:width[not(@nullFlavor)]
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:phase[not(@nullFlavor)]/hl7:width[not(@nullFlavor)]"
         id="d89512e110-false-d89767e0">
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
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:phase[not(@nullFlavor)]/hl7:low
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:phase[not(@nullFlavor)]/hl7:high
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:phase[not(@nullFlavor)]/hl7:center
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10267
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:period[not(@nullFlavor)]
Item: (PeriodeGeldigheidVSVofBSVMetDagdelen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:effectiveTime[@xsi:type='SXPR_TS']/hl7:comp[@xsi:type='PIVL_TS'][not(@nullFlavor)]/hl7:period[not(@nullFlavor)]"
         id="d89512e126-false-d89827e0">
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
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]"
         id="d41e16883-false-d89868e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="string(@typeCode) = ('PRF')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de waarde van typeCode MOET 'PRF' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']) &gt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']"
         id="d41e16892-false-d89902e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="string(@classCode) = ('ASSIGNED')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de waarde van classCode MOET 'ASSIGNED' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &gt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:id[@nullFlavor = 'NI'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:id[@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@nullFlavor = 'NI']
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@nullFlavor = 'NI']"
         id="d41e16898-false-d89943e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('NI')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']"
         id="d41e16908-false-d89964e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="string(@classCode) = ('ORG')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &gt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:id[@nullFlavor = 'NI'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:id[@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:name) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:name komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@nullFlavor = 'NI']
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@nullFlavor = 'NI']"
         id="d41e16919-false-d90015e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('NI')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:name
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:name"
         id="d41e16930-false-d90034e0">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]"
         id="d41e16938-false-d90049e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="string(@classCode) = ('CON')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de waarde van classCode MOET 'CON' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:code[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:code[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:telecom[not(contains(@value, '@'))]) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:telecom[not(contains(@value, '@'))] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:telecom[contains(@value, '@')]) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:telecom[contains(@value, '@')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)][@classCode = 'PSN'][@determinerCode = 'INSTANCE']) &gt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:contactPerson[not(@nullFlavor)][@classCode = 'PSN'][@determinerCode = 'INSTANCE'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)][@classCode = 'PSN'][@determinerCode = 'INSTANCE']) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:contactPerson[not(@nullFlavor)][@classCode = 'PSN'][@determinerCode = 'INSTANCE'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:code[@nullFlavor = 'OTH']
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:code[@nullFlavor = 'OTH']"
         id="d41e16947-false-d90117e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d41e16954-false-d90151e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:telecom[not(contains(@value, '@'))]
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:telecom[not(contains(@value, '@'))]"
         id="d41e16964-false-d90162e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:telecom[contains(@value, '@')]
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:telecom[contains(@value, '@')]"
         id="d41e16972-false-d90179e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10260
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:effectiveTime
Item: (PeriodeGeldigheidContactpersoonVoorOfBuitenschools)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:effectiveTime"
         id="d90192e6-false-d90200e0">
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
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:effectiveTime/hl7:low
Item: (PeriodeGeldigheidContactpersoonVoorOfBuitenschools)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:effectiveTime/hl7:low"
         id="d90192e45-false-d90265e0">
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
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:effectiveTime/hl7:high
Item: (PeriodeGeldigheidContactpersoonVoorOfBuitenschools)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:effectiveTime/hl7:high"
         id="d90192e64-false-d90288e0">
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
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:effectiveTime/hl7:width
Item: (PeriodeGeldigheidContactpersoonVoorOfBuitenschools)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10260
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:effectiveTime/hl7:center
Item: (PeriodeGeldigheidContactpersoonVoorOfBuitenschools)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:contactPerson[not(@nullFlavor)][@classCode = 'PSN'][@determinerCode = 'INSTANCE']
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:contactPerson[not(@nullFlavor)][@classCode = 'PSN'][@determinerCode = 'INSTANCE']"
         id="d41e16990-false-d90329e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="string(@classCode) = ('PSN')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:name) &gt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:name is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="count(hl7:name) &lt;= 1">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): element hl7:name komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.108
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:contactPerson[not(@nullFlavor)][@classCode = 'PSN'][@determinerCode = 'INSTANCE']/hl7:name
Item: (R_PatientNL-Voor-of-buitenschoolse-voorzieningen)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.108']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']]/hl7:contactPerson[not(@nullFlavor)][@classCode = 'PSN'][@determinerCode = 'INSTANCE']/hl7:name"
         id="d41e17001-false-d90365e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.108-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(R_PatientNL-Voor-of-buitenschoolse-voorzieningen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
</pattern>
