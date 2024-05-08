<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.14
Name: Versturen vaccinaties (interactie)
Description: Versturen vaccinatie. De waarde voor het element  acceptAckCode  is "AL". Wijzigingen ten op zichte van de vorige versie:  Bevat een nieuwe versie van de payload. 
            
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000-closed">
   <title>Versturen vaccinaties (interactie)</title>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:creationTime[not(@nullFlavor)] | self::hl7:versionCode[@code = 'NICTIZEd2005-Okt'] | self::hl7:interactionId[@root = '2.16.840.1.113883.1.6'] | self::hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810'] | self::hl7:processingCode[@code = 'P'] | self::hl7:processingModeCode[@code = 'T'] | self::hl7:acceptAckCode[@code = 'AL' or @code = 'NE'] | self::hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] | self::hl7:receiver[not(@nullFlavor)][hl7:device] | self::hl7:respondTo[hl7:entityRsp] | self::hl7:sender[not(@nullFlavor)][hl7:device] | self::hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN'])]"
         id="d40e26378-true-d566829e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d40e26378-true-d566829e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:creationTime[not(@nullFlavor)] | hl7:versionCode[@code = 'NICTIZEd2005-Okt'] | hl7:interactionId[@root = '2.16.840.1.113883.1.6'] | hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810'] | hl7:processingCode[@code = 'P'] | hl7:processingModeCode[@code = 'T'] | hl7:acceptAckCode[@code = 'AL' or @code = 'NE'] | hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] | hl7:receiver[not(@nullFlavor)][hl7:device] | hl7:respondTo[hl7:entityRsp] | hl7:sender[not(@nullFlavor)][hl7:device] | hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN'] (rule-reference: d40e26378-true-d566829e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/*[not(@xsi:nil = 'true')][not(self::hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] | self::hl7:value[not(@nullFlavor)])]"
         id="d566887e18-true-d566912e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.120-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperAttentionLine)/d566887e18-true-d566912e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] | hl7:value[not(@nullFlavor)] (rule-reference: d566887e18-true-d566912e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']])]"
         id="d566834e128-true-d566970e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d566834e128-true-d566970e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] (rule-reference: d566834e128-true-d566970e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:name | self::hl7:telecom | self::hl7:softwareName | self::hl7:agencyFor)]"
         id="d566981e20-true-d567045e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d566981e20-true-d567045e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:name | hl7:telecom | hl7:softwareName | hl7:agencyFor (rule-reference: d566981e20-true-d567045e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/*[not(@xsi:nil = 'true')][not(self::hl7:representedOrganization)]"
         id="d566981e67-true-d567118e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d566981e67-true-d567118e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:representedOrganization (rule-reference: d566981e67-true-d567118e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:name | self::hl7:telecom | self::hl7:NotificationParty[hl7:contactParty])]"
         id="d566981e74-true-d567180e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d566981e74-true-d567180e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:name | hl7:telecom | hl7:NotificationParty[hl7:contactParty] (rule-reference: d566981e74-true-d567180e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactParty)]"
         id="d566981e103-true-d567235e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d566981e103-true-d567235e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactParty (rule-reference: d566981e103-true-d567235e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/*[not(@xsi:nil = 'true')][not(self::hl7:Organization[hl7:contact] | self::hl7:Person)]"
         id="d567240e24-true-d567285e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d567240e24-true-d567285e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:Organization[hl7:contact] | hl7:Person (rule-reference: d567240e24-true-d567285e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:name | self::hl7:contact | self::hl7:templateId)]"
         id="d567240e28-true-d567328e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d567240e28-true-d567328e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:name | hl7:contact | hl7:templateId (rule-reference: d567240e28-true-d567328e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactPerson | self::hl7:templateId)]"
         id="d567292e6-true-d567391e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d567292e6-true-d567391e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactPerson | hl7:templateId (rule-reference: d567292e6-true-d567391e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/*[not(@xsi:nil = 'true')][not(self::hl7:name | self::hl7:templateId | self::hl7:id | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication)]"
         id="d567292e19-true-d567558e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d567292e19-true-d567558e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name | hl7:templateId | hl7:id | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication (rule-reference: d567292e19-true-d567558e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d567422e14-true-d567625e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d567422e14-true-d567625e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d567422e14-true-d567625e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:name | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication | self::hl7:templateId)]"
         id="d567240e30-true-d567712e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d567240e30-true-d567712e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:name | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication | hl7:templateId (rule-reference: d567240e30-true-d567712e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d567674e7-true-d567773e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d567674e7-true-d567773e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d567674e7-true-d567773e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']])]"
         id="d566834e142-true-d567837e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d566834e142-true-d567837e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] (rule-reference: d566834e142-true-d567837e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:name | self::hl7:telecom)]"
         id="d566834e153-true-d567870e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d566834e153-true-d567870e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:name | hl7:telecom (rule-reference: d566834e153-true-d567870e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']])]"
         id="d566834e172-true-d567934e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d566834e172-true-d567934e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] (rule-reference: d566834e172-true-d567934e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:name | self::hl7:telecom | self::hl7:softwareName | self::hl7:agencyFor)]"
         id="d567945e20-true-d568009e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d567945e20-true-d568009e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:name | hl7:telecom | hl7:softwareName | hl7:agencyFor (rule-reference: d567945e20-true-d568009e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/*[not(@xsi:nil = 'true')][not(self::hl7:representedOrganization)]"
         id="d567945e67-true-d568082e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d567945e67-true-d568082e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:representedOrganization (rule-reference: d567945e67-true-d568082e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:name | self::hl7:telecom | self::hl7:NotificationParty[hl7:contactParty])]"
         id="d567945e74-true-d568144e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d567945e74-true-d568144e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:name | hl7:telecom | hl7:NotificationParty[hl7:contactParty] (rule-reference: d567945e74-true-d568144e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactParty)]"
         id="d567945e103-true-d568199e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d567945e103-true-d568199e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactParty (rule-reference: d567945e103-true-d568199e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/*[not(@xsi:nil = 'true')][not(self::hl7:Organization[hl7:contact] | self::hl7:Person)]"
         id="d568204e24-true-d568249e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d568204e24-true-d568249e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:Organization[hl7:contact] | hl7:Person (rule-reference: d568204e24-true-d568249e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:name | self::hl7:contact | self::hl7:templateId)]"
         id="d568204e28-true-d568292e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d568204e28-true-d568292e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:name | hl7:contact | hl7:templateId (rule-reference: d568204e28-true-d568292e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactPerson | self::hl7:templateId)]"
         id="d568256e6-true-d568355e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d568256e6-true-d568355e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactPerson | hl7:templateId (rule-reference: d568256e6-true-d568355e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/*[not(@xsi:nil = 'true')][not(self::hl7:name | self::hl7:templateId | self::hl7:id | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication)]"
         id="d568256e19-true-d568522e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d568256e19-true-d568522e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name | hl7:templateId | hl7:id | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication (rule-reference: d568256e19-true-d568522e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d568386e14-true-d568589e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d568386e14-true-d568589e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d568386e14-true-d568589e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:name | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication | self::hl7:templateId)]"
         id="d568204e30-true-d568676e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d568204e30-true-d568676e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:name | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication | hl7:templateId (rule-reference: d568204e30-true-d568676e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d568638e7-true-d568737e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d568638e7-true-d568737e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d568638e7-true-d568737e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/*[not(@xsi:nil = 'true')][not(self::hl7:authorOrPerformer[@typeCode][hl7:participant] | self::hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson] | self::hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]])]"
         id="d40e26391-true-d568952e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d40e26391-true-d568952e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:authorOrPerformer[@typeCode][hl7:participant] | hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson] | hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]] (rule-reference: d40e26391-true-d568952e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/*[not(@xsi:nil = 'true')][not(self::hl7:participant[not(@nullFlavor)])]"
         id="d568957e91-true-d569085e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d568957e91-true-d569085e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:participant[not(@nullFlavor)] (rule-reference: d568957e91-true-d569085e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:AssignedDevice | self::hl7:AssignedPerson[hl7:Organization])]"
         id="d568957e101-true-d569177e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d568957e101-true-d569177e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:AssignedDevice | hl7:AssignedPerson[hl7:Organization] (rule-reference: d568957e101-true-d569177e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.2'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:id[@root = '2.16.528.1.1007.4'] | self::hl7:Organization | self::hl7:templateId)]"
         id="d568957e105-true-d569233e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d568957e105-true-d569233e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.2'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:id[@root = '2.16.528.1.1007.4'] | hl7:Organization | hl7:templateId (rule-reference: d568957e105-true-d569233e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | self::hl7:id | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:name | self::hl7:addr)]"
         id="d569262e6-true-d569320e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d569262e6-true-d569320e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | hl7:id | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:name | hl7:addr (rule-reference: d569262e6-true-d569320e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:city[not(@nullFlavor)])]"
         id="d569262e57-true-d569395e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d569262e57-true-d569395e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:city[not(@nullFlavor)] (rule-reference: d569262e57-true-d569395e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.1'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3'] | self::hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:assignedPrincipalChoiceList[hl7:assignedPerson] | self::hl7:Organization | self::hl7:templateId)]"
         id="d568957e107-true-d569500e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d568957e107-true-d569500e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3'] | hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:assignedPrincipalChoiceList[hl7:assignedPerson] | hl7:Organization | hl7:templateId (rule-reference: d568957e107-true-d569500e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedPerson[not(@nullFlavor)])]"
         id="d569414e40-true-d569575e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d569414e40-true-d569575e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedPerson[not(@nullFlavor)] (rule-reference: d569414e40-true-d569575e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)])]"
         id="d569414e45-true-d569592e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d569414e45-true-d569592e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] (rule-reference: d569414e45-true-d569592e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | self::hl7:id | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:name | self::hl7:addr)]"
         id="d569603e6-true-d569661e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d569603e6-true-d569661e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | hl7:id | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:name | hl7:addr (rule-reference: d569603e6-true-d569661e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:city[not(@nullFlavor)])]"
         id="d569603e57-true-d569736e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d569603e57-true-d569736e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:city[not(@nullFlavor)] (rule-reference: d569603e57-true-d569736e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/*[not(@xsi:nil = 'true')][not(self::hl7:time | self::hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization])]"
         id="d569753e56-true-d569835e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.502-2012-08-01T000000.html"
              test="not(.)">(ControlActOverseerPersonMcaiMfmi)/d569753e56-true-d569835e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:time | hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization] (rule-reference: d569753e56-true-d569835e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.1'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3'] | self::hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:assignedPrincipalChoiceList[hl7:assignedPerson] | self::hl7:Organization | self::hl7:templateId)]"
         id="d569753e70-true-d569934e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.502-2012-08-01T000000.html"
              test="not(.)">(ControlActOverseerPersonMcaiMfmi)/d569753e70-true-d569934e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3'] | hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:assignedPrincipalChoiceList[hl7:assignedPerson] | hl7:Organization | hl7:templateId (rule-reference: d569753e70-true-d569934e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedPerson[not(@nullFlavor)])]"
         id="d569848e44-true-d570009e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.502-2012-08-01T000000.html"
              test="not(.)">(ControlActOverseerPersonMcaiMfmi)/d569848e44-true-d570009e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedPerson[not(@nullFlavor)] (rule-reference: d569848e44-true-d570009e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)])]"
         id="d569848e49-true-d570026e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.502-2012-08-01T000000.html"
              test="not(.)">(ControlActOverseerPersonMcaiMfmi)/d569848e49-true-d570026e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] (rule-reference: d569848e49-true-d570026e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/hl7:Organization/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | self::hl7:id | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:name | self::hl7:addr)]"
         id="d570037e6-true-d570095e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d570037e6-true-d570095e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | hl7:id | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:name | hl7:addr (rule-reference: d570037e6-true-d570095e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:city[not(@nullFlavor)])]"
         id="d570037e57-true-d570170e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d570037e57-true-d570170e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:city[not(@nullFlavor)] (rule-reference: d570037e57-true-d570170e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/*[not(@xsi:nil = 'true')][not(self::hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']])]"
         id="d40e26415-true-d570259e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d40e26415-true-d570259e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']] (rule-reference: d40e26415-true-d570259e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180'] | self::hl7:id[@nullFlavor = 'MSK'] | self::hl7:id | self::hl7:code[(@code = 'CPHC' and @codeSystem = '2.16.840.1.113883.5.4')] | self::hl7:statusCode[@code = 'active' or @code = 'aborted' or @code = 'completed'] | self::hl7:subject[hl7:patient[@nullFlavor = 'MSK']] | self::hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']] | self::hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] | self::hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] | self::hl7:component[not(@nullFlavor)][hl7:encounterEvent])]"
         id="d570189e6-true-d570338e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570189e6-true-d570338e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180'] | hl7:id[@nullFlavor = 'MSK'] | hl7:id | hl7:code[(@code = 'CPHC' and @codeSystem = '2.16.840.1.113883.5.4')] | hl7:statusCode[@code = 'active' or @code = 'aborted' or @code = 'completed'] | hl7:subject[hl7:patient[@nullFlavor = 'MSK']] | hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']] | hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] | hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] | hl7:component[not(@nullFlavor)][hl7:encounterEvent] (rule-reference: d570189e6-true-d570338e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[@nullFlavor = 'MSK']]/*[not(@xsi:nil = 'true')][not(self::hl7:patient[@classCode = 'PAT'][@nullFlavor = 'MSK'])]"
         id="d570189e159-true-d570381e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570189e159-true-d570381e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:patient[@classCode = 'PAT'][@nullFlavor = 'MSK'] (rule-reference: d570189e159-true-d570381e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/*[not(@xsi:nil = 'true')][not(self::hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']])]"
         id="d570189e174-true-d570423e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570189e174-true-d570423e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']] (rule-reference: d570189e174-true-d570423e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102'] | self::hl7:id | self::hl7:addr | self::hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] | self::hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]])]"
         id="d570394e23-true-d570483e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570394e23-true-d570483e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102'] | hl7:id | hl7:addr | hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] | hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]] (rule-reference: d570394e23-true-d570483e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:streetName | self::hl7:houseNumber | self::hl7:buildingNumberSuffix | self::hl7:additionalLocator | self::hl7:postalCode | self::hl7:county | self::hl7:city | self::hl7:country | self::hl7:desc | self::hl7:useablePeriod)]"
         id="d570500e6-true-d570559e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="not(.)">(AdresJeugdige)/d570500e6-true-d570559e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:streetName | hl7:houseNumber | hl7:buildingNumberSuffix | hl7:additionalLocator | hl7:postalCode | hl7:county | hl7:city | hl7:country | hl7:desc | hl7:useablePeriod (rule-reference: d570500e6-true-d570559e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:addr/hl7:useablePeriod/*[not(@xsi:nil = 'true')][not(self::hl7:low | self::hl7:high | self::hl7:width | self::hl7:center)]"
         id="d570618e6-true-d570641e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="not(.)">(PeriodeGeldigheidAdresJeugdige)/d570618e6-true-d570641e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:low | hl7:high | hl7:width | hl7:center (rule-reference: d570618e6-true-d570641e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)] | self::hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] | self::hl7:birthTime[not(@nullFlavor)])]"
         id="d570394e93-true-d570698e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570394e93-true-d570698e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] | hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] | hl7:birthTime[not(@nullFlavor)] (rule-reference: d570394e93-true-d570698e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:name[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:given | self::hl7:prefix | self::hl7:family)]"
         id="d570394e101-true-d570725e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570394e101-true-d570725e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:given | hl7:prefix | hl7:family (rule-reference: d570394e101-true-d570725e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/*[not(@xsi:nil = 'true')][not(self::hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']])]"
         id="d570394e168-true-d570789e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570394e168-true-d570789e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']] (rule-reference: d570394e168-true-d570789e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584'] | self::hl7:code[(@code = '1584' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | self::hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.681-2024-04-25T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]] | self::hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]])]"
         id="d570394e180-true-d570839e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570394e180-true-d570839e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584'] | hl7:code[(@code = '1584' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.681-2024-04-25T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]] | hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]] (rule-reference: d570394e180-true-d570839e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/*[not(@xsi:nil = 'true')][not(self::hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']])]"
         id="d570796e27-true-d570879e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570796e27-true-d570879e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']] (rule-reference: d570796e27-true-d570879e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028'] | self::hl7:code | self::hl7:text | self::hl7:value | self::hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]])]"
         id="d570866e5-true-d570916e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570866e5-true-d570916e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028'] | hl7:code | hl7:text | hl7:value | hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]] (rule-reference: d570866e5-true-d570916e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:code/*[not(@xsi:nil = 'true')][not(self::hl7:originalText)]"
         id="d570866e80-true-d570939e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570866e80-true-d570939e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:originalText (rule-reference: d570866e80-true-d570939e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]/*[not(@xsi:nil = 'true')][not(self::hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']])]"
         id="d570866e236-true-d570974e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570866e236-true-d570974e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']] (rule-reference: d570866e236-true-d570974e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]/hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]/*[not(@xsi:nil = 'true')][not(self::hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391'])]"
         id="d570866e248-true-d570991e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570866e248-true-d570991e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391'] (rule-reference: d570866e248-true-d570991e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/*[not(@xsi:nil = 'true')][not(self::hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']])]"
         id="d570796e32-true-d571017e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570796e32-true-d571017e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']] (rule-reference: d570796e32-true-d571017e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029'] | self::hl7:code[not(@nullFlavor)] | self::hl7:text | self::hl7:value | self::hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])]"
         id="d571004e5-true-d571048e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571004e5-true-d571048e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029'] | hl7:code[not(@nullFlavor)] | hl7:text | hl7:value | hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] (rule-reference: d571004e5-true-d571048e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]/*[not(@xsi:nil = 'true')][not(self::hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']])]"
         id="d571004e107-true-d571089e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571004e107-true-d571089e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']] (rule-reference: d571004e107-true-d571089e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]/hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]/*[not(@xsi:nil = 'true')][not(self::hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267'])]"
         id="d571004e127-true-d571106e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571004e127-true-d571106e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267'] (rule-reference: d571004e127-true-d571106e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']])]"
         id="d570189e200-true-d571132e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570189e200-true-d571132e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']] (rule-reference: d570189e200-true-d571132e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122'] | self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | self::hl7:id[@nullFlavor = 'NI'] | self::hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'])]"
         id="d571119e6-true-d571160e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571119e6-true-d571160e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122'] | hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = 'NI'] | hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'] (rule-reference: d571119e6-true-d571160e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]/hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)])]"
         id="d571119e63-true-d571201e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571119e63-true-d571201e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] (rule-reference: d571119e63-true-d571201e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']])]"
         id="d570189e208-true-d571227e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570189e208-true-d571227e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']] (rule-reference: d570189e208-true-d571227e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122'] | self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | self::hl7:id[@nullFlavor = 'NI'] | self::hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'])]"
         id="d571214e6-true-d571255e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571214e6-true-d571255e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122'] | hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = 'NI'] | hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'] (rule-reference: d571214e6-true-d571255e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]/hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)])]"
         id="d571214e63-true-d571296e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571214e63-true-d571296e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] (rule-reference: d571214e63-true-d571296e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/*[not(@xsi:nil = 'true')][not(self::hl7:encounterEvent[not(@nullFlavor)])]"
         id="d570189e217-true-d571331e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570189e217-true-d571331e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:encounterEvent[not(@nullFlavor)] (rule-reference: d570189e217-true-d571331e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code[@nullFlavor = 'MSK'] | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code] | self::hl7:effectiveTime[not(@nullFlavor)] | self::hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]])]"
         id="d570189e235-true-d571374e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570189e235-true-d571374e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code[@nullFlavor = 'MSK'] | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code] | hl7:effectiveTime[not(@nullFlavor)] | hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]] (rule-reference: d570189e235-true-d571374e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/*[not(@xsi:nil = 'true')][not(self::hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']])]"
         id="d570189e313-true-d571424e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d570189e313-true-d571424e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']] (rule-reference: d570189e313-true-d571424e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117'] | self::hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | self::hl7:effectiveTime[not(@nullFlavor)] | self::hl7:consumable[not(@nullFlavor)][hl7:medication] | self::hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]] | self::hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]])]"
         id="d571405e22-true-d571472e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571405e22-true-d571472e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117'] | hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | hl7:effectiveTime[not(@nullFlavor)] | hl7:consumable[not(@nullFlavor)][hl7:medication] | hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]] | hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]] (rule-reference: d571405e22-true-d571472e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/*[not(@xsi:nil = 'true')][not(self::hl7:medication[not(@nullFlavor)][hl7:administrableMedicine])]"
         id="d571405e172-true-d571507e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571405e172-true-d571507e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:medication[not(@nullFlavor)][hl7:administrableMedicine] (rule-reference: d571405e172-true-d571507e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/*[not(@xsi:nil = 'true')][not(self::hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']])]"
         id="d571405e192-true-d571524e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571405e192-true-d571524e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']] (rule-reference: d571405e192-true-d571524e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/*[not(@xsi:nil = 'true')][not(self::hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] | self::hl7:lotNumberText)]"
         id="d571405e198-true-d571542e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571405e198-true-d571542e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] | hl7:lotNumberText (rule-reference: d571405e198-true-d571542e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']])]"
         id="d571405e244-true-d571572e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571405e244-true-d571572e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']] (rule-reference: d571405e244-true-d571572e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124'] | self::hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE'] | self::hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE'])]"
         id="d571559e6-true-d571599e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571559e6-true-d571599e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124'] | hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE'] | hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE'] (rule-reference: d571559e6-true-d571599e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:name)]"
         id="d571559e65-true-d571622e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571559e65-true-d571622e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name (rule-reference: d571559e65-true-d571622e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:id[@nullFlavor = 'NI'] | self::hl7:name | self::hl7:organizationContains[@classCode = 'PART'][hl7:partOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']])]"
         id="d571559e89-true-d571655e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571559e89-true-d571655e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@nullFlavor = 'NI'] | hl7:name | hl7:organizationContains[@classCode = 'PART'][hl7:partOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']] (rule-reference: d571559e89-true-d571655e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:organizationContains[@classCode = 'PART'][hl7:partOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']]/*[not(@xsi:nil = 'true')][not(self::hl7:partOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE'])]"
         id="d571559e119-true-d571684e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571559e119-true-d571684e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:partOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE'] (rule-reference: d571559e119-true-d571684e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:organizationContains[@classCode = 'PART'][hl7:partOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']]/hl7:partOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:id[@nullFlavor = 'NA'] | self::hl7:name[not(@nullFlavor)])]"
         id="d571559e129-true-d571706e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571559e129-true-d571706e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@nullFlavor = 'NA'] | hl7:name[not(@nullFlavor)] (rule-reference: d571559e129-true-d571706e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/*[not(@xsi:nil = 'true')][not(self::hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]])]"
         id="d571405e254-true-d571735e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571405e254-true-d571735e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] (rule-reference: d571405e254-true-d571735e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/*[not(@xsi:nil = 'true')][not(self::hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | self::hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]])]"
         id="d571405e265-true-d571757e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571405e265-true-d571757e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] (rule-reference: d571405e265-true-d571757e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/*[not(@xsi:nil = 'true')][not(self::hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]])]"
         id="d571405e293-true-d571780e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571405e293-true-d571780e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] (rule-reference: d571405e293-true-d571780e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/*[not(@xsi:nil = 'true')][not(self::hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | self::hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)])]"
         id="d571405e304-true-d571806e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.14-2024-04-25T000000.html"
              test="not(.)">(VersturenVaccinaties)/d571405e304-true-d571806e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] (rule-reference: d571405e304-true-d571806e0)</assert>
   </rule>
</pattern>
