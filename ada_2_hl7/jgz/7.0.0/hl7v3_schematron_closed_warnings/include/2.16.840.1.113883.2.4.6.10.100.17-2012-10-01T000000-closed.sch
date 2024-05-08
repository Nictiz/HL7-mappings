<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.17
Name: Opleveren vaccinatiestatus (interactie)
Description: 
                 Opleveren vaccinatiestatus. Dit bericht bevat minimaal 0 en maximaal n: 
                 
                     ontvangen (en goedgekeurde) vaccinaties; 
                     vaccinaties waartegen bezwaar is geuit; 
                     te-verwachten-vaccinaties. 
                 
                 Er kunnen ook buitenlandse vaccinaties bij zitten voor zover bekend: hiervan is geen "goedkeuring" bekend en het is mogelijk dat het vaccintype nog geen code heeft. Zie verder de specificaties bij dit element. De waarde voor het element  acceptAckCode  is "NE".  
                 Het opvragen van vaccinatiestatus is onderhevig aan algemene voorwaarden van de vaccinatie-coördinator en bepaalde specifieke voorwaarden die tussen de vaccinatie-coördinator en de vaccinatie-uitvoerder overeen worden gekomen. Als een verzoek niet aan de voorwaarden/afspraken voldoet, dan bevat het element ControlActProcess de reden. Er wordt in dat geval geen vaccinatiestatus opgeleverd. Ook enkel
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000-closed">
   <title>Opleveren vaccinatiestatus (interactie)</title>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:creationTime[not(@nullFlavor)] | self::hl7:versionCode[@code = 'NICTIZEd2005-Okt'] | self::hl7:interactionId[@root = '2.16.840.1.113883.1.6'] | self::hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810'] | self::hl7:processingCode[@code = 'P'] | self::hl7:processingModeCode[@code = 'T'] | self::hl7:acceptAckCode[@code = 'NE'] | self::hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage] | self::hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] | self::hl7:receiver[not(@nullFlavor)][hl7:device] | self::hl7:respondTo[hl7:entityRsp] | self::hl7:sender[not(@nullFlavor)][hl7:device] | self::hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN'])]"
         id="d41e45616-true-d1538797e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d41e45616-true-d1538797e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:creationTime[not(@nullFlavor)] | hl7:versionCode[@code = 'NICTIZEd2005-Okt'] | hl7:interactionId[@root = '2.16.840.1.113883.1.6'] | hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810'] | hl7:processingCode[@code = 'P'] | hl7:processingModeCode[@code = 'T'] | hl7:acceptAckCode[@code = 'NE'] | hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage] | hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]] | hl7:receiver[not(@nullFlavor)][hl7:device] | hl7:respondTo[hl7:entityRsp] | hl7:sender[not(@nullFlavor)][hl7:device] | hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN'] (rule-reference: d41e45616-true-d1538797e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/*[not(@xsi:nil = 'true')][not(self::hl7:acknowledgementDetail | self::hl7:targetMessage[not(@nullFlavor)])]"
         id="d1538802e119-true-d1538869e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.300-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000300)/d1538802e119-true-d1538869e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:acknowledgementDetail | hl7:targetMessage[not(@nullFlavor)] (rule-reference: d1538802e119-true-d1538869e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/hl7:acknowledgementDetail/*[not(@xsi:nil = 'true')][not(self::hl7:code | self::hl7:text | self::hl7:location)]"
         id="d1538802e140-true-d1538896e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.300-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000300)/d1538802e140-true-d1538896e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code | hl7:text | hl7:location (rule-reference: d1538802e140-true-d1538896e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/hl7:targetMessage[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)])]"
         id="d1538802e169-true-d1538931e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.300-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000300)/d1538802e169-true-d1538931e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] (rule-reference: d1538802e169-true-d1538931e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/*[not(@xsi:nil = 'true')][not(self::hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] | self::hl7:value[not(@nullFlavor)])]"
         id="d1538945e18-true-d1538970e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.120-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperAttentionLine)/d1538945e18-true-d1538970e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] | hl7:value[not(@nullFlavor)] (rule-reference: d1538945e18-true-d1538970e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']])]"
         id="d1538802e187-true-d1539028e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.300-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000300)/d1538802e187-true-d1539028e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] (rule-reference: d1538802e187-true-d1539028e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:name | self::hl7:telecom | self::hl7:softwareName | self::hl7:agencyFor)]"
         id="d1539039e20-true-d1539103e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1539039e20-true-d1539103e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:name | hl7:telecom | hl7:softwareName | hl7:agencyFor (rule-reference: d1539039e20-true-d1539103e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/*[not(@xsi:nil = 'true')][not(self::hl7:representedOrganization)]"
         id="d1539039e67-true-d1539176e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1539039e67-true-d1539176e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:representedOrganization (rule-reference: d1539039e67-true-d1539176e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:name | self::hl7:telecom | self::hl7:NotificationParty[hl7:contactParty])]"
         id="d1539039e74-true-d1539238e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1539039e74-true-d1539238e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:name | hl7:telecom | hl7:NotificationParty[hl7:contactParty] (rule-reference: d1539039e74-true-d1539238e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactParty)]"
         id="d1539039e103-true-d1539293e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1539039e103-true-d1539293e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactParty (rule-reference: d1539039e103-true-d1539293e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/*[not(@xsi:nil = 'true')][not(self::hl7:Organization[hl7:contact] | self::hl7:Person)]"
         id="d1539298e24-true-d1539343e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1539298e24-true-d1539343e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:Organization[hl7:contact] | hl7:Person (rule-reference: d1539298e24-true-d1539343e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:name | self::hl7:contact | self::hl7:templateId)]"
         id="d1539298e28-true-d1539386e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1539298e28-true-d1539386e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:name | hl7:contact | hl7:templateId (rule-reference: d1539298e28-true-d1539386e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactPerson | self::hl7:templateId)]"
         id="d1539350e6-true-d1539449e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1539350e6-true-d1539449e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactPerson | hl7:templateId (rule-reference: d1539350e6-true-d1539449e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/*[not(@xsi:nil = 'true')][not(self::hl7:name | self::hl7:templateId | self::hl7:id | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication)]"
         id="d1539350e19-true-d1539616e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1539350e19-true-d1539616e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name | hl7:templateId | hl7:id | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication (rule-reference: d1539350e19-true-d1539616e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d1539480e14-true-d1539683e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1539480e14-true-d1539683e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d1539480e14-true-d1539683e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:name | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication | self::hl7:templateId)]"
         id="d1539298e30-true-d1539770e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1539298e30-true-d1539770e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:name | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication | hl7:templateId (rule-reference: d1539298e30-true-d1539770e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d1539732e7-true-d1539831e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1539732e7-true-d1539831e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d1539732e7-true-d1539831e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:entityRsp[not(@nullFlavor)])]"
         id="d1538802e201-true-d1539889e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.300-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000300)/d1538802e201-true-d1539889e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:entityRsp[not(@nullFlavor)] (rule-reference: d1538802e201-true-d1539889e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:entityRsp[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:name | self::hl7:telecom)]"
         id="d1538802e207-true-d1539922e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.300-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000300)/d1538802e207-true-d1539922e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:name | hl7:telecom (rule-reference: d1538802e207-true-d1539922e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/*[not(@xsi:nil = 'true')][not(self::hl7:telecom | self::hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']])]"
         id="d1538802e227-true-d1539984e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.300-2014-07-15T000000.html"
              test="not(.)">(MCCI_MT000300)/d1538802e227-true-d1539984e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:telecom | hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] (rule-reference: d1538802e227-true-d1539984e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:name | self::hl7:telecom | self::hl7:softwareName | self::hl7:agencyFor)]"
         id="d1539995e20-true-d1540059e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1539995e20-true-d1540059e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:name | hl7:telecom | hl7:softwareName | hl7:agencyFor (rule-reference: d1539995e20-true-d1540059e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/*[not(@xsi:nil = 'true')][not(self::hl7:representedOrganization)]"
         id="d1539995e67-true-d1540132e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1539995e67-true-d1540132e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:representedOrganization (rule-reference: d1539995e67-true-d1540132e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/*[not(@xsi:nil = 'true')][not(self::hl7:id[not(@nullFlavor)] | self::hl7:name | self::hl7:telecom | self::hl7:NotificationParty[hl7:contactParty])]"
         id="d1539995e74-true-d1540194e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1539995e74-true-d1540194e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[not(@nullFlavor)] | hl7:name | hl7:telecom | hl7:NotificationParty[hl7:contactParty] (rule-reference: d1539995e74-true-d1540194e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactParty)]"
         id="d1539995e103-true-d1540249e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="not(.)">(TransmissionWrapperDevice)/d1539995e103-true-d1540249e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactParty (rule-reference: d1539995e103-true-d1540249e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/*[not(@xsi:nil = 'true')][not(self::hl7:Organization[hl7:contact] | self::hl7:Person)]"
         id="d1540254e24-true-d1540299e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1540254e24-true-d1540299e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:Organization[hl7:contact] | hl7:Person (rule-reference: d1540254e24-true-d1540299e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:name | self::hl7:contact | self::hl7:templateId)]"
         id="d1540254e28-true-d1540342e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1540254e28-true-d1540342e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:name | hl7:contact | hl7:templateId (rule-reference: d1540254e28-true-d1540342e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code | self::hl7:addr | self::hl7:telecom | self::hl7:contactPerson | self::hl7:templateId)]"
         id="d1540306e6-true-d1540405e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1540306e6-true-d1540405e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code | hl7:addr | hl7:telecom | hl7:contactPerson | hl7:templateId (rule-reference: d1540306e6-true-d1540405e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/*[not(@xsi:nil = 'true')][not(self::hl7:name | self::hl7:templateId | self::hl7:id | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication)]"
         id="d1540306e19-true-d1540572e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1540306e19-true-d1540572e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name | hl7:templateId | hl7:id | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication (rule-reference: d1540306e19-true-d1540572e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d1540436e14-true-d1540639e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1540436e14-true-d1540639e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d1540436e14-true-d1540639e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:name | self::hl7:administrativeGenderCode | self::hl7:birthTime | self::hl7:languageCommunication | self::hl7:templateId)]"
         id="d1540254e30-true-d1540726e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1540254e30-true-d1540726e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:name | hl7:administrativeGenderCode | hl7:birthTime | hl7:languageCommunication | hl7:templateId (rule-reference: d1540254e30-true-d1540726e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/*[not(@xsi:nil = 'true')][not(self::hl7:languageCode | self::hl7:modeCode | self::hl7:proficiencyLevelCode | self::hl7:preferenceInd | self::hl7:templateId)]"
         id="d1540688e7-true-d1540787e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="not(.)">(COCT_MT040203)/d1540688e7-true-d1540787e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:languageCode | hl7:modeCode | hl7:proficiencyLevelCode | hl7:preferenceInd | hl7:templateId (rule-reference: d1540688e7-true-d1540787e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/*[not(@xsi:nil = 'true')][not(self::hl7:authorOrPerformer[@typeCode][hl7:participant] | self::hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]] | self::hl7:reasonOf[hl7:justifiedDetectedIssue] | self::hl7:queryAck[hl7:queryResponseCode[@code = doc('include/voc-2.16.840.1.113883.1.11.208-2011-07-26T000000.xml')//valueSet[1]/conceptList/*/@code]])]"
         id="d41e45624-true-d1540935e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d41e45624-true-d1540935e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:authorOrPerformer[@typeCode][hl7:participant] | hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]] | hl7:reasonOf[hl7:justifiedDetectedIssue] | hl7:queryAck[hl7:queryResponseCode[@code = doc('include/voc-2.16.840.1.113883.1.11.208-2011-07-26T000000.xml')//valueSet[1]/conceptList/*/@code]] (rule-reference: d41e45624-true-d1540935e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/*[not(@xsi:nil = 'true')][not(self::hl7:participant[not(@nullFlavor)])]"
         id="d1540940e71-true-d1541005e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.519-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformerDevice)/d1540940e71-true-d1541005e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:participant[not(@nullFlavor)] (rule-reference: d1540940e71-true-d1541005e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:AssignedDevice[not(@nullFlavor)])]"
         id="d1540940e81-true-d1541073e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.519-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformerDevice)/d1540940e81-true-d1541073e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:AssignedDevice[not(@nullFlavor)] (rule-reference: d1540940e81-true-d1541073e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.2'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | self::hl7:id[@root = '2.16.528.1.1007.4'] | self::hl7:Organization | self::hl7:templateId)]"
         id="d1540940e83-true-d1541129e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.519-2012-08-01T000000.html"
              test="not(.)">(ControlActAuthorOrPerformerDevice)/d1540940e83-true-d1541129e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.2'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:id[@root = '2.16.528.1.1007.4'] | hl7:Organization | hl7:templateId (rule-reference: d1540940e83-true-d1541129e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice[not(@nullFlavor)]/hl7:Organization/*[not(@xsi:nil = 'true')][not(self::hl7:id[@root = '2.16.528.1.1007.3.3'] | self::hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | self::hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | self::hl7:id | self::hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:telecom | self::hl7:name | self::hl7:addr)]"
         id="d1541158e6-true-d1541216e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d1541158e6-true-d1541216e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'] | hl7:id | hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:telecom | hl7:name | hl7:addr (rule-reference: d1541158e6-true-d1541216e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice[not(@nullFlavor)]/hl7:Organization/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:city[not(@nullFlavor)])]"
         id="d1541158e57-true-d1541291e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="not(.)">(COCT_MT150000)/d1541158e57-true-d1541291e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:city[not(@nullFlavor)] (rule-reference: d1541158e57-true-d1541291e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/*[not(@xsi:nil = 'true')][not(self::hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']])]"
         id="d41e45644-true-d1541371e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d41e45644-true-d1541371e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']] (rule-reference: d41e45644-true-d1541371e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182'] | self::hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]] | self::hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]])]"
         id="d1541310e9-true-d1541446e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1541310e9-true-d1541446e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182'] | hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]] | hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]] (rule-reference: d1541310e9-true-d1541446e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/*[not(@xsi:nil = 'true')][not(self::hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']])]"
         id="d1541310e46-true-d1541499e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1541310e46-true-d1541499e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']] (rule-reference: d1541310e46-true-d1541499e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102'] | self::hl7:id | self::hl7:addr | self::hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] | self::hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]])]"
         id="d1541459e11-true-d1541559e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1541459e11-true-d1541559e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102'] | hl7:id | hl7:addr | hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]] | hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]] (rule-reference: d1541459e11-true-d1541559e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:addr/*[not(@xsi:nil = 'true')][not(self::hl7:streetName | self::hl7:houseNumber | self::hl7:buildingNumberSuffix | self::hl7:additionalLocator | self::hl7:postalCode | self::hl7:county | self::hl7:city | self::hl7:country | self::hl7:desc | self::hl7:useablePeriod)]"
         id="d1541576e6-true-d1541635e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10222-2012-08-01T000000.html"
              test="not(.)">(AdresJeugdige)/d1541576e6-true-d1541635e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:streetName | hl7:houseNumber | hl7:buildingNumberSuffix | hl7:additionalLocator | hl7:postalCode | hl7:county | hl7:city | hl7:country | hl7:desc | hl7:useablePeriod (rule-reference: d1541576e6-true-d1541635e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:addr/hl7:useablePeriod/*[not(@xsi:nil = 'true')][not(self::hl7:low | self::hl7:high | self::hl7:width | self::hl7:center)]"
         id="d1541694e6-true-d1541717e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.10251-2012-08-01T000000.html"
              test="not(.)">(PeriodeGeldigheidAdresJeugdige)/d1541694e6-true-d1541717e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:low | hl7:high | hl7:width | hl7:center (rule-reference: d1541694e6-true-d1541717e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)] | self::hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] | self::hl7:birthTime[not(@nullFlavor)])]"
         id="d1541459e81-true-d1541774e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1541459e81-true-d1541774e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] | hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] | hl7:birthTime[not(@nullFlavor)] (rule-reference: d1541459e81-true-d1541774e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:patientPerson[hl7:administrativeGenderCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.23-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code]]/hl7:name[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:given | self::hl7:prefix | self::hl7:family)]"
         id="d1541459e89-true-d1541801e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1541459e89-true-d1541801e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:given | hl7:prefix | hl7:family (rule-reference: d1541459e89-true-d1541801e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/*[not(@xsi:nil = 'true')][not(self::hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']])]"
         id="d1541459e156-true-d1541865e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1541459e156-true-d1541865e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']] (rule-reference: d1541459e156-true-d1541865e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584'] | self::hl7:code[(@code = '1584' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | self::hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.681-2019-07-16T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | self::hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]] | self::hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]])]"
         id="d1541459e168-true-d1541915e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1541459e168-true-d1541915e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584'] | hl7:code[(@code = '1584' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.681-2019-07-16T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] | hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]] | hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]] (rule-reference: d1541459e168-true-d1541915e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/*[not(@xsi:nil = 'true')][not(self::hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']])]"
         id="d1541872e27-true-d1541955e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1541872e27-true-d1541955e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']] (rule-reference: d1541872e27-true-d1541955e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028'] | self::hl7:code | self::hl7:value[not(@nullFlavor)] | self::hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]])]"
         id="d1541942e5-true-d1541987e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1541942e5-true-d1541987e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028'] | hl7:code | hl7:value[not(@nullFlavor)] | hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]] (rule-reference: d1541942e5-true-d1541987e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:code/*[not(@xsi:nil = 'true')][not(self::hl7:originalText)]"
         id="d1541942e78-true-d1542010e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1541942e78-true-d1542010e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:originalText (rule-reference: d1541942e78-true-d1542010e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]/*[not(@xsi:nil = 'true')][not(self::hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']])]"
         id="d1541942e182-true-d1542039e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1541942e182-true-d1542039e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']] (rule-reference: d1541942e182-true-d1542039e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]/hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]]/hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391']]/*[not(@xsi:nil = 'true')][not(self::hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391'])]"
         id="d1541942e194-true-d1542056e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1541942e194-true-d1542056e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391'] (rule-reference: d1541942e194-true-d1542056e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/*[not(@xsi:nil = 'true')][not(self::hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']])]"
         id="d1541872e32-true-d1542082e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1541872e32-true-d1542082e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']] (rule-reference: d1541872e32-true-d1542082e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029'] | self::hl7:code[not(@nullFlavor)] | self::hl7:value | self::hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]])]"
         id="d1542069e5-true-d1542114e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542069e5-true-d1542114e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029'] | hl7:code[not(@nullFlavor)] | hl7:value | hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]] (rule-reference: d1542069e5-true-d1542114e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]/*[not(@xsi:nil = 'true')][not(self::hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']])]"
         id="d1542069e99-true-d1542149e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542069e99-true-d1542149e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']] (rule-reference: d1542069e99-true-d1542149e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:subject[hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]]/hl7:patient[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.102']]/hl7:subjectOf1[hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]]/hl7:administrativeObservation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41584']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]/hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]/hl7:pertainsTo[hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]]/hl7:categoryInBDS[hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267']]/*[not(@xsi:nil = 'true')][not(self::hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267'])]"
         id="d1542069e119-true-d1542166e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542069e119-true-d1542166e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[@codeSystem = '2.16.840.1.113883.2.4.4.40.391' or @codeSystem = '2.16.840.1.113883.2.4.4.40.393' or @codeSystem = '2.16.840.1.113883.2.4.4.40.267'] (rule-reference: d1542069e119-true-d1542166e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/*[not(@xsi:nil = 'true')][not(self::hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']])]"
         id="d1541310e61-true-d1542201e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1541310e61-true-d1542201e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']] (rule-reference: d1541310e61-true-d1542201e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123'] | self::hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | self::hl7:effectiveTime | self::hl7:consumable[not(@nullFlavor)][hl7:medication] | self::hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]] | self::hl7:location[hl7:serviceDeliveryLocation[@classCode = 'SDLOC']] | self::hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]] | self::hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]] | self::hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]] | self::hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]])]"
         id="d1542179e17-true-d1542272e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e17-true-d1542272e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123'] | hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | hl7:effectiveTime | hl7:consumable[not(@nullFlavor)][hl7:medication] | hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]] | hl7:location[hl7:serviceDeliveryLocation[@classCode = 'SDLOC']] | hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]] | hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]] | hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]] | hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] (rule-reference: d1542179e17-true-d1542272e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/*[not(@xsi:nil = 'true')][not(self::hl7:medication[not(@nullFlavor)][hl7:administrableMedicine])]"
         id="d1542179e333-true-d1542307e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e333-true-d1542307e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:medication[not(@nullFlavor)][hl7:administrableMedicine] (rule-reference: d1542179e333-true-d1542307e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/*[not(@xsi:nil = 'true')][not(self::hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']])]"
         id="d1542179e353-true-d1542324e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e353-true-d1542324e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']] (rule-reference: d1542179e353-true-d1542324e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:consumable[not(@nullFlavor)][hl7:medication]/hl7:medication[not(@nullFlavor)][hl7:administrableMedicine]/hl7:administrableMedicine[hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76']]/*[not(@xsi:nil = 'true')][not(self::hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] | self::hl7:lotNumberText)]"
         id="d1542179e359-true-d1542342e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e359-true-d1542342e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[@nullFlavor or @codeSystem='2.16.840.1.113883.2.4.4.40.76'] | hl7:lotNumberText (rule-reference: d1542179e359-true-d1542342e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]/*[not(@xsi:nil = 'true')][not(self::hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']])]"
         id="d1542179e416-true-d1542372e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e416-true-d1542372e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']] (rule-reference: d1542179e416-true-d1542372e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]/*[not(@xsi:nil = 'true')][not(self::hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125'] | self::hl7:id | self::hl7:assignedOrganization[not(@nullFlavor)])]"
         id="d1542359e9-true-d1542399e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542359e9-true-d1542399e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125'] | hl7:id | hl7:assignedOrganization[not(@nullFlavor)] (rule-reference: d1542359e9-true-d1542399e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:performer[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]/hl7:assignedOrganization[not(@nullFlavor)]/*[not(@xsi:nil = 'true')][not(self::hl7:name[not(@nullFlavor)])]"
         id="d1542359e53-true-d1542428e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542359e53-true-d1542428e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:name[not(@nullFlavor)] (rule-reference: d1542359e53-true-d1542428e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:location[hl7:serviceDeliveryLocation[@classCode = 'SDLOC']]/*[not(@xsi:nil = 'true')][not(self::hl7:serviceDeliveryLocation[not(@nullFlavor)][@classCode = 'SDLOC'])]"
         id="d1542179e429-true-d1542451e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e429-true-d1542451e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:serviceDeliveryLocation[not(@nullFlavor)][@classCode = 'SDLOC'] (rule-reference: d1542179e429-true-d1542451e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/*[not(@xsi:nil = 'true')][not(self::hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]])]"
         id="d1542179e464-true-d1542474e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e464-true-d1542474e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]] (rule-reference: d1542179e464-true-d1542474e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/*[not(@xsi:nil = 'true')][not(self::hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | self::hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]])]"
         id="d1542179e475-true-d1542496e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e475-true-d1542496e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')] | hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]] (rule-reference: d1542179e475-true-d1542496e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/*[not(@xsi:nil = 'true')][not(self::hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]])]"
         id="d1542179e503-true-d1542519e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e503-true-d1542519e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] (rule-reference: d1542179e503-true-d1542519e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:authorization[hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]]/hl7:consentEvent[hl7:code[(@code = 'IMMUNIZ' and @codeSystem = '2.16.840.1.113883.5.4')]]/hl7:reasonOf[hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:observationEvent[hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/*[not(@xsi:nil = 'true')][not(self::hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | self::hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code])]"
         id="d1542179e515-true-d1542545e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e515-true-d1542545e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[(@code = '683' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.323-2012-05-21T012654.xml')//valueSet[1]/conceptList/exception/@code] (rule-reference: d1542179e515-true-d1542545e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]]/*[not(@xsi:nil = 'true')][not(self::hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]])]"
         id="d1542179e555-true-d1542576e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e555-true-d1542576e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]] (rule-reference: d1542179e555-true-d1542576e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:dateCriterion[hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')]]/*[not(@xsi:nil = 'true')][not(self::hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')] | self::hl7:value[not(@nullFlavor)])]"
         id="d1542179e563-true-d1542598e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e563-true-d1542598e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[(@code = '30981-5' and @codeSystem = '2.16.840.1.113883.6.1')] | hl7:value[not(@nullFlavor)] (rule-reference: d1542179e563-true-d1542598e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]]/*[not(@xsi:nil = 'true')][not(self::hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]])]"
         id="d1542179e596-true-d1542627e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e596-true-d1542627e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]] (rule-reference: d1542179e596-true-d1542627e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:limitation[hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]]/hl7:dateCriterion[hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')]]/*[not(@xsi:nil = 'true')][not(self::hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')] | self::hl7:value[not(@nullFlavor)])]"
         id="d1542179e604-true-d1542649e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e604-true-d1542649e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[(@code = '30980-7' and @codeSystem = '2.16.840.1.113883.6.1')] | hl7:value[not(@nullFlavor)] (rule-reference: d1542179e604-true-d1542649e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/*[not(@xsi:nil = 'true')][not(self::hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]])]"
         id="d1542179e637-true-d1542681e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542179e637-true-d1542681e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]] (rule-reference: d1542179e637-true-d1542681e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:subject[hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]]/hl7:VaccinationAdministrationList[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.182']]/hl7:component[hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]]/hl7:substanceAdministration[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.123']]/hl7:component[hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]]/hl7:vaccinationObservation[hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]]/*[not(@xsi:nil = 'true')][not(self::hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | self::hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')])]"
         id="d1542668e8-true-d1542703e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542668e8-true-d1542703e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code[(@code = '1589' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] | hl7:value[not(@nullFlavor)][resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')] (rule-reference: d1542668e8-true-d1542703e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:reasonOf[hl7:justifiedDetectedIssue]/*[not(@xsi:nil = 'true')][not(self::hl7:justifiedDetectedIssue)]"
         id="d41e45658-true-d1542735e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d41e45658-true-d1542735e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:justifiedDetectedIssue (rule-reference: d41e45658-true-d1542735e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:reasonOf[hl7:justifiedDetectedIssue]/hl7:justifiedDetectedIssue/*[not(@xsi:nil = 'true')][not(self::hl7:id | self::hl7:code[not(@nullFlavor)] | self::hl7:text | self::hl7:value | self::hl7:triggerFor[hl7:actOrderRequired] | self::hl7:targetOf)]"
         id="d41e45664-true-d1542780e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d41e45664-true-d1542780e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:id | hl7:code[not(@nullFlavor)] | hl7:text | hl7:value | hl7:triggerFor[hl7:actOrderRequired] | hl7:targetOf (rule-reference: d41e45664-true-d1542780e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:reasonOf[hl7:justifiedDetectedIssue]/hl7:justifiedDetectedIssue/hl7:triggerFor[hl7:actOrderRequired]/*[not(@xsi:nil = 'true')][not(self::hl7:actOrderRequired)]"
         id="d1542742e34-true-d1542821e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542742e34-true-d1542821e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:actOrderRequired (rule-reference: d1542742e34-true-d1542821e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:reasonOf[hl7:justifiedDetectedIssue]/hl7:justifiedDetectedIssue/hl7:triggerFor[hl7:actOrderRequired]/hl7:actOrderRequired/*[not(@xsi:nil = 'true')][not(self::hl7:code | self::hl7:effectiveTime | self::hl7:subject[hl7:participant])]"
         id="d1542742e56-true-d1542848e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542742e56-true-d1542848e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code | hl7:effectiveTime | hl7:subject[hl7:participant] (rule-reference: d1542742e56-true-d1542848e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:reasonOf[hl7:justifiedDetectedIssue]/hl7:justifiedDetectedIssue/hl7:triggerFor[hl7:actOrderRequired]/hl7:actOrderRequired/hl7:subject[hl7:participant]/*[not(@xsi:nil = 'true')][not(self::hl7:participant)]"
         id="d1542742e72-true-d1542877e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542742e72-true-d1542877e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:participant (rule-reference: d1542742e72-true-d1542877e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:reasonOf[hl7:justifiedDetectedIssue]/hl7:justifiedDetectedIssue/hl7:triggerFor[hl7:actOrderRequired]/hl7:actOrderRequired/hl7:subject[hl7:participant]/hl7:participant/*[not(@xsi:nil = 'true')][not(self::hl7:code)]"
         id="d1542742e87-true-d1542894e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542742e87-true-d1542894e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code (rule-reference: d1542742e87-true-d1542894e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:reasonOf[hl7:justifiedDetectedIssue]/hl7:justifiedDetectedIssue/hl7:targetOf/*[not(@xsi:nil = 'true')][not(self::hl7:source[@moodCode])]"
         id="d1542742e102-true-d1542917e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542742e102-true-d1542917e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:source[@moodCode] (rule-reference: d1542742e102-true-d1542917e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:reasonOf[hl7:justifiedDetectedIssue]/hl7:justifiedDetectedIssue/hl7:targetOf/hl7:source[@moodCode]/*[not(@xsi:nil = 'true')][not(self::hl7:code | self::hl7:text)]"
         id="d1542742e128-true-d1542939e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.17-2012-10-01T000000.html"
              test="not(.)">(OpleverenVaccinatiestatus)/d1542742e128-true-d1542939e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:code | hl7:text (rule-reference: d1542742e128-true-d1542939e0)</assert>
   </rule>
   <!-- Checking undefined contents for template/element @isClosed="false". Match context that we did not already match -->
   <rule fpi="RUL-QQQ"
         context="//hl7:REPC_IN002171NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[not(@nullFlavor)][@moodCode = 'EVN']/hl7:queryAck[hl7:queryResponseCode[@code = doc('include/voc-2.16.840.1.113883.1.11.208-2011-07-26T000000.xml')//valueSet[1]/conceptList/*/@code]]/*[not(@xsi:nil = 'true')][not(self::hl7:queryId[not(@nullFlavor)] | self::hl7:statusCode[@code = 'aborted' or @code = 'deliveredResponse' or @nullFlavor] | self::hl7:queryResponseCode[@code = doc('include/voc-2.16.840.1.113883.1.11.208-2011-07-26T000000.xml')//valueSet[1]/conceptList/*/@code] | self::hl7:resultTotalQuantity | self::hl7:resultCurrentQuantity[not(@nullFlavor)] | self::hl7:resultRemainingQuantity)]"
         id="d1542956e45-true-d1543001e0">
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.506-2012-09-01T000000.html"
              test="not(.)">(QueryAck)/d1542956e45-true-d1543001e0: dit element '<name/>' is niet gedefinieerd, of niet gedefinieerd met deze inhoud. Mogelijk betreft dit het templateId, code, of id. Verwacht in deze context: hl7:queryId[not(@nullFlavor)] | hl7:statusCode[@code = 'aborted' or @code = 'deliveredResponse' or @nullFlavor] | hl7:queryResponseCode[@code = doc('include/voc-2.16.840.1.113883.1.11.208-2011-07-26T000000.xml')//valueSet[1]/conceptList/*/@code] | hl7:resultTotalQuantity | hl7:resultCurrentQuantity[not(@nullFlavor)] | hl7:resultRemainingQuantity (rule-reference: d1542956e45-true-d1543001e0)</assert>
   </rule>
</pattern>
