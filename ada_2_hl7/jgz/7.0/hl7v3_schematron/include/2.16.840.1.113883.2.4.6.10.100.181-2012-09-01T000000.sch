<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.181
Name: Bericht 1 Opvragen vaccinatiestatus (payload)
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000">
   <title>Bericht 1 Opvragen vaccinatiestatus (payload)</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]
Item: (OpvragenVaccinatiestatus-payload)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]"
         id="d41e46648-false-d866542e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']) &gt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:queryId[not(@nullFlavor)]) &gt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:queryId[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:queryId[not(@nullFlavor)]) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:queryId[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:statusCode[@code = 'executing']) &gt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:statusCode[@code = 'executing'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:statusCode[@code = 'executing']) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:statusCode[@code = 'executing'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:modifyCode) = 0">(OpvragenVaccinatiestatus-payload): element hl7:modifyCode MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:responseElementGroupId) = 0">(OpvragenVaccinatiestatus-payload): element hl7:responseElementGroupId MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:responseModalityCode[@code = 'R']) &gt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:responseModalityCode[@code = 'R'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:responseModalityCode[@code = 'R']) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:responseModalityCode[@code = 'R'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:responsePriorityCode[@code = 'I']) &gt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:responsePriorityCode[@code = 'I'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:responsePriorityCode[@code = 'I']) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:responsePriorityCode[@code = 'I'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:initialQuantity) = 0">(OpvragenVaccinatiestatus-payload): element hl7:initialQuantity MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:initialQuantityCode) = 0">(OpvragenVaccinatiestatus-payload): element hl7:initialQuantityCode MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:executionAndDeliveryTime) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:executionAndDeliveryTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:sortControl) = 0">(OpvragenVaccinatiestatus-payload): element hl7:sortControl MAG NIET voorkomen.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:patientId[hl7:value[@root = '2.16.840.1.113883.2.4.6.3']]) &gt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:patientId[hl7:value[@root = '2.16.840.1.113883.2.4.6.3']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:patientId[hl7:value[@root = '2.16.840.1.113883.2.4.6.3']]) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:patientId[hl7:value[@root = '2.16.840.1.113883.2.4.6.3']] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:person.addr) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:person.addr komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:person.administrativeGender[hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:person.administrativeGender[hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:person.birthTime) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:person.birthTime komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:person.name) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:person.name komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']"
         id="d41e46717-false-d866728e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.181')">(OpvragenVaccinatiestatus-payload): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.181' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:queryId[not(@nullFlavor)]
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:queryId[not(@nullFlavor)]"
         id="d41e46728-false-d866747e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:statusCode[@code = 'executing']
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:statusCode[@code = 'executing']"
         id="d41e46739-false-d866760e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="@nullFlavor or (@code='executing')">(OpvragenVaccinatiestatus-payload): de elementwaarde MOET een zijn van 'code 'executing''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:modifyCode
Item: (OpvragenVaccinatiestatus-payload)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:responseElementGroupId
Item: (OpvragenVaccinatiestatus-payload)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:responseModalityCode[@code = 'R']
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:responseModalityCode[@code = 'R']"
         id="d41e46758-false-d866798e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="@nullFlavor or (@code='R')">(OpvragenVaccinatiestatus-payload): de elementwaarde MOET een zijn van 'code 'R''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:responsePriorityCode[@code = 'I']
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:responsePriorityCode[@code = 'I']"
         id="d41e46768-false-d866818e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="@nullFlavor or (@code='I')">(OpvragenVaccinatiestatus-payload): de elementwaarde MOET een zijn van 'code 'I''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:initialQuantity
Item: (OpvragenVaccinatiestatus-payload)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:initialQuantityCode
Item: (OpvragenVaccinatiestatus-payload)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:executionAndDeliveryTime
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:executionAndDeliveryTime"
         id="d41e46787-false-d866856e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="not(*)">(OpvragenVaccinatiestatus-payload): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:sortControl
Item: (OpvragenVaccinatiestatus-payload)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:patientId[hl7:value[@root = '2.16.840.1.113883.2.4.6.3']]
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:patientId[hl7:value[@root = '2.16.840.1.113883.2.4.6.3']]"
         id="d41e46814-false-d866882e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:value[@root = '2.16.840.1.113883.2.4.6.3']) &gt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:value[@root = '2.16.840.1.113883.2.4.6.3'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:value[@root = '2.16.840.1.113883.2.4.6.3']) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:value[@root = '2.16.840.1.113883.2.4.6.3'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:patientId[hl7:value[@root = '2.16.840.1.113883.2.4.6.3']]/hl7:value[@root = '2.16.840.1.113883.2.4.6.3']
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:patientId[hl7:value[@root = '2.16.840.1.113883.2.4.6.3']]/hl7:value[@root = '2.16.840.1.113883.2.4.6.3']"
         id="d41e46827-false-d866906e0">
      <extends rule="II.NL.BSN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.3')">(OpvragenVaccinatiestatus-payload): de waarde van root MOET '2.16.840.1.113883.2.4.6.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.addr
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.addr"
         id="d41e46835-false-d866925e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.addr/hl7:value[not(@nullFlavor)]
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.addr/hl7:value[not(@nullFlavor)]"
         id="d41e46861-false-d866949e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@use),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="not(@use) or empty($theAttValue[not(. = (doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.3-2012-05-21T012654.xml')/*/valueSet/conceptList/concept/@code))])">(OpvragenVaccinatiestatus-payload): de waarde van use MOET worden gekozen uit waardelijst '2.16.840.1.113883.2.4.3.11.60.100.11.2.3' W0003 Soort adres (HL7) (2012-05-21T01:26:54).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:houseNumber) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:houseNumber komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:buildingNumberSuffix) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:buildingNumberSuffix komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:additionalLocator) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:additionalLocator komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:postalCode) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:postalCode komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.addr/hl7:value[not(@nullFlavor)]/hl7:houseNumber
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.addr/hl7:value[not(@nullFlavor)]/hl7:houseNumber"
         id="d41e46868-false-d867011e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.addr/hl7:value[not(@nullFlavor)]/hl7:buildingNumberSuffix
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.addr/hl7:value[not(@nullFlavor)]/hl7:buildingNumberSuffix"
         id="d41e46874-false-d867024e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.addr/hl7:value[not(@nullFlavor)]/hl7:additionalLocator
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.addr/hl7:value[not(@nullFlavor)]/hl7:additionalLocator"
         id="d41e46880-false-d867037e0">
      <extends rule="ADXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ADXP')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ADXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="text()=('to','by')">(OpvragenVaccinatiestatus-payload): 
                                <name path=".."/>/<name/> MOET 'to' of 'by' zijn</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.addr/hl7:value[not(@nullFlavor)]/hl7:postalCode
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.addr/hl7:value[not(@nullFlavor)]/hl7:postalCode"
         id="d41e46893-false-d867050e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.administrativeGender[hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.administrativeGender[hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]"
         id="d41e46904-false-d867065e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &gt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.administrativeGender[hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.administrativeGender[hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e46917-false-d867093e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(OpvragenVaccinatiestatus-payload): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(OpvragenVaccinatiestatus-payload): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.23 W0023 Geslacht (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.birthTime
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.birthTime"
         id="d41e46925-false-d867120e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.birthTime/hl7:value[not(@nullFlavor)]
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.birthTime/hl7:value[not(@nullFlavor)]"
         id="d41e46940-false-d867144e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="not(*)">(OpvragenVaccinatiestatus-payload): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.name
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.name"
         id="d41e46945-false-d867161e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.name/hl7:value[not(@nullFlavor)]
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.name/hl7:value[not(@nullFlavor)]"
         id="d41e46971-false-d867185e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:given) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:given komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:prefix) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:prefix komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="count(hl7:family) &lt;= 1">(OpvragenVaccinatiestatus-payload): element hl7:family komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.name/hl7:value[not(@nullFlavor)]/hl7:given
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.name/hl7:value[not(@nullFlavor)]/hl7:given"
         id="d41e46973-false-d867225e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="string(@qualifier) = ('BR') or not(@qualifier)">(OpvragenVaccinatiestatus-payload): de waarde van qualifier MOET 'BR' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.name/hl7:value[not(@nullFlavor)]/hl7:prefix
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.name/hl7:value[not(@nullFlavor)]/hl7:prefix"
         id="d41e46981-false-d867244e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="@qualifier">(OpvragenVaccinatiestatus-payload): attribute @qualifier MOET aanwezig zijn.</assert>
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@qualifier),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="not(@qualifier) or empty($theAttValue[not(. = (('VV','BR')))])">(OpvragenVaccinatiestatus-payload): de waarde van qualifier MOET 'code VV of code BR' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.181
Context: *[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.name/hl7:value[not(@nullFlavor)]/hl7:family
Item: (OpvragenVaccinatiestatus-payload)
-->
   <rule fpi="RULC-1"
         context="*[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]/hl7:person.name/hl7:value[not(@nullFlavor)]/hl7:family"
         id="d41e46994-false-d867277e0">
      <extends rule="ENXP"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ENXP')">(OpvragenVaccinatiestatus-payload): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ENXP" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.181-2012-09-01T000000.html"
              test="string(@qualifier) = ('BR')">(OpvragenVaccinatiestatus-payload): de waarde van qualifier MOET 'BR' zijn. Gevonden: "<value-of select="@qualifier"/>"</assert>
   </rule>
</pattern>
