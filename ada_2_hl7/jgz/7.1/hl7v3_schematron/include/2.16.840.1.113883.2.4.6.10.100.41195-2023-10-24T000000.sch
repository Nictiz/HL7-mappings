<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.41195
Name: obs Aanmelding Verwijsindex
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000">
   <title>obs Aanmelding Verwijsindex</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]
Item: (obsElement1195)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]"
         id="d40e63290-false-d464027e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]) &gt;= 1">(obsElement1195): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]) &lt;= 1">(obsElement1195): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]
Item: (obsElement1195)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]"
         id="d40e63300-false-d464054e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement1195): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement1195): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="string(@negationInd) = ('false') or not(@negationInd)">(obsElement1195): de waarde van negationInd MOET 'false' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']) &gt;= 1">(obsElement1195): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']) &lt;= 1">(obsElement1195): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '1195' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement1195): element hl7:code[(@code = '1195' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:code[(@code = '1195' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement1195): element hl7:code[(@code = '1195' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:effectiveTime[not(@nullFlavor)]) &gt;= 1">(obsElement1195): element hl7:effectiveTime[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:effectiveTime[not(@nullFlavor)]) &lt;= 1">(obsElement1195): element hl7:effectiveTime[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:value) &gt;= 1">(obsElement1195): element hl7:value is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:value) &lt;= 1">(obsElement1195): element hl7:value komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]) &gt;= 1">(obsElement1195): element hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]) &lt;= 1">(obsElement1195): element hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']
Item: (obsElement1195)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']"
         id="d40e63341-false-d464166e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement1195): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.41195')">(obsElement1195): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.41195' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:code[(@code = '1195' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement1195)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:code[(@code = '1195' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e63351-false-d464185e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement1195): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="@nullFlavor or (@code='1195' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement1195): de elementwaarde MOET een zijn van 'code '1195' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:effectiveTime[not(@nullFlavor)]
Item: (obsElement1195)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:effectiveTime[not(@nullFlavor)]"
         id="d40e63361-false-d464205e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(obsElement1195): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="not(*)">(obsElement1195): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:value
Item: (obsElement1195)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:value"
         id="d40e63370-false-d464222e0">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(obsElement1195): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="string(@value) = ('true')">(obsElement1195): de waarde van value MOET 'true' zijn. Gevonden: "<value-of select="@value"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]
Item: (obsElement1195)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]"
         id="d40e63380-false-d464241e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="string(@typeCode) = ('PRF') or not(@typeCode)">(obsElement1195): de waarde van typeCode MOET 'PRF' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']) &gt;= 1">(obsElement1195): element hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']) &lt;= 1">(obsElement1195): element hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']
Item: (obsElement1195)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']"
         id="d40e63389-false-d464271e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="string(@classCode) = ('ASSIGNED')">(obsElement1195): de waarde van classCode MOET 'ASSIGNED' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.1'] | hl7:id[@root = '2.16.528.1.1007.5.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = 'NI'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="$elmcount &gt;= 1">(obsElement1195): keuze (hl7:id[@root = '2.16.528.1.1007.3.1']  of  hl7:id[@root = '2.16.528.1.1007.5.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = 'NI']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="$elmcount &lt;= 3">(obsElement1195): keuze (hl7:id[@root = '2.16.528.1.1007.3.1']  of  hl7:id[@root = '2.16.528.1.1007.5.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = 'NI']) bevat te veel elementen [max 3x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.3.1']) &lt;= 1">(obsElement1195): element hl7:id[@root = '2.16.528.1.1007.3.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.5.1']) &lt;= 1">(obsElement1195): element hl7:id[@root = '2.16.528.1.1007.5.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.1']) &lt;= 1">(obsElement1195): element hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &lt;= 1">(obsElement1195): element hl7:id[@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']) &lt;= 1">(obsElement1195): element hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.528.1.1007.3.1']
Item: (obsElement1195)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.528.1.1007.3.1']"
         id="d40e63403-false-d464351e0">
      <extends rule="II.NL.UZI"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement1195): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="string(@root) = ('2.16.528.1.1007.3.1')">(obsElement1195): de waarde van root MOET '2.16.528.1.1007.3.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.528.1.1007.5.1']
Item: (obsElement1195)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.528.1.1007.5.1']"
         id="d40e63411-false-d464370e0">
      <extends rule="II.NL.BIG"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement1195): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="string(@root) = ('2.16.528.1.1007.5.1')">(obsElement1195): de waarde van root MOET '2.16.528.1.1007.5.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']
Item: (obsElement1195)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']"
         id="d40e63419-false-d464389e0">
      <extends rule="II.NL.AGB"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement1195): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.1')">(obsElement1195): de waarde van root MOET '2.16.840.1.113883.2.4.6.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@nullFlavor = 'NI']
Item: (obsElement1195)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:id[@nullFlavor = 'NI']"
         id="d40e63427-false-d464408e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement1195): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="string(@nullFlavor) = ('NI')">(obsElement1195): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']
Item: (obsElement1195)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']"
         id="d40e63436-false-d464427e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="string(@classCode) = ('PSN')">(obsElement1195): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(obsElement1195): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(obsElement1195): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(obsElement1195): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']/hl7:name[not(@nullFlavor)]
Item: (obsElement1195)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:performer[not(@nullFlavor)][hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']/hl7:name[not(@nullFlavor)]"
         id="d40e63445-false-d464463e0">
      <extends rule="TN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41195-2023-10-24T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TN')">(obsElement1195): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]
Item: (obsElement1195)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41195
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]
Item: (obsElement1195)
-->
</pattern>
