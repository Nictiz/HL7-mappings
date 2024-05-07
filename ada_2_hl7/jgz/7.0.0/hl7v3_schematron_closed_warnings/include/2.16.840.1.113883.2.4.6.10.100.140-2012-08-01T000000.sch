<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.140
Name: Bericht 3 Geldige partijnummers (payload)
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000">
   <title>Bericht 3 Geldige partijnummers (payload)</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]"
         id="d40e26435-false-d571852e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]) &gt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]) &lt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]"
         id="d40e26443-false-d571877e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="string(@classCode) = ('LIST') or not(@classCode)">(VersturenGeldigePartijnummers-payload): de waarde van classCode MOET 'LIST' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(VersturenGeldigePartijnummers-payload): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']) &gt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']) &lt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '373873005' and @codeSystem = '2.16.840.1.113883.6.96')]) &gt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:code[(@code = '373873005' and @codeSystem = '2.16.840.1.113883.6.96')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '373873005' and @codeSystem = '2.16.840.1.113883.6.96')]) &lt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:code[(@code = '373873005' and @codeSystem = '2.16.840.1.113883.6.96')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:effectiveTime[not(@nullFlavor)]) &gt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:effectiveTime[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:effectiveTime[not(@nullFlavor)]) &lt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:effectiveTime[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]) &gt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']] is mandatory [min 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']"
         id="d40e26477-false-d571954e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(VersturenGeldigePartijnummers-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.140')">(VersturenGeldigePartijnummers-payload): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.140' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:code[(@code = '373873005' and @codeSystem = '2.16.840.1.113883.6.96')]
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:code[(@code = '373873005' and @codeSystem = '2.16.840.1.113883.6.96')]"
         id="d40e26487-false-d571973e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(VersturenGeldigePartijnummers-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="@nullFlavor or (@code='373873005' and @codeSystem='2.16.840.1.113883.6.96')">(VersturenGeldigePartijnummers-payload): de elementwaarde MOET een zijn van 'code '373873005' codeSystem '2.16.840.1.113883.6.96''.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="@displayName">(VersturenGeldigePartijnummers-payload): attribute @displayName MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="not(@displayName) or string-length(@displayName)&gt;0">(VersturenGeldigePartijnummers-payload): attribuut @displayName MOET datatype 'st' hebben  - '<value-of select="@displayName"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:effectiveTime[not(@nullFlavor)]
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:effectiveTime[not(@nullFlavor)]">
      <extends rule="d572139e0-false-d572145e0"/>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:effectiveTime[not(@nullFlavor)]/hl7:low[not(@nullFlavor)]
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:effectiveTime[not(@nullFlavor)]/hl7:low[not(@nullFlavor)]">
      <extends rule="d572139e17-false-d572200e0"/>
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="(@nullFlavor or (string-length(string(@value))&gt;=14))">(VersturenGeldigePartijnummers-payload): value MOET een stringlengte in bereik [14..*] hebben </assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:effectiveTime[not(@nullFlavor)]/hl7:high[not(@nullFlavor)]
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:effectiveTime[not(@nullFlavor)]/hl7:high[not(@nullFlavor)]">
      <extends rule="d572139e27-false-d572217e0"/>
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="(@nullFlavor or (string-length(string(@value))&gt;=14))">(VersturenGeldigePartijnummers-payload): value MOET een stringlengte in bereik [14..*] hebben </assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:effectiveTime[not(@nullFlavor)]/hl7:center
Item: (VersturenGeldigePartijnummers-payload)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:effectiveTime[not(@nullFlavor)]/hl7:width
Item: (VersturenGeldigePartijnummers-payload)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10244
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:effectiveTime[not(@nullFlavor)]
Item: (Periode-M-Start-M-Eind-M)
-->
   <rule fpi="RULC-1" id="d572139e0-false-d572145e0" abstract="true">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10244-2012-08-01T000000.html"
              test="count(hl7:low[not(@nullFlavor)]) &gt;= 1">(Periode-M-Start-M-Eind-M): element hl7:low[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10244-2012-08-01T000000.html"
              test="count(hl7:low[not(@nullFlavor)]) &lt;= 1">(Periode-M-Start-M-Eind-M): element hl7:low[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10244-2012-08-01T000000.html"
              test="count(hl7:high[not(@nullFlavor)]) &gt;= 1">(Periode-M-Start-M-Eind-M): element hl7:high[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10244-2012-08-01T000000.html"
              test="count(hl7:high[not(@nullFlavor)]) &lt;= 1">(Periode-M-Start-M-Eind-M): element hl7:high[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10244-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(Periode-M-Start-M-Eind-M): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10244-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(Periode-M-Start-M-Eind-M): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10244
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:effectiveTime[not(@nullFlavor)]/hl7:low[not(@nullFlavor)]
Item: (Periode-M-Start-M-Eind-M)
-->
   <rule fpi="RULC-1" id="d572139e17-false-d572200e0" abstract="true">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10244-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(Periode-M-Start-M-Eind-M): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10244-2012-08-01T000000.html"
              test="not(*)">(Periode-M-Start-M-Eind-M): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10244
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:effectiveTime[not(@nullFlavor)]/hl7:high[not(@nullFlavor)]
Item: (Periode-M-Start-M-Eind-M)
-->
   <rule fpi="RULC-1" id="d572139e27-false-d572217e0" abstract="true">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10244-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(Periode-M-Start-M-Eind-M): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10244-2012-08-01T000000.html"
              test="not(*)">(Periode-M-Start-M-Eind-M): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10244
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:effectiveTime[not(@nullFlavor)]/hl7:width
Item: (Periode-M-Start-M-Eind-M)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10244
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:effectiveTime[not(@nullFlavor)]/hl7:center
Item: (Periode-M-Start-M-Eind-M)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]"
         id="d40e26552-false-d572255e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="string(@typeCode) = ('PRD')">(VersturenGeldigePartijnummers-payload): de waarde van typeCode MOET 'PRD' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]) &gt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]) &lt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]"
         id="d40e26569-false-d572285e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="string(@classCode) = ('INST')">(VersturenGeldigePartijnummers-payload): de waarde van classCode MOET 'INST' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]) &gt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]) &lt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:kindOfProduct[@classCode = 'MAT'][@determinerCode = 'KIND']) &lt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:kindOfProduct[@classCode = 'MAT'][@determinerCode = 'KIND'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]"
         id="d40e26586-false-d572324e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="string(@classCode) = ('MMAT')">(VersturenGeldigePartijnummers-payload): de waarde van classCode MOET 'MMAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(VersturenGeldigePartijnummers-payload): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:id) &gt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:id is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:id) &lt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:id komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:expirationTime) &lt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:expirationTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:asInstanceOfKind[hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]) &gt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:asInstanceOfKind[hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:asInstanceOfKind[hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]) &lt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:asInstanceOfKind[hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]/hl7:id
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]/hl7:id"
         id="d40e26606-false-d572386e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(VersturenGeldigePartijnummers-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="@extension and (@root or @nullFlavor='UNC')">(VersturenGeldigePartijnummers-payload): Er MOET tenminste een partijnummer in @extension staan. Het attribuut @root MOET een waarde bevatten of @nullFlavor='UNC'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]/hl7:expirationTime
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]/hl7:expirationTime"
         id="d40e26622-false-d572399e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(VersturenGeldigePartijnummers-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:low) = 0">(VersturenGeldigePartijnummers-payload): element hl7:low MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:high[not(@nullFlavor)]) &gt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:high[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:high[not(@nullFlavor)]) &lt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:high[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]/hl7:expirationTime/hl7:low
Item: (VersturenGeldigePartijnummers-payload)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]/hl7:expirationTime/hl7:high[not(@nullFlavor)]
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]/hl7:expirationTime/hl7:high[not(@nullFlavor)]"
         id="d40e26642-false-d572444e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(VersturenGeldigePartijnummers-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="not(*)">(VersturenGeldigePartijnummers-payload): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]/hl7:asInstanceOfKind[hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]/hl7:asInstanceOfKind[hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]"
         id="d40e26656-false-d572463e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="string(@classCode) = ('INST')">(VersturenGeldigePartijnummers-payload): de waarde van classCode MOET 'INST' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]) &gt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]) &lt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]/hl7:asInstanceOfKind[hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]/hl7:asInstanceOfKind[hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]"
         id="d40e26673-false-d572497e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="string(@classCode) = ('MAT')">(VersturenGeldigePartijnummers-payload): de waarde van classCode MOET 'MAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="string(@determinerCode) = ('KIND')">(VersturenGeldigePartijnummers-payload): de waarde van determinerCode MOET 'KIND' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <report fpi="CD-UNKN-BSP"
              role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt; 1">(VersturenGeldigePartijnummers-payload): element hl7:code is gecodeerd met bindingssterkte 'CWE' en bevat een code buiten de gespecificeerde set.</report>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]/hl7:asInstanceOfKind[hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:productInstanceInstance[not(@nullFlavor)][@classCode = 'MMAT'][@determinerCode = 'INSTANCE'][hl7:asInstanceOfKind[@classCode = 'INST']]/hl7:asInstanceOfKind[hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:kindOfMaterialKind[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d40e26693-false-d572536e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(VersturenGeldigePartijnummers-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(VersturenGeldigePartijnummers-payload): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.422 W0422 Soort vaccinatie (HL7) (2016-12-09T00:00:00)'.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="not(@code) or @displayName">(VersturenGeldigePartijnummers-payload): 
                                            <name path=".."/>/<name/>/@displayName MOET de weergavenaam bevatten</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:kindOfProduct[@classCode = 'MAT'][@determinerCode = 'KIND']
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:kindOfProduct[@classCode = 'MAT'][@determinerCode = 'KIND']"
         id="d40e26719-false-d572558e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="string(@classCode) = ('MAT')">(VersturenGeldigePartijnummers-payload): de waarde van classCode MOET 'MAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="string(@determinerCode) = ('KIND')">(VersturenGeldigePartijnummers-payload): de waarde van determinerCode MOET 'KIND' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:code) &gt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:code is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="count(hl7:code) &lt;= 1">(VersturenGeldigePartijnummers-payload): element hl7:code komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.140
Context: *[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:kindOfProduct[@classCode = 'MAT'][@determinerCode = 'KIND']/hl7:code
Item: (VersturenGeldigePartijnummers-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]]/hl7:ProductList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.140']]/hl7:product[not(@nullFlavor)][@typeCode = 'PRD'][hl7:instanceOfKind[@classCode = 'INST']]/hl7:instanceOfKind[not(@nullFlavor)][@classCode = 'INST'][hl7:productInstanceInstance[@classCode = 'MMAT'][@determinerCode = 'INSTANCE']]/hl7:kindOfProduct[@classCode = 'MAT'][@determinerCode = 'KIND']/hl7:code"
         id="d40e26736-false-d572594e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(VersturenGeldigePartijnummers-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('OTH') or not(@nullFlavor)">(VersturenGeldigePartijnummers-payload): de waarde van nullFlavor MOET 'OTH' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="@nullFlavor or (@code and @codeSystem and @displayName)">(VersturenGeldigePartijnummers-payload): Als er geen @nullFlavor is, dan MOETEN @code, @codeSystem én @displayName een waarde bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.140-2012-08-01T000000.html"
              test="not(@nullFlavor) or (@nullFlavor='OTH' and hl7:originalText)">(VersturenGeldigePartijnummers-payload): Als er een @nullFlavor is dan MOET de waarde 'OTH' zijn en MOET originalText de omschrijving bevatten.</assert>
   </rule>
</pattern>
