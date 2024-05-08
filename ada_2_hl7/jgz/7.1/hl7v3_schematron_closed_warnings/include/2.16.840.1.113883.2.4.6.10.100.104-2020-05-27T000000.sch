<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.104
Name: R_PatientNL - Huisarts
Description: Rubriek 6: Huisartsgegevens
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000">
   <title>R_PatientNL - Huisarts</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]"
         id="d40e8933-false-d34041e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]) &gt;= 1">(R_PatientNL-Huisarts): element hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]) &lt;= 1">(R_PatientNL-Huisarts): element hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]"
         id="d40e8944-false-d34068e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="string(@classCode) = ('PCPR')">(R_PatientNL-Huisarts): de waarde van classCode MOET 'PCPR' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN')">(R_PatientNL-Huisarts): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']) &gt;= 1">(R_PatientNL-Huisarts): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']) &lt;= 1">(R_PatientNL-Huisarts): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'GENRL' and @codeSystem = '2.16.840.1.113883.5.4') or @nullFlavor]) &gt;= 1">(R_PatientNL-Huisarts): element hl7:code[(@code = 'GENRL' and @codeSystem = '2.16.840.1.113883.5.4') or @nullFlavor] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'GENRL' and @codeSystem = '2.16.840.1.113883.5.4') or @nullFlavor]) &lt;= 1">(R_PatientNL-Huisarts): element hl7:code[(@code = 'GENRL' and @codeSystem = '2.16.840.1.113883.5.4') or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:effectiveTime[@xsi:type='IVL_TS']) &lt;= 1">(R_PatientNL-Huisarts): element hl7:effectiveTime[@xsi:type='IVL_TS'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]) &gt;= 1">(R_PatientNL-Huisarts): element hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]) &lt;= 1">(R_PatientNL-Huisarts): element hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']"
         id="d40e8992-false-d34147e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Huisarts): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.104')">(R_PatientNL-Huisarts): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.104' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:code[(@code = 'GENRL' and @codeSystem = '2.16.840.1.113883.5.4') or @nullFlavor]
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:code[(@code = 'GENRL' and @codeSystem = '2.16.840.1.113883.5.4') or @nullFlavor]"
         id="d40e9002-false-d34166e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(R_PatientNL-Huisarts): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="@nullFlavor or (@code='GENRL' and @codeSystem='2.16.840.1.113883.5.4')">(R_PatientNL-Huisarts): de elementwaarde MOET een zijn van 'code 'GENRL' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10255
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:effectiveTime[@xsi:type='IVL_TS']
Item: (PeriodeGeldigheidHuisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:effectiveTime[@xsi:type='IVL_TS']"
         id="d34180e6-false-d34186e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="@xsi:type">(PeriodeGeldigheidHuisarts): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(PeriodeGeldigheidHuisarts): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeGeldigheidHuisarts): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeGeldigheidHuisarts): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeGeldigheidHuisarts): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeGeldigheidHuisarts): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeGeldigheidHuisarts): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeGeldigheidHuisarts): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10255
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low
Item: (PeriodeGeldigheidHuisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low"
         id="d34180e45-false-d34257e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidHuisarts): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidHuisarts): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidHuisarts): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10255
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high
Item: (PeriodeGeldigheidHuisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high"
         id="d34180e64-false-d34280e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeGeldigheidHuisarts): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="not(*)">(PeriodeGeldigheidHuisarts): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10255-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeGeldigheidHuisarts): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10255
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:width
Item: (PeriodeGeldigheidHuisarts)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10255
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:center
Item: (PeriodeGeldigheidHuisarts)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]"
         id="d40e9018-false-d34321e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="string(@typeCode) = ('PRF')">(R_PatientNL-Huisarts): de waarde van typeCode MOET 'PRF' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']) &gt;= 1">(R_PatientNL-Huisarts): element hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']) &lt;= 1">(R_PatientNL-Huisarts): element hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']"
         id="d40e9027-false-d34351e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="string(@classCode) = ('ASSIGNED')">(R_PatientNL-Huisarts): de waarde van classCode MOET 'ASSIGNED' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.1'] | hl7:id[@root = '2.16.528.1.1007.5.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = 'NI'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="$elmcount &gt;= 1">(R_PatientNL-Huisarts): keuze (hl7:id[@root = '2.16.528.1.1007.3.1']  of  hl7:id[@root = '2.16.528.1.1007.5.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = 'NI']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="$elmcount &lt;= 3">(R_PatientNL-Huisarts): keuze (hl7:id[@root = '2.16.528.1.1007.3.1']  of  hl7:id[@root = '2.16.528.1.1007.5.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = 'NI']) bevat te veel elementen [max 3x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.3.1']) &lt;= 1">(R_PatientNL-Huisarts): element hl7:id[@root = '2.16.528.1.1007.3.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.5.1']) &lt;= 1">(R_PatientNL-Huisarts): element hl7:id[@root = '2.16.528.1.1007.5.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.1']) &lt;= 1">(R_PatientNL-Huisarts): element hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &lt;= 1">(R_PatientNL-Huisarts): element hl7:id[@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']) &lt;= 1">(R_PatientNL-Huisarts): element hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.528.1.1007.3.1']
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.528.1.1007.3.1']"
         id="d40e9038-false-d34431e0">
      <extends rule="II.NL.UZI"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Huisarts): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="string(@root) = ('2.16.528.1.1007.3.1')">(R_PatientNL-Huisarts): de waarde van root MOET '2.16.528.1.1007.3.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.528.1.1007.5.1']
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.528.1.1007.5.1']"
         id="d40e9046-false-d34450e0">
      <extends rule="II.NL.BIG"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Huisarts): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="string(@root) = ('2.16.528.1.1007.5.1')">(R_PatientNL-Huisarts): de waarde van root MOET '2.16.528.1.1007.5.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']"
         id="d40e9054-false-d34469e0">
      <extends rule="II.NL.AGB"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Huisarts): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.1')">(R_PatientNL-Huisarts): de waarde van root MOET '2.16.840.1.113883.2.4.6.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@nullFlavor = 'NI']
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@nullFlavor = 'NI']"
         id="d40e9062-false-d34488e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Huisarts): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('NI')">(R_PatientNL-Huisarts): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']"
         id="d40e9073-false-d34507e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="string(@classCode) = ('ORG')">(R_PatientNL-Huisarts): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(R_PatientNL-Huisarts): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = 'NI'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="$elmcount &lt;= 2">(R_PatientNL-Huisarts): keuze (hl7:id[@root = '2.16.528.1.1007.3.3']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = 'NI']) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.3.3']) &lt;= 1">(R_PatientNL-Huisarts): element hl7:id[@root = '2.16.528.1.1007.3.3'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.1']) &lt;= 1">(R_PatientNL-Huisarts): element hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &lt;= 1">(R_PatientNL-Huisarts): element hl7:id[@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="count(hl7:name) &lt;= 1">(R_PatientNL-Huisarts): element hl7:name komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.528.1.1007.3.3']
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.528.1.1007.3.3']"
         id="d40e9089-false-d34578e0">
      <extends rule="II.NL.URA"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Huisarts): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="string(@root) = ('2.16.528.1.1007.3.3')">(R_PatientNL-Huisarts): de waarde van root MOET '2.16.528.1.1007.3.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']"
         id="d40e9097-false-d34597e0">
      <extends rule="II.NL.AGB"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Huisarts): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.1')">(R_PatientNL-Huisarts): de waarde van root MOET '2.16.840.1.113883.2.4.6.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@nullFlavor = 'NI']
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@nullFlavor = 'NI']"
         id="d40e9105-false-d34616e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_PatientNL-Huisarts): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('NI')">(R_PatientNL-Huisarts): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.104
Context: *[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:name
Item: (R_PatientNL-Huisarts)
-->
   <rule fpi="RULC-1"
         context="*[hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]]/hl7:careProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.104']]/hl7:performer[not(@nullFlavor)][@typeCode = 'PRF'][hl7:assignedProvider[@classCode = 'ASSIGNED']]/hl7:assignedProvider[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:name"
         id="d40e9117-false-d34635e0">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.104-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(R_PatientNL-Huisarts): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
</pattern>
