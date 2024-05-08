<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.11043
Name: Rubriek 43 BFMT
Description: Vastleggen van de uitkomsten van de Baecke-Fassaert Motoriektest voor kleuters (5-6 jarigen).
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000">
   <title>Rubriek 43 BFMT</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]
Item: (rubricCluster43)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]"
         id="d40e15706-false-d286688e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="string(@classCode) = ('CLUSTER') or not(@classCode)">(rubricCluster43): de waarde van classCode MOET 'CLUSTER' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(rubricCluster43): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="not(hl7:component/hl7:observation[hl7:templateId/@root='2.16.840.1.113883.2.4.6.10.100.41006'])">(rubricCluster43): Element 1006 Scan van oefeningenblad moet worden doorgegeven via de rubriek Externe documenten in plaats van de rubriek BFMT</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']) &gt;= 1">(rubricCluster43): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']) &lt;= 1">(rubricCluster43): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'R043' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &gt;= 1">(rubricCluster43): element hl7:code[(@code = 'R043' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'R043' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &lt;= 1">(rubricCluster43): element hl7:code[(@code = 'R043' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41382']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41382']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41005']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41005']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41007']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41007']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41008']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41008']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41010']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41010']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41012']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41012']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41013']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41013']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41015']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41015']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41017']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41017']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41018']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41018']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41019']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41019']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41020']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41020']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41022']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41022']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41023']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41023']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41024']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41024']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41026']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41026']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41028']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41028']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41030']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41030']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41031']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41031']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41033']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41033']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41009']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41009']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41011']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41011']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41014']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41014']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41016']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41016']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41021']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41021']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41025']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41025']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41027']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41027']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41029']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41029']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41032']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41032']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41034']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41034']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41035']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41035']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41036']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41036']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41037']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41037']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41038']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41038']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41039']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41039']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41040']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41040']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41042']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41042']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41045']]]) &lt;= 1">(rubricCluster43): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41045']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']
Item: (rubricCluster43)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']"
         id="d40e15932-false-d287233e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(rubricCluster43): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.11043')">(rubricCluster43): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.11043' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:code[(@code = 'R043' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]
Item: (rubricCluster43)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:code[(@code = 'R043' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]"
         id="d40e15942-false-d287252e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster43): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11043-2020-05-27T000000.html"
              test="@nullFlavor or (@code='R043' and @codeSystem='2.16.840.1.113883.2.4.4.40.391')">(rubricCluster43): de elementwaarde MOET een zijn van 'code 'R043' codeSystem '2.16.840.1.113883.2.4.4.40.391''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41382']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41005']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41007']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41008']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41010']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41012']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41013']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41015']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41017']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41018']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41019']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41020']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41022']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41023']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41024']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41026']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41028']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41030']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41031']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41033']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41009']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41011']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41014']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41016']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41021']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41025']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41027']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41029']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41032']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41034']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41035']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41036']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41037']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41038']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41039']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41040']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41042']]]
Item: (rubricCluster43)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11043
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11043']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41045']]]
Item: (rubricCluster43)
-->
</pattern>
