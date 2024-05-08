<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.11040
Name: Rubriek 40 Gehooronderzoek
Description: Vastleggen van het gestandaardiseerde onderzoek van het gehoor.
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000">
   <title>Rubriek 40 Gehooronderzoek</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]
Item: (rubricCluster40)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]"
         id="d41e24006-false-d1414241e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="string(@classCode) = ('CLUSTER') or not(@classCode)">(rubricCluster40): de waarde van classCode MOET 'CLUSTER' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(rubricCluster40): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']) &gt;= 1">(rubricCluster40): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']) &lt;= 1">(rubricCluster40): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'R040' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &gt;= 1">(rubricCluster40): element hl7:code[(@code = 'R040' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'R040' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &lt;= 1">(rubricCluster40): element hl7:code[(@code = 'R040' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40438']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40438']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40863']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40863']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41331']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41331']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40439']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40439']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40441']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40441']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40442']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40442']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40444']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40444']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40445']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40445']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40447']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40447']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41413']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41413']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41434']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41434']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41433']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41433']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41435']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41435']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41436']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41436']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40864']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40864']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41203']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41203']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41204']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41204']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41205']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41205']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41206']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41206']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41207']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41207']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41208']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41208']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41209']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41209']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41210']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41210']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41211']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41211']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41212']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41212']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41213']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41213']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41214']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41214']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40865']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40865']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41216']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41216']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41218']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41218']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41220']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41220']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41222']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41222']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41224']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41224']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41226']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41226']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41228']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41228']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41230']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41230']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41232']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41232']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41234']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41234']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41236']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41236']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41238']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41238']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41239']]]) &lt;= 1">(rubricCluster40): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41239']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']
Item: (rubricCluster40)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']"
         id="d41e24236-false-d1414825e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(rubricCluster40): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.11040')">(rubricCluster40): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.11040' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:code[(@code = 'R040' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]
Item: (rubricCluster40)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:code[(@code = 'R040' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]"
         id="d41e24247-false-d1414844e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster40): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.11040-2020-05-27T000000.html"
              test="@nullFlavor or (@code='R040' and @codeSystem='2.16.840.1.113883.2.4.4.40.391')">(rubricCluster40): de elementwaarde MOET een zijn van 'code 'R040' codeSystem '2.16.840.1.113883.2.4.4.40.391''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40438']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40863']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41331']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40439']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40441']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40442']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40444']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40445']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40447']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41413']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41434']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41433']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41435']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41436']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40864']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41203']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41204']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41205']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41206']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41207']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41208']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41209']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41210']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41211']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41212']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41213']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41214']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40865']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41216']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41218']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41220']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41222']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41224']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41226']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41228']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41230']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41232']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41234']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41236']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41238']]]
Item: (rubricCluster40)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11040
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11040']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41239']]]
Item: (rubricCluster40)
-->
</pattern>
