<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.180
Name: Bericht 4 Versturen vaccinaties (payload)
Description: Bevat vaccinatie-informatie in de context van een dossier en activiteit waarin de vaccinatie heeft plaatsgevonden. Merk op dat bij geanonimiseerd gebruik dossier-id en patiëntgegevens gemaskeerd moeten worden. Er kan in dat geval ook geen sprake zijn van bezwaar.
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000">
   <title>Bericht 4 Versturen vaccinaties (payload)</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]"
         id="d41e46250-false-d865842e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]) &gt;= 1">(VersturenVaccinaties-payload): element hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]) &lt;= 1">(VersturenVaccinaties-payload): element hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]"
         id="d41e46261-false-d865903e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="string(@classCode) = ('PCPR') or not(@classCode)">(VersturenVaccinaties-payload): de waarde van classCode MOET 'PCPR' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(VersturenVaccinaties-payload): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <let name="maskedData"
           value="hl7:id[@nullFlavor = 'MSK'] | hl7:subject[hl7:patient/@nullFlavor = 'MSK']"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="not($maskedData) or count($maskedData) = 2">(VersturenVaccinaties-payload): Als de vaccinatiegegevens geanonimiseerd worden verstuurd, dan moeten dossier-id (CareProvisionEvent/id) en patiëntgegevens (CareProvisionEvent/subject/patient) beiden een @nullFlavor='MSK' bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="not($maskedData and .//hl7:substanceAdministrationEvent/hl7:authorization)">(VersturenVaccinaties-payload): Als de vaccinatiegegevens geanonimiseerd worden verstuurd, dan kan er geen sprake zijn van bezwaar. Bij bezwaar is er niet gevaccineerd en is er voor dat vaccin geen verdere communicatie.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']) &gt;= 1">(VersturenVaccinaties-payload): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']) &lt;= 1">(VersturenVaccinaties-payload): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180'] komt te vaak voor [max 1x].</assert>
      <let name="elmcount" value="count(hl7:id[@nullFlavor = 'MSK'] | hl7:id)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(VersturenVaccinaties-payload): keuze (hl7:id[@nullFlavor = 'MSK']  of  hl7:id) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(VersturenVaccinaties-payload): keuze (hl7:id[@nullFlavor = 'MSK']  of  hl7:id) bevat te veel elementen [max 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = 'MSK']) &lt;= 1">(VersturenVaccinaties-payload): element hl7:id[@nullFlavor = 'MSK'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:id) &lt;= 1">(VersturenVaccinaties-payload): element hl7:id komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'CPHC' and @codeSystem = '2.16.840.1.113883.5.4')]) &gt;= 1">(VersturenVaccinaties-payload): element hl7:code[(@code = 'CPHC' and @codeSystem = '2.16.840.1.113883.5.4')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:code[(@code = 'CPHC' and @codeSystem = '2.16.840.1.113883.5.4')]) &lt;= 1">(VersturenVaccinaties-payload): element hl7:code[(@code = 'CPHC' and @codeSystem = '2.16.840.1.113883.5.4')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:statusCode[@code = 'active' or @code = 'aborted' or @code = 'completed']) &gt;= 1">(VersturenVaccinaties-payload): element hl7:statusCode[@code = 'active' or @code = 'aborted' or @code = 'completed'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:statusCode[@code = 'active' or @code = 'aborted' or @code = 'completed']) &lt;= 1">(VersturenVaccinaties-payload): element hl7:statusCode[@code = 'active' or @code = 'aborted' or @code = 'completed'] komt te vaak voor [max 1x].</assert>
      <let name="elmcount"
           value="count(hl7:subject[hl7:patient[@nullFlavor = 'MSK']] | hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(VersturenVaccinaties-payload): keuze (hl7:subject[hl7:patient[@nullFlavor = 'MSK']]  of  hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(VersturenVaccinaties-payload): keuze (hl7:subject[hl7:patient[@nullFlavor = 'MSK']]  of  hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]) bevat te veel elementen [max 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]) &gt;= 1">(VersturenVaccinaties-payload): element hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]) &lt;= 1">(VersturenVaccinaties-payload): element hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]) &gt;= 1">(VersturenVaccinaties-payload): element hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]) &lt;= 1">(VersturenVaccinaties-payload): element hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:component[not(@nullFlavor)][hl7:encounterEvent]) &gt;= 1">(VersturenVaccinaties-payload): element hl7:component[not(@nullFlavor)][hl7:encounterEvent] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:component[not(@nullFlavor)][hl7:encounterEvent]) &lt;= 1">(VersturenVaccinaties-payload): element hl7:component[not(@nullFlavor)][hl7:encounterEvent] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']"
         id="d41e46365-false-d866070e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(VersturenVaccinaties-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.180')">(VersturenVaccinaties-payload): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.180' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:id[@nullFlavor = 'MSK']
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:id[@nullFlavor = 'MSK']"
         id="d41e46377-false-d866087e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(VersturenVaccinaties-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('MSK')">(VersturenVaccinaties-payload): de waarde van nullFlavor MOET 'MSK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:id
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:id"
         id="d41e46385-false-d866106e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(VersturenVaccinaties-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="@root">(VersturenVaccinaties-payload): attribute @root MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="@extension">(VersturenVaccinaties-payload): attribute @extension MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:code[(@code = 'CPHC' and @codeSystem = '2.16.840.1.113883.5.4')]
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:code[(@code = 'CPHC' and @codeSystem = '2.16.840.1.113883.5.4')]"
         id="d41e46398-false-d866129e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(VersturenVaccinaties-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="@nullFlavor or (@code='CPHC' and @codeSystem='2.16.840.1.113883.5.4')">(VersturenVaccinaties-payload): de elementwaarde MOET een zijn van 'code 'CPHC' codeSystem '2.16.840.1.113883.5.4''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:statusCode[@code = 'active' or @code = 'aborted' or @code = 'completed']
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:statusCode[@code = 'active' or @code = 'aborted' or @code = 'completed']"
         id="d41e46409-false-d866149e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(VersturenVaccinaties-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="@nullFlavor or (@code='active') or (@code='aborted') or (@code='completed')">(VersturenVaccinaties-payload): de elementwaarde MOET een zijn van 'code 'active' of code 'aborted' of code 'completed''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[@nullFlavor = 'MSK']]
Item: (VersturenVaccinaties-payload)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[@nullFlavor = 'MSK']]/hl7:patient[@classCode = 'PAT'][@nullFlavor = 'MSK']
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[@nullFlavor = 'MSK']]/hl7:patient[@classCode = 'PAT'][@nullFlavor = 'MSK']"
         id="d41e46436-false-d866184e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="string(@classCode) = ('PAT')">(VersturenVaccinaties-payload): de waarde van classCode MOET 'PAT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('MSK')">(VersturenVaccinaties-payload): de waarde van nullFlavor MOET 'MSK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="string(@typeCode) = ('SBJ') or not(@typeCode)">(VersturenVaccinaties-payload): de waarde van typeCode MOET 'SBJ' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <let name="patRoot" value="'2.16.840.1.113883.2.4.6.3'"/>
      <let name="patExt"
           value="(hl7:patient/hl7:id[@root=$patRoot])[1]/@extension"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="not(ancestor::*/hl7:attentionLine) or ancestor::*/hl7:attentionLine/hl7:value[@extension=$patExt and @root=$patRoot]">(VersturenVaccinaties-payload): De patiënt in de Payload (BSN '<value-of select="$patExt"/>') moet overeen komen met de patient in de attentionLine (BSN '<value-of select="ancestor::*/hl7:attentionLine/hl7:value/@extension"/>')</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="string(@typeCode) = ('PRF') or not(@typeCode)">(VersturenVaccinaties-payload): de waarde van typeCode MOET 'PRF' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="string(@typeCode) = ('AUT') or not(@typeCode)">(VersturenVaccinaties-payload): de waarde van typeCode MOET 'AUT' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]"
         id="d41e46495-false-d866277e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(VersturenVaccinaties-payload): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:encounterEvent[not(@nullFlavor)]) &gt;= 1">(VersturenVaccinaties-payload): element hl7:encounterEvent[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:encounterEvent[not(@nullFlavor)]) &lt;= 1">(VersturenVaccinaties-payload): element hl7:encounterEvent[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]"
         id="d41e46515-false-d866315e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(VersturenVaccinaties-payload): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="string(@classCode) = ('ENC') or not(@classCode)">(VersturenVaccinaties-payload): de waarde van classCode MOET 'ENC' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:id) &gt;= 1">(VersturenVaccinaties-payload): element hl7:id is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:id) &lt;= 1">(VersturenVaccinaties-payload): element hl7:id komt te vaak voor [max 1x].</assert>
      <let name="elmcount"
           value="count(hl7:code[@nullFlavor = 'MSK'] | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(VersturenVaccinaties-payload): keuze (hl7:code[@nullFlavor = 'MSK']  of  hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(VersturenVaccinaties-payload): keuze (hl7:code[@nullFlavor = 'MSK']  of  hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) bevat te veel elementen [max 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:code[@nullFlavor = 'MSK']) &lt;= 1">(VersturenVaccinaties-payload): element hl7:code[@nullFlavor = 'MSK'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(VersturenVaccinaties-payload): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:effectiveTime[not(@nullFlavor)]) &gt;= 1">(VersturenVaccinaties-payload): element hl7:effectiveTime[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="count(hl7:effectiveTime[not(@nullFlavor)]) &lt;= 1">(VersturenVaccinaties-payload): element hl7:effectiveTime[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:id
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:id"
         id="d41e46540-false-d866410e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(VersturenVaccinaties-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="@root">(VersturenVaccinaties-payload): attribute @root MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="@extension">(VersturenVaccinaties-payload): attribute @extension MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:code[@nullFlavor = 'MSK']
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:code[@nullFlavor = 'MSK']"
         id="d41e46560-false-d866431e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(VersturenVaccinaties-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('MSK')">(VersturenVaccinaties-payload): de waarde van nullFlavor MOET 'MSK' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e46568-false-d866452e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(VersturenVaccinaties-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(VersturenVaccinaties-payload): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1 W0188 Soort contactmoment (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(VersturenVaccinaties-payload): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1 W0188 Soort contactmoment (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:effectiveTime[not(@nullFlavor)]
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:effectiveTime[not(@nullFlavor)]"
         id="d41e46586-false-d866479e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(VersturenVaccinaties-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="not(*)">(VersturenVaccinaties-payload): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="matches(@value,'^[0-9]{8}')">(VersturenVaccinaties-payload): 
                                <name path=".."/>/<name/> moet tenminste tot op de dag nauwkeurig worden opgegeven</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.180
Context: *[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]
Item: (VersturenVaccinaties-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="string(@typeCode) = ('COMP') or not(@typeCode)">(VersturenVaccinaties-payload): de waarde van typeCode MOET 'COMP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.180-2012-08-01T000000.html"
              test="not(.//*[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.124']/hl7:assignedPerson)">(VersturenVaccinaties-payload): In bericht 4 is overdracht van BDS element 1410 Naam uitvoerende persoon en dus gebruik van element assignedPerson niet gedefinieerd.</assert>
   </rule>
</pattern>
