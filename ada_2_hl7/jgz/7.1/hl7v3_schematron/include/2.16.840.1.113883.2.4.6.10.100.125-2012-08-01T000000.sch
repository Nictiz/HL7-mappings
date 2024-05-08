<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.125
Name: R_AssignedEntityNL [confirmable]
Description: R_AssignedEntityNL universal (COCT_MT090000NL) teruggebracht tot een Organisatie-id (optioneel) en een Organisatie-naam (verplicht)
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.125-2012-08-01T000000">
   <title>R_AssignedEntityNL [confirmable]</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.125
Context: *[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]
Item: (R_AssignedEntityNL-confirmable)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.125
Context: *[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]
Item: (R_AssignedEntityNL-confirmable)
-->
   <rule fpi="RULC-1"
         context="*[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]"
         id="d40e22081-false-d304745e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.125-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']) &gt;= 1">(R_AssignedEntityNL-confirmable): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.125-2012-08-01T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']) &lt;= 1">(R_AssignedEntityNL-confirmable): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.125-2012-08-01T000000.html"
              test="count(hl7:id) &lt;= 1">(R_AssignedEntityNL-confirmable): element hl7:id komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.125-2012-08-01T000000.html"
              test="count(hl7:assignedOrganization[not(@nullFlavor)]) &gt;= 1">(R_AssignedEntityNL-confirmable): element hl7:assignedOrganization[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.125-2012-08-01T000000.html"
              test="count(hl7:assignedOrganization[not(@nullFlavor)]) &lt;= 1">(R_AssignedEntityNL-confirmable): element hl7:assignedOrganization[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.125
Context: *[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']
Item: (R_AssignedEntityNL-confirmable)
-->
   <rule fpi="RULC-1"
         context="*[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']"
         id="d40e22106-false-d304793e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.125-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_AssignedEntityNL-confirmable): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.125-2012-08-01T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.125')">(R_AssignedEntityNL-confirmable): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.125' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.125
Context: *[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]/hl7:id
Item: (R_AssignedEntityNL-confirmable)
-->
   <rule fpi="RULC-1"
         context="*[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]/hl7:id"
         id="d40e22116-false-d304812e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.125-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(R_AssignedEntityNL-confirmable): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.125
Context: *[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]/hl7:assignedOrganization[not(@nullFlavor)]
Item: (R_AssignedEntityNL-confirmable)
-->
   <rule fpi="RULC-1"
         context="*[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]/hl7:assignedOrganization[not(@nullFlavor)]"
         id="d40e22125-false-d304825e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.125-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(R_AssignedEntityNL-confirmable): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.125-2012-08-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(R_AssignedEntityNL-confirmable): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.125
Context: *[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]/hl7:assignedOrganization[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]
Item: (R_AssignedEntityNL-confirmable)
-->
   <rule fpi="RULC-1"
         context="*[hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]]/hl7:assignedEntity[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.125']]/hl7:assignedOrganization[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]"
         id="d40e22132-false-d304849e0">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.125-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(R_AssignedEntityNL-confirmable): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
</pattern>
