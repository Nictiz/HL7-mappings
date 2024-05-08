<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.3.11.60.102.10.0
Name: Accept Acknowledgement
Description: Een Accept Acknowledgement/Ontvangstbevestiging (MCCI_IN000002) vertelt of de interactie waarop wordt geantwoord succesvol is ontvangen, is afgeleverd bij de bedoelde applicatie, en of deze interactie syntactisch correct is bevonden.  Het ontvangende systeem voert een technische validatie uit op de interactie. Technische validatie omvat alles wat een ontvangend systeem volledig automatisch, direct na ontvangst kan doen op het gebied van structuur en syntaxvalidatie. Hieronder valt: 
                 
                     of de interactie ondersteund wordt op basis van interactie-id en profile-id; 
                     of de interactie is afgeleverd bij de applicatie die is geïdentificeerd in het element receiver in de transmission wrapper; 
                     of de interactie transmission wrapper ondersteunde waarden heeft voor  sender/device/id ,  processingCode ,  versionCode , en  attentionLine ; 
                     of de interactie syntactisch correct is bevonden, waaronder;  

-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000">
   <title>Accept Acknowledgement</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.0
Context: /
Item: (MCCI_IN000002)
-->
   <rule fpi="RULC-1" context="/" id="d41e3-false-d7508e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]) &gt;= 1">(MCCI_IN000002): element hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]) &lt;= 1">(MCCI_IN000002): element hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.0
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]
Item: (MCCI_IN000002)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]"
         id="d41e62-false-d7602e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(MCCI_IN000002): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(MCCI_IN000002): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:creationTime[not(@nullFlavor)]) &gt;= 1">(MCCI_IN000002): element hl7:creationTime[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:creationTime[not(@nullFlavor)]) &lt;= 1">(MCCI_IN000002): element hl7:creationTime[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:versionCode[@code = 'NICTIZEd2005-Okt']) &gt;= 1">(MCCI_IN000002): element hl7:versionCode[@code = 'NICTIZEd2005-Okt'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:versionCode[@code = 'NICTIZEd2005-Okt']) &lt;= 1">(MCCI_IN000002): element hl7:versionCode[@code = 'NICTIZEd2005-Okt'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:interactionId[@root = '2.16.840.1.113883.1.6']) &gt;= 1">(MCCI_IN000002): element hl7:interactionId[@root = '2.16.840.1.113883.1.6'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:interactionId[@root = '2.16.840.1.113883.1.6']) &lt;= 1">(MCCI_IN000002): element hl7:interactionId[@root = '2.16.840.1.113883.1.6'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810']) &gt;= 1">(MCCI_IN000002): element hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810']) &lt;= 1">(MCCI_IN000002): element hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:processingCode[@code = 'P']) &gt;= 1">(MCCI_IN000002): element hl7:processingCode[@code = 'P'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:processingCode[@code = 'P']) &lt;= 1">(MCCI_IN000002): element hl7:processingCode[@code = 'P'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:processingModeCode[@code = 'T']) &gt;= 1">(MCCI_IN000002): element hl7:processingModeCode[@code = 'T'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:processingModeCode[@code = 'T']) &lt;= 1">(MCCI_IN000002): element hl7:processingModeCode[@code = 'T'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:acceptAckCode[@code = 'NE']) &gt;= 1">(MCCI_IN000002): element hl7:acceptAckCode[@code = 'NE'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:acceptAckCode[@code = 'NE']) &lt;= 1">(MCCI_IN000002): element hl7:acceptAckCode[@code = 'NE'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]) &gt;= 1">(MCCI_IN000002): element hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]) &lt;= 1">(MCCI_IN000002): element hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:receiver[not(@nullFlavor)][hl7:device]) &gt;= 1">(MCCI_IN000002): element hl7:receiver[not(@nullFlavor)][hl7:device] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:receiver[not(@nullFlavor)][hl7:device]) &lt;= 1">(MCCI_IN000002): element hl7:receiver[not(@nullFlavor)][hl7:device] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:sender[not(@nullFlavor)][hl7:device]) &gt;= 1">(MCCI_IN000002): element hl7:sender[not(@nullFlavor)][hl7:device] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count(hl7:sender[not(@nullFlavor)][hl7:device]) &lt;= 1">(MCCI_IN000002): element hl7:sender[not(@nullFlavor)][hl7:device] komt te vaak voor [max 1x].</assert>
      <let name="transmission" value="."/>
      <let name="interactionId" value="$transmission/local-name()"/>
      <let name="interactionVocabFile"
           value="'../vocab/2.16.840.1.113883.1.6.xml'"/>
      <let name="interactionVocab"
           value="if (doc-available($interactionVocabFile)) then doc($interactionVocabFile) else ()"/>
      <let name="interactionName"
           value="$interactionVocab/*/hl7:code[@code=$interactionId]/@displayName"/>
      <let name="isActive"
           value="not(exists($interactionVocab/*/hl7:code[@code=$interactionId]/hl7:qualifier[@name='Actief'][@value='false']))"/>
      <let name="allowBsn"
           value="exists($interactionVocab/*/hl7:code[@code=$interactionId]/hl7:qualifier[@name='AttentionLineMetBsn'][@value='true'])"/>
      <let name="allowContextCode"
           value="exists($interactionVocab/*/hl7:code[@code=$interactionId]/hl7:qualifier[@name='AttentionLineMetContextCode'][@value='true'])"/>
      <let name="senderGbpOrGbk"
           value="exists($transmission/hl7:ControlActProcess/hl7:authorOrPerformer/hl7:participant/hl7:AssignedPerson/hl7:code[@codeSystem=('2.16.840.1.113883.2.4.3.11.8','2.16.840.1.113883.2.4.3.11.6')])"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="$interactionVocab">(MCCI_IN000002): Transmission: <value-of select="$interactionVocabFile"/> niet gevonden. Controles gebaseerd op dit externe configuratiebestand zijn gedeactiveerd.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="not($interactionVocab) or $isActive">(MCCI_IN000002): Transmission: deze interactie <value-of select="$interactionId"/> (<value-of select="$interactionName"/>) is niet (meer) Actief in <value-of select="$interactionVocabFile"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="not($interactionVocab) or not($allowBsn) or $transmission/hl7:attentionLine/hl7:keyWordText[@code=('FICID','PATID')][@codeSystem='2.16.840.1.113883.2.4.15.1']">(MCCI_IN000002): Transmission: er moet in deze interactie exact één AttentionLine met BSN zitten - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="not($interactionVocab) or  not($allowContextCode) or $transmission/hl7:attentionLine/hl7:keyWordText[@code='CONTEXT'][@codeSystem='2.16.840.1.113883.2.4.15.1']">(MCCI_IN000002): Transmission: er moet in deze interactie exact één AttentionLine met de ContextCode zitten - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="not($interactionVocab) or not($transmission/hl7:attentionLine/hl7:keywordText[@code=('FICID','PATID')][@codeSystem='2.16.840.1.113883.2.4.15.1']) or $allowBsn or $senderGbpOrGbk">(MCCI_IN000002): Transmission: deze interactie <value-of select="$interactionId"/> (<value-of select="$interactionName"/>) is niet geconfigureerd voor gebruik van het element <value-of select="local-name()"/> voor BSN in <value-of select="$interactionVocabFile"/> en afzender is niet GBK of GBP</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="not($interactionVocab) or not($transmission/hl7:attentionLine/hl7:keywordText[@code='CONTEXT'][@codeSystem='2.16.840.1.113883.2.4.15.1']) or $allowContextCode or $senderGbpOrGbk">(MCCI_IN000002): Transmission: deze interactie <value-of select="$interactionId"/> (<value-of select="$interactionName"/>) is niet geconfigureerd voor gebruik van het element <value-of select="local-name()"/> voor ContextCode in <value-of select="$interactionVocabFile"/> en afzender is niet GBK of GBP</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count($transmission/hl7:attentionLine/hl7:keyWordText[@code=('FICID','PATID')][@codeSystem='2.16.840.1.113883.2.4.15.1'])&lt;=1">(MCCI_IN000002): Transmission: er mag maximaal één AttentionLine met BSN zijn - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.0-2014-07-15T000000.html"
              test="count($transmission/hl7:attentionLine/hl7:keyWordText[@code='CONTEXT'][@codeSystem='2.16.840.1.113883.2.4.15.1'])&lt;=1">(MCCI_IN000002): Transmission: er mag maximaal één AttentionLine met de ContextCode zijn - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:id[not(@nullFlavor)]
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:id[not(@nullFlavor)]"
         id="d7815e46-false-d7823e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(MCCI_MT000200): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="@root">(MCCI_MT000200): attribute @root MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="not(@root) or matches(@root,'^[0-2](\.(0|[1-9]\d*))*$') or matches(@root,'^[A-Fa-f\d]{8}-[A-Fa-f\d]{4}-[A-Fa-f\d]{4}-[A-Fa-f\d]{4}-[A-Fa-f\d]{12}$') or matches(@root,'^[A-Za-z][A-Za-z\d\-]*$')">(MCCI_MT000200): attribuut @root MOET datatype 'uid' hebben  - '<value-of select="@root"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="@extension">(MCCI_MT000200): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="not(@extension) or string-length(@extension)&gt;0">(MCCI_MT000200): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:creationTime[not(@nullFlavor)]
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:creationTime[not(@nullFlavor)]"
         id="d7815e57-false-d7856e0">
      <extends rule="TS.DATETIME.MIN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(MCCI_MT000200): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="not(*)">(MCCI_MT000200): <value-of select="local-name()"/> met datatype TS.DATETIME.MIN, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:versionCode[@code = 'NICTIZEd2005-Okt']
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:versionCode[@code = 'NICTIZEd2005-Okt']"
         id="d7815e66-false-d7873e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(MCCI_MT000200): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="@nullFlavor or (@code='NICTIZEd2005-Okt')">(MCCI_MT000200): de elementwaarde MOET een zijn van 'code 'NICTIZEd2005-Okt''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:interactionId[@root = '2.16.840.1.113883.1.6']
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:interactionId[@root = '2.16.840.1.113883.1.6']"
         id="d7815e74-false-d7893e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(MCCI_MT000200): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="string(@root) = ('2.16.840.1.113883.1.6')">(MCCI_MT000200): de waarde van root MOET '2.16.840.1.113883.1.6' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="not(@root='2.16.840.1.113883.1.6') or local-name(..)=@extension">(MCCI_MT000200): Transmission: @extension moet overeenkomen met het startelement van het bericht</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810']
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810']"
         id="d7815e85-false-d7912e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(MCCI_MT000200): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.3.11.1')">(MCCI_MT000200): de waarde van root MOET '2.16.840.1.113883.2.4.3.11.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="string(@extension) = ('810')">(MCCI_MT000200): de waarde van extension MOET '810' zijn. Gevonden: "<value-of select="@extension"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="not(@extension) or string-length(@extension)&gt;0">(MCCI_MT000200): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:processingCode[@code = 'P']
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:processingCode[@code = 'P']"
         id="d7815e95-false-d7942e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(MCCI_MT000200): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="@nullFlavor or (@code='P')">(MCCI_MT000200): de elementwaarde MOET een zijn van 'code 'P''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:processingModeCode[@code = 'T']
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:processingModeCode[@code = 'T']"
         id="d7815e103-false-d7962e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(MCCI_MT000200): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="@nullFlavor or (@code='T')">(MCCI_MT000200): de elementwaarde MOET een zijn van 'code 'T''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acceptAckCode[@code = 'NE']
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acceptAckCode[@code = 'NE']"
         id="d7815e112-false-d7982e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(MCCI_MT000200): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="@nullFlavor or (@code='NE')">(MCCI_MT000200): de elementwaarde MOET een zijn van 'code 'NE''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]"
         id="d7815e120-false-d8002e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="@typeCode">(MCCI_MT000200): attribute @typeCode MOET aanwezig zijn.</assert>
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@typeCode),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="not(@typeCode) or empty($theAttValue[not(. = (doc('include/voc-2.16.840.1.113883.1.11.8-2011-07-26T000000.xml')/*/valueSet/conceptList/concept/@code))])">(MCCI_MT000200): de waarde van typeCode MOET worden gekozen uit waardelijst '2.16.840.1.113883.1.11.8' AcknowledgementType (2011-07-26T00:00:00).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="substring(@typeCode, 1, 1) = 'C'">(MCCI_MT000200): De acknowledgement typeCode kan alleen een code zijn beginnend met een 'C'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="@typeCode != 'CE' or hl7:acknowledgementDetail">(MCCI_MT000200): Indien er in het bericht een fout wordt opgegeven, dan dient ook de volledige fout te worden aangegeven met een foutcode en foutmelding</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="count(hl7:targetMessage[not(@nullFlavor)]) &gt;= 1">(MCCI_MT000200): element hl7:targetMessage[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="count(hl7:targetMessage[not(@nullFlavor)]) &lt;= 1">(MCCI_MT000200): element hl7:targetMessage[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/hl7:acknowledgementDetail
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/hl7:acknowledgementDetail"
         id="d7815e141-false-d8047e0">
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@typeCode),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="not(@typeCode) or empty($theAttValue[not(. = (doc('include/voc-2.16.840.1.113883.1.11.19358-2011-07-26T000000.xml')/*/valueSet/conceptList/concept/@code))])">(MCCI_MT000200): de waarde van typeCode MOET worden gekozen uit waardelijst '2.16.840.1.113883.1.11.19358' AcknowledgementDetailType (2011-07-26T00:00:00).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="not(@typeCode) or @typeCode = 'E'">(MCCI_MT000200): @typeCode is optioneel aanwezig, maar moet indien aanwezig de waarde “E” bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="count(hl7:code[not(@nullFlavor)]) &gt;= 1">(MCCI_MT000200): element hl7:code[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="count(hl7:code[not(@nullFlavor)]) &lt;= 1">(MCCI_MT000200): element hl7:code[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="count(hl7:text) &lt;= 1">(MCCI_MT000200): element hl7:text komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/hl7:acknowledgementDetail/hl7:code[not(@nullFlavor)]
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/hl7:acknowledgementDetail/hl7:code[not(@nullFlavor)]"
         id="d7815e154-false-d8097e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(MCCI_MT000200): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="@codeSystem = '2.16.840.1.113883.5.1100' or @displayName">(MCCI_MT000200): @displayName is verplicht als de code niet uit de valueset AcknowledgementDetailCode komt</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/hl7:acknowledgementDetail/hl7:text
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/hl7:acknowledgementDetail/hl7:text"
         id="d7815e163-false-d8110e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(MCCI_MT000200): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/hl7:acknowledgementDetail/hl7:location
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/hl7:acknowledgementDetail/hl7:location"
         id="d7815e170-false-d8123e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')">(MCCI_MT000200): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ST" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/hl7:targetMessage[not(@nullFlavor)]
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/hl7:targetMessage[not(@nullFlavor)]"
         id="d7815e180-false-d8136e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(MCCI_MT000200): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(MCCI_MT000200): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/hl7:targetMessage[not(@nullFlavor)]/hl7:id[not(@nullFlavor)]
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acknowledgement[not(@nullFlavor)][@typeCode][hl7:targetMessage]/hl7:targetMessage[not(@nullFlavor)]/hl7:id[not(@nullFlavor)]"
         id="d7815e185-false-d8160e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(MCCI_MT000200): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.120
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]
Item: (TransmissionWrapperAttentionLine)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]"
         id="d8167e18-false-d8177e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.120-2014-07-15T000000.html"
              test="count(hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &gt;= 1">(TransmissionWrapperAttentionLine): element hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.120-2014-07-15T000000.html"
              test="count(hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]) &lt;= 1">(TransmissionWrapperAttentionLine): element hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.120-2014-07-15T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &gt;= 1">(TransmissionWrapperAttentionLine): element hl7:value[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.120-2014-07-15T000000.html"
              test="count(hl7:value[not(@nullFlavor)]) &lt;= 1">(TransmissionWrapperAttentionLine): element hl7:value[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.120
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (TransmissionWrapperAttentionLine)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d8167e23-false-d8220e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.120-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(TransmissionWrapperAttentionLine): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.120-2014-07-15T000000.html"
              test="@nullFlavor or not(@code) or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(TransmissionWrapperAttentionLine): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.102.11.1 AttentionLineElementTypeNL (DYNAMISCH)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.120
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:value[not(@nullFlavor)]
Item: (TransmissionWrapperAttentionLine)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:value[not(@nullFlavor)]"
         id="d8167e35-false-d8244e0">
      <extends rule="ANY"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.120-2014-07-15T000000.html"
              test="@xsi:type">(TransmissionWrapperAttentionLine): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]"
         id="d7815e202-false-d8270e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="string(@typeCode) = ('RCV') or not(@typeCode)">(MCCI_MT000200): de waarde van typeCode MOET 'RCV' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="count(hl7:telecom) &lt;= 1">(MCCI_MT000200): element hl7:telecom komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="count(hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]) &gt;= 1">(MCCI_MT000200): element hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="count(hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]) &lt;= 1">(MCCI_MT000200): element hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:telecom
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:telecom"
         id="d7815e206-false-d8327e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(MCCI_MT000200): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]"
         id="d8334e20-false-d8354e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(TransmissionWrapperDevice): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="string(@classCode) = ('DEV') or not(@classCode)">(TransmissionWrapperDevice): de waarde van classCode MOET 'DEV' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.6']) &gt;= 1">(TransmissionWrapperDevice): element hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.6']) &lt;= 1">(TransmissionWrapperDevice): element hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:name) &lt;= 1">(TransmissionWrapperDevice): element hl7:name komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:softwareName) &lt;= 1">(TransmissionWrapperDevice): element hl7:softwareName komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:agencyFor) &lt;= 1">(TransmissionWrapperDevice): element hl7:agencyFor komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1008
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.6']
Item: (dtAortaApplicationId)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.6']"
         id="d8431e10-false-d8439e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1008-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtAortaApplicationId): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1008-2014-07-15T000000.html"
              test="@extension">(dtAortaApplicationId): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1008-2014-07-15T000000.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtAortaApplicationId): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1008-2014-07-15T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.6')">(dtAortaApplicationId): de waarde van root MOET '2.16.840.1.113883.2.4.6.6' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:name
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:name"
         id="d8334e46-false-d8468e0">
      <extends rule="EN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'EN')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:EN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:telecom
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:telecom"
         id="d8334e53-false-d8481e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:softwareName
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:softwareName"
         id="d8334e60-false-d8494e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor"
         id="d8334e67-false-d8517e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="string(@classCode) = ('AGNT') or not(@classCode)">(TransmissionWrapperDevice): de waarde van classCode MOET 'AGNT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:representedOrganization) &lt;= 1">(TransmissionWrapperDevice): element hl7:representedOrganization komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization"
         id="d8334e74-false-d8561e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(TransmissionWrapperDevice): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(TransmissionWrapperDevice): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(TransmissionWrapperDevice): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(TransmissionWrapperDevice): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:NotificationParty[hl7:contactParty]) &lt;= 1">(TransmissionWrapperDevice): element hl7:NotificationParty[hl7:contactParty] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:id[not(@nullFlavor)]
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:id[not(@nullFlavor)]"
         id="d8334e84-false-d8624e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:name
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:name"
         id="d8334e90-false-d8637e0">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:telecom
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:telecom"
         id="d8334e97-false-d8650e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]"
         id="d8334e103-false-d8673e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="string(@classCode) = ('CON') or not(@classCode)">(TransmissionWrapperDevice): de waarde van classCode MOET 'CON' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:contactParty) &gt;= 1">(TransmissionWrapperDevice): element hl7:contactParty is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:contactParty) &lt;= 1">(TransmissionWrapperDevice): element hl7:contactParty komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:id
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:id"
         id="d8723e16-false-d8731e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:code
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:code"
         id="d8723e18-false-d8744e0">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:addr
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:addr"
         id="d8723e20-false-d8757e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:telecom
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:telecom"
         id="d8723e22-false-d8770e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty"
         id="d8723e24-false-d8787e0">
      <let name="elmcount"
           value="count(hl7:Organization[hl7:contact] | hl7:Person)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="$elmcount &gt;= 1">(COCT_MT040203): keuze (hl7:Organization[hl7:contact]  of  hl7:Person) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="$elmcount &lt;= 1">(COCT_MT040203): keuze (hl7:Organization[hl7:contact]  of  hl7:Person) bevat te veel elementen [max 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="count(hl7:Organization[hl7:contact]) &lt;= 1">(COCT_MT040203): element hl7:Organization[hl7:contact] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="count(hl7:Person) &lt;= 1">(COCT_MT040203): element hl7:Person komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]
Item: (COCT_MT040203)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(COCT_MT150003): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(COCT_MT150003): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="count(hl7:id) &gt;= 1">(COCT_MT150003): element hl7:id is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="count(hl7:code) &lt;= 1">(COCT_MT150003): element hl7:code komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="count(hl7:contact) &gt;= 1">(COCT_MT150003): element hl7:contact is required [min 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:id
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:code
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:code">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:name
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:name">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="string(@classCode) = ('CON') or not(@classCode)">(COCT_MT150003): de waarde van classCode MOET 'CON' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="count(hl7:code) &lt;= 1">(COCT_MT150003): element hl7:code komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="count(hl7:contactPerson) &lt;= 1">(COCT_MT150003): element hl7:contactPerson komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:id
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:code
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:code">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:addr
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:addr">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:telecom
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:telecom">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson">
      <extends rule="d9123e0-false-d9131e0"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="count(hl7:name) &gt;= 1">(COCT_MT150003): element hl7:name is required [min 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:name
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:name">
      <extends rule="d9123e9-false-d9205e0"/>
      <extends rule="PN.NL"/>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:templateId
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:templateId">
      <extends rule="d9123e25-false-d9362e0"/>
      <extends rule="II"/>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1" id="d9123e0-false-d9131e0" abstract="true">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(COCT_MT030203): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(COCT_MT030203): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:id) &gt;= 1">(COCT_MT030203): element hl7:id is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:administrativeGenderCode) &lt;= 1">(COCT_MT030203): element hl7:administrativeGenderCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:birthTime) &lt;= 1">(COCT_MT030203): element hl7:birthTime komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:id
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:name
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1" id="d9123e9-false-d9205e0" abstract="true">
      <extends rule="PN.NL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:administrativeGenderCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:administrativeGenderCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:birthTime
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:birthTime">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="not(*)">(COCT_MT030203): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:languageCode) &lt;= 1">(COCT_MT030203): element hl7:languageCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:modeCode) &lt;= 1">(COCT_MT030203): element hl7:modeCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:proficiencyLevelCode) &lt;= 1">(COCT_MT030203): element hl7:proficiencyLevelCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:preferenceInd) &lt;= 1">(COCT_MT030203): element hl7:preferenceInd komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:languageCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:languageCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:modeCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:modeCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:proficiencyLevelCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:proficiencyLevelCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:preferenceInd
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:preferenceInd">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1" id="d9123e25-false-d9362e0" abstract="true">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:templateId
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:templateId
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person
Item: (COCT_MT040203)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(COCT_MT030203): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(COCT_MT030203): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:id) &gt;= 1">(COCT_MT030203): element hl7:id is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:administrativeGenderCode) &lt;= 1">(COCT_MT030203): element hl7:administrativeGenderCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:birthTime) &lt;= 1">(COCT_MT030203): element hl7:birthTime komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:id
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:name
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:name">
      <extends rule="PN.NL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:administrativeGenderCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:administrativeGenderCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:birthTime
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:birthTime">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="not(*)">(COCT_MT030203): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:languageCode) &lt;= 1">(COCT_MT030203): element hl7:languageCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:modeCode) &lt;= 1">(COCT_MT030203): element hl7:modeCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:proficiencyLevelCode) &lt;= 1">(COCT_MT030203): element hl7:proficiencyLevelCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:preferenceInd) &lt;= 1">(COCT_MT030203): element hl7:preferenceInd komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:languageCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:languageCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:modeCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:modeCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:proficiencyLevelCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:proficiencyLevelCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:preferenceInd
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:preferenceInd">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]"
         id="d7815e216-false-d9680e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="string(@typeCode) = ('SND') or not(@typeCode)">(MCCI_MT000200): de waarde van typeCode MOET 'SND' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="count(hl7:telecom) &lt;= 1">(MCCI_MT000200): element hl7:telecom komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="count(hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]) &gt;= 1">(MCCI_MT000200): element hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="count(hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]) &lt;= 1">(MCCI_MT000200): element hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.200
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:telecom
Item: (MCCI_MT000200)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:telecom"
         id="d7815e220-false-d9737e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.200-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(MCCI_MT000200): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]"
         id="d9744e20-false-d9764e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(TransmissionWrapperDevice): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="string(@classCode) = ('DEV') or not(@classCode)">(TransmissionWrapperDevice): de waarde van classCode MOET 'DEV' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.6']) &gt;= 1">(TransmissionWrapperDevice): element hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.6']) &lt;= 1">(TransmissionWrapperDevice): element hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:name) &lt;= 1">(TransmissionWrapperDevice): element hl7:name komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:softwareName) &lt;= 1">(TransmissionWrapperDevice): element hl7:softwareName komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:agencyFor) &lt;= 1">(TransmissionWrapperDevice): element hl7:agencyFor komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1008
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.6']
Item: (dtAortaApplicationId)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.6']"
         id="d9841e10-false-d9849e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1008-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtAortaApplicationId): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1008-2014-07-15T000000.html"
              test="@extension">(dtAortaApplicationId): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1008-2014-07-15T000000.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtAortaApplicationId): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1008-2014-07-15T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.6')">(dtAortaApplicationId): de waarde van root MOET '2.16.840.1.113883.2.4.6.6' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:name
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:name"
         id="d9744e46-false-d9878e0">
      <extends rule="EN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'EN')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:EN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:telecom
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:telecom"
         id="d9744e53-false-d9891e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:softwareName
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:softwareName"
         id="d9744e60-false-d9904e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor"
         id="d9744e67-false-d9927e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="string(@classCode) = ('AGNT') or not(@classCode)">(TransmissionWrapperDevice): de waarde van classCode MOET 'AGNT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:representedOrganization) &lt;= 1">(TransmissionWrapperDevice): element hl7:representedOrganization komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization"
         id="d9744e74-false-d9971e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(TransmissionWrapperDevice): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(TransmissionWrapperDevice): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(TransmissionWrapperDevice): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(TransmissionWrapperDevice): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:NotificationParty[hl7:contactParty]) &lt;= 1">(TransmissionWrapperDevice): element hl7:NotificationParty[hl7:contactParty] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:id[not(@nullFlavor)]
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:id[not(@nullFlavor)]"
         id="d9744e84-false-d10034e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:name
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:name"
         id="d9744e90-false-d10047e0">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:telecom
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:telecom"
         id="d9744e97-false-d10060e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]"
         id="d9744e103-false-d10083e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="string(@classCode) = ('CON') or not(@classCode)">(TransmissionWrapperDevice): de waarde van classCode MOET 'CON' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:contactParty) &gt;= 1">(TransmissionWrapperDevice): element hl7:contactParty is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:contactParty) &lt;= 1">(TransmissionWrapperDevice): element hl7:contactParty komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:id
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:id"
         id="d10133e16-false-d10141e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:code
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:code"
         id="d10133e18-false-d10154e0">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:addr
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:addr"
         id="d10133e20-false-d10167e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:telecom
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:telecom"
         id="d10133e22-false-d10180e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty"
         id="d10133e24-false-d10197e0">
      <let name="elmcount"
           value="count(hl7:Organization[hl7:contact] | hl7:Person)"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="$elmcount &gt;= 1">(COCT_MT040203): keuze (hl7:Organization[hl7:contact]  of  hl7:Person) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="$elmcount &lt;= 1">(COCT_MT040203): keuze (hl7:Organization[hl7:contact]  of  hl7:Person) bevat te veel elementen [max 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="count(hl7:Organization[hl7:contact]) &lt;= 1">(COCT_MT040203): element hl7:Organization[hl7:contact] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="count(hl7:Person) &lt;= 1">(COCT_MT040203): element hl7:Person komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]
Item: (COCT_MT040203)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="string(@classCode) = ('ORG') or not(@classCode)">(COCT_MT150003): de waarde van classCode MOET 'ORG' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(COCT_MT150003): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="count(hl7:id) &gt;= 1">(COCT_MT150003): element hl7:id is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="count(hl7:code) &lt;= 1">(COCT_MT150003): element hl7:code komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="count(hl7:contact) &gt;= 1">(COCT_MT150003): element hl7:contact is required [min 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:id
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:code
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:code">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:name
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:name">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="string(@classCode) = ('CON') or not(@classCode)">(COCT_MT150003): de waarde van classCode MOET 'CON' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="count(hl7:code) &lt;= 1">(COCT_MT150003): element hl7:code komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="count(hl7:contactPerson) &lt;= 1">(COCT_MT150003): element hl7:contactPerson komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:id
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:code
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:code">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:addr
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:addr">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:telecom
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:telecom">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson">
      <extends rule="d10533e0-false-d10541e0"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="count(hl7:name) &gt;= 1">(COCT_MT150003): element hl7:name is required [min 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:name
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:name">
      <extends rule="d10533e9-false-d10615e0"/>
      <extends rule="PN.NL"/>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:templateId
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:templateId">
      <extends rule="d10533e25-false-d10772e0"/>
      <extends rule="II"/>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1" id="d10533e0-false-d10541e0" abstract="true">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(COCT_MT030203): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(COCT_MT030203): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:id) &gt;= 1">(COCT_MT030203): element hl7:id is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:administrativeGenderCode) &lt;= 1">(COCT_MT030203): element hl7:administrativeGenderCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:birthTime) &lt;= 1">(COCT_MT030203): element hl7:birthTime komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:id
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:name
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1" id="d10533e9-false-d10615e0" abstract="true">
      <extends rule="PN.NL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:administrativeGenderCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:administrativeGenderCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:birthTime
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:birthTime">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="not(*)">(COCT_MT030203): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:languageCode) &lt;= 1">(COCT_MT030203): element hl7:languageCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:modeCode) &lt;= 1">(COCT_MT030203): element hl7:modeCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:proficiencyLevelCode) &lt;= 1">(COCT_MT030203): element hl7:proficiencyLevelCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:preferenceInd) &lt;= 1">(COCT_MT030203): element hl7:preferenceInd komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:languageCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:languageCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:modeCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:modeCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:proficiencyLevelCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:proficiencyLevelCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:preferenceInd
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:preferenceInd">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1" id="d10533e25-false-d10772e0" abstract="true">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:templateId
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:templateId
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person
Item: (COCT_MT040203)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="string(@classCode) = ('PSN') or not(@classCode)">(COCT_MT030203): de waarde van classCode MOET 'PSN' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(COCT_MT030203): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:id) &gt;= 1">(COCT_MT030203): element hl7:id is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:administrativeGenderCode) &lt;= 1">(COCT_MT030203): element hl7:administrativeGenderCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:birthTime) &lt;= 1">(COCT_MT030203): element hl7:birthTime komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:id
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:name
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:name">
      <extends rule="PN.NL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:administrativeGenderCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:administrativeGenderCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:birthTime
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:birthTime">
      <extends rule="TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="not(*)">(COCT_MT030203): <value-of select="local-name()"/> met datatype TS, MAG GEEN elementen bevatten.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:languageCode) &lt;= 1">(COCT_MT030203): element hl7:languageCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:modeCode) &lt;= 1">(COCT_MT030203): element hl7:modeCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:proficiencyLevelCode) &lt;= 1">(COCT_MT030203): element hl7:proficiencyLevelCode komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="count(hl7:preferenceInd) &lt;= 1">(COCT_MT030203): element hl7:preferenceInd komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:languageCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:languageCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:modeCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:modeCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:proficiencyLevelCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:proficiencyLevelCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:preferenceInd
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:preferenceInd">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: /hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="/hl7:MCCI_IN000002[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
</pattern>
