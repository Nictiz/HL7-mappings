<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.40822
Name: obs Totaalscore SLS
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000">
   <title>obs Totaalscore SLS</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40822
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]]
Item: (obsElement0822)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]]"
         id="d41e76058-false-d959958e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]) &gt;= 1">(obsElement0822): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]) &lt;= 1">(obsElement0822): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40822
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]
Item: (obsElement0822)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]"
         id="d41e76066-false-d959985e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0822): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0822): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="string(@negationInd) = ('false') or not(@negationInd)">(obsElement0822): de waarde van negationInd MOET 'false' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']) &gt;= 1">(obsElement0822): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']) &lt;= 1">(obsElement0822): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '822' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0822): element hl7:code[(@code = '822' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '822' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0822): element hl7:code[(@code = '822' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="count(hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &gt;= 1">(obsElement0822): element hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="count(hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]) &lt;= 1">(obsElement0822): element hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40822
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']
Item: (obsElement0822)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']"
         id="d41e76092-false-d960067e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement0822): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.40822')">(obsElement0822): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.40822' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40822
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]/hl7:code[(@code = '822' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0822)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]/hl7:code[(@code = '822' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e76102-false-d960086e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0822): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="@nullFlavor or (@code='822' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0822): de elementwaarde MOET een zijn van 'code '822' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40822
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]
Item: (obsElement0822)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'INT')]"
         id="d41e76112-false-d960106e0">
      <extends rule="INT"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="not(@value) or matches(@value, '^-?[1-9]\d*$|^+?\d*$')">(obsElement0822): @value is geen geldig INT getal <value-of select="@value"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="@xsi:type">(obsElement0822): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40822-2012-08-01T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(obsElement0822): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40822
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]
Item: (obsElement0822)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40822
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40822']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]
Item: (obsElement0822)
-->
</pattern>