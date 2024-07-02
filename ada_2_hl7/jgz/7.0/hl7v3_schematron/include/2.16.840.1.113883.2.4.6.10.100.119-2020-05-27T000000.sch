<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.119
Name: A_OntvangenZorg [universal]
Description: COCT_RM900917NL: Gegevens van de zorg die ontvangen is of wordt ontvangen door het gezin. Verschillen met de voorgaande versie zijn:  
                     PatientCareProvision/reasonOf/@typeCode was COMP is aangepast naar RSON conform XML schema 
                     PatientCareProvision/goal/@typeCode was COMP is aangepast naar GOAL conform XML schema 
                     PatientCareProvision/goal/OberservationGoal/@classCode was PCPR is aangepast naar OBS conform XML schema 
                     PatientCareProvision/goal/OberservationGoal/@moodCode was INT is aangepast naar GOL conform XML schema 
                 
            
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000">
   <title>A_OntvangenZorg [universal]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]"
         id="d41e34078-false-d780849e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]) &gt;= 1">(A_OntvangenZorg-universal): element hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]"
         id="d41e34100-false-d780876e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@classCode) = ('PCPR') or not(@classCode)">(A_OntvangenZorg-universal): de waarde van classCode MOET 'PCPR' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_OntvangenZorg-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']) &gt;= 1">(A_OntvangenZorg-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']) &lt;= 1">(A_OntvangenZorg-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.305-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.305-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_OntvangenZorg-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.305-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.305-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.305-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.305-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.305-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.305-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:text) &lt;= 1">(A_OntvangenZorg-universal): element hl7:text komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:statusCode[@code = 'active' or @code = 'completed' or @nullFlavor]) &gt;= 1">(A_OntvangenZorg-universal): element hl7:statusCode[@code = 'active' or @code = 'completed' or @nullFlavor] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:statusCode[@code = 'active' or @code = 'completed' or @nullFlavor]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:statusCode[@code = 'active' or @code = 'completed' or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:effectiveTime[not(@nullFlavor)]) &gt;= 1">(A_OntvangenZorg-universal): element hl7:effectiveTime[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:effectiveTime[not(@nullFlavor)]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:effectiveTime[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:subject[hl7:patient | hl7:personalRelationship][not(@nullFlavor)]) &gt;= 1">(A_OntvangenZorg-universal): element hl7:subject[hl7:patient | hl7:personalRelationship][not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:subject[hl7:patient | hl7:personalRelationship][not(@nullFlavor)]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:subject[hl7:patient | hl7:personalRelationship][not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:goal[hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:goal[hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:reasonOf[hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:reasonOf[hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']"
         id="d41e34158-false-d781005e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_OntvangenZorg-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.119')">(A_OntvangenZorg-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.119' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.305-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.305-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.305-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.305-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e34168-false-d781026e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_OntvangenZorg-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.305-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_OntvangenZorg-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.305 W0305 Type zorg (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.305-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_OntvangenZorg-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.305 W0305 Type zorg (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:text
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:text"
         id="d41e34178-false-d781053e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_OntvangenZorg-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:statusCode[@code = 'active' or @code = 'completed' or @nullFlavor]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:statusCode[@code = 'active' or @code = 'completed' or @nullFlavor]"
         id="d41e34187-false-d781066e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(A_OntvangenZorg-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="@nullFlavor or (@code='active') or (@code='completed')">(A_OntvangenZorg-universal): de elementwaarde MOET een zijn van 'code 'active' of code 'completed''.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="not(@nullFlavor) or @nullFlavor=('ASKU')">(A_OntvangenZorg-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst .</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('ASKU') or not(@nullFlavor)">(A_OntvangenZorg-universal): de waarde van nullFlavor MOET 'ASKU' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10258
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:effectiveTime
Item: (PeriodeZorg)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:effectiveTime"
         id="d781093e6-false-d781101e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10258-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(PeriodeZorg): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="elmcount" value="count(hl7:low | hl7:high)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10258-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(PeriodeZorg): keuze (hl7:low  of  hl7:high) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10258-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(PeriodeZorg): keuze (hl7:low  of  hl7:high) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10258-2012-08-01T000000.html"
              test="count(hl7:low) &lt;= 1">(PeriodeZorg): element hl7:low komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10258-2012-08-01T000000.html"
              test="count(hl7:high) &lt;= 1">(PeriodeZorg): element hl7:high komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10258-2012-08-01T000000.html"
              test="count(hl7:width) = 0">(PeriodeZorg): element hl7:width MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10258-2012-08-01T000000.html"
              test="count(hl7:center) = 0">(PeriodeZorg): element hl7:center MAG NIET voorkomen.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10258
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:effectiveTime/hl7:low
Item: (PeriodeZorg)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:effectiveTime/hl7:low"
         id="d781093e43-false-d781166e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10258-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeZorg): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10258-2012-08-01T000000.html"
              test="not(*)">(PeriodeZorg): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10258-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeZorg): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10258
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:effectiveTime/hl7:high
Item: (PeriodeZorg)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:effectiveTime/hl7:high"
         id="d781093e62-false-d781189e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10258-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(PeriodeZorg): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10258-2012-08-01T000000.html"
              test="not(*)">(PeriodeZorg): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10258-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('UNK') or not(@nullFlavor)">(PeriodeZorg): de waarde van nullFlavor MOET 'UNK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10258
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:effectiveTime/hl7:width
Item: (PeriodeZorg)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.10258
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:effectiveTime/hl7:center
Item: (PeriodeZorg)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:subject[hl7:patient | hl7:personalRelationship][not(@nullFlavor)]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:subject[hl7:patient | hl7:personalRelationship][not(@nullFlavor)]"
         id="d41e34205-false-d781228e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(A_OntvangenZorg-universal): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:patient | hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="$elmcount &gt;= 1">(A_OntvangenZorg-universal): keuze (hl7:patient  of  hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="$elmcount &lt;= 1">(A_OntvangenZorg-universal): keuze (hl7:patient  of  hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]) bevat te veel elementen [max 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:patient) &lt;= 1">(A_OntvangenZorg-universal): element hl7:patient komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:subject[hl7:patient | hl7:personalRelationship][not(@nullFlavor)]/hl7:patient
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:subject[hl7:patient | hl7:personalRelationship][not(@nullFlavor)]/hl7:patient"
         id="d41e34236-false-d781283e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@classCode) = ('PAT') or not(@classCode)">(A_OntvangenZorg-universal): de waarde van classCode MOET 'PAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:subject[hl7:patient | hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:subject[hl7:patient | hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]"
         id="d41e34251-false-d781300e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@classCode) = ('PRS') or not(@classCode)">(A_OntvangenZorg-universal): de waarde van classCode MOET 'PRS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(A_OntvangenZorg-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']) &gt;= 1">(A_OntvangenZorg-universal): element hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI'] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']) &lt;= 1">(A_OntvangenZorg-universal): element hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:subject[hl7:patient | hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:subject[hl7:patient | hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e34270-false-d781349e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_OntvangenZorg-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_OntvangenZorg-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.307 W0307 Zorg voor (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_OntvangenZorg-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.307 W0307 Zorg voor (HL7) (2012-05-21T01:26:54).</assert>
      <report fpi="CD-DEPR-BSP"
              role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept[@type='D'][@code = $theCode][@codeSystem = $theCodeSystem])">(A_OntvangenZorg-universal): element hl7:code is gecodeerd met bindingssterkte 'required' en bevat een code die verouderd is.</report>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:subject[hl7:patient | hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:subject[hl7:patient | hl7:personalRelationship][not(@nullFlavor)]/hl7:personalRelationship[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.307-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:relationshipHolder[@classCode = 'PSN'][@determinerCode = 'INSTANCE'][@nullFlavor = 'NI']"
         id="d41e34281-false-d781381e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_OntvangenZorg-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@classCode) = ('PSN')">(A_OntvangenZorg-universal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(A_OntvangenZorg-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@nullFlavor) = ('NI')">(A_OntvangenZorg-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:goal[hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:goal[hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e34301-false-d781412e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@typeCode) = ('GOAL') or not(@typeCode)">(A_OntvangenZorg-universal): de waarde van typeCode MOET 'GOAL' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_OntvangenZorg-universal): element hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:goal[hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:goal[hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e34310-false-d781442e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_OntvangenZorg-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@moodCode) = ('GOL') or not(@moodCode)">(A_OntvangenZorg-universal): de waarde van moodCode MOET 'GOL' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_OntvangenZorg-universal): element hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:text[not(@nullFlavor)]) &gt;= 1">(A_OntvangenZorg-universal): element hl7:text[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:text[not(@nullFlavor)]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:text[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:goal[hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:goal[hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e34321-false-d781493e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_OntvangenZorg-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="@nullFlavor or (@code='829' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_OntvangenZorg-universal): de elementwaarde MOET een zijn van 'code '829' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:goal[hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:text[not(@nullFlavor)]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:goal[hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationGoal[hl7:code[(@code = '829' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:text[not(@nullFlavor)]"
         id="d41e34332-false-d781513e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_OntvangenZorg-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:reasonOf[hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:reasonOf[hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e34342-false-d781526e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@typeCode) = ('RSON') or not(@typeCode)">(A_OntvangenZorg-universal): de waarde van typeCode MOET 'RSON' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_OntvangenZorg-universal): element hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:reasonOf[hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:reasonOf[hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e34351-false-d781556e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(A_OntvangenZorg-universal): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_OntvangenZorg-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_OntvangenZorg-universal): element hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(A_OntvangenZorg-universal): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(A_OntvangenZorg-universal): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:reasonOf[hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:reasonOf[hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e34359-false-d781607e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_OntvangenZorg-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="@nullFlavor or (@code='365' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_OntvangenZorg-universal): de elementwaarde MOET een zijn van 'code '365' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.119
Context: *[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:reasonOf[hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]
Item: (A_OntvangenZorg-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]]/hl7:patientCareProvision[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.119']]/hl7:reasonOf[hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:patientCareObservation[hl7:code[(@code = '365' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[not(@nullFlavor)]"
         id="d41e34370-false-d781627e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.119-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(A_OntvangenZorg-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
</pattern>
