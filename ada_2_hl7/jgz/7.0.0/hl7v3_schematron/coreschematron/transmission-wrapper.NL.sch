<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="transmission-wrapper">
    <title>Transmission Wrapper Algemeen</title>
    
    <!-- Include datatype abstract schematrons -->
    <include href="../include/DTr1_AD.sch"/>
    <include href="../include/DTr1_AD.NL.sch"/>
    <include href="../include/DTr1_AD.DE.sch"/>
    <include href="../include/DTr1_AD.EPSOS.sch"/>
    <include href="../include/DTr1_ANY.sch"/>
    <include href="../include/DTr1_BIN.sch"/>
    <include href="../include/DTr1_ED.sch"/>
    <include href="../include/DTr1_ST.sch"/>
    <include href="../include/DTr1_SC.sch"/>
    <include href="../include/DTr1_ENXP.sch"/>
    <include href="../include/DTr1_ADXP.sch"/>
    <include href="../include/DTr1_thumbnail.sch"/>
    <include href="../include/DTr1_BL.sch"/>
    <include href="../include/DTr1_BN.sch"/>
    <include href="../include/DTr1_CD.sch"/>
    <include href="../include/DTr1_CE.sch"/>
    <include href="../include/DTr1_CV.sch"/>
    <include href="../include/DTr1_CO.sch"/>
    <include href="../include/DTr1_CO.EPSOS.sch"/>
    <include href="../include/DTr1_PQR.sch"/>
    <include href="../include/DTr1_CV.EPSOS.sch"/>
    <include href="../include/DTr1_EIVL.event.sch"/>
    <include href="../include/DTr1_CE.EPSOS.sch"/>
    <include href="../include/DTr1_CD.EPSOS.sch"/>
    <include href="../include/DTr1_CR.sch"/>
    <include href="../include/DTr1_CS.sch"/>
    <include href="../include/DTr1_CS.LANG.sch"/>
    <include href="../include/DTr1_EN.sch"/>
    <include href="../include/DTr1_ON.sch"/>
    <include href="../include/DTr1_PN.sch"/>
    <include href="../include/DTr1_TN.sch"/>
    <include href="../include/DTr1_II.sch"/>
    <include href="../include/DTr1_II.NL.BSN.sch"/>
    <include href="../include/DTr1_II.NL.URA.sch"/>
    <include href="../include/DTr1_II.NL.UZI.sch"/>
    <include href="../include/DTr1_II.NL.AGB.sch"/>
    <include href="../include/DTr1_II.AT.DVR.sch"/>
    <include href="../include/DTr1_II.AT.ATU.sch"/>
    <include href="../include/DTr1_II.AT.BLZ.sch"/>
    <include href="../include/DTr1_II.AT.KTONR.sch"/>
    <include href="../include/DTr1_II.EPSOS.sch"/>
    <include href="../include/DTr1_QTY.sch"/>
    <include href="../include/DTr1_INT.sch"/>
    <include href="../include/DTr1_IVXB_INT.sch"/>
    <include href="../include/DTr1_SXCM_INT.sch"/>
    <include href="../include/DTr1_IVL_INT.sch"/>
    <include href="../include/DTr1_INT.NONNEG.sch"/>
    <include href="../include/DTr1_INT.POS.sch"/>
    <include href="../include/DTr1_MO.sch"/>
    <include href="../include/DTr1_IVXB_MO.sch"/>
    <include href="../include/DTr1_SXCM_MO.sch"/>
    <include href="../include/DTr1_IVL_MO.sch"/>
    <include href="../include/DTr1_PQ.sch"/>
    <include href="../include/DTr1_IVXB_PQ.sch"/>
    <include href="../include/DTr1_SXCM_PQ.sch"/>
    <include href="../include/DTr1_IVL_PQ.sch"/>
    <include href="../include/DTr1_REAL.sch"/>
    <include href="../include/DTr1_IVXB_REAL.sch"/>
    <include href="../include/DTr1_SXCM_REAL.sch"/>
    <include href="../include/DTr1_IVL_REAL.sch"/>
    <include href="../include/DTr1_REAL.NONNEG.sch"/>
    <include href="../include/DTr1_REAL.POS.sch"/>
    <include href="../include/DTr1_TS.sch"/>
    <include href="../include/DTr1_IVXB_TS.sch"/>
    <include href="../include/DTr1_SXCM_TS.sch"/>
    <include href="../include/DTr1_IVL_TS.sch"/>
    <include href="../include/DTr1_IVL_TS.EPSOS.TZ.sch"/>
    <include href="../include/DTr1_IVL_TS.EPSOS.TZ.OPT.sch"/>
    <include href="../include/DTr1_PIVL_TS.sch"/>
    <include href="../include/DTr1_EIVL_TS.sch"/>
    <include href="../include/DTr1_SXPR_TS.sch"/>
    <include href="../include/DTr1_TS.DATE.sch"/>
    <include href="../include/DTr1_TS.DATE.FULL.sch"/>
    <include href="../include/DTr1_TS.DATE.MIN.sch"/>
    <include href="../include/DTr1_TS.DATETIME.MIN.sch"/>
    <include href="../include/DTr1_TS.EPSOS.TZ.sch"/>
    <include href="../include/DTr1_TS.EPSOS.TZ.OPT.sch"/>
    <include href="../include/DTr1_RTO_PQ_PQ.sch"/>
    <include href="../include/DTr1_RTO_QTY_QTY.sch"/>
    <include href="../include/DTr1_RTO.sch"/>
    <include href="../include/DTr1_SD.TEXT.sch"/>
    <include href="../include/DTr1_URL.sch"/>
    <include href="../include/DTr1_TEL.sch"/>
    <include href="../include/DTr1_TEL.AT.sch"/>
    <include href="../include/DTr1_TEL.EPSOS.sch"/>
    <include href="../include/DTr1_URL.NL.EXTENDED.sch"/>
    
    <let name="interactionVocabFile" value="'../vocab/2.16.840.1.113883.1.6.xml'"/>
    
    <rule context="$element">
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <let name="interactionId" value="hl7:interactionId[@root='2.16.840.1.113883.1.6']/@extension"/>
        <let name="interactionName" value="if (doc-available($interactionVocabFile)) then (document($interactionVocabFile)/*/hl7:code[@code=$interactionId]/@displayName) else ()"/>
        <let name="allowBsn" value="if (doc-available($interactionVocabFile)) then (document($interactionVocabFile)/*/hl7:code[@code=$interactionId]/hl7:qualifier[@name='AttentionLineMetBsn']/@value='true') else (false())"/>
        <let name="allowContextCode" value="if (doc-available($interactionVocabFile)) then (document($interactionVocabFile)/*/hl7:code[@code=$interactionId]/hl7:qualifier[@name='AttentionLineMetContextCode']/@value='true') else (false())"/>
        <let name="senderGbpOrGbk" value="exists(hl7:ControlActProcess/hl7:authorOrPerformer/hl7:participant/hl7:AssignedPerson/hl7:code[@codeSystem=('2.16.840.1.113883.2.4.3.11.8','2.16.840.1.113883.2.4.3.11.6')])"/>
        
        <assert role="error" test="not($allowBsn) or hl7:attentionLine[hl7:keyWordText=('Patient.id','FictiefPatientnummer')]"
            ><value-of select="$leadingMarker"/>: er moet in deze interactie exact één AttentionLine met BSN zitten - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
        <assert role="error" test="not($allowContextCode) or hl7:attentionLine[hl7:keyWordText=('ContextCode')]"
            ><value-of select="$leadingMarker"/>: er moet in deze interactie exact één AttentionLine met de ContextCode zitten - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
        
        <assert role="error" test="count(hl7:attentionLine[hl7:keyWordText=('Patient.id','FictiefPatientnummer')])&lt;=1"
            ><value-of select="$leadingMarker"/>: er mag maximaal één AttentionLine met BSN zijn - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
        <assert role="error" test="count(hl7:attentionLine[hl7:keyWordText=('ContextCode')])&lt;=1"
            ><value-of select="$leadingMarker"/>: er mag maximaal één AttentionLine met de ContextCode zijn - <value-of select="$interactionId"/> (<value-of select="$interactionName"/>)</assert>
        
        <assert role="warning" test="not(hl7:attentionLine/hl7:keywordText[@code=('FICID','PATID')][@codeSystem='2.16.840.1.113883.2.4.15.1']) or $allowBsn or $senderGbpOrGbk"
            ><value-of select="$leadingMarker"/>: interaction-id <value-of select="$interactionId"/> (<value-of select="$interactionName"/>) is niet geconfigureerd voor gebruik van het element <value-of select="local-name()"/> voor BSN in <value-of select="$interactionVocabFile"/> en afzender is niet GBK of GBP</assert>
        <assert role="warning" test="not(hl7:attentionLine/hl7:keywordText[@code='CONTEXT'][@codeSystem='2.16.840.1.113883.2.4.15.1']) or $allowContextCode or $senderGbpOrGbk"
            ><value-of select="$leadingMarker"/>: interaction-id <value-of select="$interactionId"/> (<value-of select="$interactionName"/>) is niet geconfigureerd voor gebruik van het element <value-of select="local-name()"/> voor ContextCode in <value-of select="$interactionVocabFile"/> en afzender is niet GBK of GBP</assert>
    </rule>
    
    <!-- 
        Message id equals every id that is adjacent to hl7:creationTime. 
        This way it works for batches and every message contained, even SOAP wrapped.
    -->
    <rule context="$element/hl7:id">
        <extends rule="II"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="@root and @extension"
            ><value-of select="$leadingMarker"/>: id element mist root of extension</assert>
        <!--report role="warning"
            test="not(substring(@root,1,26)='2.16.840.1.113883.2.4.6.6.' or substring(@root,1,20)='2.16.528.1.1007.3.3.' or substring(@root,1,29)='2.16.840.1.113883.2.4.3.11.7.')"
            ><value-of select="$leadingMarker"/>: @root moet bij voorkeur zijn gebaseerd op URA, AORTA applicatie-id of Klantenloket id</report-->
    </rule>
    <!-- creationTime -->
    <rule context="$element/hl7:creationTime">
        <extends rule="TS"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="not(@xsi:type) or @xsi:type='TS' or ends-with(@xsi:type,':TS')"
            ><value-of select="$leadingMarker"/>: creationTime moet datatype TS hebben. Gevonden '<value-of select="@xsi:type"/>'</assert>
        <assert role="error" test="string-length(@value)&gt;13"
            ><value-of select="$leadingMarker"/>: creationTime moet minimaal op de seconde nauwkeurig zijn</assert>
    </rule>
    <!-- versionCode -->
    <rule context="$element/hl7:versionCode">
        <extends rule="CS"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="@code='NICTIZEd2005-Okt'"
            ><value-of select="$leadingMarker"/>: versionCode '<value-of select="@code"/>' moet 'NICTIZEd2005-Okt' zijn</assert>
    </rule>
    <!-- interactionId -->
    <rule context="$element/hl7:interactionId">
        <extends rule="II"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <let name="interactionId" value="self::node()[@root='2.16.840.1.113883.1.6']/@extension"/>
        <let name="interactionVocabFile" value="'../vocab/2.16.840.1.113883.1.6.xml'"/>
        <let name="interactionName" value="if (doc-available($interactionVocabFile)) then (document($interactionVocabFile)/*/hl7:code[@code=$interactionId]/@displayName) else ()"/>
        
        <assert role="error" test="@root='2.16.840.1.113883.1.6'"
            ><value-of select="$leadingMarker"/>: @root moet '2.16.840.1.113883.1.6' zijn</assert>
        <assert role="error" test="not(@root='2.16.840.1.113883.1.6') or local-name(..)=@extension"
            ><value-of select="$leadingMarker"/>: @extension moet overeenkomen met het startelement van het bericht</assert>
        <assert role="error" test="not(contains(@extension,':'))"
            ><value-of select="$leadingMarker"/>: @extension mag geen namespace prefix bevatten</assert>
        <assert role="error" test="not(doc-available($interactionVocabFile)) or 
            not(document($interactionVocabFile)/*/hl7:code[@code=$interactionId]/hl7:qualifier[@name='Actief']/@value='false')"
            ><value-of select="$leadingMarker"/>: interaction-id <value-of select="$interactionId"/> (<value-of select="$interactionName"/>) is niet (meer) Actief in <value-of select="$interactionVocabFile"/></assert>
    </rule>
    <!-- profileId -->
    <rule context="$element/hl7:profileId">
        <extends rule="II"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="@root='2.16.840.1.113883.2.4.3.11.1' and (@extension='810')"
            ><value-of select="$leadingMarker"/>: profileId '<value-of select="@extension"/>' moet gelijk zijn aan 810. </assert>
        <assert role="error" test="not(following-sibling::hl7:profileId)"
            ><value-of select="$leadingMarker"/>: er mag maar één profileId worden gebruikt</assert>
    </rule>
    
    <rule context="$element[self::hl7:MCCI_IN200101]/hl7:referenceControlId">
        <extends rule="II"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="false()"
            ><value-of select="$leadingMarker"/>: <value-of select="local-name(..)"/>/<value-of select="local-name()"/> mag niet worden gebruikt</assert>
    </rule>
    <rule context="$element[self::hl7:MCCI_IN200101]/hl7:name">
        <extends rule="SC"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="false()"
            ><value-of select="$leadingMarker"/>: <value-of select="local-name(..)"/>/<value-of select="local-name()"/> mag niet worden gebruikt</assert>
    </rule>
    <rule context="$element[self::hl7:MCCI_IN200101]/hl7:batchComment">
        <extends rule="ST"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="false()"
            ><value-of select="$leadingMarker"/>: <value-of select="local-name(..)"/>/<value-of select="local-name()"/> mag niet worden gebruikt</assert>
    </rule>
    <rule context="$element[self::hl7:MCCI_IN200101]/hl7:transmissionQuantity">
        <extends rule="INT"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <let name="messageCount" value="count(../hl7:sender/following-sibling::*)"/>
        <assert role="error" test="number(@value) = $messageCount"
            ><value-of select="$leadingMarker"/>: <value-of select="local-name(..)"/>/<value-of select="local-name()"/> '<value-of select="@value"/>' moet 
            overeenkomen met het aantal berichten '<value-of select="$messageCount"/>'</assert>
    </rule>
    <rule context="$element[self::hl7:MCCI_IN200101]/hl7:receiver/hl7:device/hl7:id">
        <extends rule="II"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="@root='2.16.840.1.113883.2.4.6.6' and not(@extension='1')"
            ><value-of select="$leadingMarker"/>: De ontvanger van deze interactie moet een AORTA applicatie zijn, en kan niet de ZIM zijn</assert>
    </rule>
    <rule context="$element[self::hl7:MCCI_IN200101]/hl7:sender/hl7:device/hl7:id">
        <extends rule="II"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="@root='2.16.840.1.113883.2.4.6.6' and @extension='1'"
            ><value-of select="$leadingMarker"/>: De zender moet de ZIM zijn (applicatie-id = '1')</assert>
    </rule>
    
    <!-- acknowledgement algemeen, adjacent to hl7:creationTime -->
    <rule context="$element/hl7:acknowledgement">
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="local-name(..)='MCCI_IN000002' or @typeCode='AA' or @typeCode='AE' or @typeCode='AR'"
            ><value-of select="$leadingMarker"/>: applicatieantwoorden moeten acknowledgement/@typeCode AA, AE of AR hebben</assert>
        <!-- acknowledgement MCCI_IN000002 -->
        <assert role="warning" test="not(local-name(..)='MCCI_IN000002') or @typeCode='CA' or @typeCode='CE' or @typeCode='CR'"
            ><value-of select="$leadingMarker"/>: ontvangstbevestigingen moeten acknowledgement/@typeCode CA, CE of CR hebben. In slechts sommige gevallen worden 
            toch inhoudelijke antwoorden toegestaan (@typeCode is 'AA', 'AE' or 'AR').</assert>
        <assert role="error" test="hl7:targetMessage/hl7:id[@root and @extension] or hl7:targetTransmission/hl7:id[@root and @extension]"
            ><value-of select="$leadingMarker"/>: in antwoordinteracties moet de interactie waarop wordt geantwoord, worden geïdentificeerd in het element targetTransmission/id</assert>
        <assert role="warning" test="@typeCode='AA' or @typeCode='CA' or hl7:acknowledgementDetail or ../hl7:ControlActProcess/hl7:reason or ../hl7:ControlActProcess/hl7:reasonOf"
            ><value-of select="$leadingMarker"/>: negatieve antwoordberichten moeten ook een reden hebben waarom</assert>
    </rule>
    <!-- acknowledgementDetail/@typeCode -->
    <rule context="$element/hl7:acknowledgement/hl7:acknowledgementDetail">
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="not(@typeCode) or @typeCode='E'"
            ><value-of select="$leadingMarker"/>: acknowledgementDetail/@typeCode moet indien aanwezig E (Error) zijn. W (Warning) of I (Information) zijn niet toegestaan</assert>
        <assert role="error" test="hl7:code"
            ><value-of select="$leadingMarker"/>: acknowledgementDetail/code moet een waarde hebben.</assert>
        <assert role="error" test="hl7:code[@code and @displayName] or hl7:text"
            ><value-of select="$leadingMarker"/>: er moet een toelichting op de fout/waarschuwing zijn in hl7:code/@displayName of text</assert>
    </rule>
    
    <rule context="$element/hl7:acknowledgement/hl7:acknowledgementDetail/hl7:code">
        <extends rule="CE"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="not(@nulFlavor)"
            ><value-of select="$leadingMarker"/>: code moet een waarde hebben.</assert>
        <assert role="error" test="not(hl7:translation)"
            ><value-of select="$leadingMarker"/>: code mag geen translation bevatten.</assert>
        <report role="warning" test="not(@codeSystem='2.16.840.1.113883.5.1100' or @codeSystem='2.16.840.1.113883.2.4.6.6.1.1000' or @codeSystem='2.16.840.1.113883.5.4') and not(@displayName)"
            ><value-of select="$leadingMarker"/>: als de code niet uit een van de standaardcodesystemen '2.16.840.1.113883.5.1100', '2.16.840.1.113883.2.4.6.6.1.1000', of '2.16.840.1.113883.5.4' komt is het @displayName attribuut verplicht</report>
    </rule>
    
    <rule context="$element/hl7:receiver">
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="not(@typeCode) or @typeCode='RCV'"
            ><value-of select="$leadingMarker"/>: receiver/@typeCode moet 'RCV' zijn indien aanwezig</assert>
        <assert role="error" test="count(../hl7:receiver)=1"
            ><value-of select="$leadingMarker"/>: receiver mag slechts éénmaal voorkomen</assert>
    </rule>
    
    <rule context="$element/hl7:respondTo">
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="not(@typeCode) or @typeCode='RSP'"
            ><value-of select="$leadingMarker"/>: respondTo/@typeCode moet 'RSP' zijn indien aanwezig</assert>
        <assert role="error" test="count(../hl7:respondTo)=1"
            ><value-of select="$leadingMarker"/>: respondTo mag slechts éénmaal voorkomen</assert>
        <assert role="error" test="count(hl7:entityRsp)=1"
            ><value-of select="$leadingMarker"/>: respondTo/entityRsp mag slechts éénmaal voorkomen</assert>
        
        <let name="entityRspRoot" value="hl7:entityRsp/hl7:id/@root"/>
        <assert role="warning" test="not(hl7:entityRsp/hl7:id/@extension=../hl7:sender/hl7:device/hl7:id[@root=$entityRspRoot]/@extension)"
            ><value-of select="$leadingMarker"/>: waarschuwing: het antwoord moet worden verstuurd aan dezelfde applicatie als de zendende applicatie. In dit geval is respondTo redundant.</assert>
    </rule>
    
    <rule context="$element/hl7:sender">
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="not(@typeCode) or @typeCode='SND'"
            ><value-of select="$leadingMarker"/>: sender/@typeCode moet 'SND' zijn indien aanwezig</assert>
    </rule>
    
    <rule context="$element/hl7:attentionLine">
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="hl7:keyWordText"
            ><value-of select="$leadingMarker"/>: attentionLine/keyWordText is verplicht</assert>
        <assert role="error" test="hl7:value"
            ><value-of select="$leadingMarker"/>: attentionLine/value is verplicht</assert>
    </rule>
    <rule context="$element/hl7:attentionLine/hl7:keyWordText">
        <extends rule="SC"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <let name="code" value="@code"/>
        <let name="codeSystem" value="@codeSystem"/>
        <let name="text" value=".[1]"/>
        <let name="vocabFile" value="concat('../vocab/',$codeSystem,'.xml')"/>
        <assert role="error" test="$codeSystem='2.16.840.1.113883.2.4.15.1' and document($vocabFile)/*/hl7:code[@code=$code][@codeSystem=$codeSystem]"
            ><value-of select="$leadingMarker"/>: attentionLine/keyWordText moet een geldige code uit codesysteem '2.16.840.1.113883.2.4.15.1' bevatten</assert>
        <assert role="error" test="not(@code='PATID') or $text='Patient.id'"
            ><value-of select="$leadingMarker"/>: attentionLine/keyWordText moet de waarde 'Patient.id' bevatten als @code='PATID'</assert>
        <assert role="error" test="not(@code='FICID') or $text='FictiefPatientnummer'"
            ><value-of select="$leadingMarker"/>: attentionLine/keyWordText moet de waarde 'FictiefPatientnummer' bevatten als @code='FICID'</assert>
        <assert role="error" test="not(@code='CONTEXT') or $text='ContextCode'"
            ><value-of select="$leadingMarker"/>: attentionLine/keyWordText moet de waarde 'ContextCode' bevatten als @code='CONTEXT'</assert>
    </rule>
    <rule context="$element/hl7:attentionLine[hl7:keyWordText[@code=('PATID','FICID')][@codeSystem='2.16.840.1.113883.2.4.15.1']]/hl7:value">
        <extends rule="II"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="@root='2.16.840.1.113883.2.4.6.3'"
            ><value-of select="$leadingMarker"/>: attentionLine/value moet een burgerservicenummer bevatten met OID '2.16.840.1.113883.2.4.6.3'</assert>
    </rule>
    <rule context="$element/hl7:attentionLine[hl7:keyWordText[@code=('CONTEXT')][@codeSystem='2.16.840.1.113883.2.4.15.1']]/hl7:value">
        <extends rule="CV"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="@codeSystem='2.16.840.1.113883.2.4.3.111.15.1'"
            ><value-of select="$leadingMarker"/>: attentionLine/value moet een code bevatten uit codesysteem '2.16.840.1.113883.2.4.3.111.15.1'</assert>
    </rule>
    <!-- receiver or sender device or respondTo id -->
    <!-- respondTo - voor het eerst toegepast in Sgl (Signaleringen) -->
    <rule context="$element/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:id | hl7:respondTo/hl7:entityRsp/hl7:id">
        <extends rule="II"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="@root='2.16.840.1.113883.2.4.6.6' and @extension"
            ><value-of select="$leadingMarker"/>: <value-of select="local-name(../..)"/>/<value-of select="local-name(..)"/>/id/@root moet 2.16.840.1.113883.2.4.6.6 zijn</assert>
    </rule>

    <!-- receiver or sender device -->
    <rule context="$element/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:desc">
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="warning" test="not(.)"
            ><value-of select="$leadingMarker"/>: <value-of select="local-name(..)"/>/device/descr is niet gespecificeerd in de Nederlandse Implementatiehandleiding Wrappers.</assert>
    </rule>
    <rule context="$element/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:existenceTime">
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="warning" test="not(.)"
            ><value-of select="$leadingMarker"/>: <value-of select="local-name(..)"/>/device/existenceTime is niet gespecificeerd in de Nederlandse Implementatiehandleiding Wrappers.</assert>
    </rule>
    <rule context="$element/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:manufacturerModelName">
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="warning" test="not(.)"
            ><value-of select="$leadingMarker"/>: <value-of select="local-name(..)"/>/device/manufacturerModelName is niet gespecificeerd in de Nederlandse Implementatiehandleiding Wrappers.</assert>
    </rule>
    <rule context="$element/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:agencyFor">
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="not(@classCode) or @classCode='AGNT'"
            ><value-of select="$leadingMarker"/>: <value-of select="local-name(../..)"/>/<value-of select="local-name(..)"/>/agencyFor/@classCode moet, indien aanwezig de waarde "AGNT" bevatten</assert>
    </rule>
    <rule context="$element/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:agencyFor/hl7:representedOrganization">
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="not(@classCode) or @classCode='ORG'"
            ><value-of select="$leadingMarker"/>: <value-of select="local-name(../../..)"/>/<value-of select="local-name(../..)"/>/agencyFor/representedOrganization/@classCode moet, indien aanwezig de waarde "ORG" bevatten</assert>
        <assert role="error" test="not(@determinerCode) or @determinerCode='INSTANCE'"
            ><value-of select="$leadingMarker"/>: <value-of select="local-name(../../..)"/>/<value-of select="local-name(../..)"/>/agencyFor/representedOrganization/@determinerCode moet, indien aanwezig de waarde "INSTANCE" bevatten</assert>
        <assert role="error" test="count(hl7:id)=1"
            ><value-of select="$leadingMarker"/>: <value-of select="local-name(../../..)"/>/<value-of select="local-name(../..)"/>/agencyFor/representedOrganization/id mag maar één maal voorkomen</assert>
    </rule>
    <!-- May be RIVM nowadays...unknown how to check, not important enough to pursue -->
    <!--rule context="$element/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:agencyFor/hl7:representedOrganization/hl7:id">
        <extends rule="II"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="(@root='2.16.528.1.1007.3.3' and @extension) or (@root='2.16.840.1.113883.2.4.3.11' and @extension='7')"
            ><value-of select="$leadingMarker"/>: <value-of select="local-name(../../../..)"/>/<value-of select="local-name(../../..)"/>/agencyFor/representedOrganization/id moet een UZI-registerabonneenummer zijn of het Klantenloket</assert>
    </rule-->
    <rule context="$element/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:agencyFor/hl7:representedOrganization/hl7:name">
        <extends rule="ON"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
    </rule>
    <rule context="$element/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:agencyFor/hl7:representedOrganization/hl7:telecom">
        <extends rule="TEL"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
    </rule>
    <rule context="$element/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:location">
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="warning" test="not(.)"
            ><value-of select="$leadingMarker"/>: <value-of select="local-name(..)"/>/device/location is niet gespecificeerd in de Nederlandse Implementatiehandleiding Wrappers.</assert>
    </rule>
    
    <title>Transmission Wrapper, geen batch MCCI_IN200101</title>
    <rule context="$element/hl7:processingCode">
        <extends rule="CS"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="warning" test="@code='P' or document(document-uri(/))/processing-instruction('nictiz')"
            ><value-of select="$leadingMarker"/>: processingCode moet in productie altijd gelijk zijn aan P (productie). D (debug) en T (training) zijn dan niet toegestaan</assert>

        <assert role="error" test="@code='P' or @code='T' or @code='D'"
            ><value-of select="$leadingMarker"/>: processingCode moet de waarde P (productie). D (debug) of T (training) bevatten</assert>
    </rule>
    <rule context="$element/hl7:processingModeCode">
        <extends rule="CS"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="@code='T'"
            ><value-of select="$leadingMarker"/>: processingModeCode moet gelijk zijn aan T (Current processing). A (Archive), I (Initial load), en R (Restore from archive) zijn niet toegestaan</assert>
    </rule>
    
    <!-- checking the exact value for acceptAckCode is interaction specific - please handle in main schematron -->
    <rule context="$element/hl7:acceptAckCode">
        <extends rule="CS"/>
        <let name="leadingMarker" value="if (starts-with(local-name(.),'MCCI_IN200101')) then 'Batch' else 'Transmission'"/>
        <assert role="error" test="@code='NE' or @code='AL'"
            ><value-of select="$leadingMarker"/>: acceptAckCode moet gelijk zijn aan NE (never) of AL (always)</assert>
    </rule>
</pattern>
