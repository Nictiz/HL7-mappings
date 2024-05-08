<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.18
Name: Versturen vaccinatiesoproeplijst (interactie)
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.18-2015-06-29T000000-closed">
   <title>Versturen vaccinatiesoproeplijst (interactie)</title>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:creationTime[not(@nullFlavor)] | self::hl7:versionCode[@code = 'NICTIZEd2005-Okt'] | self::hl7:interactionId[@root = '2.16.840.1.113883.1.6'] | self::hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810'] | self::hl7:processingCode[@code = 'P'] | self::hl7:processingModeCode[@code = 'T'] | self::hl7:acceptAckCode[@code = 'AL' or @code = 'NE'] | self::hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] | self::hl7:receiver[not(@nullFlavor)][hl7:device] | self::hl7:respondTo[hl7:entityRsp] | self::hl7:sender[not(@nullFlavor)][hl7:device] | self::hl7:ControlActProcess[@moodCode = 'EVN'])]"
         id="d40e27752-true-d610264e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.18-2015-06-29T000000.html"
              test="not(.)">(VersturenVaccinatiesoproeplijst)/d40e27752-true-d610264e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:creationTime[not(@nullFlavor)] | hl7:versionCode[@code = 'NICTIZEd2005-Okt'] | hl7:interactionId[@root = '2.16.840.1.113883.1.6'] | hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810'] | hl7:processingCode[@code = 'P'] | hl7:processingModeCode[@code = 'T'] | hl7:acceptAckCode[@code = 'AL' or @code = 'NE'] | hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] | hl7:receiver[not(@nullFlavor)][hl7:device] | hl7:respondTo[hl7:entityRsp] | hl7:sender[not(@nullFlavor)][hl7:device] | hl7:ControlActProcess[@moodCode = 'EVN'] (rule-reference: d40e27752-true-d610264e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/*[not(@xsi:nil = 'true')][not(self::hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] | self::hl7:value[not(@nullFlavor)])]"
         id="d610322e18-true-d610347e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.120-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperAttentionLine)/d610322e18-true-d610347e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] | hl7:value[not(@nullFlavor)] (rule-reference: d610322e18-true-d610347e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']])]"
         id="d610269e128-true-d610405e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d610269e128-true-d610405e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] (rule-reference: d610269e128-true-d610405e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:name | self::hl7:telecom | self::hl7:softwareName | self::hl7:agencyFor)]"
         id="d610416e20-true-d610480e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d610416e20-true-d610480e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:name | hl7:telecom | hl7:softwareName | hl7:agencyFor (rule-reference: d610416e20-true-d610480e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/*[not(@xsi:nil = 'true')][not(self::hl7:representedOrganization)]"
         id="d610416e67-true-d610553e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d610416e67-true-d610553e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:representedOrganization (rule-reference: d610416e67-true-d610553e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:name | self::hl7:telecom | self::hl7:NotificationParty[hl7:contactParty])]"
         id="d610416e74-true-d610615e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d610416e74-true-d610615e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:name | hl7:telecom | hl7:NotificationParty[hl7:contactParty] (rule-reference: d610416e74-true-d610615e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactParty)]"
         id="d610416e103-true-d610670e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d610416e103-true-d610670e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactParty (rule-reference: d610416e103-true-d610670e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/*[not(@xsi:nil = 'true')][not(self::hl7:Organization[hl7:contact] | self::hl7:Person)]"
         id="d610675e24-true-d610720e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d610675e24-true-d610720e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:Organization[hl7:contact] | hl7:Person (rule-reference: d610675e24-true-d610720e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:name | self::hl7:contact | self::hl7:templateId)]"
         id="d610675e28-true-d610763e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d610675e28-true-d610763e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:name | hl7:contact | hl7:templateId (rule-reference: d610675e28-true-d610763e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactPerson | self::hl7:templateId)]"
         id="d610727e6-true-d610826e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d610727e6-true-d610826e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactPerson | hl7:templateId (rule-reference: d610727e6-true-d610826e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/*[not(@xsi:nil = 'true')][not(self::hl7:name | self::hl7:templateId | self::hl7:id | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication)]"
         id="d610727e19-true-d610993e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d610727e19-true-d610993e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name | hl7:templateId | hl7:id | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication (rule-reference: d610727e19-true-d610993e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d610857e14-true-d611060e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d610857e14-true-d611060e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d610857e14-true-d611060e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:name | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication | self::hl7:templateId)]"
         id="d610675e30-true-d611147e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d610675e30-true-d611147e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:name | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication | hl7:templateId (rule-reference: d610675e30-true-d611147e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d611109e7-true-d611208e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d611109e7-true-d611208e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d611109e7-true-d611208e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']])]"
         id="d610269e142-true-d611272e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d610269e142-true-d611272e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] (rule-reference: d610269e142-true-d611272e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:name | self::hl7:telecom)]"
         id="d610269e153-true-d611305e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d610269e153-true-d611305e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:name | hl7:telecom (rule-reference: d610269e153-true-d611305e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']])]"
         id="d610269e172-true-d611369e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d610269e172-true-d611369e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] (rule-reference: d610269e172-true-d611369e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:name | self::hl7:telecom | self::hl7:softwareName | self::hl7:agencyFor)]"
         id="d611380e20-true-d611444e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d611380e20-true-d611444e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:name | hl7:telecom | hl7:softwareName | hl7:agencyFor (rule-reference: d611380e20-true-d611444e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/*[not(@xsi:nil = 'true')][not(self::hl7:representedOrganization)]"
         id="d611380e67-true-d611517e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d611380e67-true-d611517e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:representedOrganization (rule-reference: d611380e67-true-d611517e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:name | self::hl7:telecom | self::hl7:NotificationParty[hl7:contactParty])]"
         id="d611380e74-true-d611579e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d611380e74-true-d611579e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:name | hl7:telecom | hl7:NotificationParty[hl7:contactParty] (rule-reference: d611380e74-true-d611579e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactParty)]"
         id="d611380e103-true-d611634e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d611380e103-true-d611634e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactParty (rule-reference: d611380e103-true-d611634e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/*[not(@xsi:nil = 'true')][not(self::hl7:Organization[hl7:contact] | self::hl7:Person)]"
         id="d611639e24-true-d611684e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d611639e24-true-d611684e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:Organization[hl7:contact] | hl7:Person (rule-reference: d611639e24-true-d611684e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:name | self::hl7:contact | self::hl7:templateId)]"
         id="d611639e28-true-d611727e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d611639e28-true-d611727e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:name | hl7:contact | hl7:templateId (rule-reference: d611639e28-true-d611727e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactPerson | self::hl7:templateId)]"
         id="d611691e6-true-d611790e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d611691e6-true-d611790e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactPerson | hl7:templateId (rule-reference: d611691e6-true-d611790e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/*[not(@xsi:nil = 'true')][not(self::hl7:name | self::hl7:templateId | self::hl7:id | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication)]"
         id="d611691e19-true-d611957e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d611691e19-true-d611957e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name | hl7:templateId | hl7:id | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication (rule-reference: d611691e19-true-d611957e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d611821e14-true-d612024e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d611821e14-true-d612024e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d611821e14-true-d612024e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:name | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication | self::hl7:templateId)]"
         id="d611639e30-true-d612111e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d611639e30-true-d612111e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:name | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication | hl7:templateId (rule-reference: d611639e30-true-d612111e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d612073e7-true-d612172e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d612073e7-true-d612172e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d612073e7-true-d612172e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/*[not(@xsi:nil = 'true')][not(self::hl7:authorOrPerformer[@typeCode][hl7:participant] | self::hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]])]"
         id="d40e27756-true-d612287e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.18-2015-06-29T000000.html"
              test="not(.)">(VersturenVaccinatiesoproeplijst)/d40e27756-true-d612287e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:authorOrPerformer[@typeCode][hl7:participant] | hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]] (rule-reference: d40e27756-true-d612287e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/*[not(@xsi:nil = 'true')][not(self::hl7:participant[not(@nullFlavor)])]"
         id="d612292e71-true-d612357e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.519-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformerDevice)/d612292e71-true-d612357e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:participant[not(@nullFlavor)] (rule-reference: d612292e71-true-d612357e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:AssignedDevice[not(@nullFlavor)])]"
         id="d612292e81-true-d612425e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.519-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformerDevice)/d612292e81-true-d612425e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:AssignedDevice[not(@nullFlavor)] (rule-reference: d612292e81-true-d612425e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.2'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:id[@root = '2.16.528.1.1007.4'] | self::hl7:Organization | self::hl7:templateId)]"
         id="d612292e83-true-d612481e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.519-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformerDevice)/d612292e83-true-d612481e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.2'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:id[@root = '2.16.528.1.1007.4'] | hl7:Organization | hl7:templateId (rule-reference: d612292e83-true-d612481e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice[not(@nullFlavor)]/hl7:Organization/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | self::hl7:id | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:name | self::hl7:addr)]"
         id="d612510e6-true-d612568e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d612510e6-true-d612568e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | hl7:id | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:name | hl7:addr (rule-reference: d612510e6-true-d612568e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice[not(@nullFlavor)]/hl7:Organization/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:city[not(@nullFlavor)])]"
         id="d612510e57-true-d612643e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d612510e57-true-d612643e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:city[not(@nullFlavor)] (rule-reference: d612510e57-true-d612643e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/*[not(@xsi:nil = 'true')][not(self::hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']])]"
         id="d40e27762-true-d612711e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.18-2015-06-29T000000.html"
              test="not(.)">(VersturenVaccinatiesoproeplijst)/d40e27762-true-d612711e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']] (rule-reference: d40e27762-true-d612711e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160'] | self::hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | self::hl7:component[hl7:organizer])]"
         id="d612677e1-true-d612774e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.18-2015-06-29T000000.html"
              test="not(.)">(VersturenVaccinatiesoproeplijst)/d612677e1-true-d612774e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160'] | hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | hl7:component[hl7:organizer] (rule-reference: d612677e1-true-d612774e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/*[not(@xsi:nil = 'true')][not(self::hl7:organizer)]"
         id="d612677e23-true-d612839e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.18-2015-06-29T000000.html"
              test="not(.)">(VersturenVaccinatiesoproeplijst)/d612677e23-true-d612839e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:organizer (rule-reference: d612677e23-true-d612839e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/*[not(@xsi:nil = 'true')][not(self::hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]] | self::hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]])]"
         id="d612677e27-true-d612897e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.18-2015-06-29T000000.html"
              test="not(.)">(VersturenVaccinatiesoproeplijst)/d612677e27-true-d612897e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]] | hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]] (rule-reference: d612677e27-true-d612897e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/*[not(@xsi:nil = 'true')][not(self::hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']])]"
         id="d612677e33-true-d612947e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.18-2015-06-29T000000.html"
              test="not(.)">(VersturenVaccinatiesoproeplijst)/d612677e33-true-d612947e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']] (rule-reference: d612677e33-true-d612947e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.20'] | self::hl7:addr | self::hl7:statusCode[@code = 'active'] | self::hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']])]"
         id="d612904e3-true-d612995e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.18-2015-06-29T000000.html"
              test="not(.)">(VersturenVaccinatiesoproeplijst)/d612904e3-true-d612995e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.20'] | hl7:addr | hl7:statusCode[@code = 'active'] | hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']] (rule-reference: d612904e3-true-d612995e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:streetName | self::hl7:houseNumber | self::hl7:buildingNumberSuffix | self::hl7:additionalLocator | self::hl7:postalCode | self::hl7:county | self::hl7:city | self::hl7:country | self::hl7:desc | self::hl7:useablePeriod)]"
         id="d613018e6-true-d613077e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="not(.)">(AdresJeugdige)/d613018e6-true-d613077e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:streetName | hl7:houseNumber | hl7:buildingNumberSuffix | hl7:additionalLocator | hl7:postalCode | hl7:county | hl7:city | hl7:country | hl7:desc | hl7:useablePeriod (rule-reference: d613018e6-true-d613077e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:addr/hl7:useablePeriod/*[not(@xsi:nil = 'true')][not(self::hl7:low | self::hl7:high | self::hl7:width | self::hl7:center)]"
         id="d613136e6-true-d613159e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="not(.)">(PeriodeGeldigheidAdresJeugdige)/d613136e6-true-d613159e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:low | hl7:high | hl7:width | hl7:center (rule-reference: d613136e6-true-d613159e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136'] | self::hl7:name[@use='OR'] | self::hl7:name[@use='L'] | self::hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code] | self::hl7:birthTime[not(@nullFlavor)] | self::hl7:multipleBirthInd | self::hl7:multipleBirthOrderNumber | self::hl7:contactParty | self::hl7:birthPlace)]"
         id="d613194e15-true-d613248e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="not(.)">(PatientPerson-minimal)/d613194e15-true-d613248e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136'] | hl7:name[@use='OR'] | hl7:name[@use='L'] | hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code] | hl7:birthTime[not(@nullFlavor)] | hl7:multipleBirthInd | hl7:multipleBirthOrderNumber | hl7:contactParty | hl7:birthPlace (rule-reference: d613194e15-true-d613248e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='OR']/*[not(@xsi:nil = 'true')][not(self::hl7:given | self::hl7:prefix | self::hl7:family[not(@nullFlavor)])]"
         id="d613259e9-true-d613281e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10232-2012-08-01T000000.html"
              test="not(.)">(NaamKindOfficieel)/d613259e9-true-d613281e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:given | hl7:prefix | hl7:family[not(@nullFlavor)] (rule-reference: d613259e9-true-d613281e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:name[@use='L']/*[not(@xsi:nil = 'true')][not(self::hl7:given | self::hl7:prefix | self::hl7:family | self::hl7:delimiter | self::hl7:suffix)]"
         id="d613304e9-true-d613321e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.10233-2012-08-01T000000.html"
              test="not(.)">(NaamKindZoalsBekendBijInstelling)/d613304e9-true-d613321e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:given | hl7:prefix | hl7:family | hl7:delimiter | hl7:suffix (rule-reference: d613304e9-true-d613321e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/*[not(@xsi:nil = 'true')][not(self::hl7:telecom[not(@nullFlavor)] | self::hl7:effectiveTime | self::hl7:contactPerson)]"
         id="d613194e103-true-d613404e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="not(.)">(PatientPerson-minimal)/d613194e103-true-d613404e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom[not(@nullFlavor)] | hl7:effectiveTime | hl7:contactPerson (rule-reference: d613194e103-true-d613404e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:effectiveTime/*[not(@xsi:nil = 'true')][not(self::hl7:low | self::hl7:high | self::hl7:width | self::hl7:center)]"
         id="d613194e123-true-d613442e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="not(.)">(PatientPerson-minimal)/d613194e123-true-d613442e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:low | hl7:high | hl7:width | hl7:center (rule-reference: d613194e123-true-d613442e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:contactParty/hl7:contactPerson/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)])]"
         id="d613194e151-true-d613483e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="not(.)">(PatientPerson-minimal)/d613194e151-true-d613483e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] (rule-reference: d613194e151-true-d613483e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:birthPlace/*[not(@xsi:nil = 'true')][not(self::hl7:addr[not(@nullFlavor)])]"
         id="d613194e168-true-d613506e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="not(.)">(PatientPerson-minimal)/d613194e168-true-d613506e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:addr[not(@nullFlavor)] (rule-reference: d613194e168-true-d613506e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.135']]/hl7:patientPerson[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.136']]/hl7:birthPlace/hl7:addr[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:county | self::hl7:country)]"
         id="d613194e188-true-d613528e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.136-2015-07-13T000000.html"
              test="not(.)">(PatientPerson-minimal)/d613194e188-true-d613528e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:county | hl7:country (rule-reference: d613194e188-true-d613528e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/*[not(@xsi:nil = 'true')][not(self::hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]])]"
         id="d612677e38-true-d613557e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.18-2015-06-29T000000.html"
              test="not(.)">(VersturenVaccinatiesoproeplijst)/d612677e38-true-d613557e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] (rule-reference: d612677e38-true-d613557e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/*[not(@xsi:nil = 'true')][not(self::hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | self::hl7:effectiveTime | self::hl7:consumable[hl7:medication])]"
         id="d612677e42-true-d613584e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.18-2015-06-29T000000.html"
              test="not(.)">(VersturenVaccinatiesoproeplijst)/d612677e42-true-d613584e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | hl7:effectiveTime | hl7:consumable[hl7:medication] (rule-reference: d612677e42-true-d613584e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:consumable[hl7:medication]/*[not(@xsi:nil = 'true')][not(self::hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]])]"
         id="d612677e77-true-d613617e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.18-2015-06-29T000000.html"
              test="not(.)">(VersturenVaccinatiesoproeplijst)/d612677e77-true-d613617e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]] (rule-reference: d612677e77-true-d613617e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:consumable[hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/*[not(@xsi:nil = 'true')][not(self::hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]])]"
         id="d612677e95-true-d613640e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.18-2015-06-29T000000.html"
              test="not(.)">(VersturenVaccinatiesoproeplijst)/d612677e95-true-d613640e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] (rule-reference: d612677e95-true-d613640e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002160NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN']/hl7:subject[hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]]/hl7:immunizationRequestList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.160']]/hl7:component[hl7:organizer]/hl7:organizer/hl7:component[hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:substanceAdministration[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:consumable[hl7:medication]/hl7:medication[hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]]/hl7:administrableMedicine[hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.422-2016-12-09T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/*[not(@xsi:nil = 'true')][not(self::hl7:code | self::hl7:lotNumberText)]"
         id="d612677e99-true-d613664e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.18-2015-06-29T000000.html"
              test="not(.)">(VersturenVaccinatiesoproeplijst)/d612677e99-true-d613664e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code | hl7:lotNumberText (rule-reference: d612677e99-true-d613664e0)</assert>
   </rule>
</pattern>
