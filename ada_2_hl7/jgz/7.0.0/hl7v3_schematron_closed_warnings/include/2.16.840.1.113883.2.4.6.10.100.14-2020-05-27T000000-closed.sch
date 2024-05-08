<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.14
Name: Versturen vaccinaties (interactie)
Description: Versturen vaccinatie. De waarde voor het element  acceptAckCode  is "AL". Wijzigingen ten op zichte van de vorige versie:  Bevat een nieuwe versie van de payload. 
            
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000-closed">
   <title>Versturen vaccinaties (interactie)</title>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:creationTime[not(@nullFlavor)] | self::hl7:versionCode[@code = 'NICTIZEd2005-Okt'] | self::hl7:interactionId[@root = '2.16.840.1.113883.1.6'] | self::hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810'] | self::hl7:processingCode[@code = 'P'] | self::hl7:processingModeCode[@code = 'T'] | self::hl7:acceptAckCode[@code = 'AL' or @code = 'NE'] | self::hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] | self::hl7:receiver[not(@nullFlavor)][hl7:device] | self::hl7:respondTo[hl7:entityRsp] | self::hl7:sender[not(@nullFlavor)][hl7:device] | self::hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN'])]"
         id="d41e44402-true-d1493418e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d41e44402-true-d1493418e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:creationTime[not(@nullFlavor)] | hl7:versionCode[@code = 'NICTIZEd2005-Okt'] | hl7:interactionId[@root = '2.16.840.1.113883.1.6'] | hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810'] | hl7:processingCode[@code = 'P'] | hl7:processingModeCode[@code = 'T'] | hl7:acceptAckCode[@code = 'AL' or @code = 'NE'] | hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] | hl7:receiver[not(@nullFlavor)][hl7:device] | hl7:respondTo[hl7:entityRsp] | hl7:sender[not(@nullFlavor)][hl7:device] | hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN'] (rule-reference: d41e44402-true-d1493418e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/*[not(@xsi:nil = 'true')][not(self::hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] | self::hl7:value[not(@nullFlavor)])]"
         id="d1493476e18-true-d1493501e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.120-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperAttentionLine)/d1493476e18-true-d1493501e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] | hl7:value[not(@nullFlavor)] (rule-reference: d1493476e18-true-d1493501e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']])]"
         id="d1493423e128-true-d1493559e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d1493423e128-true-d1493559e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] (rule-reference: d1493423e128-true-d1493559e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:name | self::hl7:telecom | self::hl7:softwareName | self::hl7:agencyFor)]"
         id="d1493570e20-true-d1493634e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1493570e20-true-d1493634e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:name | hl7:telecom | hl7:softwareName | hl7:agencyFor (rule-reference: d1493570e20-true-d1493634e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/*[not(@xsi:nil = 'true')][not(self::hl7:representedOrganization)]"
         id="d1493570e67-true-d1493707e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1493570e67-true-d1493707e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:representedOrganization (rule-reference: d1493570e67-true-d1493707e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:name | self::hl7:telecom | self::hl7:NotificationParty[hl7:contactParty])]"
         id="d1493570e74-true-d1493769e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1493570e74-true-d1493769e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:name | hl7:telecom | hl7:NotificationParty[hl7:contactParty] (rule-reference: d1493570e74-true-d1493769e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactParty)]"
         id="d1493570e103-true-d1493824e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1493570e103-true-d1493824e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactParty (rule-reference: d1493570e103-true-d1493824e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/*[not(@xsi:nil = 'true')][not(self::hl7:Organization[hl7:contact] | self::hl7:Person)]"
         id="d1493829e24-true-d1493874e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1493829e24-true-d1493874e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:Organization[hl7:contact] | hl7:Person (rule-reference: d1493829e24-true-d1493874e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:name | self::hl7:contact | self::hl7:templateId)]"
         id="d1493829e28-true-d1493917e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1493829e28-true-d1493917e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:name | hl7:contact | hl7:templateId (rule-reference: d1493829e28-true-d1493917e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactPerson | self::hl7:templateId)]"
         id="d1493881e6-true-d1493980e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1493881e6-true-d1493980e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactPerson | hl7:templateId (rule-reference: d1493881e6-true-d1493980e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/*[not(@xsi:nil = 'true')][not(self::hl7:name | self::hl7:templateId | self::hl7:id | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication)]"
         id="d1493881e19-true-d1494147e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1493881e19-true-d1494147e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name | hl7:templateId | hl7:id | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication (rule-reference: d1493881e19-true-d1494147e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d1494011e14-true-d1494214e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1494011e14-true-d1494214e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d1494011e14-true-d1494214e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:name | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication | self::hl7:templateId)]"
         id="d1493829e30-true-d1494301e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1493829e30-true-d1494301e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:name | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication | hl7:templateId (rule-reference: d1493829e30-true-d1494301e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d1494263e7-true-d1494362e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1494263e7-true-d1494362e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d1494263e7-true-d1494362e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']])]"
         id="d1493423e142-true-d1494426e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d1493423e142-true-d1494426e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] (rule-reference: d1493423e142-true-d1494426e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:name | self::hl7:telecom)]"
         id="d1493423e153-true-d1494459e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d1493423e153-true-d1494459e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:name | hl7:telecom (rule-reference: d1493423e153-true-d1494459e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']])]"
         id="d1493423e172-true-d1494523e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000100)/d1493423e172-true-d1494523e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] (rule-reference: d1493423e172-true-d1494523e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:name | self::hl7:telecom | self::hl7:softwareName | self::hl7:agencyFor)]"
         id="d1494534e20-true-d1494598e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1494534e20-true-d1494598e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:name | hl7:telecom | hl7:softwareName | hl7:agencyFor (rule-reference: d1494534e20-true-d1494598e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/*[not(@xsi:nil = 'true')][not(self::hl7:representedOrganization)]"
         id="d1494534e67-true-d1494671e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1494534e67-true-d1494671e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:representedOrganization (rule-reference: d1494534e67-true-d1494671e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:name | self::hl7:telecom | self::hl7:NotificationParty[hl7:contactParty])]"
         id="d1494534e74-true-d1494733e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1494534e74-true-d1494733e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:name | hl7:telecom | hl7:NotificationParty[hl7:contactParty] (rule-reference: d1494534e74-true-d1494733e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactParty)]"
         id="d1494534e103-true-d1494788e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1494534e103-true-d1494788e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactParty (rule-reference: d1494534e103-true-d1494788e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/*[not(@xsi:nil = 'true')][not(self::hl7:Organization[hl7:contact] | self::hl7:Person)]"
         id="d1494793e24-true-d1494838e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1494793e24-true-d1494838e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:Organization[hl7:contact] | hl7:Person (rule-reference: d1494793e24-true-d1494838e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:name | self::hl7:contact | self::hl7:templateId)]"
         id="d1494793e28-true-d1494881e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1494793e28-true-d1494881e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:name | hl7:contact | hl7:templateId (rule-reference: d1494793e28-true-d1494881e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactPerson | self::hl7:templateId)]"
         id="d1494845e6-true-d1494944e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1494845e6-true-d1494944e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactPerson | hl7:templateId (rule-reference: d1494845e6-true-d1494944e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/*[not(@xsi:nil = 'true')][not(self::hl7:name | self::hl7:templateId | self::hl7:id | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication)]"
         id="d1494845e19-true-d1495111e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1494845e19-true-d1495111e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name | hl7:templateId | hl7:id | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication (rule-reference: d1494845e19-true-d1495111e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d1494975e14-true-d1495178e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1494975e14-true-d1495178e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d1494975e14-true-d1495178e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:name | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication | self::hl7:templateId)]"
         id="d1494793e30-true-d1495265e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1494793e30-true-d1495265e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:name | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication | hl7:templateId (rule-reference: d1494793e30-true-d1495265e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d1495227e7-true-d1495326e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1495227e7-true-d1495326e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d1495227e7-true-d1495326e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/*[not(@xsi:nil = 'true')][not(self::hl7:authorOrPerformer[@typeCode][hl7:participant] | self::hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson] | self::hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]])]"
         id="d41e44415-true-d1495541e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d41e44415-true-d1495541e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:authorOrPerformer[@typeCode][hl7:participant] | hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson] | hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]] (rule-reference: d41e44415-true-d1495541e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/*[not(@xsi:nil = 'true')][not(self::hl7:participant[not(@nullFlavor)])]"
         id="d1495546e91-true-d1495674e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d1495546e91-true-d1495674e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:participant[not(@nullFlavor)] (rule-reference: d1495546e91-true-d1495674e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:AssignedDevice | self::hl7:AssignedPerson[hl7:Organization])]"
         id="d1495546e101-true-d1495766e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d1495546e101-true-d1495766e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:AssignedDevice | hl7:AssignedPerson[hl7:Organization] (rule-reference: d1495546e101-true-d1495766e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.2'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:id[@root = '2.16.528.1.1007.4'] | self::hl7:Organization | self::hl7:templateId)]"
         id="d1495546e105-true-d1495822e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d1495546e105-true-d1495822e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.2'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:id[@root = '2.16.528.1.1007.4'] | hl7:Organization | hl7:templateId (rule-reference: d1495546e105-true-d1495822e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | self::hl7:id | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:name | self::hl7:addr)]"
         id="d1495851e6-true-d1495909e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d1495851e6-true-d1495909e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | hl7:id | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:name | hl7:addr (rule-reference: d1495851e6-true-d1495909e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:city[not(@nullFlavor)])]"
         id="d1495851e57-true-d1495984e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d1495851e57-true-d1495984e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:city[not(@nullFlavor)] (rule-reference: d1495851e57-true-d1495984e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.1'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3'] | self::hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:assignedPrincipalChoiceList[hl7:assignedPerson] | self::hl7:Organization | self::hl7:templateId)]"
         id="d1495546e107-true-d1496089e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d1495546e107-true-d1496089e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3'] | hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:assignedPrincipalChoiceList[hl7:assignedPerson] | hl7:Organization | hl7:templateId (rule-reference: d1495546e107-true-d1496089e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedPerson[not(@nullFlavor)])]"
         id="d1496003e40-true-d1496164e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d1496003e40-true-d1496164e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedPerson[not(@nullFlavor)] (rule-reference: d1496003e40-true-d1496164e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)])]"
         id="d1496003e45-true-d1496181e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformer)/d1496003e45-true-d1496181e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] (rule-reference: d1496003e45-true-d1496181e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | self::hl7:id | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:name | self::hl7:addr)]"
         id="d1496192e6-true-d1496250e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d1496192e6-true-d1496250e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | hl7:id | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:name | hl7:addr (rule-reference: d1496192e6-true-d1496250e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:city[not(@nullFlavor)])]"
         id="d1496192e57-true-d1496325e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d1496192e57-true-d1496325e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:city[not(@nullFlavor)] (rule-reference: d1496192e57-true-d1496325e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/*[not(@xsi:nil = 'true')][not(self::hl7:time | self::hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization])]"
         id="d1496342e56-true-d1496424e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.502-2012-08-01T000000.html"
              test="not(.)">(ControlActOverseerPersonMcaiMfmi)/d1496342e56-true-d1496424e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:time | hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization] (rule-reference: d1496342e56-true-d1496424e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.1'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3'] | self::hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:assignedPrincipalChoiceList[hl7:assignedPerson] | self::hl7:Organization | self::hl7:templateId)]"
         id="d1496342e70-true-d1496523e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.502-2012-08-01T000000.html"
              test="not(.)">(ControlActOverseerPersonMcaiMfmi)/d1496342e70-true-d1496523e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3'] | hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:assignedPrincipalChoiceList[hl7:assignedPerson] | hl7:Organization | hl7:templateId (rule-reference: d1496342e70-true-d1496523e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedPerson[not(@nullFlavor)])]"
         id="d1496437e44-true-d1496598e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.502-2012-08-01T000000.html"
              test="not(.)">(ControlActOverseerPersonMcaiMfmi)/d1496437e44-true-d1496598e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedPerson[not(@nullFlavor)] (rule-reference: d1496437e44-true-d1496598e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)])]"
         id="d1496437e49-true-d1496615e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.502-2012-08-01T000000.html"
              test="not(.)">(ControlActOverseerPersonMcaiMfmi)/d1496437e49-true-d1496615e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] (rule-reference: d1496437e49-true-d1496615e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/hl7:Organization/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | self::hl7:id | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:name | self::hl7:addr)]"
         id="d1496626e6-true-d1496684e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d1496626e6-true-d1496684e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | hl7:id | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:name | hl7:addr (rule-reference: d1496626e6-true-d1496684e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:overseer[@typeCode = 'RESP'][hl7:AssignedPerson]/hl7:AssignedPerson[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:city[not(@nullFlavor)])]"
         id="d1496626e57-true-d1496759e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d1496626e57-true-d1496759e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:city[not(@nullFlavor)] (rule-reference: d1496626e57-true-d1496759e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/*[not(@xsi:nil = 'true')][not(self::hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']])]"
         id="d41e44439-true-d1496848e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d41e44439-true-d1496848e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']] (rule-reference: d41e44439-true-d1496848e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180'] | self::hl7:id[@nullFlavor = 'MSK'] | self::hl7:id | self::hl7:code[(@code = 'CPHC' and @codeSystem = '2.16.840.1.113883.5.4')] | self::hl7:statusCode[@code = 'active' or @code = 'aborted' or @code = 'completed'] | self::hl7:subject[hl7:patient[@nullFlavor = 'MSK']] | self::hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']] | self::hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] | self::hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] | self::hl7:component[not(@nullFlavor)][hl7:encounterEvent])]"
         id="d1496778e6-true-d1496927e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1496778e6-true-d1496927e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180'] | hl7:id[@nullFlavor = 'MSK'] | hl7:id | hl7:code[(@code = 'CPHC' and @codeSystem = '2.16.840.1.113883.5.4')] | hl7:statusCode[@code = 'active' or @code = 'aborted' or @code = 'completed'] | hl7:subject[hl7:patient[@nullFlavor = 'MSK']] | hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']] | hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] | hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]] | hl7:component[not(@nullFlavor)][hl7:encounterEvent] (rule-reference: d1496778e6-true-d1496927e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[@nullFlavor = 'MSK']]/*[not(@xsi:nil = 'true')][not(self::hl7:patient[@classCode = 'PAT'][@nullFlavor = 'MSK'])]"
         id="d1496778e159-true-d1496970e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1496778e159-true-d1496970e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:patient[@classCode = 'PAT'][@nullFlavor = 'MSK'] (rule-reference: d1496778e159-true-d1496970e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/*[not(@xsi:nil = 'true')][not(self::hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']])]"
         id="d1496778e174-true-d1497012e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1496778e174-true-d1497012e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']] (rule-reference: d1496778e174-true-d1497012e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102'] | self::hl7:id | self::hl7:addr | self::hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] | self::hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]])]"
         id="d1496983e23-true-d1497072e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1496983e23-true-d1497072e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102'] | hl7:id | hl7:addr | hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] | hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]] (rule-reference: d1496983e23-true-d1497072e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:streetName | self::hl7:houseNumber | self::hl7:buildingNumberSuffix | self::hl7:additionalLocator | self::hl7:postalCode | self::hl7:county | self::hl7:city | self::hl7:country | self::hl7:desc | self::hl7:useablePeriod)]"
         id="d1497089e6-true-d1497148e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="not(.)">(AdresJeugdige)/d1497089e6-true-d1497148e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:streetName | hl7:houseNumber | hl7:buildingNumberSuffix | hl7:additionalLocator | hl7:postalCode | hl7:county | hl7:city | hl7:country | hl7:desc | hl7:useablePeriod (rule-reference: d1497089e6-true-d1497148e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:addr/hl7:useablePeriod/*[not(@xsi:nil = 'true')][not(self::hl7:low | self::hl7:high | self::hl7:width | self::hl7:center)]"
         id="d1497207e6-true-d1497230e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="not(.)">(PeriodeGeldigheidAdresJeugdige)/d1497207e6-true-d1497230e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:low | hl7:high | hl7:width | hl7:center (rule-reference: d1497207e6-true-d1497230e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)] | self::hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] | self::hl7:birthTime[not(@nullFlavor)])]"
         id="d1496983e93-true-d1497287e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1496983e93-true-d1497287e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] | hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] | hl7:birthTime[not(@nullFlavor)] (rule-reference: d1496983e93-true-d1497287e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:name[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:given | self::hl7:prefix | self::hl7:family)]"
         id="d1496983e101-true-d1497314e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1496983e101-true-d1497314e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:given | hl7:prefix | hl7:family (rule-reference: d1496983e101-true-d1497314e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/*[not(@xsi:nil = 'true')][not(self::hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']])]"
         id="d1496983e168-true-d1497378e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1496983e168-true-d1497378e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']] (rule-reference: d1496983e168-true-d1497378e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584'] | self::hl7:code[(@code = '1584' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | self::hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.681-2019-07-16T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]] | self::hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]])]"
         id="d1496983e180-true-d1497428e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1496983e180-true-d1497428e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584'] | hl7:code[(@code = '1584' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.681-2019-07-16T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]] | hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]] (rule-reference: d1496983e180-true-d1497428e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/*[not(@xsi:nil = 'true')][not(self::hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']])]"
         id="d1497385e27-true-d1497468e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497385e27-true-d1497468e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']] (rule-reference: d1497385e27-true-d1497468e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028'] | self::hl7:code | self::hl7:value[not(@nullFlavor)] | self::hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]])]"
         id="d1497455e5-true-d1497500e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497455e5-true-d1497500e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028'] | hl7:code | hl7:value[not(@nullFlavor)] | hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]] (rule-reference: d1497455e5-true-d1497500e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:code/*[not(@xsi:nil = 'true')][not(self::hl7:originalText)]"
         id="d1497455e78-true-d1497523e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497455e78-true-d1497523e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:originalText (rule-reference: d1497455e78-true-d1497523e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]/*[not(@xsi:nil = 'true')][not(self::hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']])]"
         id="d1497455e182-true-d1497552e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497455e182-true-d1497552e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']] (rule-reference: d1497455e182-true-d1497552e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]/hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]/*[not(@xsi:nil = 'true')][not(self::hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391'])]"
         id="d1497455e194-true-d1497569e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497455e194-true-d1497569e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391'] (rule-reference: d1497455e194-true-d1497569e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/*[not(@xsi:nil = 'true')][not(self::hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']])]"
         id="d1497385e32-true-d1497595e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497385e32-true-d1497595e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']] (rule-reference: d1497385e32-true-d1497595e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029'] | self::hl7:code[not(@nullFlavor)] | self::hl7:value | self::hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])]"
         id="d1497582e5-true-d1497627e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497582e5-true-d1497627e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029'] | hl7:code[not(@nullFlavor)] | hl7:value | hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] (rule-reference: d1497582e5-true-d1497627e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]/*[not(@xsi:nil = 'true')][not(self::hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']])]"
         id="d1497582e99-true-d1497662e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497582e99-true-d1497662e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']] (rule-reference: d1497582e99-true-d1497662e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:subject[hl7:patient[hl7:templateId/@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]/hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]/*[not(@xsi:nil = 'true')][not(self::hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267'])]"
         id="d1497582e119-true-d1497679e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497582e119-true-d1497679e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267'] (rule-reference: d1497582e119-true-d1497679e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']])]"
         id="d1496778e200-true-d1497705e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1496778e200-true-d1497705e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']] (rule-reference: d1496778e200-true-d1497705e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122'] | self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | self::hl7:id[@nullFlavor = 'NI'] | self::hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'])]"
         id="d1497692e6-true-d1497733e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497692e6-true-d1497733e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122'] | hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = 'NI'] | hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'] (rule-reference: d1497692e6-true-d1497733e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]/hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)])]"
         id="d1497692e63-true-d1497774e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497692e63-true-d1497774e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] (rule-reference: d1497692e63-true-d1497774e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']])]"
         id="d1496778e208-true-d1497800e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1496778e208-true-d1497800e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']] (rule-reference: d1496778e208-true-d1497800e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122'] | self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | self::hl7:id[@nullFlavor = 'NI'] | self::hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'])]"
         id="d1497787e6-true-d1497828e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497787e6-true-d1497828e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122'] | hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] | hl7:id[@nullFlavor = 'NI'] | hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE'] (rule-reference: d1497787e6-true-d1497828e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:author[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.122']]/hl7:assignedOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)])]"
         id="d1497787e63-true-d1497869e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497787e63-true-d1497869e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] (rule-reference: d1497787e63-true-d1497869e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/*[not(@xsi:nil = 'true')][not(self::hl7:encounterEvent[not(@nullFlavor)])]"
         id="d1496778e217-true-d1497904e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1496778e217-true-d1497904e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:encounterEvent[not(@nullFlavor)] (rule-reference: d1496778e217-true-d1497904e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code[@nullFlavor = 'MSK'] | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code] | self::hl7:effectiveTime[not(@nullFlavor)] | self::hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]])]"
         id="d1496778e235-true-d1497947e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1496778e235-true-d1497947e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code[@nullFlavor = 'MSK'] | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.188-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code] | hl7:effectiveTime[not(@nullFlavor)] | hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]] (rule-reference: d1496778e235-true-d1497947e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/*[not(@xsi:nil = 'true')][not(self::hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']])]"
         id="d1496778e313-true-d1497997e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1496778e313-true-d1497997e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']] (rule-reference: d1496778e313-true-d1497997e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117'] | self::hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | self::hl7:effectiveTime[not(@nullFlavor)] | self::hl7:consumable[not(@nullFlavor)][hl7:medication] | self::hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]] | self::hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]])]"
         id="d1497978e22-true-d1498045e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497978e22-true-d1498045e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117'] | hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | hl7:effectiveTime[not(@nullFlavor)] | hl7:consumable[not(@nullFlavor)][hl7:medication] | hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]] | hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]] (rule-reference: d1497978e22-true-d1498045e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/*[not(@xsi:nil = 'true')][not(self::hl7:medication[not(@nullFlavor)][hl7:administrableMedicine])]"
         id="d1497978e172-true-d1498080e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497978e172-true-d1498080e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:medication[not(@nullFlavor)][hl7:administrableMedicine] (rule-reference: d1497978e172-true-d1498080e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/*[not(@xsi:nil = 'true')][not(self::hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']])]"
         id="d1497978e192-true-d1498097e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497978e192-true-d1498097e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']] (rule-reference: d1497978e192-true-d1498097e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/*[not(@xsi:nil = 'true')][not(self::hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] | self::hl7:lotNumberText)]"
         id="d1497978e198-true-d1498115e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497978e198-true-d1498115e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] | hl7:lotNumberText (rule-reference: d1497978e198-true-d1498115e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']])]"
         id="d1497978e244-true-d1498145e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497978e244-true-d1498145e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']] (rule-reference: d1497978e244-true-d1498145e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124'] | self::hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE'] | self::hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE'])]"
         id="d1498132e6-true-d1498172e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1498132e6-true-d1498172e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124'] | hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE'] | hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE'] (rule-reference: d1498132e6-true-d1498172e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/hl7:assignedPerson[@classCode = 'PSN'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:name)]"
         id="d1498132e65-true-d1498195e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1498132e65-true-d1498195e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name (rule-reference: d1498132e65-true-d1498195e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:id[@nullFlavor = 'NI'] | self::hl7:name | self::hl7:organizationContains[@classCode = 'PART'][hl7:partOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']])]"
         id="d1498132e89-true-d1498228e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1498132e89-true-d1498228e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@nullFlavor = 'NI'] | hl7:name | hl7:organizationContains[@classCode = 'PART'][hl7:partOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']] (rule-reference: d1498132e89-true-d1498228e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:organizationContains[@classCode = 'PART'][hl7:partOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']]/*[not(@xsi:nil = 'true')][not(self::hl7:partOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE'])]"
         id="d1498132e119-true-d1498257e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1498132e119-true-d1498257e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:partOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE'] (rule-reference: d1498132e119-true-d1498257e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.124']]/hl7:representedOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE']/hl7:organizationContains[@classCode = 'PART'][hl7:partOrganization[@classCode = 'ORG'][@determinerCode = 'INSTANCE']]/hl7:partOrganization[not(@nullFlavor)][@classCode = 'ORG'][@determinerCode = 'INSTANCE']/*[not(@xsi:nil = 'true')][not(self::hl7:id[@nullFlavor = 'NA'] | self::hl7:name[not(@nullFlavor)])]"
         id="d1498132e129-true-d1498279e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1498132e129-true-d1498279e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@nullFlavor = 'NA'] | hl7:name[not(@nullFlavor)] (rule-reference: d1498132e129-true-d1498279e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/*[not(@xsi:nil = 'true')][not(self::hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]])]"
         id="d1497978e254-true-d1498308e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497978e254-true-d1498308e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] (rule-reference: d1497978e254-true-d1498308e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/*[not(@xsi:nil = 'true')][not(self::hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | self::hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]])]"
         id="d1497978e265-true-d1498330e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497978e265-true-d1498330e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] (rule-reference: d1497978e265-true-d1498330e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/*[not(@xsi:nil = 'true')][not(self::hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]])]"
         id="d1497978e293-true-d1498353e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497978e293-true-d1498353e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] (rule-reference: d1497978e293-true-d1498353e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002140NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]]/hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.180']]/hl7:component[not(@nullFlavor)][hl7:encounterEvent]/hl7:encounterEvent[not(@nullFlavor)]/hl7:component[hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]]/hl7:substanceAdministrationEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.117']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/*[not(@xsi:nil = 'true')][not(self::hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | self::hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)])]"
         id="d1497978e304-true-d1498379e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.14-2020-05-27T000000.html"
              test="not(.)">(VersturenVaccinaties)/d1497978e304-true-d1498379e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] (rule-reference: d1497978e304-true-d1498379e0)</assert>
   </rule>
</pattern>
