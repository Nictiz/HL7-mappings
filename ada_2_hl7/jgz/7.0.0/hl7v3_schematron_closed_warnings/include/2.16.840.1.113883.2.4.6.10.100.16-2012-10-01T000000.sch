<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.16
Name: Opvragen vaccinatiestatus (interactie)
Description: Opvragen vaccinatiestatus. Er zijn een aantal generieke elementen met specifieke vulling:  
                     Het gebruik van het element hl7:attentionLine is verplicht met daarin het BSN van de persoon voor wie de vaccinatiestatus wordt opgevraagd. 
                     Het applicatie-id van het RIVM komt in hl7:receiver/hl7:device/hl7:id 
                     hl7:acceptAckCode/@code moet de waarde NE bevatten 
                     hl7:queryByParameter/hl7:responseModalityCode/@code moet de waarde 'R' bevatten 
                  De waarde voor het element  acceptAckCode  is "NE".
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000">
   <title>Opvragen vaccinatiestatus (interactie)</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.16
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]
Item: (OpvragenVaccinatiestatus)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]"
         id="d41e45021-false-d1521799e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="hl7:attentionLine">(OpvragenVaccinatiestatus): 
                    <name/>/attentionLine met het burgerservicenummer van de jeugdige is verplicht</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &gt;= 1">(OpvragenVaccinatiestatus): element hl7:id[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:id[not(@nullFlavor)]) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:id[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:creationTime[not(@nullFlavor)]) &gt;= 1">(OpvragenVaccinatiestatus): element hl7:creationTime[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:creationTime[not(@nullFlavor)]) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:creationTime[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:versionCode[@code = 'NICTIZEd2005-Okt']) &gt;= 1">(OpvragenVaccinatiestatus): element hl7:versionCode[@code = 'NICTIZEd2005-Okt'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:versionCode[@code = 'NICTIZEd2005-Okt']) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:versionCode[@code = 'NICTIZEd2005-Okt'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:interactionId[@root = '2.16.840.1.113883.1.6']) &gt;= 1">(OpvragenVaccinatiestatus): element hl7:interactionId[@root = '2.16.840.1.113883.1.6'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:interactionId[@root = '2.16.840.1.113883.1.6']) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:interactionId[@root = '2.16.840.1.113883.1.6'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810']) &gt;= 1">(OpvragenVaccinatiestatus): element hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810']) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:processingCode[@code = 'P']) &gt;= 1">(OpvragenVaccinatiestatus): element hl7:processingCode[@code = 'P'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:processingCode[@code = 'P']) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:processingCode[@code = 'P'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:processingModeCode[@code = 'T']) &gt;= 1">(OpvragenVaccinatiestatus): element hl7:processingModeCode[@code = 'T'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:processingModeCode[@code = 'T']) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:processingModeCode[@code = 'T'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:acceptAckCode[@code = 'AL' or @code = 'NE']) &gt;= 1">(OpvragenVaccinatiestatus): element hl7:acceptAckCode[@code = 'AL' or @code = 'NE'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:acceptAckCode[@code = 'AL' or @code = 'NE']) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:acceptAckCode[@code = 'AL' or @code = 'NE'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:receiver[not(@nullFlavor)][hl7:device]) &gt;= 1">(OpvragenVaccinatiestatus): element hl7:receiver[not(@nullFlavor)][hl7:device] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:receiver[not(@nullFlavor)][hl7:device]) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:receiver[not(@nullFlavor)][hl7:device] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:respondTo[hl7:entityRsp]) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:respondTo[hl7:entityRsp] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:sender[not(@nullFlavor)][hl7:device]) &gt;= 1">(OpvragenVaccinatiestatus): element hl7:sender[not(@nullFlavor)][hl7:device] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:sender[not(@nullFlavor)][hl7:device]) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:sender[not(@nullFlavor)][hl7:device] komt te vaak voor [max 1x].</assert>
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="$interactionVocab">(OpvragenVaccinatiestatus): Transmission: <value-of select="$interactionVocabFile"/> niet gevonden. Controles gebaseerd op dit externe configuratiebestand zijn gedeactiveerd.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($interactionVocab) or $isActive">(OpvragenVaccinatiestatus): Transmission: deze interactie <value-of select="$interactionId"/> (<value-of select="$interactionName"/>) is niet (meer) Actief in <value-of select="$interactionVocabFile"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($interactionVocab) or not($allowBsn) or $transmission/hl7:attentionLine/hl7:keyWordText[@code=('FICID','PATID')][@codeSystem='2.16.840.1.113883.2.4.15.1']">(OpvragenVaccinatiestatus): Transmission: er moet in deze interactie exact één AttentionLine met BSN zitten - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($interactionVocab) or  not($allowContextCode) or $transmission/hl7:attentionLine/hl7:keyWordText[@code='CONTEXT'][@codeSystem='2.16.840.1.113883.2.4.15.1']">(OpvragenVaccinatiestatus): Transmission: er moet in deze interactie exact één AttentionLine met de ContextCode zitten - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($interactionVocab) or not($transmission/hl7:attentionLine/hl7:keywordText[@code=('FICID','PATID')][@codeSystem='2.16.840.1.113883.2.4.15.1']) or $allowBsn or $senderGbpOrGbk">(OpvragenVaccinatiestatus): Transmission: deze interactie <value-of select="$interactionId"/> (<value-of select="$interactionName"/>) is niet geconfigureerd voor gebruik van het element <value-of select="local-name()"/> voor BSN in <value-of select="$interactionVocabFile"/> en afzender is niet GBK of GBP</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($interactionVocab) or not($transmission/hl7:attentionLine/hl7:keywordText[@code='CONTEXT'][@codeSystem='2.16.840.1.113883.2.4.15.1']) or $allowContextCode or $senderGbpOrGbk">(OpvragenVaccinatiestatus): Transmission: deze interactie <value-of select="$interactionId"/> (<value-of select="$interactionName"/>) is niet geconfigureerd voor gebruik van het element <value-of select="local-name()"/> voor ContextCode in <value-of select="$interactionVocabFile"/> en afzender is niet GBK of GBP</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count($transmission/hl7:attentionLine/hl7:keyWordText[@code=('FICID','PATID')][@codeSystem='2.16.840.1.113883.2.4.15.1'])&lt;=1">(OpvragenVaccinatiestatus): Transmission: er mag maximaal één AttentionLine met BSN zijn - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count($transmission/hl7:attentionLine/hl7:keyWordText[@code='CONTEXT'][@codeSystem='2.16.840.1.113883.2.4.15.1'])&lt;=1">(OpvragenVaccinatiestatus): Transmission: er mag maximaal één AttentionLine met de ContextCode zijn - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]) &gt;= 1">(OpvragenVaccinatiestatus): element hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]] komt te vaak voor [max 1x].</assert>
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
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="$interactionVocab">(OpvragenVaccinatiestatus): Transmission: <value-of select="$interactionVocabFile"/> niet gevonden. Controles gebaseerd op dit externe configuratiebestand zijn gedeactiveerd.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($interactionVocab) or $isActive">(OpvragenVaccinatiestatus): Transmission: deze interactie <value-of select="$interactionId"/> (<value-of select="$interactionName"/>) is niet (meer) Actief in <value-of select="$interactionVocabFile"/>
      </assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($interactionVocab) or not($allowBsn) or $transmission/hl7:attentionLine/hl7:keyWordText[@code=('FICID','PATID')][@codeSystem='2.16.840.1.113883.2.4.15.1']">(OpvragenVaccinatiestatus): Transmission: er moet in deze interactie exact één AttentionLine met BSN zitten - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($interactionVocab) or  not($allowContextCode) or $transmission/hl7:attentionLine/hl7:keyWordText[@code='CONTEXT'][@codeSystem='2.16.840.1.113883.2.4.15.1']">(OpvragenVaccinatiestatus): Transmission: er moet in deze interactie exact één AttentionLine met de ContextCode zitten - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($interactionVocab) or not($transmission/hl7:attentionLine/hl7:keywordText[@code=('FICID','PATID')][@codeSystem='2.16.840.1.113883.2.4.15.1']) or $allowBsn or $senderGbpOrGbk">(OpvragenVaccinatiestatus): Transmission: deze interactie <value-of select="$interactionId"/> (<value-of select="$interactionName"/>) is niet geconfigureerd voor gebruik van het element <value-of select="local-name()"/> voor BSN in <value-of select="$interactionVocabFile"/> en afzender is niet GBK of GBP</assert>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($interactionVocab) or not($transmission/hl7:attentionLine/hl7:keywordText[@code='CONTEXT'][@codeSystem='2.16.840.1.113883.2.4.15.1']) or $allowContextCode or $senderGbpOrGbk">(OpvragenVaccinatiestatus): Transmission: deze interactie <value-of select="$interactionId"/> (<value-of select="$interactionName"/>) is niet geconfigureerd voor gebruik van het element <value-of select="local-name()"/> voor ContextCode in <value-of select="$interactionVocabFile"/> en afzender is niet GBK of GBP</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count($transmission/hl7:attentionLine/hl7:keyWordText[@code=('FICID','PATID')][@codeSystem='2.16.840.1.113883.2.4.15.1'])&lt;=1">(OpvragenVaccinatiestatus): Transmission: er mag maximaal één AttentionLine met BSN zijn - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count($transmission/hl7:attentionLine/hl7:keyWordText[@code='CONTEXT'][@codeSystem='2.16.840.1.113883.2.4.15.1'])&lt;=1">(OpvragenVaccinatiestatus): Transmission: er mag maximaal één AttentionLine met de ContextCode zijn - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:id[not(@nullFlavor)]
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:id[not(@nullFlavor)]"
         id="d1522074e32-false-d1522082e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(MCCI_MT000100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="@root and @extension">(MCCI_MT000100): Transmission: id element mist root of extension</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:creationTime[not(@nullFlavor)]
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:creationTime[not(@nullFlavor)]"
         id="d1522074e52-false-d1522095e0">
      <extends rule="TS.DATETIME.MIN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TS')">(MCCI_MT000100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(*)">(MCCI_MT000100): <value-of select="local-name()"/> met datatype TS.DATETIME.MIN, MAG GEEN elementen bevatten.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="@value">(MCCI_MT000100): attribute @value MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(@value) or matches(string(@value), '^[0-9]{4,14}')">(MCCI_MT000100): attribuut @value MOET datatype 'ts' hebben  - '<value-of select="@value"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="string-length(@value) &gt;= 14">(MCCI_MT000100): creationTime moet minimaal op de seconde nauwkeurig zijn</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:versionCode[@code = 'NICTIZEd2005-Okt']
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:versionCode[@code = 'NICTIZEd2005-Okt']"
         id="d1522074e66-false-d1522122e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(MCCI_MT000100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="@nullFlavor or (@code='NICTIZEd2005-Okt')">(MCCI_MT000100): de elementwaarde MOET een zijn van 'code 'NICTIZEd2005-Okt''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:interactionId[@root = '2.16.840.1.113883.1.6']
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:interactionId[@root = '2.16.840.1.113883.1.6']"
         id="d1522074e74-false-d1522142e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(MCCI_MT000100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="string(@root) = ('2.16.840.1.113883.1.6')">(MCCI_MT000100): de waarde van root MOET '2.16.840.1.113883.1.6' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(@root='2.16.840.1.113883.1.6') or local-name(..)=@extension">(MCCI_MT000100): Transmission: @extension moet overeenkomen met het startelement van het bericht</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810']
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:profileId[@root = '2.16.840.1.113883.2.4.3.11.1'][@extension = '810']"
         id="d1522074e85-false-d1522161e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(MCCI_MT000100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.3.11.1')">(MCCI_MT000100): de waarde van root MOET '2.16.840.1.113883.2.4.3.11.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="string(@extension) = ('810')">(MCCI_MT000100): de waarde van extension MOET '810' zijn. Gevonden: "<value-of select="@extension"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="not(@extension) or string-length(@extension)&gt;0">(MCCI_MT000100): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:processingCode[@code = 'P']
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:processingCode[@code = 'P']"
         id="d1522074e95-false-d1522191e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(MCCI_MT000100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="@nullFlavor or (@code='P')">(MCCI_MT000100): de elementwaarde MOET een zijn van 'code 'P''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:processingModeCode[@code = 'T']
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:processingModeCode[@code = 'T']"
         id="d1522074e103-false-d1522211e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(MCCI_MT000100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="@nullFlavor or (@code='T')">(MCCI_MT000100): de elementwaarde MOET een zijn van 'code 'T''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acceptAckCode[@code = 'AL' or @code = 'NE']
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:acceptAckCode[@code = 'AL' or @code = 'NE']"
         id="d1522074e112-false-d1522231e0">
      <extends rule="CS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CS')">(MCCI_MT000100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="@nullFlavor or (@code='AL') or (@code='NE')">(MCCI_MT000100): de elementwaarde MOET een zijn van 'code 'AL' of code 'NE''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.120
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]
Item: (TransmissionWrapperAttentionLine)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]"
         id="d1522247e18-false-d1522257e0">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]
Item: (TransmissionWrapperAttentionLine)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]"
         id="d1522247e23-false-d1522300e0">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:value[not(@nullFlavor)]
Item: (TransmissionWrapperAttentionLine)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:attentionLine[hl7:keyWordText[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem)]]/hl7:value[not(@nullFlavor)]"
         id="d1522247e35-false-d1522324e0">
      <extends rule="ANY"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.120-2014-07-15T000000.html"
              test="@xsi:type">(TransmissionWrapperAttentionLine): attribute @xsi:type MOET aanwezig zijn.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]"
         id="d1522074e128-false-d1522350e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="string(@typeCode) = ('RCV') or not(@typeCode)">(MCCI_MT000100): de waarde van typeCode MOET 'RCV' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="count(hl7:telecom) &lt;= 1">(MCCI_MT000100): element hl7:telecom komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="count(hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]) &gt;= 1">(MCCI_MT000100): element hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="count(hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]) &lt;= 1">(MCCI_MT000100): element hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:telecom
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:telecom"
         id="d1522074e132-false-d1522407e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(MCCI_MT000100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]"
         id="d1522414e20-false-d1522434e0">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.6']
Item: (dtAortaApplicationId)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.6']"
         id="d1522511e10-false-d1522519e0">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:name
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:name"
         id="d1522414e46-false-d1522548e0">
      <extends rule="EN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'EN')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:EN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:telecom
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:telecom"
         id="d1522414e53-false-d1522561e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:softwareName
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:softwareName"
         id="d1522414e60-false-d1522574e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor"
         id="d1522414e67-false-d1522597e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="string(@classCode) = ('AGNT') or not(@classCode)">(TransmissionWrapperDevice): de waarde van classCode MOET 'AGNT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:representedOrganization) &lt;= 1">(TransmissionWrapperDevice): element hl7:representedOrganization komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization"
         id="d1522414e74-false-d1522641e0">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:id[not(@nullFlavor)]
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:id[not(@nullFlavor)]"
         id="d1522414e84-false-d1522704e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:name
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:name"
         id="d1522414e90-false-d1522717e0">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:telecom
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:telecom"
         id="d1522414e97-false-d1522730e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]"
         id="d1522414e103-false-d1522753e0">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:id
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:id"
         id="d1522803e16-false-d1522811e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:code
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:code"
         id="d1522803e18-false-d1522824e0">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:addr
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:addr"
         id="d1522803e20-false-d1522837e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:telecom
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:telecom"
         id="d1522803e22-false-d1522850e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty"
         id="d1522803e24-false-d1522867e0">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]
Item: (COCT_MT040203)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:id
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:code
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:code">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:name
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:name">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:id
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:code
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:code">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:addr
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:addr">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:telecom
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:telecom">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson">
      <extends rule="d1523203e0-false-d1523211e0"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="count(hl7:name) &gt;= 1">(COCT_MT150003): element hl7:name is required [min 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:name
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:name">
      <extends rule="d1523203e9-false-d1523285e0"/>
      <extends rule="PN.NL"/>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:templateId
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:templateId">
      <extends rule="d1523203e25-false-d1523442e0"/>
      <extends rule="II"/>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1" id="d1523203e0-false-d1523211e0" abstract="true">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:id
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:name
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1" id="d1523203e9-false-d1523285e0" abstract="true">
      <extends rule="PN.NL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:administrativeGenderCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:administrativeGenderCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:birthTime
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:birthTime">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:languageCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:languageCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:modeCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:modeCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:proficiencyLevelCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:proficiencyLevelCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:preferenceInd
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:preferenceInd">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1" id="d1523203e25-false-d1523442e0" abstract="true">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:templateId
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:templateId
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person
Item: (COCT_MT040203)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:id
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:name
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:name">
      <extends rule="PN.NL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:administrativeGenderCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:administrativeGenderCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:birthTime
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:birthTime">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:languageCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:languageCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:modeCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:modeCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:proficiencyLevelCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:proficiencyLevelCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:preferenceInd
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:preferenceInd">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:receiver[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]"
         id="d1522074e142-false-d1523750e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="string(@typeCode) = ('RSP') or not(@typeCode)">(MCCI_MT000100): de waarde van typeCode MOET 'RSP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="count(hl7:telecom) &lt;= 1">(MCCI_MT000100): element hl7:telecom komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="count(hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]) &gt;= 1">(MCCI_MT000100): element hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="count(hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]) &lt;= 1">(MCCI_MT000100): element hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:telecom
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:telecom"
         id="d1522074e146-false-d1523791e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(MCCI_MT000100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]"
         id="d1522074e153-false-d1523806e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="string(@classCode) = ('DEV') or not(@classCode)">(MCCI_MT000100): de waarde van classCode MOET 'DEV' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="string(@determinerCode) = ('INSTANCE') or not(@determinerCode)">(MCCI_MT000100): de waarde van determinerCode MOET 'INSTANCE' zijn. Gevonden: "<value-of select="@determinerCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.6']) &gt;= 1">(MCCI_MT000100): element hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] is mandatory [min 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1008
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.6']
Item: (dtAortaApplicationId)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.6']"
         id="d1523845e10-false-d1523853e0">
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
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:name
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:name"
         id="d1522074e166-false-d1523882e0">
      <extends rule="EN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'EN')">(MCCI_MT000100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:EN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:telecom
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:respondTo[hl7:entityRsp]/hl7:entityRsp[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:telecom"
         id="d1522074e168-false-d1523895e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(MCCI_MT000100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]"
         id="d1522074e172-false-d1523920e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="string(@typeCode) = ('SND') or not(@typeCode)">(MCCI_MT000100): de waarde van typeCode MOET 'SND' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="count(hl7:telecom) &lt;= 1">(MCCI_MT000100): element hl7:telecom komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="count(hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]) &gt;= 1">(MCCI_MT000100): element hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="count(hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]) &lt;= 1">(MCCI_MT000100): element hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.100
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:telecom
Item: (MCCI_MT000100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:telecom"
         id="d1522074e176-false-d1523977e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.100-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(MCCI_MT000100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]"
         id="d1523984e20-false-d1524004e0">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.6']
Item: (dtAortaApplicationId)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.6.6']"
         id="d1524081e10-false-d1524089e0">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:name
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:name"
         id="d1523984e46-false-d1524118e0">
      <extends rule="EN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'EN')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:EN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:telecom
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:telecom"
         id="d1523984e53-false-d1524131e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:softwareName
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:softwareName"
         id="d1523984e60-false-d1524144e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor"
         id="d1523984e67-false-d1524167e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="string(@classCode) = ('AGNT') or not(@classCode)">(TransmissionWrapperDevice): de waarde van classCode MOET 'AGNT' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="count(hl7:representedOrganization) &lt;= 1">(TransmissionWrapperDevice): element hl7:representedOrganization komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization"
         id="d1523984e74-false-d1524211e0">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:id[not(@nullFlavor)]
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:id[not(@nullFlavor)]"
         id="d1523984e84-false-d1524274e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:name
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:name"
         id="d1523984e90-false-d1524287e0">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:telecom
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:telecom"
         id="d1523984e97-false-d1524300e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.110-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(TransmissionWrapperDevice): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.110
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]
Item: (TransmissionWrapperDevice)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]"
         id="d1523984e103-false-d1524323e0">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:id
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:id"
         id="d1524373e16-false-d1524381e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:code
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:code"
         id="d1524373e18-false-d1524394e0">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:addr
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:addr"
         id="d1524373e20-false-d1524407e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:telecom
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:telecom"
         id="d1524373e22-false-d1524420e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.516-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(COCT_MT040203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty
Item: (COCT_MT040203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty"
         id="d1524373e24-false-d1524437e0">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]
Item: (COCT_MT040203)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:id
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:code
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:code">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:name
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:name">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:id
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:code
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:code">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:addr
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:addr">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:telecom
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:telecom">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson">
      <extends rule="d1524773e0-false-d1524781e0"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="count(hl7:name) &gt;= 1">(COCT_MT150003): element hl7:name is required [min 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:name
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:name">
      <extends rule="d1524773e9-false-d1524855e0"/>
      <extends rule="PN.NL"/>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:templateId
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:templateId">
      <extends rule="d1524773e25-false-d1525012e0"/>
      <extends rule="II"/>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1" id="d1524773e0-false-d1524781e0" abstract="true">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:id
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:name
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1" id="d1524773e9-false-d1524855e0" abstract="true">
      <extends rule="PN.NL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:administrativeGenderCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:administrativeGenderCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:birthTime
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:birthTime">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:languageCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:languageCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:modeCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:modeCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:proficiencyLevelCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:proficiencyLevelCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:preferenceInd
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:preferenceInd">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:languageCommunication/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:contactPerson/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1" id="d1524773e25-false-d1525012e0" abstract="true">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:templateId
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:contact/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.517
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:templateId
Item: (COCT_MT150003)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Organization[hl7:contact]/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.517-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150003): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.516
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person
Item: (COCT_MT040203)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:id
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:name
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:name">
      <extends rule="PN.NL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:administrativeGenderCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:administrativeGenderCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:birthTime
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:birthTime">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication">
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
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:languageCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:languageCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:modeCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:modeCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:proficiencyLevelCode
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:proficiencyLevelCode">
      <extends rule="CE"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CE')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CE" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:preferenceInd
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:preferenceInd">
      <extends rule="BL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'BL')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:BL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:languageCommunication/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.518
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:templateId
Item: (COCT_MT030203)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:sender[not(@nullFlavor)][hl7:device]/hl7:device[hl7:id[@root = '2.16.840.1.113883.2.4.6.6']]/hl7:agencyFor/hl7:representedOrganization/hl7:NotificationParty[hl7:contactParty]/hl7:contactParty/hl7:Person/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.518-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT030203): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.16
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]
Item: (OpvragenVaccinatiestatus)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]"
         id="d41e45034-false-d1525366e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="string(@moodCode) = ('EVN')">(OpvragenVaccinatiestatus): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:authorOrPerformer[not(@nullFlavor)][@typeCode][hl7:participant]) &gt;= 1">(OpvragenVaccinatiestatus): element hl7:authorOrPerformer[not(@nullFlavor)][@typeCode][hl7:participant] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:authorOrPerformer[not(@nullFlavor)][@typeCode][hl7:participant]) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:authorOrPerformer[not(@nullFlavor)][@typeCode][hl7:participant] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]) &gt;= 1">(OpvragenVaccinatiestatus): element hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="count(hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]) &lt;= 1">(OpvragenVaccinatiestatus): element hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']] komt te vaak voor [max 1x].</assert>
      <let name="controlActProcess" value="."/>
      <let name="authorEntity"
           value="$controlActProcess/hl7:authorOrPerformer//hl7:*[lower-case(local-name())=('assigneddevice','assignedperson')][1]"/>
      <let name="authorDevice"
           value="$authorEntity[lower-case(local-name())='assigneddevice']"/>
      <let name="authorPerson"
           value="$authorEntity[lower-case(local-name())='assignedperson']"/>
      <let name="overseerPerson"
           value="$controlActProcess/hl7:overseer/hl7:*[lower-case(local-name())=('assignedentity','assignedperson')][1]"/>
      <let name="authorPath"
           value="string-join($authorEntity/ancestor-or-self::*/name(),'/')"/>
      <let name="overseerPath"
           value="string-join($overseerPerson/ancestor-or-self::*/name(),'/')"/>
      <let name="senderApplicationId"
           value="$controlActProcess/../hl7:sender/hl7:device/hl7:id[@root='2.16.840.1.113883.2.4.6.6']/@extension"/>
      <let name="authorApplicationId"
           value="$authorDevice/hl7:id[@root='2.16.840.1.113883.2.4.6.6']/@extension"/>
      <let name="overseerOrgId" value="$overseerPerson/hl7:Organization/hl7:id"/>
      <let name="authorOrgId" value="$authorEntity/hl7:Organization/hl7:id"/>
      <let name="interactionId" value="$controlActProcess/../local-name()"/>
      <let name="interactionVocabFile"
           value="'../vocab/2.16.840.1.113883.1.6.xml'"/>
      <let name="interactionVocab"
           value="if (doc-available($interactionVocabFile)) then doc($interactionVocabFile) else ()"/>
      <let name="interactionTrustLevel"
           value="$interactionVocab/*/hl7:code[@code=$interactionId]/hl7:qualifier[@name='Vertrouwensniveau']/@value"/>
      <let name="interactionSendType"
           value="$interactionVocab/*/hl7:code[@code=$interactionId]/hl7:qualifier[@name='Verzendtype']/@value"/>
      <let name="interactionTriggerEventCode"
           value="$interactionVocab/*/hl7:code[@code=$interactionId]/hl7:reference/@extension"/>
      <let name="messageTriggerEventCode"
           value="$controlActProcess/hl7:code/@code"/>
      <assert role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="$interactionVocab">(OpvragenVaccinatiestatus): Control Act: <value-of select="$interactionVocabFile"/> niet gevonden. Controles gebaseerd op dit externe configuratiebestand zijn gedeactiveerd.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($controlActProcess/hl7:queryByParameter) or $controlActProcess[@moodCode='EVN']">(OpvragenVaccinatiestatus): Control Act: <value-of select="local-name()"/>/@moodCode moet 'EVN' zijn bij queries</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($interactionVocab) or not($messageTriggerEventCode) or $interactionTriggerEventCode=$messageTriggerEventCode">(OpvragenVaccinatiestatus): Control Act: <value-of select="local-name()"/>/code (Trigger Event) moet bij deze interactie '<value-of select="$interactionTriggerEventCode"/>' zijn, gevonden is echter '<value-of select="$messageTriggerEventCode"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($interactionVocab) or $authorPerson or not($interactionTrustLevel) or $interactionTrustLevel='Laag'">(OpvragenVaccinatiestatus): Control Act Author: <value-of select="local-name()"/>/authorOrPerformer moet een persoon bevatten in berichten met vertrouwensniveau midden of hoog</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($interactionVocab) or $overseerPerson or empty($interactionTrustLevel) or $interactionTrustLevel='Laag'">(OpvragenVaccinatiestatus): Control Act Overseer: <value-of select="local-name()"/>/overseer moet de mandaterende persoon bevatten in berichten met vertrouwensniveau midden of hoog</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="empty($senderApplicationId) or empty($authorApplicationId) or $senderApplicationId=$authorApplicationId or $senderApplicationId='1'">(OpvragenVaccinatiestatus): Control Act Author: <value-of select="$authorPath"/>/id. Applicatie-id <value-of select="$authorApplicationId"/> komt niet overeen met Transmission-wrapper sender <value-of select="$senderApplicationId"/>.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($authorDevice/hl7:Organization/hl7:id[@root='2.16.528.1.1007.3.3']) or $authorDevice/hl7:id[@root='2.16.528.1.1007.3.2']">(OpvragenVaccinatiestatus): Control Act Author: <value-of select="$authorPath"/>/id moet tenminste het UZI-nummer systemen bevatten voor een XIS in een GBZ</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($authorDevice/hl7:id[@root='2.16.528.1.1007.3.2']) or $authorDevice/hl7:Organization/hl7:id[@root='2.16.528.1.1007.3.3' and @extension]">(OpvragenVaccinatiestatus): Control Act Author: <value-of select="$authorPath"/>/id moet de zorgaanbieder van het XIS identificeren</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($authorDevice) or $authorDevice/hl7:id[@root='2.16.840.1.113883.2.4.6.6'][@extension='1'] or $authorDevice/hl7:id[@root='2.16.528.1.1007.4'] or $authorDevice/hl7:Organization/hl7:id">(OpvragenVaccinatiestatus): Control Act Author: <value-of select="$authorPath"/>/ moet een geïdentificeerde organisatie hebben, tenzij het de ZIM of het SBV-Z betreft.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($authorPerson/hl7:id[@root='2.16.840.1.113883.2.4.6.3']) or $authorPerson/hl7:code[@codeSystem='2.16.840.1.113883.2.4.3.11.8'][@code='P']">(OpvragenVaccinatiestatus): Control Act Author: <value-of select="$authorPath"/>/code/@code moet "P" (Patiënt) zijn. Wettelijke vertegenwoordigers moet dit via het Klantenloket doen en kunnen dus niet als auteur optreden</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($authorPerson/hl7:id[@root=('2.16.840.1.113883.2.4.3.11.7.3','2.16.528.1.1003.1.3.5.4.1')]) or $authorPerson/hl7:code[@codeSystem='2.16.840.1.113883.2.4.3.11.8'][@code='KLANTENLOKET']">(OpvragenVaccinatiestatus): Control Act Author: <value-of select="$authorPath"/>/code/@code moet "KLANTENLOKET" zijn voor klantenloketmedewerkers</assert>
      <assert role="info"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($authorPerson/hl7:id[@root='2.16.528.1.1007.3.1']) or $authorPerson/hl7:code[@codeSystem='2.16.840.1.113883.2.4.15.111']">(OpvragenVaccinatiestatus): Control Act Author: <value-of select="$authorPath"/>/code ontbreekt. Dit is alleen toegestaan als de rolcode 00.000 is.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($authorPerson/hl7:id[@root='2.16.528.1.1007.3.1']) or $authorOrgId[@root='2.16.528.1.1007.3.3' and @extension]">(OpvragenVaccinatiestatus): Control Act Author: <value-of select="$authorPath"/>/Organization/id moet de zorgaanbieder van de persoon identificeren</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($authorPerson/hl7:id[@root='2.16.840.1.113883.2.4.6.3']) or $authorOrgId[@root='2.16.840.1.113883.2.4.3.11.25']">(OpvragenVaccinatiestatus): Control Act Author: <value-of select="$authorPath"/>/Organization/id/@root moet '2.16.840.1.113883.2.4.3.11.25' bevatten</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($authorPerson/hl7:id[@root=('2.16.840.1.113883.2.4.3.11','2.16.528.1.1003.1.3.5.4.1')]) or $authorOrgId[@root='2.16.840.1.113883.2.4.3.11'][@extension='7']">(OpvragenVaccinatiestatus): Control Act Author: <value-of select="$authorPath"/>/Organization/id moet de Nictiz-klantenloket organisatie identificeren</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($overseerPerson/hl7:Organization[not(hl7:name)]/hl7:id[@root='2.16.528.1.1007.3.3'])">(OpvragenVaccinatiestatus): Control Act Overseer: <value-of select="$authorPath"/>/Organization/name moet de zorgaanbieder/organisatienaam bevatten</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($overseerPerson/hl7:Organization[not(hl7:name)]/hl7:id[@root='2.16.840.1.113883.2.4.3.11' and @extension='7'])">(OpvragenVaccinatiestatus): Control Act Overseer: <value-of select="$authorPath"/>/Organization/name moet de Nictiz-klantenloket organisatienaam bevatten</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($overseerPerson) or $overseerPerson/hl7:code">(OpvragenVaccinatiestatus): Control Act Overseer: <value-of select="$overseerPath"/>/code is verplicht</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($overseerPerson/hl7:id[@root='2.16.840.1.113883.2.4.6.3']) or $overseerPerson/hl7:code[@codeSystem='2.16.840.1.113883.2.4.3.11.8'][@code='P'] or $overseerPerson/hl7:code[@codeSystem='2.16.840.1.113883.2.4.3.11.6']">(OpvragenVaccinatiestatus): Control Act Overseer: <value-of select="$overseerPath"/>/code/@code moet "P" (Patiënt) zijn of een geldige waarde uit RoleCodeWettelijkeVertegenwoordigerNL</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($overseerPerson/hl7:id[@root='2.16.528.1.1007.3.1']) or $overseerPerson/hl7:assignedPrincipalChoiceList/hl7:assignedPerson/hl7:name">(OpvragenVaccinatiestatus): Control Act Overseer: <value-of select="$overseerPath"/>/assignedPrincipalChoiceList/assignedPerson/name is verplicht</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($overseerPerson/hl7:id[@root='2.16.528.1.1007.3.1']) or $overseerPerson/hl7:Organization/hl7:id[@root='2.16.528.1.1007.3.3']">(OpvragenVaccinatiestatus): Control Act Overseer: <value-of select="$overseerPath"/>/Organization/id moet de zorgaanbieder van de persoon identificeren</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($overseerPerson/hl7:id[@root='2.16.528.1.1007.3.1']) or $overseerPerson/hl7:Organization/hl7:name">(OpvragenVaccinatiestatus): Control Act Overseer: <value-of select="$overseerPath"/>/Organization/name moet de zorgaanbiedernaam bevatten</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($overseerPerson/hl7:id[@root='2.16.528.1.1007.3.1']) or $overseerPerson/hl7:Organization/hl7:addr/hl7:city">(OpvragenVaccinatiestatus): Control Act Overseer: <value-of select="$overseerPath"/>/Organization/addr moet tenminste de vestigingsplaats bevatten</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="not($overseerOrgId) or $authorOrgId[@root=$overseerOrgId/@root][@extension=$overseerOrgId/@extension] or $authorEntity[lower-case(local-name())='assigneddevice']">(OpvragenVaccinatiestatus): Control Act: <value-of select="$overseerPath"/>/Organization/id. Organisatie van de overseer (<value-of select="$overseerOrgId/@root"/>#<value-of select="$overseerOrgId/@extension"/>) moet gelijk zijn aan die van de authorOrPerformer (<value-of select="$authorOrgId/@extension"/>)</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000.html"
              test="$authorDevice/hl7:id[@root='2.16.528.1.1007'][@extension='4'] or $authorDevice/hl7:id[@root='2.16.840.1.113883.2.4.6.6'][@extension='1'] or $authorEntity/hl7:Organization/hl7:name">(OpvragenVaccinatiestatus): Control Act Author: <value-of select="$authorPath"/>/hl7:Organization/hl7:name dient een organisatienaam te bevatten indien de applicatie niet het SBV-Z is of de ZIM betreft. 1: <value-of select="$authorDevice/hl7:id[@root='2.16.528.1.1007'][@extension='4']"/>, 2: <value-of select="$authorDevice/hl7:id[@root='2.16.840.1.113883.2.4.6.6'][@extension='1']"/>, 3: <value-of select="$authorEntity/hl7:Organization/hl7:name"/>
      </assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.500
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]
Item: (ControlActAuthorOrPerformer)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]"
         id="d1525500e91-false-d1525546e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="@typeCode">(ControlActAuthorOrPerformer): attribute @typeCode MOET aanwezig zijn.</assert>
      <let name="theAttValue"
           value="distinct-values(tokenize(normalize-space(@typeCode),'\s'))"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="not(@typeCode) or empty($theAttValue[not(. = (doc('include/voc-2.16.840.1.113883.1.11.19080-2011-07-26T000000.xml')/*/valueSet/conceptList/concept/@code))])">(ControlActAuthorOrPerformer): de waarde van typeCode MOET worden gekozen uit waardelijst '2.16.840.1.113883.1.11.19080' x_ParticipationAuthorPerformer (2011-07-26T00:00:00).</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="@typeCode = 'AUT' or @typeCode = 'PRF'">(ControlActAuthorOrPerformer): @typeCode moet de waarde “AUT” of “PRF” hebben.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="count(hl7:participant[not(@nullFlavor)]) &gt;= 1">(ControlActAuthorOrPerformer): element hl7:participant[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="count(hl7:participant[not(@nullFlavor)]) &lt;= 1">(ControlActAuthorOrPerformer): element hl7:participant[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.500
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]
Item: (ControlActAuthorOrPerformer)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]"
         id="d1525500e101-false-d1525663e0">
      <let name="elmcount"
           value="count(hl7:AssignedDevice | hl7:AssignedPerson[hl7:Organization])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(ControlActAuthorOrPerformer): keuze (hl7:AssignedDevice  of  hl7:AssignedPerson[hl7:Organization]) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.500-2012-08-01T000000.html"
              test="$elmcount &lt;= 1">(ControlActAuthorOrPerformer): keuze (hl7:AssignedDevice  of  hl7:AssignedPerson[hl7:Organization]) bevat te veel elementen [max 1x]</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.500
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice
Item: (ControlActAuthorOrPerformer)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.513
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice
Item: (COCT_MT090300)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice">
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.2'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.6'] | hl7:id[@root = '2.16.528.1.1007.4'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.513-2012-09-01T000000.html"
              test="$elmcount &gt;= 1">(COCT_MT090300): keuze (hl7:id[@root = '2.16.528.1.1007.3.2']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.6']  of  hl7:id[@root = '2.16.528.1.1007.4']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.513-2012-09-01T000000.html"
              test="$elmcount &lt;= 2">(COCT_MT090300): keuze (hl7:id[@root = '2.16.528.1.1007.3.2']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.6']  of  hl7:id[@root = '2.16.528.1.1007.4']) bevat te veel elementen [max 2x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.513-2012-09-01T000000.html"
              test="count(hl7:Organization) &lt;= 1">(COCT_MT090300): element hl7:Organization komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1010
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:id[@root = '2.16.528.1.1007.3.2']
Item: (dtUZIsystemen)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:id[@root = '2.16.528.1.1007.3.2']">
      <extends rule="II.NL.UZI"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1010-2018-11-01T150524.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtUZIsystemen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1010-2018-11-01T150524.html"
              test="string(@root) = ('2.16.528.1.1007.3.2')">(dtUZIsystemen): de waarde van root MOET '2.16.528.1.1007.3.2' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1010-2018-11-01T150524.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtUZIsystemen): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1008
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:id[@root = '2.16.840.1.113883.2.4.6.6']
Item: (dtAortaApplicationId)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:id[@root = '2.16.840.1.113883.2.4.6.6']">
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
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1018
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:id[@root = '2.16.528.1.1007.4']
Item: (dtSBV-Zsystemen)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:id[@root = '2.16.528.1.1007.4']">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1018-2018-11-01T150034.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtSBV-Zsystemen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1018-2018-11-01T150034.html"
              test="string(@root) = ('2.16.528.1.1007.4')">(dtSBV-Zsystemen): de waarde van root MOET '2.16.528.1.1007.4' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1018-2018-11-01T150034.html"
              test="@extension">(dtSBV-Zsystemen): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1018-2018-11-01T150034.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtSBV-Zsystemen): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization">
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="$elmcount &gt;= 1">(COCT_MT150000): keuze (hl7:id[@root = '2.16.528.1.1007.3.3']  of  hl7:id[@root = '2.16.528.1.1007'][@extension = '4']  of  hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25']  of  hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="$elmcount &lt;= 1">(COCT_MT150000): keuze (hl7:id[@root = '2.16.528.1.1007.3.3']  of  hl7:id[@root = '2.16.528.1.1007'][@extension = '4']  of  hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25']  of  hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7']) bevat te veel elementen [max 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(COCT_MT150000): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="count(hl7:addr) &lt;= 1">(COCT_MT150000): element hl7:addr komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1011
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:id[@root = '2.16.528.1.1007.3.3']
Item: (dtURAorganization)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:id[@root = '2.16.528.1.1007.3.3']">
      <extends rule="II.NL.URA"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1011-2018-11-01T150615.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtURAorganization): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1011-2018-11-01T150615.html"
              test="string(@root) = ('2.16.528.1.1007.3.3')">(dtURAorganization): de waarde van root MOET '2.16.528.1.1007.3.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1011-2018-11-01T150615.html"
              test="@extension">(dtURAorganization): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1011-2018-11-01T150615.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtURAorganization): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1019
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:id[@root = '2.16.528.1.1007'][@extension = '4']
Item: (dtSBV-ZOrganizationId)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:id[@root = '2.16.528.1.1007'][@extension = '4']">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1019-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtSBV-ZOrganizationId): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1019-2014-07-15T000000.html"
              test="string(@root) = ('2.16.528.1.1007')">(dtSBV-ZOrganizationId): de waarde van root MOET '2.16.528.1.1007' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1019-2014-07-15T000000.html"
              test="string(@extension) = ('4')">(dtSBV-ZOrganizationId): de waarde van extension MOET '4' zijn. Gevonden: "<value-of select="@extension"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1020
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25']
Item: (dtGBO-GBP)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25']">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1020-2018-11-01T150146.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtGBO-GBP): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1020-2018-11-01T150146.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.3.11.25')">(dtGBO-GBP): de waarde van root MOET '2.16.840.1.113883.2.4.3.11.25' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1020-2018-11-01T150146.html"
              test="@extension">(dtGBO-GBP): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1020-2018-11-01T150146.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtGBO-GBP): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1021
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7']
Item: (dtGBKOrganizationId)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7']">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1021-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtGBKOrganizationId): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1021-2014-07-15T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.3.11')">(dtGBKOrganizationId): de waarde van root MOET '2.16.840.1.113883.2.4.3.11' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1021-2014-07-15T000000.html"
              test="string(@extension) = ('7')">(dtGBKOrganizationId): de waarde van extension MOET '7' zijn. Gevonden: "<value-of select="@extension"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:id
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(COCT_MT150000): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.1.11.1 RoleCodeNL - zorgaanbiedertype (organisaties) (DYNAMISCH)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:telecom
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:telecom">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:name
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:name">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:addr
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:addr">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="count(hl7:city[not(@nullFlavor)]) &gt;= 1">(COCT_MT150000): element hl7:city[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="count(hl7:city[not(@nullFlavor)]) &lt;= 1">(COCT_MT150000): element hl7:city[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:addr/hl7:city[not(@nullFlavor)]
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:Organization/hl7:addr/hl7:city[not(@nullFlavor)]">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.513
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:templateId
Item: (COCT_MT090300)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedDevice/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.513-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT090300): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.500
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]
Item: (ControlActAuthorOrPerformer)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.514
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]
Item: (COCT_MT090100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]">
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3'] | hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="$elmcount &gt;= 1">(COCT_MT090100): keuze (hl7:id[@root = '2.16.528.1.1007.3.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.3']  of  hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3']  of  hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.1']) &lt;= 1">(COCT_MT090100): element hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(COCT_MT090100): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="count(hl7:telecom) &lt;= 1">(COCT_MT090100): element hl7:telecom komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="count(hl7:assignedPrincipalChoiceList[hl7:assignedPerson]) &lt;= 1">(COCT_MT090100): element hl7:assignedPrincipalChoiceList[hl7:assignedPerson] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="count(hl7:Organization[not(@nullFlavor)]) &gt;= 1">(COCT_MT090100): element hl7:Organization[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="count(hl7:Organization[not(@nullFlavor)]) &lt;= 1">(COCT_MT090100): element hl7:Organization[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1009
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:id[@root = '2.16.528.1.1007.3.1']
Item: (dtUZIpersonen)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:id[@root = '2.16.528.1.1007.3.1']">
      <extends rule="II.NL.UZI"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1009-2018-11-01T150349.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtUZIpersonen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1009-2018-11-01T150349.html"
              test="@extension">(dtUZIpersonen): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1009-2018-11-01T150349.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtUZIpersonen): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1009-2018-11-01T150349.html"
              test="string(@root) = ('2.16.528.1.1007.3.1')">(dtUZIpersonen): de waarde van root MOET '2.16.528.1.1007.3.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1012
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']
Item: (dtBSNId)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']">
      <extends rule="II.NL.BSN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1012-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtBSNId): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1012-2014-07-15T000000.html"
              test="@extension">(dtBSNId): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1012-2014-07-15T000000.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtBSNId): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1012-2014-07-15T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.3')">(dtBSNId): de waarde van root MOET '2.16.840.1.113883.2.4.6.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1012-2014-07-15T000000.html"
              test="string-length(@extension) = 9">(dtBSNId): Het BSN dient altijd 9 cijfers te bevatten. Het BSN kan ook voorloopnullen bevatten, oftewel beginnen met een nul.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1015
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3']
Item: (dtBatchInzageAuteur)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3']">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1015-2018-11-01T144621.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtBatchInzageAuteur): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1015-2018-11-01T144621.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.3.11.7.3')">(dtBatchInzageAuteur): de waarde van root MOET '2.16.840.1.113883.2.4.3.11.7.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1015-2018-11-01T144621.html"
              test="@extension">(dtBatchInzageAuteur): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1015-2018-11-01T144621.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtBatchInzageAuteur): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1016
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1']
Item: (dtVZVZKlantenloketPKIO)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1']">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1016-2018-11-01T144037.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtVZVZKlantenloketPKIO): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1016-2018-11-01T144037.html"
              test="string(@root) = ('2.16.528.1.1003.1.3.5.4.1')">(dtVZVZKlantenloketPKIO): de waarde van root MOET '2.16.528.1.1003.1.3.5.4.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1016-2018-11-01T144037.html"
              test="@extension">(dtVZVZKlantenloketPKIO): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1016-2018-11-01T144037.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtVZVZKlantenloketPKIO): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1017
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']
Item: (dtAGB)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']">
      <extends rule="II.NL.AGB"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1017-2018-11-01T144449.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtAGB): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1017-2018-11-01T144449.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.1')">(dtAGB): de waarde van root MOET '2.16.840.1.113883.2.4.6.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1017-2018-11-01T144449.html"
              test="@extension">(dtAGB): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1017-2018-11-01T144449.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtAGB): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.514
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (COCT_MT090100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(COCT_MT090100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]]) or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]]) or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(COCT_MT090100): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.1.11.2 RoleCodeNL - zorgverlenertype (personen) (DYNAMISCH) of 2.16.840.1.113883.2.4.3.11.60.102.11.4 RoleCodeNL - toegang patiënt (DYNAMISCH) of 2.16.840.1.113883.2.4.3.11.60.102.11.5 RoleCodeNL - wettelijke vertegenwoording (DYNAMISCH)'.</assert>
      <report fpi="CD-DEPR-BSP"
              role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept[@type='D'][@code = $theCode][@codeSystem = $theCodeSystem])">(COCT_MT090100): element hl7:code is gecodeerd met bindingssterkte 'required' en bevat een code die verouderd is.</report>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="not(@code='00.000' and @codeSystem='2.16.840.1.113883.2.4.15.111')">(COCT_MT090100): Control Act: <name path=".."/>/<name/> moet een UZI-rolcode 00.000 is niet toegestaan</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.514
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:telecom
Item: (COCT_MT090100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:telecom">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(COCT_MT090100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.514
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]
Item: (COCT_MT090100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="count(hl7:assignedPerson[not(@nullFlavor)]) &gt;= 1">(COCT_MT090100): element hl7:assignedPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="count(hl7:assignedPerson[not(@nullFlavor)]) &lt;= 1">(COCT_MT090100): element hl7:assignedPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.514
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]
Item: (COCT_MT090100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(COCT_MT090100): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(COCT_MT090100): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.514
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]
Item: (COCT_MT090100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]">
      <extends rule="PN.NL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(COCT_MT090100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization">
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="$elmcount &gt;= 1">(COCT_MT150000): keuze (hl7:id[@root = '2.16.528.1.1007.3.3']  of  hl7:id[@root = '2.16.528.1.1007'][@extension = '4']  of  hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25']  of  hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="$elmcount &lt;= 1">(COCT_MT150000): keuze (hl7:id[@root = '2.16.528.1.1007.3.3']  of  hl7:id[@root = '2.16.528.1.1007'][@extension = '4']  of  hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25']  of  hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7']) bevat te veel elementen [max 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(COCT_MT150000): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="count(hl7:addr) &lt;= 1">(COCT_MT150000): element hl7:addr komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1011
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.528.1.1007.3.3']
Item: (dtURAorganization)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.528.1.1007.3.3']">
      <extends rule="II.NL.URA"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1011-2018-11-01T150615.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtURAorganization): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1011-2018-11-01T150615.html"
              test="string(@root) = ('2.16.528.1.1007.3.3')">(dtURAorganization): de waarde van root MOET '2.16.528.1.1007.3.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1011-2018-11-01T150615.html"
              test="@extension">(dtURAorganization): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1011-2018-11-01T150615.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtURAorganization): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1019
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.528.1.1007'][@extension = '4']
Item: (dtSBV-ZOrganizationId)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.528.1.1007'][@extension = '4']">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1019-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtSBV-ZOrganizationId): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1019-2014-07-15T000000.html"
              test="string(@root) = ('2.16.528.1.1007')">(dtSBV-ZOrganizationId): de waarde van root MOET '2.16.528.1.1007' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1019-2014-07-15T000000.html"
              test="string(@extension) = ('4')">(dtSBV-ZOrganizationId): de waarde van extension MOET '4' zijn. Gevonden: "<value-of select="@extension"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1020
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25']
Item: (dtGBO-GBP)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25']">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1020-2018-11-01T150146.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtGBO-GBP): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1020-2018-11-01T150146.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.3.11.25')">(dtGBO-GBP): de waarde van root MOET '2.16.840.1.113883.2.4.3.11.25' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1020-2018-11-01T150146.html"
              test="@extension">(dtGBO-GBP): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1020-2018-11-01T150146.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtGBO-GBP): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1021
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7']
Item: (dtGBKOrganizationId)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7']">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1021-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtGBKOrganizationId): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1021-2014-07-15T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.3.11')">(dtGBKOrganizationId): de waarde van root MOET '2.16.840.1.113883.2.4.3.11' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1021-2014-07-15T000000.html"
              test="string(@extension) = ('7')">(dtGBKOrganizationId): de waarde van extension MOET '7' zijn. Gevonden: "<value-of select="@extension"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:id
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:id">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(COCT_MT150000): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.1.11.1 RoleCodeNL - zorgaanbiedertype (organisaties) (DYNAMISCH)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:telecom
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:telecom">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:name
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:name">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:addr
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:addr">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="count(hl7:city[not(@nullFlavor)]) &gt;= 1">(COCT_MT150000): element hl7:city[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="count(hl7:city[not(@nullFlavor)]) &lt;= 1">(COCT_MT150000): element hl7:city[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:addr/hl7:city[not(@nullFlavor)]
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:Organization/hl7:addr/hl7:city[not(@nullFlavor)]">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.514
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:templateId
Item: (COCT_MT090100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:authorOrPerformer[@typeCode][hl7:participant]/hl7:participant[not(@nullFlavor)]/hl7:AssignedPerson[hl7:Organization]/hl7:templateId">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT090100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.503
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]
Item: (ControlActOverseerPersonQuery)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]"
         id="d1526977e60-false-d1527010e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.503-2012-08-01T000000.html"
              test="string(@typeCode) = ('RESP')">(ControlActOverseerPersonQuery): de waarde van typeCode MOET 'RESP' zijn. Gevonden: "<value-of select="@typeCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.503-2012-08-01T000000.html"
              test="count(hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]) &gt;= 1">(ControlActOverseerPersonQuery): element hl7:assignedEntity[not(@nullFlavor)][hl7:Organization] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.503-2012-08-01T000000.html"
              test="count(hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]) &lt;= 1">(ControlActOverseerPersonQuery): element hl7:assignedEntity[not(@nullFlavor)][hl7:Organization] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.503
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:time
Item: (ControlActOverseerPersonQuery)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:time"
         id="d1526977e67-false-d1527069e0">
      <extends rule="IVL_TS"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.503-2012-08-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'IVL_TS')">(ControlActOverseerPersonQuery): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:IVL_TS" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.503
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]
Item: (ControlActOverseerPersonQuery)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]"
         id="d1526977e74-false-d1527107e0">
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.3'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3'] | hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1'] | hl7:id[@root = '2.16.840.1.113883.2.4.6.1'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.503-2012-08-01T000000.html"
              test="$elmcount &gt;= 1">(ControlActOverseerPersonQuery): keuze (hl7:id[@root = '2.16.528.1.1007.3.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.3']  of  hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3']  of  hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1']  of  hl7:id[@root = '2.16.840.1.113883.2.4.6.1']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.503-2012-08-01T000000.html"
              test="count(hl7:id[@root = '2.16.840.1.113883.2.4.6.1']) &lt;= 1">(ControlActOverseerPersonQuery): element hl7:id[@root = '2.16.840.1.113883.2.4.6.1'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.503-2012-08-01T000000.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(ControlActOverseerPersonQuery): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.503-2012-08-01T000000.html"
              test="count(hl7:telecom) &lt;= 1">(ControlActOverseerPersonQuery): element hl7:telecom komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.503-2012-08-01T000000.html"
              test="count(hl7:assignedPrincipalChoiceList[hl7:assignedPerson]) &lt;= 1">(ControlActOverseerPersonQuery): element hl7:assignedPrincipalChoiceList[hl7:assignedPerson] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.503-2012-08-01T000000.html"
              test="count(hl7:Organization[not(@nullFlavor)]) &gt;= 1">(ControlActOverseerPersonQuery): element hl7:Organization[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.503-2012-08-01T000000.html"
              test="count(hl7:Organization[not(@nullFlavor)]) &lt;= 1">(ControlActOverseerPersonQuery): element hl7:Organization[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.514
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]
Item: (COCT_MT090100)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1009
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:id[@root = '2.16.528.1.1007.3.1']
Item: (dtUZIpersonen)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:id[@root = '2.16.528.1.1007.3.1']"
         id="d1527221e8-false-d1527229e0">
      <extends rule="II.NL.UZI"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1009-2018-11-01T150349.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtUZIpersonen): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1009-2018-11-01T150349.html"
              test="@extension">(dtUZIpersonen): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1009-2018-11-01T150349.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtUZIpersonen): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1009-2018-11-01T150349.html"
              test="string(@root) = ('2.16.528.1.1007.3.1')">(dtUZIpersonen): de waarde van root MOET '2.16.528.1.1007.3.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1012
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']
Item: (dtBSNId)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']"
         id="d1527252e7-false-d1527260e0">
      <extends rule="II.NL.BSN"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1012-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtBSNId): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1012-2014-07-15T000000.html"
              test="@extension">(dtBSNId): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1012-2014-07-15T000000.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtBSNId): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1012-2014-07-15T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.3')">(dtBSNId): de waarde van root MOET '2.16.840.1.113883.2.4.6.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1012-2014-07-15T000000.html"
              test="string-length(@extension) = 9">(dtBSNId): Het BSN dient altijd 9 cijfers te bevatten. Het BSN kan ook voorloopnullen bevatten, oftewel beginnen met een nul.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1015
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3']
Item: (dtBatchInzageAuteur)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:id[@root = '2.16.840.1.113883.2.4.3.11.7.3']"
         id="d1527283e8-false-d1527291e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1015-2018-11-01T144621.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtBatchInzageAuteur): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1015-2018-11-01T144621.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.3.11.7.3')">(dtBatchInzageAuteur): de waarde van root MOET '2.16.840.1.113883.2.4.3.11.7.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1015-2018-11-01T144621.html"
              test="@extension">(dtBatchInzageAuteur): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1015-2018-11-01T144621.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtBatchInzageAuteur): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1016
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1']
Item: (dtVZVZKlantenloketPKIO)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:id[@root = '2.16.528.1.1003.1.3.5.4.1']"
         id="d1527314e8-false-d1527322e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1016-2018-11-01T144037.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtVZVZKlantenloketPKIO): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1016-2018-11-01T144037.html"
              test="string(@root) = ('2.16.528.1.1003.1.3.5.4.1')">(dtVZVZKlantenloketPKIO): de waarde van root MOET '2.16.528.1.1003.1.3.5.4.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1016-2018-11-01T144037.html"
              test="@extension">(dtVZVZKlantenloketPKIO): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1016-2018-11-01T144037.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtVZVZKlantenloketPKIO): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1017
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']
Item: (dtAGB)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']"
         id="d1527345e8-false-d1527353e0">
      <extends rule="II.NL.AGB"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1017-2018-11-01T144449.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtAGB): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1017-2018-11-01T144449.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.1')">(dtAGB): de waarde van root MOET '2.16.840.1.113883.2.4.6.1' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1017-2018-11-01T144449.html"
              test="@extension">(dtAGB): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1017-2018-11-01T144449.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtAGB): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.514
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (COCT_MT090100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]"
         id="d1527216e38-false-d1527388e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(COCT_MT090100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]]) or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.4-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]]) or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.102.11.5-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(COCT_MT090100): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.1.11.2 RoleCodeNL - zorgverlenertype (personen) (DYNAMISCH) of 2.16.840.1.113883.2.4.3.11.60.102.11.4 RoleCodeNL - toegang patiënt (DYNAMISCH) of 2.16.840.1.113883.2.4.3.11.60.102.11.5 RoleCodeNL - wettelijke vertegenwoording (DYNAMISCH)'.</assert>
      <report fpi="CD-DEPR-BSP"
              role="warning"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.2-DYNAMIC.xml')//valueSet[1]/conceptList/concept[@type='D'][@code = $theCode][@codeSystem = $theCodeSystem])">(COCT_MT090100): element hl7:code is gecodeerd met bindingssterkte 'required' en bevat een code die verouderd is.</report>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="not(@code='00.000' and @codeSystem='2.16.840.1.113883.2.4.15.111')">(COCT_MT090100): Control Act: <name path=".."/>/<name/> moet een UZI-rolcode 00.000 is niet toegestaan</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.514
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:telecom
Item: (COCT_MT090100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:telecom"
         id="d1527216e57-false-d1527429e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(COCT_MT090100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.514
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]
Item: (COCT_MT090100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]"
         id="d1527216e63-false-d1527442e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="count(hl7:assignedPerson[not(@nullFlavor)]) &gt;= 1">(COCT_MT090100): element hl7:assignedPerson[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="count(hl7:assignedPerson[not(@nullFlavor)]) &lt;= 1">(COCT_MT090100): element hl7:assignedPerson[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.514
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]
Item: (COCT_MT090100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]"
         id="d1527216e68-false-d1527466e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &gt;= 1">(COCT_MT090100): element hl7:name[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="count(hl7:name[not(@nullFlavor)]) &lt;= 1">(COCT_MT090100): element hl7:name[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.514
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]
Item: (COCT_MT090100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:assignedPrincipalChoiceList[hl7:assignedPerson]/hl7:assignedPerson[not(@nullFlavor)]/hl7:name[not(@nullFlavor)]"
         id="d1527216e73-false-d1527490e0">
      <extends rule="PN.NL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'PN')">(COCT_MT090100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:PN" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization"
         id="d1527497e6-false-d1527513e0">
      <let name="elmcount"
           value="count(hl7:id[@root = '2.16.528.1.1007.3.3'] | hl7:id[@root = '2.16.528.1.1007'][@extension = '4'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25'] | hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7'])"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="$elmcount &gt;= 1">(COCT_MT150000): keuze (hl7:id[@root = '2.16.528.1.1007.3.3']  of  hl7:id[@root = '2.16.528.1.1007'][@extension = '4']  of  hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25']  of  hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7']) bevat te weinig elementen [min 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="$elmcount &lt;= 1">(COCT_MT150000): keuze (hl7:id[@root = '2.16.528.1.1007.3.3']  of  hl7:id[@root = '2.16.528.1.1007'][@extension = '4']  of  hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25']  of  hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7']) bevat te veel elementen [max 1x]</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="count(hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(COCT_MT150000): element hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="count(hl7:addr) &lt;= 1">(COCT_MT150000): element hl7:addr komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1011
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.528.1.1007.3.3']
Item: (dtURAorganization)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.528.1.1007.3.3']"
         id="d1527576e8-false-d1527584e0">
      <extends rule="II.NL.URA"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1011-2018-11-01T150615.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtURAorganization): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1011-2018-11-01T150615.html"
              test="string(@root) = ('2.16.528.1.1007.3.3')">(dtURAorganization): de waarde van root MOET '2.16.528.1.1007.3.3' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1011-2018-11-01T150615.html"
              test="@extension">(dtURAorganization): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1011-2018-11-01T150615.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtURAorganization): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1019
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.528.1.1007'][@extension = '4']
Item: (dtSBV-ZOrganizationId)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.528.1.1007'][@extension = '4']"
         id="d1527607e4-false-d1527615e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1019-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtSBV-ZOrganizationId): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1019-2014-07-15T000000.html"
              test="string(@root) = ('2.16.528.1.1007')">(dtSBV-ZOrganizationId): de waarde van root MOET '2.16.528.1.1007' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1019-2014-07-15T000000.html"
              test="string(@extension) = ('4')">(dtSBV-ZOrganizationId): de waarde van extension MOET '4' zijn. Gevonden: "<value-of select="@extension"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1020
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25']
Item: (dtGBO-GBP)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.840.1.113883.2.4.3.11.25']"
         id="d1527634e8-false-d1527642e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1020-2018-11-01T150146.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtGBO-GBP): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1020-2018-11-01T150146.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.3.11.25')">(dtGBO-GBP): de waarde van root MOET '2.16.840.1.113883.2.4.3.11.25' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1020-2018-11-01T150146.html"
              test="@extension">(dtGBO-GBP): attribute @extension MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1020-2018-11-01T150146.html"
              test="not(@extension) or string-length(@extension)&gt;0">(dtGBO-GBP): attribuut @extension MOET datatype 'st' hebben  - '<value-of select="@extension"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1021
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7']
Item: (dtGBKOrganizationId)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:id[@root = '2.16.840.1.113883.2.4.3.11'][@extension = '7']"
         id="d1527665e4-false-d1527673e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1021-2014-07-15T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(dtGBKOrganizationId): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1021-2014-07-15T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.3.11')">(dtGBKOrganizationId): de waarde van root MOET '2.16.840.1.113883.2.4.3.11' zijn. Gevonden: "<value-of select="@root"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1021-2014-07-15T000000.html"
              test="string(@extension) = ('7')">(dtGBKOrganizationId): de waarde van extension MOET '7' zijn. Gevonden: "<value-of select="@extension"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:id
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:id"
         id="d1527497e28-false-d1527698e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]"
         id="d1527497e34-false-d1527713e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.1.11.1-DYNAMIC.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(COCT_MT150000): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.1.11.1 RoleCodeNL - zorgaanbiedertype (organisaties) (DYNAMISCH)'.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:telecom
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:telecom"
         id="d1527497e43-false-d1527737e0">
      <extends rule="TEL"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'TEL')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:TEL" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:name
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:name"
         id="d1527497e49-false-d1527750e0">
      <extends rule="ON"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ON')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:ON" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:addr
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:addr"
         id="d1527497e57-false-d1527763e0">
      <extends rule="AD"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'AD')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:AD" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="count(hl7:city[not(@nullFlavor)]) &gt;= 1">(COCT_MT150000): element hl7:city[not(@nullFlavor)] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="count(hl7:city[not(@nullFlavor)]) &lt;= 1">(COCT_MT150000): element hl7:city[not(@nullFlavor)] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.1023
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:addr/hl7:city[not(@nullFlavor)]
Item: (COCT_MT150000)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:Organization/hl7:addr/hl7:city[not(@nullFlavor)]"
         id="d1527497e62-false-d1527791e0">
      <extends rule="SC"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.1023-2017-05-30T103308.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'SC')">(COCT_MT150000): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:SC" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.3.11.60.102.10.514
Context: //hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:templateId
Item: (COCT_MT090100)
-->
   <rule fpi="RULC-1"
         context="//hl7:REPC_IN002170NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[hl7:queryByParameter[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.181']]]/hl7:overseer[@typeCode = 'RESP'][hl7:assignedEntity]/hl7:assignedEntity[not(@nullFlavor)][hl7:Organization]/hl7:templateId"
         id="d1527216e88-false-d1527804e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.3.11.60.102.10.514-2012-09-01T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(COCT_MT090100): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
   </rule>
</pattern>
