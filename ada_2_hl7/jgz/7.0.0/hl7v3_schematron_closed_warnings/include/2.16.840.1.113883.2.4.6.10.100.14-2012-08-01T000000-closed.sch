<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.14
Name: Versturen vaccinaties (interactie)
Description: Versturen vaccinatie. De waarde voor het element  acceptAckCode  is "AL".
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000-closed">
   <title>Versturen vaccinaties (interactie)</title>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:creationTime[not(@nullFlavor)] | self::hl7:versionCode[@code = 'NICTIZEd2005-Okt'] | self::hl7:interactionId[@root = '2.16.840.1.113883.1.6'] | self::hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810'] | self::hl7:processingCode[@code = 'P'] | self::hl7:processingModeCode[@code = 'T'] | self::hl7:acceptAckCode[@code = 'AL' or @code = 'NE'] | self::hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] | self::hl7:receiver[not(@nullFlavor)][hl7:device] | self::hl7:respondTo[hl7:entityRsp] | self::hl7:sender[not(@nullFlavor)][hl7:device] | self::hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN'])]"
         id="d41e44497-true-d1504976e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d41e44497-true-d1504976e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:creationTime[not(@nullFlavor)] | hl7:versionCode[@code = 'NICTIZEd2005-Okt'] | hl7:interactionId[@root = '2.16.840.1.113883.1.6'] | hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810'] | hl7:processingCode[@code = 'P'] | hl7:processingModeCode[@code = 'T'] | hl7:acceptAckCode[@code = 'AL' or @code = 'NE'] | hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] | hl7:receiver[not(@nullFlavor)][hl7:device] | hl7:respondTo[hl7:entityRsp] | hl7:sender[not(@nullFlavor)][hl7:device] | hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN'] (rule-reference: d41e44497-true-d1504976e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/*[not(@xsi:nil = 'true')][not(self::hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] | self::hl7:value[not(@nullFlavor)])]"
         id="d1505034e18-true-d1505059e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.120-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperAttentionLine)/d1505034e18-true-d1505059e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] | hl7:value[not(@nullFlavor)] (rule-reference: d1505034e18-true-d1505059e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']])]"
         id="d1504981e128-true-d1505117e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d1504981e128-true-d1505117e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] (rule-reference: d1504981e128-true-d1505117e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:name | self::hl7:telecom | self::hl7:softwareName | self::hl7:agencyFor)]"
         id="d1505128e20-true-d1505192e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1505128e20-true-d1505192e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:name | hl7:telecom | hl7:softwareName | hl7:agencyFor (rule-reference: d1505128e20-true-d1505192e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/*[not(@xsi:nil = 'true')][not(self::hl7:representedOrganization)]"
         id="d1505128e67-true-d1505265e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1505128e67-true-d1505265e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:representedOrganization (rule-reference: d1505128e67-true-d1505265e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:name | self::hl7:telecom | self::hl7:NotificationParty[hl7:contactParty])]"
         id="d1505128e74-true-d1505327e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1505128e74-true-d1505327e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:name | hl7:telecom | hl7:NotificationParty[hl7:contactParty] (rule-reference: d1505128e74-true-d1505327e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactParty)]"
         id="d1505128e103-true-d1505382e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1505128e103-true-d1505382e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactParty (rule-reference: d1505128e103-true-d1505382e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/*[not(@xsi:nil = 'true')][not(self::hl7:Organization[hl7:contact] | self::hl7:Person)]"
         id="d1505387e24-true-d1505432e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1505387e24-true-d1505432e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:Organization[hl7:contact] | hl7:Person (rule-reference: d1505387e24-true-d1505432e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:name | self::hl7:contact | self::hl7:templateId)]"
         id="d1505387e28-true-d1505475e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1505387e28-true-d1505475e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:name | hl7:contact | hl7:templateId (rule-reference: d1505387e28-true-d1505475e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactPerson | self::hl7:templateId)]"
         id="d1505439e6-true-d1505538e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1505439e6-true-d1505538e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactPerson | hl7:templateId (rule-reference: d1505439e6-true-d1505538e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/*[not(@xsi:nil = 'true')][not(self::hl7:name | self::hl7:templateId | self::hl7:id | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication)]"
         id="d1505439e19-true-d1505705e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1505439e19-true-d1505705e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name | hl7:templateId | hl7:id | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication (rule-reference: d1505439e19-true-d1505705e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d1505569e14-true-d1505772e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1505569e14-true-d1505772e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d1505569e14-true-d1505772e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:name | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication | self::hl7:templateId)]"
         id="d1505387e30-true-d1505859e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1505387e30-true-d1505859e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:name | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication | hl7:templateId (rule-reference: d1505387e30-true-d1505859e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d1505821e7-true-d1505920e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1505821e7-true-d1505920e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d1505821e7-true-d1505920e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']])]"
         id="d1504981e142-true-d1505984e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d1504981e142-true-d1505984e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] (rule-reference: d1504981e142-true-d1505984e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:name | self::hl7:telecom)]"
         id="d1504981e153-true-d1506017e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d1504981e153-true-d1506017e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:name | hl7:telecom (rule-reference: d1504981e153-true-d1506017e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']])]"
         id="d1504981e172-true-d1506081e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d1504981e172-true-d1506081e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] (rule-reference: d1504981e172-true-d1506081e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:name | self::hl7:telecom | self::hl7:softwareName | self::hl7:agencyFor)]"
         id="d1506092e20-true-d1506156e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1506092e20-true-d1506156e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:name | hl7:telecom | hl7:softwareName | hl7:agencyFor (rule-reference: d1506092e20-true-d1506156e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/*[not(@xsi:nil = 'true')][not(self::hl7:representedOrganization)]"
         id="d1506092e67-true-d1506229e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1506092e67-true-d1506229e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:representedOrganization (rule-reference: d1506092e67-true-d1506229e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:name | self::hl7:telecom | self::hl7:NotificationParty[hl7:contactParty])]"
         id="d1506092e74-true-d1506291e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1506092e74-true-d1506291e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:name | hl7:telecom | hl7:NotificationParty[hl7:contactParty] (rule-reference: d1506092e74-true-d1506291e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactParty)]"
         id="d1506092e103-true-d1506346e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1506092e103-true-d1506346e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactParty (rule-reference: d1506092e103-true-d1506346e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/*[not(@xsi:nil = 'true')][not(self::hl7:Organization[hl7:contact] | self::hl7:Person)]"
         id="d1506351e24-true-d1506396e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1506351e24-true-d1506396e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:Organization[hl7:contact] | hl7:Person (rule-reference: d1506351e24-true-d1506396e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:name | self::hl7:contact | self::hl7:templateId)]"
         id="d1506351e28-true-d1506439e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1506351e28-true-d1506439e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:name | hl7:contact | hl7:templateId (rule-reference: d1506351e28-true-d1506439e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactPerson | self::hl7:templateId)]"
         id="d1506403e6-true-d1506502e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1506403e6-true-d1506502e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactPerson | hl7:templateId (rule-reference: d1506403e6-true-d1506502e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/*[not(@xsi:nil = 'true')][not(self::hl7:name | self::hl7:templateId | self::hl7:id | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication)]"
         id="d1506403e19-true-d1506669e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1506403e19-true-d1506669e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name | hl7:templateId | hl7:id | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication (rule-reference: d1506403e19-true-d1506669e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d1506533e14-true-d1506736e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1506533e14-true-d1506736e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d1506533e14-true-d1506736e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:name | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication | self::hl7:templateId)]"
         id="d1506351e30-true-d1506823e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1506351e30-true-d1506823e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:name | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication | hl7:templateId (rule-reference: d1506351e30-true-d1506823e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d1506785e7-true-d1506884e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1506785e7-true-d1506884e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d1506785e7-true-d1506884e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/*[not(@xsi:nil = 'true')][not(self::hl7:authorOrPerformer[@typeCode][hl7:participant] | self::hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson] | self::hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]])]"
         id="d41e44510-true-d1507099e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d41e44510-true-d1507099e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:authorOrPerformer[@typeCode][hl7:participant] | hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson] | hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]] (rule-reference: d41e44510-true-d1507099e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/*[not(@xsi:nil = 'true')][not(self::hl7:participant[not(@nullFlavor)])]"
         id="d1507104e91-true-d1507232e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d1507104e91-true-d1507232e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:participant[not(@nullFlavor)] (rule-reference: d1507104e91-true-d1507232e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:AssignedDevice | self::hl7:AssignedPerson[hl7:Organization])]"
         id="d1507104e101-true-d1507324e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d1507104e101-true-d1507324e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:AssignedDevice | hl7:AssignedPerson[hl7:Organization] (rule-reference: d1507104e101-true-d1507324e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.2'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:id[@root = '2.16.528.1.1007.4'] | self::hl7:Organization | self::hl7:templateId)]"
         id="d1507104e105-true-d1507380e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d1507104e105-true-d1507380e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.2'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:id[@root = '2.16.528.1.1007.4'] | hl7:Organization | hl7:templateId (rule-reference: d1507104e105-true-d1507380e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | self::hl7:id | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:name | self::hl7:addr)]"
         id="d1507409e6-true-d1507467e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d1507409e6-true-d1507467e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | hl7:id | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:name | hl7:addr (rule-reference: d1507409e6-true-d1507467e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:city[not(@nullFlavor)])]"
         id="d1507409e57-true-d1507542e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d1507409e57-true-d1507542e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:city[not(@nullFlavor)] (rule-reference: d1507409e57-true-d1507542e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.1'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3'] | self::hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:assignedPrincipalChoiceList[hl7:assignedPerson] | self::hl7:Organization | self::hl7:templateId)]"
         id="d1507104e107-true-d1507647e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d1507104e107-true-d1507647e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3'] | hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:assignedPrincipalChoiceList[hl7:assignedPerson] | hl7:Organization | hl7:templateId (rule-reference: d1507104e107-true-d1507647e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedPerson[not(@nullFlavor)])]"
         id="d1507561e40-true-d1507722e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d1507561e40-true-d1507722e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedPerson[not(@nullFlavor)] (rule-reference: d1507561e40-true-d1507722e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)])]"
         id="d1507561e45-true-d1507739e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d1507561e45-true-d1507739e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] (rule-reference: d1507561e45-true-d1507739e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | self::hl7:id | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:name | self::hl7:addr)]"
         id="d1507750e6-true-d1507808e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d1507750e6-true-d1507808e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | hl7:id | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:name | hl7:addr (rule-reference: d1507750e6-true-d1507808e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:city[not(@nullFlavor)])]"
         id="d1507750e57-true-d1507883e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d1507750e57-true-d1507883e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:city[not(@nullFlavor)] (rule-reference: d1507750e57-true-d1507883e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/*[not(@xsi:nil = 'true')][not(self::hl7:time | self::hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization])]"
         id="d1507900e56-true-d1507982e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.502-2012-08-01T000000.html"
              test="not(.)">(ControlActOverseerPersonMcaiMfmi)/d1507900e56-true-d1507982e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:time | hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization] (rule-reference: d1507900e56-true-d1507982e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.1'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3'] | self::hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:assignedPrincipalChoiceList[hl7:assignedPerson] | self::hl7:Organization | self::hl7:templateId)]"
         id="d1507900e70-true-d1508081e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.502-2012-08-01T000000.html"
              test="not(.)">(ControlActOverseerPersonMcaiMfmi)/d1507900e70-true-d1508081e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3'] | hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:assignedPrincipalChoiceList[hl7:assignedPerson] | hl7:Organization | hl7:templateId (rule-reference: d1507900e70-true-d1508081e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedPerson[not(@nullFlavor)])]"
         id="d1507995e44-true-d1508156e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.502-2012-08-01T000000.html"
              test="not(.)">(ControlActOverseerPersonMcaiMfmi)/d1507995e44-true-d1508156e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedPerson[not(@nullFlavor)] (rule-reference: d1507995e44-true-d1508156e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)])]"
         id="d1507995e49-true-d1508173e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.502-2012-08-01T000000.html"
              test="not(.)">(ControlActOverseerPersonMcaiMfmi)/d1507995e49-true-d1508173e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] (rule-reference: d1507995e49-true-d1508173e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/hl7:Organization/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | self::hl7:id | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:name | self::hl7:addr)]"
         id="d1508184e6-true-d1508242e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d1508184e6-true-d1508242e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | hl7:id | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:name | hl7:addr (rule-reference: d1508184e6-true-d1508242e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:city[not(@nullFlavor)])]"
         id="d1508184e57-true-d1508317e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d1508184e57-true-d1508317e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:city[not(@nullFlavor)] (rule-reference: d1508184e57-true-d1508317e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/*[not(@xsi:nil = 'true')][not(self::hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']])]"
         id="d41e44534-true-d1508406e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d41e44534-true-d1508406e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']] (rule-reference: d41e44534-true-d1508406e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180'] | self::hl7:id[@nullFlavor = 'MSK'] | self::hl7:id | self::hl7:code[(@code = 'CPHC' and @codeSystem = '2.16.840.1.113883.5.4')] | self::hl7:statusCode[@code = 'active' or @code = 'aborted' or @code = 'completed'] | self::hl7:subject[hl7:patient[@nullFlavor = 'MSK']] | self::hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']] | self::hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] | self::hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] | self::hl7:component[not(@nullFlavor)][hl7:encounterEvent])]"
         id="d1508336e6-true-d1508485e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508336e6-true-d1508485e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180'] | hl7:id[@nullFlavor = 'MSK'] | hl7:id | hl7:code[(@code = 'CPHC' and @codeSystem = '2.16.840.1.113883.5.4')] | hl7:statusCode[@code = 'active' or @code = 'aborted' or @code = 'completed'] | hl7:subject[hl7:patient[@nullFlavor = 'MSK']] | hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']] | hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] | hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] | hl7:component[not(@nullFlavor)][hl7:encounterEvent] (rule-reference: d1508336e6-true-d1508485e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[@nullFlavor = 'MSK']]/*[not(@xsi:nil = 'true')][not(self::hl7:patient[@classCode = 'PAT'][@nullFlavor = 'MSK'])]"
         id="d1508336e174-true-d1508528e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508336e174-true-d1508528e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:patient[@classCode = 'PAT'][@nullFlavor = 'MSK'] (rule-reference: d1508336e174-true-d1508528e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/*[not(@xsi:nil = 'true')][not(self::hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']])]"
         id="d1508336e191-true-d1508570e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508336e191-true-d1508570e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']] (rule-reference: d1508336e191-true-d1508570e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102'] | self::hl7:id | self::hl7:addr | self::hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] | self::hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]])]"
         id="d1508541e23-true-d1508630e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508541e23-true-d1508630e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102'] | hl7:id | hl7:addr | hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] | hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]] (rule-reference: d1508541e23-true-d1508630e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:streetName | self::hl7:houseNumber | self::hl7:buildingNumberSuffix | self::hl7:additionalLocator | self::hl7:postalCode | self::hl7:county | self::hl7:city | self::hl7:country | self::hl7:desc | self::hl7:useablePeriod)]"
         id="d1508647e6-true-d1508706e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="not(.)">(AdresJeugdige)/d1508647e6-true-d1508706e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:streetName | hl7:houseNumber | hl7:buildingNumberSuffix | hl7:additionalLocator | hl7:postalCode | hl7:county | hl7:city | hl7:country | hl7:desc | hl7:useablePeriod (rule-reference: d1508647e6-true-d1508706e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:addr/hl7:useablePeriod/*[not(@xsi:nil = 'true')][not(self::hl7:low | self::hl7:high | self::hl7:width | self::hl7:center)]"
         id="d1508765e6-true-d1508788e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="not(.)">(PeriodeGeldigheidAdresJeugdige)/d1508765e6-true-d1508788e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:low | hl7:high | hl7:width | hl7:center (rule-reference: d1508765e6-true-d1508788e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)] | self::hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] | self::hl7:birthTime[not(@nullFlavor)])]"
         id="d1508541e93-true-d1508845e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508541e93-true-d1508845e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] | hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] | hl7:birthTime[not(@nullFlavor)] (rule-reference: d1508541e93-true-d1508845e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:name[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:given | self::hl7:prefix | self::hl7:family)]"
         id="d1508541e101-true-d1508872e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508541e101-true-d1508872e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:given | hl7:prefix | hl7:family (rule-reference: d1508541e101-true-d1508872e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/*[not(@xsi:nil = 'true')][not(self::hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']])]"
         id="d1508541e168-true-d1508936e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508541e168-true-d1508936e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']] (rule-reference: d1508541e168-true-d1508936e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584'] | self::hl7:code[(@code = '1584' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | self::hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.681-2019-07-16T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]] | self::hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]])]"
         id="d1508541e180-true-d1508986e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508541e180-true-d1508986e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584'] | hl7:code[(@code = '1584' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.681-2019-07-16T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]] | hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]] (rule-reference: d1508541e180-true-d1508986e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/*[not(@xsi:nil = 'true')][not(self::hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']])]"
         id="d1508943e27-true-d1509026e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508943e27-true-d1509026e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']] (rule-reference: d1508943e27-true-d1509026e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028'] | self::hl7:code | self::hl7:value[not(@nullFlavor)] | self::hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]])]"
         id="d1509013e5-true-d1509058e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509013e5-true-d1509058e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028'] | hl7:code | hl7:value[not(@nullFlavor)] | hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]] (rule-reference: d1509013e5-true-d1509058e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:code/*[not(@xsi:nil = 'true')][not(self::hl7:originalText)]"
         id="d1509013e78-true-d1509081e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509013e78-true-d1509081e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:originalText (rule-reference: d1509013e78-true-d1509081e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]/*[not(@xsi:nil = 'true')][not(self::hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']])]"
         id="d1509013e182-true-d1509110e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509013e182-true-d1509110e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']] (rule-reference: d1509013e182-true-d1509110e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]/hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]/*[not(@xsi:nil = 'true')][not(self::hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391'])]"
         id="d1509013e194-true-d1509127e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509013e194-true-d1509127e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391'] (rule-reference: d1509013e194-true-d1509127e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/*[not(@xsi:nil = 'true')][not(self::hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']])]"
         id="d1508943e32-true-d1509153e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508943e32-true-d1509153e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']] (rule-reference: d1508943e32-true-d1509153e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029'] | self::hl7:code[not(@nullFlavor)] | self::hl7:value | self::hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])]"
         id="d1509140e5-true-d1509185e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509140e5-true-d1509185e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029'] | hl7:code[not(@nullFlavor)] | hl7:value | hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] (rule-reference: d1509140e5-true-d1509185e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]/*[not(@xsi:nil = 'true')][not(self::hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']])]"
         id="d1509140e99-true-d1509220e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509140e99-true-d1509220e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']] (rule-reference: d1509140e99-true-d1509220e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]/hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]/*[not(@xsi:nil = 'true')][not(self::hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267'])]"
         id="d1509140e119-true-d1509237e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509140e119-true-d1509237e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267'] (rule-reference: d1509140e119-true-d1509237e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']])]"
         id="d1508336e220-true-d1509263e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508336e220-true-d1509263e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']] (rule-reference: d1508336e220-true-d1509263e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122'] | self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | self::hl7:id[@nullFlavor = 'NI'] | self::hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'])]"
         id="d1509250e6-true-d1509291e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509250e6-true-d1509291e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122'] | hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = 'NI'] | hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'] (rule-reference: d1509250e6-true-d1509291e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]/hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)])]"
         id="d1509250e63-true-d1509332e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509250e63-true-d1509332e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] (rule-reference: d1509250e63-true-d1509332e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']])]"
         id="d1508336e230-true-d1509358e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508336e230-true-d1509358e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']] (rule-reference: d1508336e230-true-d1509358e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122'] | self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | self::hl7:id[@nullFlavor = 'NI'] | self::hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'])]"
         id="d1509345e6-true-d1509386e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509345e6-true-d1509386e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122'] | hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = 'NI'] | hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'] (rule-reference: d1509345e6-true-d1509386e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]/hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)])]"
         id="d1509345e63-true-d1509427e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509345e63-true-d1509427e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] (rule-reference: d1509345e63-true-d1509427e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/*[not(@xsi:nil = 'true')][not(self::hl7:encounterEvent[not(@nullFlavor)])]"
         id="d1508336e240-true-d1509462e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508336e240-true-d1509462e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:encounterEvent[not(@nullFlavor)] (rule-reference: d1508336e240-true-d1509462e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code[@nullFlavor = 'MSK'] | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] | self::hl7:effectiveTime[not(@nullFlavor)] | self::hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]])]"
         id="d1508336e260-true-d1509505e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508336e260-true-d1509505e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code[@nullFlavor = 'MSK'] | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188.1-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] | hl7:effectiveTime[not(@nullFlavor)] | hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]] (rule-reference: d1508336e260-true-d1509505e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/*[not(@xsi:nil = 'true')][not(self::hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']])]"
         id="d1508336e348-true-d1509555e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1508336e348-true-d1509555e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']] (rule-reference: d1508336e348-true-d1509555e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117'] | self::hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | self::hl7:effectiveTime[not(@nullFlavor)] | self::hl7:consumable[not(@nullFlavor)][hl7:medication] | self::hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]] | self::hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]])]"
         id="d1509536e22-true-d1509603e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509536e22-true-d1509603e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117'] | hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | hl7:effectiveTime[not(@nullFlavor)] | hl7:consumable[not(@nullFlavor)][hl7:medication] | hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]] | hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]] (rule-reference: d1509536e22-true-d1509603e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/*[not(@xsi:nil = 'true')][not(self::hl7:medication[not(@nullFlavor)][hl7:administrableMedicine])]"
         id="d1509536e172-true-d1509638e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509536e172-true-d1509638e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:medication[not(@nullFlavor)][hl7:administrableMedicine] (rule-reference: d1509536e172-true-d1509638e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/*[not(@xsi:nil = 'true')][not(self::hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']])]"
         id="d1509536e192-true-d1509655e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509536e192-true-d1509655e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']] (rule-reference: d1509536e192-true-d1509655e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/*[not(@xsi:nil = 'true')][not(self::hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] | self::hl7:lotNumberText)]"
         id="d1509536e198-true-d1509673e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509536e198-true-d1509673e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] | hl7:lotNumberText (rule-reference: d1509536e198-true-d1509673e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']])]"
         id="d1509536e244-true-d1509703e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509536e244-true-d1509703e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']] (rule-reference: d1509536e244-true-d1509703e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124'] | self::hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE'] | self::hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE'])]"
         id="d1509690e6-true-d1509730e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509690e6-true-d1509730e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124'] | hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE'] | hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE'] (rule-reference: d1509690e6-true-d1509730e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:name)]"
         id="d1509690e65-true-d1509753e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509690e65-true-d1509753e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name (rule-reference: d1509690e65-true-d1509753e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:id[@nullFlavor = 'NI'] | self::hl7:name | self::hl7:organizationContains[@classCode = 'PART'][hl7:partOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']])]"
         id="d1509690e89-true-d1509786e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509690e89-true-d1509786e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@nullFlavor = 'NI'] | hl7:name | hl7:organizationContains[@classCode = 'PART'][hl7:partOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']] (rule-reference: d1509690e89-true-d1509786e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:organizationContains[@classCode = 'PART'][hl7:partOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']]/*[not(@xsi:nil = 'true')][not(self::hl7:partOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE'])]"
         id="d1509690e119-true-d1509815e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509690e119-true-d1509815e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:partOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE'] (rule-reference: d1509690e119-true-d1509815e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:organizationContains[@classCode = 'PART'][hl7:partOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']]/hl7:partOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:id[@nullFlavor = 'NA'] | self::hl7:name[not(@nullFlavor)])]"
         id="d1509690e129-true-d1509837e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509690e129-true-d1509837e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@nullFlavor = 'NA'] | hl7:name[not(@nullFlavor)] (rule-reference: d1509690e129-true-d1509837e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/*[not(@xsi:nil = 'true')][not(self::hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]])]"
         id="d1509536e254-true-d1509866e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509536e254-true-d1509866e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] (rule-reference: d1509536e254-true-d1509866e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/*[not(@xsi:nil = 'true')][not(self::hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | self::hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]])]"
         id="d1509536e265-true-d1509888e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509536e265-true-d1509888e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] (rule-reference: d1509536e265-true-d1509888e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/*[not(@xsi:nil = 'true')][not(self::hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]])]"
         id="d1509536e293-true-d1509911e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509536e293-true-d1509911e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] (rule-reference: d1509536e293-true-d1509911e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/*[not(@xsi:nil = 'true')][not(self::hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | self::hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)])]"
         id="d1509536e304-true-d1509937e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2012-08-01T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1509536e304-true-d1509937e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] (rule-reference: d1509536e304-true-d1509937e0)</assert>
   </rule>
</pattern>
