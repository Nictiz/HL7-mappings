<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.11045
Name: Rubriek 45 SDQ
Description: Vastleggen van de uitkomsten van de Strenghts and Difficulties Questionnaire: Vragenlijst voor het signaleren van psychosociale problemen bij kinderen van 7-12 jaar.
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000">
   <title>Rubriek 45 SDQ</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]
Item: (rubricCluster45)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]"
         id="d40e16132-false-d288542e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="string(@classCode) = ('CLUSTER') or not(@classCode)">(rubricCluster45): de waarde van classCode MOET 'CLUSTER' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(rubricCluster45): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']) &gt;= 1">(rubricCluster45): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']) &lt;= 1">(rubricCluster45): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'R045' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &gt;= 1">(rubricCluster45): element hl7:code[(@code = 'R045' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:code[(@code = 'R045' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]) &lt;= 1">(rubricCluster45): element hl7:code[(@code = 'R045' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41078']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41078']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41079']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41079']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41080']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41080']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41081']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41081']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41082']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41082']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41083']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41083']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41084']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41084']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41085']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41085']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41086']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41086']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41087']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41087']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41088']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41088']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41089']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41089']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41090']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41090']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41092']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41092']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41093']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41093']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41094']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41094']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41095']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41095']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41096']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41096']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41097']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41097']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41098']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41098']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41099']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41099']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41100']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41100']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41101']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41101']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41102']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41102']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41103']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41103']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41104']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41104']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41105']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41105']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41106']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41106']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41107']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41107']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41108']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41108']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41109']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41109']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41110']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41110']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41111']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41111']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41112']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41112']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41113']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41113']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41114']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41114']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41115']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41115']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41117']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41117']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41447']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41447']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="count(hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41116']]]) &lt;= 1">(rubricCluster45): element hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41116']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']
Item: (rubricCluster45)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']"
         id="d40e16362-false-d289126e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(rubricCluster45): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.11045')">(rubricCluster45): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.11045' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:code[(@code = 'R045' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]
Item: (rubricCluster45)
-->
   <rule fpi="RULC-1"
         context="*[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:code[(@code = 'R045' and @codeSystem = '2.16.840.1.113883.2.4.4.40.391')]"
         id="d40e16373-false-d289145e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(rubricCluster45): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.11045-2020-05-27T000000.html"
              test="@nullFlavor or (@code='R045' and @codeSystem='2.16.840.1.113883.2.4.4.40.391')">(rubricCluster45): de elementwaarde MOET een zijn van 'code 'R045' codeSystem '2.16.840.1.113883.2.4.4.40.391''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41078']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41079']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41080']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41081']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41082']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41083']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41084']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41085']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41086']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41087']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41088']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41089']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41090']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41092']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41093']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41094']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41095']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41096']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41097']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41098']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41099']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41100']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41101']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41102']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41103']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41104']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41105']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41106']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41107']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41108']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41109']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41110']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41111']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41112']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41113']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41114']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41115']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41117']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41447']]]
Item: (rubricCluster45)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.11045
Context: *[hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]]/hl7:rubricCluster[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.11045']]/hl7:component[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41116']]]
Item: (rubricCluster45)
-->
</pattern>
