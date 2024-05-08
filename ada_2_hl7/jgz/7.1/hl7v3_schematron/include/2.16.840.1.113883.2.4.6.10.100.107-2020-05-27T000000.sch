<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.107
Name: R_PatientNL - Andere organisaties/hulpverleners
Description: Rubriek 7: Andere organisaties/hulpverleners
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000">
   <title>R_PatientNL - Andere organisaties/hulpverleners</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]"
         id="d40e9314-false-d33749e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]) &gt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]"
         id="d40e9325-false-d33780e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@classCode) = ('PCPR')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van classCode MOET 'PCPR' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']) &gt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'G082' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393') or @nullFlavor]) &gt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:code[(@code = 'G082' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393') or @nullFlavor] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'G082' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393') or @nullFlavor]) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:code[(@code = 'G082' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393') or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:effectiveTime[@xsi:type='IVL_TS']) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:effectiveTime[@xsi:type='IVL_TS'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]) &gt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']"
         id="d40e9385-false-d33861e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.107')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.107' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:code[(@code = 'G082' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393') or @nullFlavor]
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:code[(@code = 'G082' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393') or @nullFlavor]"
         id="d40e9396-false-d33880e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="@nullFlavor or (@code='G082' and @codeSystem='2.16.840.1.113883.2.4.4.40.393')">(R_PatientNL-Andere-organisaties-hulpverleners): de elementwaarde MOET een zijn van 'code 'G082' codeSystem '2.16.840.1.113883.2.4.4.40.393''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10256
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:effectiveTime[@xsi:type='IVL_TS']
Item: (PeriodeGeldigheidAndereOrganisatiesHulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:effectiveTime[@xsi:type='IVL_TS']"
         id="d33894e6-false-d33900e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="@xsi:type">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10256
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low
Item: (PeriodeGeldigheidAndereOrganisatiesHulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low"
         id="d33894e45-false-d33971e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10256
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high
Item: (PeriodeGeldigheidAndereOrganisatiesHulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high"
         id="d33894e64-false-d33994e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10256-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidAndereOrganisatiesHulpverleners): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10256
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:width
Item: (PeriodeGeldigheidAndereOrganisatiesHulpverleners)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10256
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:center
Item: (PeriodeGeldigheidAndereOrganisatiesHulpverleners)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]"
         id="d40e9414-false-d34037e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@typeCode) = ('PRF')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van typeCode MOET 'PRF' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:assignedProvider[@classCode = 'ASSIGNED']) &gt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:assignedProvider[@classCode = 'ASSIGNED'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:assignedProvider[@classCode = 'ASSIGNED']) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:assignedProvider[@classCode = 'ASSIGNED'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']"
         id="d40e9423-false-d34071e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@classCode) = ('ASSIGNED')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van classCode MOET 'ASSIGNED' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.1'] | hl7:id[@root = '2.16.528.1.1007.5.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = 'NI'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="$elmcount &gt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): keuze (hl7:id[@root = '2.16.528.1.1007.3.1']  of  hl7:id[@root = '2.16.528.1.1007.5.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = 'NI']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="$elmcount &lt;= 3">(R_PatientNL-Andere-organisaties-hulpverleners): keuze (hl7:id[@root = '2.16.528.1.1007.3.1']  of  hl7:id[@root = '2.16.528.1.1007.5.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = 'NI']) bevat te veel elementen [max 3x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.3.1']) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:id[@root = '2.16.528.1.1007.3.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.5.1']) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:id[@root = '2.16.528.1.1007.5.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.1']) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:id[@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.528.1.1007.3.1']
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.528.1.1007.3.1']"
         id="d40e9434-false-d34153e0">
      <extends rule="II.NL.UZI"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@root) = ('2.16.528.1.1007.3.1')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van root MOET '2.16.528.1.1007.3.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.528.1.1007.5.1']
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.528.1.1007.5.1']"
         id="d40e9442-false-d34172e0">
      <extends rule="II.NL.BIG"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@root) = ('2.16.528.1.1007.5.1')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van root MOET '2.16.528.1.1007.5.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']"
         id="d40e9450-false-d34191e0">
      <extends rule="II.NL.AGB"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.1')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van root MOET '2.16.840.1.113883.2.4.6.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:id[@nullFlavor = 'NI']
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:id[@nullFlavor = 'NI']"
         id="d40e9458-false-d34210e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('NI')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']"
         id="d40e9469-false-d34231e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@classCode) = ('ORG')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = 'NI'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="$elmcount &lt;= 2">(R_PatientNL-Andere-organisaties-hulpverleners): keuze (hl7:id[@root = '2.16.528.1.1007.3.3']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = 'NI']) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.3.3']) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:id[@root = '2.16.528.1.1007.3.3'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.1']) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:id[@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:name) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:name komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.528.1.1007.3.3']
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.528.1.1007.3.3']"
         id="d40e9485-false-d34308e0">
      <extends rule="II.NL.URA"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@root) = ('2.16.528.1.1007.3.3')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van root MOET '2.16.528.1.1007.3.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']"
         id="d40e9493-false-d34327e0">
      <extends rule="II.NL.AGB"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.1')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van root MOET '2.16.840.1.113883.2.4.6.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@nullFlavor = 'NI']
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@nullFlavor = 'NI']"
         id="d40e9501-false-d34346e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('NI')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:name
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:name"
         id="d40e9513-false-d34365e0">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]"
         id="d40e9521-false-d34380e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@classCode) = ('CON')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van classCode MOET 'CON' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:code[@nullFlavor = 'OTH']) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:code[@nullFlavor = 'OTH'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:telecom[not(contains(@value, '@'))]) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:telecom[not(contains(@value, '@'))] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:telecom[contains(@value, '@')]) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:telecom[contains(@value, '@')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:contactPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:contactPerson[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:contactPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']"
         id="d40e9530-false-d34448e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('OTH')">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &gt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:originalText[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:originalText[not(@nullFlavor)]) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:originalText[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:code[@nullFlavor = 'OTH']/hl7:originalText[not(@nullFlavor)]"
         id="d40e9537-false-d34482e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:telecom[not(contains(@value, '@'))]
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:telecom[not(contains(@value, '@'))]"
         id="d40e9547-false-d34493e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-Andere-organisaties-hulpverleners): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:telecom[contains(@value, '@')]
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:telecom[contains(@value, '@')]"
         id="d40e9555-false-d34510e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="not(@use) or string-length(@use) &gt; 0">(R_PatientNL-Andere-organisaties-hulpverleners): attribuut @use MOET datatype 'set_cs' hebben  - '<value-of select="@use"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10257
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime
Item: (PeriodeGeldigheidContactpersoonOrganisatieHulpverl)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime"
         id="d34523e6-false-d34531e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10257
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:low
Item: (PeriodeGeldigheidContactpersoonOrganisatieHulpverl)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:low"
         id="d34523e45-false-d34596e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10257
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:high
Item: (PeriodeGeldigheidContactpersoonOrganisatieHulpverl)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:high"
         id="d34523e64-false-d34619e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10257-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidContactpersoonOrganisatieHulpverl): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10257
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:width
Item: (PeriodeGeldigheidContactpersoonOrganisatieHulpverl)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10257
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:effectiveTime/hl7:center
Item: (PeriodeGeldigheidContactpersoonOrganisatieHulpverl)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]"
         id="d40e9573-false-d34660e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(R_PatientNL-Andere-organisaties-hulpverleners): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:name) &gt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:name is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="count(hl7:name) &lt;= 1">(R_PatientNL-Andere-organisaties-hulpverleners): element hl7:name komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.107
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name
Item: (R_PatientNL-Andere-organisaties-hulpverleners)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.107']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:contactParty[@classCode = 'CON'][hl7:contactPerson]/hl7:contactPerson[not(@nullFlavor)]/hl7:name"
         id="d40e9584-false-d34696e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.107-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(R_PatientNL-Andere-organisaties-hulpverleners): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
</pattern>
