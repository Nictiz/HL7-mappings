<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.11052
Name: Rubriek 52 Meldingen
Description: Vastleggen van meldingen aan derden. Wijzigingen ten opzichte van 2012 versie:  
                     Verwijzingen naar de onderliggende templates zijn bijgewerkt. 
                     jgz-issue-177: Groep G074 kan nu zowel aan- als afmelding verwijsindex bevatten. 
                 
            
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000">
   <title>Rubriek 52 Meldingen</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]
Item: (rubricCluster52)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]
Item: (rubricCluster52)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]"
         id="d41e30651-false-d771052e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="string(@classCode) = ('CLUSTER') or not(@classCode)">(rubricCluster52): de waarde van classCode MOET 'CLUSTER' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(rubricCluster52): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']) &gt;= 1">(rubricCluster52): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']) &lt;= 1">(rubricCluster52): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'R052' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &gt;= 1">(rubricCluster52): element hl7:code[(@code = 'R052' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'R052' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &lt;= 1">(rubricCluster52): element hl7:code[(@code = 'R052' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:component[hl7:groupCluster[hl7:code[@code = 'G075'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]) &lt;= 1">(rubricCluster52): element hl7:component[hl7:groupCluster[hl7:code[@code = 'G075'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:component[hl7:groupCluster[hl7:code[@code = 'G084'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]) &lt;= 1">(rubricCluster52): element hl7:component[hl7:groupCluster[hl7:code[@code = 'G084'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']
Item: (rubricCluster52)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']"
         id="d41e30723-false-d771119e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(rubricCluster52): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.11052')">(rubricCluster52): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.11052' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:code[(@code = 'R052' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]
Item: (rubricCluster52)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:code[(@code = 'R052' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]"
         id="d41e30734-false-d771138e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster52): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="@nullFlavor or (@code='R052' and @codeSystem='2.16.840.1.113883.2.4.4.40.391')">(rubricCluster52): de elementwaarde MOET een zijn van 'code 'R052' codeSystem '2.16.840.1.113883.2.4.4.40.391''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G074'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]
Item: (rubricCluster52)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G074'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]"
         id="d41e30744-false-d771156e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &gt;= 1">(rubricCluster52): element hl7:groupCluster[hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &lt;= 1">(rubricCluster52): element hl7:groupCluster[hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G074'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]
Item: (rubricCluster52)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G074'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]"
         id="d41e30749-false-d771204e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &gt;= 1">(rubricCluster52): element hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &lt;= 1">(rubricCluster52): element hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] komt te vaak voor [max 1x].</assert>
      <let name="elmcount"
           value="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]] | hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41196']]])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="$elmcount &gt;= 1">(rubricCluster52): keuze (hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]  of  hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41196']]]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]) &lt;= 1">(rubricCluster52): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41196']]]) &lt;= 1">(rubricCluster52): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41196']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41408']]]) &lt;= 1">(rubricCluster52): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41408']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G074'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]
Item: (rubricCluster52)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G074'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]"
         id="d41e30756-false-d771288e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster52): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="@nullFlavor or (@code='G074' and @codeSystem='2.16.840.1.113883.2.4.4.40.393')">(rubricCluster52): de elementwaarde MOET een zijn van 'code 'G074' codeSystem '2.16.840.1.113883.2.4.4.40.393''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G074'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41195']]]
Item: (rubricCluster52)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G074'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41196']]]
Item: (rubricCluster52)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G074'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G074' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41408']]]
Item: (rubricCluster52)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G075'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]
Item: (rubricCluster52)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G075'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]"
         id="d41e30784-false-d771366e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &gt;= 1">(rubricCluster52): element hl7:groupCluster[hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &lt;= 1">(rubricCluster52): element hl7:groupCluster[hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G075'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]
Item: (rubricCluster52)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G075'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]"
         id="d41e30789-false-d771406e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &gt;= 1">(rubricCluster52): element hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &lt;= 1">(rubricCluster52): element hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41326']]]) &gt;= 1">(rubricCluster52): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41326']]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41326']]]) &lt;= 1">(rubricCluster52): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41326']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41380']]]) &lt;= 1">(rubricCluster52): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41380']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G075'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]
Item: (rubricCluster52)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G075'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]"
         id="d41e30796-false-d771462e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster52): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="@nullFlavor or (@code='G075' and @codeSystem='2.16.840.1.113883.2.4.4.40.393')">(rubricCluster52): de elementwaarde MOET een zijn van 'code 'G075' codeSystem '2.16.840.1.113883.2.4.4.40.393''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G075'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41326']]]
Item: (rubricCluster52)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G075'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G075' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41380']]]
Item: (rubricCluster52)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G084'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]
Item: (rubricCluster52)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G084'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]"
         id="d41e30818-false-d771520e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &gt;= 1">(rubricCluster52): element hl7:groupCluster[hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:groupCluster[hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]) &lt;= 1">(rubricCluster52): element hl7:groupCluster[hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G084'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]
Item: (rubricCluster52)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G084'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]"
         id="d41e30823-false-d771560e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &gt;= 1">(rubricCluster52): element hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]) &lt;= 1">(rubricCluster52): element hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41327']]]) &gt;= 1">(rubricCluster52): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41327']]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41327']]]) &lt;= 1">(rubricCluster52): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41327']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41328']]]) &lt;= 1">(rubricCluster52): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41328']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G084'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]
Item: (rubricCluster52)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G084'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]"
         id="d41e30830-false-d771616e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster52): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11052-2020-05-27T000000.html"
              test="@nullFlavor or (@code='G084' and @codeSystem='2.16.840.1.113883.2.4.4.40.393')">(rubricCluster52): de elementwaarde MOET een zijn van 'code 'G084' codeSystem '2.16.840.1.113883.2.4.4.40.393''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G084'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41327']]]
Item: (rubricCluster52)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11052
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11052']]/hl7:component[hl7:groupCluster[hl7:code[@code = 'G084'][@codeSystem = '2.16.840.1.113883.2.4.4.40.393']]]/hl7:groupCluster[hl7:code[(@code = 'G084' and @codeSystem = '2.16.840.1.113883.2.4.4.40.393')]]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41328']]]
Item: (rubricCluster52)
-->
</pattern>
