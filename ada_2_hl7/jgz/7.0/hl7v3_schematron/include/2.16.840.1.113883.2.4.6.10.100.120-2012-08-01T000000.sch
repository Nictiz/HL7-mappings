<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.120
Name: A_ZorgPlan [universal]
Description: COCT_RM900918NL: Gegevens over een zorgplan
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000">
   <title>A_ZorgPlan [universal]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]"
         id="d41e34671-false-d782479e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]) &gt;= 1">(A_ZorgPlan-universal): element hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]) &lt;= 1">(A_ZorgPlan-universal): element hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]"
         id="d41e34682-false-d782506e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@classCode) = ('PCPR') or not(@classCode)">(A_ZorgPlan-universal): de waarde van classCode MOET 'PCPR' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@moodCode) = ('INT') or not(@moodCode)">(A_ZorgPlan-universal): de waarde van moodCode MOET 'INT' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']) &gt;= 1">(A_ZorgPlan-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']) &lt;= 1">(A_ZorgPlan-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:id) &lt;= 1">(A_ZorgPlan-universal): element hl7:id komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'G081' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &gt;= 1">(A_ZorgPlan-universal): element hl7:code[(@code = 'G081' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'G081' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &lt;= 1">(A_ZorgPlan-universal): element hl7:code[(@code = 'G081' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:effectiveTime) &lt;= 1">(A_ZorgPlan-universal): element hl7:effectiveTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:finalGoal[hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_ZorgPlan-universal): element hl7:finalGoal[hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &gt;= 1">(A_ZorgPlan-universal): element hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_ZorgPlan-universal): element hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:pertinentInformation[hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_ZorgPlan-universal): element hl7:pertinentInformation[hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:component[hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_ZorgPlan-universal): element hl7:component[hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']"
         id="d41e34775-false-d782623e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.120')">(A_ZorgPlan-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.120' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:id
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:id"
         id="d41e34785-false-d782642e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:code[(@code = 'G081' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:code[(@code = 'G081' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]"
         id="d41e34793-false-d782655e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="@nullFlavor or (@code='G081' and @codeSystem='2.16.840.1.113883.2.4.4.40.393')">(A_ZorgPlan-universal): de elementwaarde MOET een zijn van 'code 'G081' codeSystem '2.16.840.1.113883.2.4.4.40.393''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10265
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:effectiveTime
Item: (PeriodeZorgOpMaat)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:effectiveTime"
         id="d782669e6-false-d782677e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10265-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeZorgOpMaat): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10265-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeZorgOpMaat): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10265-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeZorgOpMaat): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10265-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeZorgOpMaat): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10265-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeZorgOpMaat): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10265-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeZorgOpMaat): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10265-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeZorgOpMaat): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10265
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:effectiveTime/hl7:low
Item: (PeriodeZorgOpMaat)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:effectiveTime/hl7:low"
         id="d782669e43-false-d782742e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10265-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeZorgOpMaat): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10265-2012-08-01T000000.html"
              test="not(*)">(PeriodeZorgOpMaat): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10265-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeZorgOpMaat): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10265
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:effectiveTime/hl7:high
Item: (PeriodeZorgOpMaat)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:effectiveTime/hl7:high"
         id="d782669e62-false-d782765e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10265-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeZorgOpMaat): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10265-2012-08-01T000000.html"
              test="not(*)">(PeriodeZorgOpMaat): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10265-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeZorgOpMaat): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10265
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:effectiveTime/hl7:width
Item: (PeriodeZorgOpMaat)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10265
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:effectiveTime/hl7:center
Item: (PeriodeZorgOpMaat)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:finalGoal[hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:finalGoal[hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e34808-false-d782806e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@typeCode) = ('OBJF') or not(@typeCode)">(A_ZorgPlan-universal): de waarde van typeCode MOET 'OBJF' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_ZorgPlan-universal): element hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_ZorgPlan-universal): element hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:finalGoal[hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:finalGoal[hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e34817-false-d782836e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_ZorgPlan-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@moodCode) = ('GOL') or not(@moodCode)">(A_ZorgPlan-universal): de waarde van moodCode MOET 'GOL' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_ZorgPlan-universal): element hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_ZorgPlan-universal): element hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(A_ZorgPlan-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(A_ZorgPlan-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:finalGoal[hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:finalGoal[hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e34828-false-d782887e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1154' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_ZorgPlan-universal): de elementwaarde MOET een zijn van 'code '1154' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:finalGoal[hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:finalGoal[hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationGoal[hl7:code[(@code = '1154' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]"
         id="d41e34839-false-d782907e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="(@nullFlavor or (string-length(string(text()))&gt;=1))">(A_ZorgPlan-universal): value MOET een stringlengte in bereik [1..*] hebben </assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e34851-false-d782934e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@typeCode) = ('SUBJ') or not(@typeCode)">(A_ZorgPlan-universal): de waarde van typeCode MOET 'SUBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@contextControlCode) = ('AN') or not(@contextControlCode)">(A_ZorgPlan-universal): de waarde van contextControlCode MOET 'AN' zijn. Gevonden: "<value-of select="@contextControlCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@contextConductionInd) = ('true') or not(@contextConductionInd)">(A_ZorgPlan-universal): de waarde van contextConductionInd MOET 'true' zijn. Gevonden: "<value-of select="@contextConductionInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_ZorgPlan-universal): element hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_ZorgPlan-universal): element hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e34867-false-d782976e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_ZorgPlan-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_ZorgPlan-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_ZorgPlan-universal): element hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_ZorgPlan-universal): element hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:text[not(@nullFlavor)]) &gt;= 1">(A_ZorgPlan-universal): element hl7:text[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:text[not(@nullFlavor)]) &lt;= 1">(A_ZorgPlan-universal): element hl7:text[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:reasonOf[hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_ZorgPlan-universal): element hl7:reasonOf[hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:subjectOf[hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_ZorgPlan-universal): element hl7:subjectOf[hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e34878-false-d783045e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1151' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_ZorgPlan-universal): de elementwaarde MOET een zijn van 'code '1151' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:text[not(@nullFlavor)]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:text[not(@nullFlavor)]"
         id="d41e34889-false-d783065e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:reasonOf[hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:reasonOf[hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e34897-false-d783078e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_ZorgPlan-universal): element hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_ZorgPlan-universal): element hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:reasonOf[hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:reasonOf[hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e34904-false-d783102e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_ZorgPlan-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_ZorgPlan-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_ZorgPlan-universal): element hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_ZorgPlan-universal): element hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:text[not(@nullFlavor)]) &gt;= 1">(A_ZorgPlan-universal): element hl7:text[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:text[not(@nullFlavor)]) &lt;= 1">(A_ZorgPlan-universal): element hl7:text[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:reasonOf[hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:reasonOf[hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e34915-false-d783153e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1152' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_ZorgPlan-universal): de elementwaarde MOET een zijn van 'code '1152' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:reasonOf[hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:text[not(@nullFlavor)]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:reasonOf[hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:condition[hl7:code[(@code = '1152' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:text[not(@nullFlavor)]"
         id="d41e34926-false-d783173e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e34936-false-d783186e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@typeCode) = ('SUBJ') or not(@typeCode)">(A_ZorgPlan-universal): de waarde van typeCode MOET 'SUBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_ZorgPlan-universal): element hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_ZorgPlan-universal): element hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e34945-false-d783216e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_ZorgPlan-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_ZorgPlan-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_ZorgPlan-universal): element hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_ZorgPlan-universal): element hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:text[not(@nullFlavor)]) &gt;= 1">(A_ZorgPlan-universal): element hl7:text[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:text[not(@nullFlavor)]) &lt;= 1">(A_ZorgPlan-universal): element hl7:text[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e34956-false-d783267e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1153' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_ZorgPlan-universal): de elementwaarde MOET een zijn van 'code '1153' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:text[not(@nullFlavor)]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:subject[hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:problem[hl7:code[(@code = '1151' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:subjectOf[hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:symptom[hl7:code[(@code = '1153' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:text[not(@nullFlavor)]"
         id="d41e34967-false-d783287e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:pertinentInformation[hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:pertinentInformation[hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e34980-false-d783300e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@typeCode) = ('PERT') or not(@typeCode)">(A_ZorgPlan-universal): de waarde van typeCode MOET 'PERT' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_ZorgPlan-universal): element hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_ZorgPlan-universal): element hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:pertinentInformation[hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:pertinentInformation[hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e34989-false-d783330e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_ZorgPlan-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_ZorgPlan-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_ZorgPlan-universal): element hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_ZorgPlan-universal): element hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(A_ZorgPlan-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(A_ZorgPlan-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:pertinentInformation[hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:pertinentInformation[hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35000-false-d783381e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1156' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_ZorgPlan-universal): de elementwaarde MOET een zijn van 'code '1156' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:pertinentInformation[hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:pertinentInformation[hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:evaluationEvent[hl7:code[(@code = '1156' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]"
         id="d41e35011-false-d783401e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="(@nullFlavor or (string-length(string(text()))&gt;=1))">(A_ZorgPlan-universal): value MOET een stringlengte in bereik [1..*] hebben </assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:component[hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:component[hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e35023-false-d783428e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(A_ZorgPlan-universal): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_ZorgPlan-universal): element hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_ZorgPlan-universal): element hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:component[hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:component[hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e35032-false-d783458e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_ZorgPlan-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="string(@moodCode) = ('INT') or not(@moodCode)">(A_ZorgPlan-universal): de waarde van moodCode MOET 'INT' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_ZorgPlan-universal): element hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_ZorgPlan-universal): element hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(A_ZorgPlan-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(A_ZorgPlan-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:component[hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:component[hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e35049-false-d783509e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="@nullFlavor or (@code='1155' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_ZorgPlan-universal): de elementwaarde MOET een zijn van 'code '1155' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.120
Context: *[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:component[hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]
Item: (A_ZorgPlan-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]]/hl7:carePlan[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.120']]/hl7:component[hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationIntent[hl7:code[(@code = '1155' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]"
         id="d41e35059-false-d783529e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_ZorgPlan-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.120-2012-08-01T000000.html"
              test="(@nullFlavor or (string-length(string(text()))&gt;=1))">(A_ZorgPlan-universal): value MOET een stringlengte in bereik [1..*] hebben </assert>
   </rule>
</pattern>
