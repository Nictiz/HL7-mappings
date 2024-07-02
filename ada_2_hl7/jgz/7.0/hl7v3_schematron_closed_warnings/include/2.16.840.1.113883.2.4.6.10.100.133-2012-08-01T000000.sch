<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.133
Name: A_HeelPrick [universal]
Description: COCT_RM900920NL: Gegevens over de hielprik. De aanvraag, de uitvoering en het resultaat
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000">
   <title>A_HeelPrick [universal]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]
Item: (A_HeelPrick-universal)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]"
         id="d41e43381-false-d1483998e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@classCode) = ('SPECCOLLECT') or not(@classCode)">(A_HeelPrick-universal): de waarde van classCode MOET 'SPECCOLLECT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(A_HeelPrick-universal): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="not(@negationInd) or string(@negationInd)=('true','false')">(A_HeelPrick-universal): attribuut @negationInd MOET datatype 'bl' hebben  - '<value-of select="@negationInd"/>'</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="not(@negationInd='true') or hl7:reasonCode">(A_HeelPrick-universal): 
                    <name/>/@negationInd='true' maar er is geen reden niet afgenomen in reasonCode</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="@negationInd='true' or not(hl7:reasonCode)">(A_HeelPrick-universal): 
                    <name/>/@negationInd!='true' maar er is toch een reden niet afgenomen in reasonCode</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']) &gt;= 1">(A_HeelPrick-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']) &lt;= 1">(A_HeelPrick-universal): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(A_HeelPrick-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(A_HeelPrick-universal): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:reasonCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.313-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.313-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]) &lt;= 1">(A_HeelPrick-universal): element hl7:reasonCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.313-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.313-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]) &lt;= 1">(A_HeelPrick-universal): element hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:outcome[hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]) &lt;= 1">(A_HeelPrick-universal): element hl7:outcome[hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:inFulFillmentOf[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]) &lt;= 1">(A_HeelPrick-universal): element hl7:inFulFillmentOf[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']"
         id="d41e43462-false-d1484096e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_HeelPrick-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.133')">(A_HeelPrick-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.133' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d41e43473-false-d1484117e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_HeelPrick-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.316-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_HeelPrick-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.316 W0316 Type hielprik (HL7) (2012-05-21T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:reasonCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.313-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.313-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:reasonCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.313-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.313-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]"
         id="d41e43483-false-d1484141e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_HeelPrick-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.313-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_HeelPrick-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.313 W0313 Reden niet afgenomen hielprik (HL7) (2012-05-21T01:26:54)'.</assert>
      <let name="theNullFlavor" value="@nullFlavor"/>
      <let name="validNullFlavorsFound"
           value="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.313-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception[@code = $theNullFlavor][@codeSystem = '2.16.840.1.113883.5.1008'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="not(@nullFlavor) or $validNullFlavorsFound">(A_HeelPrick-universal): de nulwaarde '<value-of select="@nullFlavor"/>' voor @code MOET komen uit de set die is gedefinieerd voor dit attribuut of zijn gekoppeld aan waardelijst 2.16.840.1.113883.2.4.3.11.60.100.11.2.313 W0313 Reden niet afgenomen hielprik (HL7) (2012-05-21T01:26:54).</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]"
         id="d41e43493-false-d1484168e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@typeCode) = ('PRF') or not(@typeCode)">(A_HeelPrick-universal): de waarde van typeCode MOET 'PRF' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:time[not(@nullFlavor)]) &gt;= 1">(A_HeelPrick-universal): element hl7:time[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:time[not(@nullFlavor)]) &lt;= 1">(A_HeelPrick-universal): element hl7:time[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']) &gt;= 1">(A_HeelPrick-universal): element hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']) &lt;= 1">(A_HeelPrick-universal): element hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:time[not(@nullFlavor)]
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:time[not(@nullFlavor)]"
         id="d41e43502-false-d1484213e0">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(A_HeelPrick-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="not(*)">(A_HeelPrick-universal): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']"
         id="d41e43511-false-d1484230e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@classCode) = ('ASSIGNED')">(A_HeelPrick-universal): de waarde van classCode MOET 'ASSIGNED' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:assignedPerson) &lt;= 1">(A_HeelPrick-universal): element hl7:assignedPerson komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']) &lt;= 1">(A_HeelPrick-universal): element hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:assignedPerson
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:assignedPerson"
         id="d41e43538-false-d1484263e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(A_HeelPrick-universal): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(A_HeelPrick-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(A_HeelPrick-universal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(A_HeelPrick-universal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:assignedPerson/hl7:name[not(@nullFlavor)]
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:assignedPerson/hl7:name[not(@nullFlavor)]"
         id="d41e43549-false-d1484299e0">
      <extends rule="PN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(A_HeelPrick-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']"
         id="d41e43559-false-d1484312e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@classCode) = ('ORG')">(A_HeelPrick-universal): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE')">(A_HeelPrick-universal): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = 'NI'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(A_HeelPrick-universal): keuze (hl7:id[@root = '2.16.528.1.1007.3.3']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = 'NI']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="$elmcount &lt;= 2">(A_HeelPrick-universal): keuze (hl7:id[@root = '2.16.528.1.1007.3.3']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']  of  hl7:id[@nullFlavor = 'NI']) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.528.1.1007.3.3']) &lt;= 1">(A_HeelPrick-universal): element hl7:id[@root = '2.16.528.1.1007.3.3'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.1']) &lt;= 1">(A_HeelPrick-universal): element hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:id[@nullFlavor = 'NI']) &lt;= 1">(A_HeelPrick-universal): element hl7:id[@nullFlavor = 'NI'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(A_HeelPrick-universal): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(A_HeelPrick-universal): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.528.1.1007.3.3']
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.528.1.1007.3.3']"
         id="d41e43575-false-d1484394e0">
      <extends rule="II.NL.URA"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_HeelPrick-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@root) = ('2.16.528.1.1007.3.3')">(A_HeelPrick-universal): de waarde van root MOET '2.16.528.1.1007.3.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']"
         id="d41e43583-false-d1484413e0">
      <extends rule="II.NL.AGB"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_HeelPrick-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.1')">(A_HeelPrick-universal): de waarde van root MOET '2.16.840.1.113883.2.4.6.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@nullFlavor = 'NI']
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:id[@nullFlavor = 'NI']"
         id="d41e43591-false-d1484432e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_HeelPrick-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@nullFlavor) = ('NI')">(A_HeelPrick-universal): de waarde van nullFlavor MOET 'NI' zijn. Gevonden: "<value-of select="@nullFlavor"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:name[not(@nullFlavor)]
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:performer[hl7:assignedEntity[@classCode = 'ASSIGNED']]/hl7:assignedEntity[not(@nullFlavor)][@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:name[not(@nullFlavor)]"
         id="d41e43603-false-d1484451e0">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(A_HeelPrick-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:outcome[hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:outcome[hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]"
         id="d41e43615-false-d1484464e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@typeCode) = ('OUTC') or not(@typeCode)">(A_HeelPrick-universal): de waarde van typeCode MOET 'OUTC' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@contextConductionInd) = ('false') or not(@contextConductionInd)">(A_HeelPrick-universal): de waarde van contextConductionInd MOET 'false' zijn. Gevonden: "<value-of select="@contextConductionInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &gt;= 1">(A_HeelPrick-universal): element hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]) &lt;= 1">(A_HeelPrick-universal): element hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:outcome[hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:outcome[hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]"
         id="d41e43626-false-d1484500e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:id) &lt;= 1">(A_HeelPrick-universal): element hl7:id komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(A_HeelPrick-universal): element hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(A_HeelPrick-universal): element hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.321-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(A_HeelPrick-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.321-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.321-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(A_HeelPrick-universal): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.321-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:outcome[hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:id
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:outcome[hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:id"
         id="d41e43633-false-d1484550e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(A_HeelPrick-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:outcome[hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:outcome[hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e43641-false-d1484563e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_HeelPrick-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="@nullFlavor or (@code='381' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(A_HeelPrick-universal): de elementwaarde MOET een zijn van 'code '381' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:outcome[hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.321-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:outcome[hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:result[hl7:code[(@code = '381' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.321-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d41e43652-false-d1484585e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(A_HeelPrick-universal): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.321-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(A_HeelPrick-universal): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.321 W0321 Uitslag (HL7) (2012-05-21T01:26:54)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.133
Context: *[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:inFulFillmentOf[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]
Item: (A_HeelPrick-universal)
-->
   <rule fpi="RULC-1"
         context="*[hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]]/hl7:heelPrick[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.133']]/hl7:inFulFillmentOf[hl7:procedureRequest[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.134']]]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@typeCode) = ('FLFS') or not(@typeCode)">(A_HeelPrick-universal): de waarde van typeCode MOET 'FLFS' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.133-2012-08-01T000000.html"
              test="string(@contextConductionInd) = ('false') or not(@contextConductionInd)">(A_HeelPrick-universal): de waarde van contextConductionInd MOET 'false' zijn. Gevonden: "<value-of select="@contextConductionInd"/>"</assert>
   </rule>
</pattern>
