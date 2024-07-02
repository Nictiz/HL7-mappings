<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>Schematronvalidatie van MCCI_IN200101 - Batch Response</title>
    <ns uri="urn:hl7-org:v3" prefix="hl7"/>
    <ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
    <include href="coreschematron/DTr1_XML.NL.sch"/>
    
    <pattern>
        <!-- Include datatype abstract schematrons -->
        <include href="include/DTr1_ANY.sch"/>
        <include href="include/DTr1_AD.sch"/>
        <include href="include/DTr1_AD.NL.sch"/>
        <include href="include/DTr1_AD.DE.sch"/>
        <include href="include/DTr1_AD.EPSOS.sch"/>
        <include href="include/DTr1_BIN.sch"/>
        <include href="include/DTr1_ED.sch"/>
        <include href="include/DTr1_ST.sch"/>
        <include href="include/DTr1_SC.sch"/>
        <include href="include/DTr1_ENXP.sch"/>
        <include href="include/DTr1_ADXP.sch"/>
        <include href="include/DTr1_thumbnail.sch"/>
        <include href="include/DTr1_BL.sch"/>
        <include href="include/DTr1_BN.sch"/>
        <include href="include/DTr1_CD.sch"/>
        <include href="include/DTr1_CE.sch"/>
        <include href="include/DTr1_CV.sch"/>
        <include href="include/DTr1_CO.sch"/>
        <include href="include/DTr1_CO.EPSOS.sch"/>
        <include href="include/DTr1_PQR.sch"/>
        <include href="include/DTr1_CV.EPSOS.sch"/>
        <include href="include/DTr1_EIVL.event.sch"/>
        <include href="include/DTr1_CE.EPSOS.sch"/>
        <include href="include/DTr1_CD.EPSOS.sch"/>
        <include href="include/DTr1_CR.sch"/>
        <include href="include/DTr1_CS.sch"/>
        <include href="include/DTr1_CS.LANG.sch"/>
        <include href="include/DTr1_EN.sch"/>
        <include href="include/DTr1_ON.sch"/>
        <include href="include/DTr1_PN.sch"/>
        <include href="include/DTr1_TN.sch"/>
        <include href="include/DTr1_II.sch"/>
        <include href="include/DTr1_II.NL.BSN.sch"/>
        <include href="include/DTr1_II.NL.URA.sch"/>
        <include href="include/DTr1_II.NL.UZI.sch"/>
        <include href="include/DTr1_II.NL.AGB.sch"/>
        <include href="include/DTr1_II.AT.DVR.sch"/>
        <include href="include/DTr1_II.AT.ATU.sch"/>
        <include href="include/DTr1_II.AT.BLZ.sch"/>
        <include href="include/DTr1_II.AT.KTONR.sch"/>
        <include href="include/DTr1_II.EPSOS.sch"/>
        <include href="include/DTr1_QTY.sch"/>
        <include href="include/DTr1_INT.sch"/>
        <include href="include/DTr1_IVXB_INT.sch"/>
        <include href="include/DTr1_SXCM_INT.sch"/>
        <include href="include/DTr1_IVL_INT.sch"/>
        <include href="include/DTr1_INT.NONNEG.sch"/>
        <include href="include/DTr1_INT.POS.sch"/>
        <include href="include/DTr1_MO.sch"/>
        <include href="include/DTr1_IVXB_MO.sch"/>
        <include href="include/DTr1_SXCM_MO.sch"/>
        <include href="include/DTr1_IVL_MO.sch"/>
        <include href="include/DTr1_PQ.sch"/>
        <include href="include/DTr1_IVXB_PQ.sch"/>
        <include href="include/DTr1_SXCM_PQ.sch"/>
        <include href="include/DTr1_IVL_PQ.sch"/>
        <include href="include/DTr1_REAL.sch"/>
        <include href="include/DTr1_IVXB_REAL.sch"/>
        <include href="include/DTr1_SXCM_REAL.sch"/>
        <include href="include/DTr1_IVL_REAL.sch"/>
        <include href="include/DTr1_REAL.NONNEG.sch"/>
        <include href="include/DTr1_REAL.POS.sch"/>
        <include href="include/DTr1_TS.sch"/>
        <include href="include/DTr1_IVXB_TS.sch"/>
        <include href="include/DTr1_SXCM_TS.sch"/>
        <include href="include/DTr1_IVL_TS.sch"/>
        <include href="include/DTr1_IVL_TS.EPSOS.TZ.sch"/>
        <include href="include/DTr1_IVL_TS.EPSOS.TZ.OPT.sch"/>
        <include href="include/DTr1_PIVL_TS.sch"/>
        <include href="include/DTr1_EIVL_TS.sch"/>
        <include href="include/DTr1_SXPR_TS.sch"/>
        <include href="include/DTr1_TS.DATE.sch"/>
        <include href="include/DTr1_TS.DATE.FULL.sch"/>
        <include href="include/DTr1_TS.DATE.MIN.sch"/>
        <include href="include/DTr1_TS.DATETIME.MIN.sch"/>
        <include href="include/DTr1_TS.EPSOS.TZ.sch"/>
        <include href="include/DTr1_TS.EPSOS.TZ.OPT.sch"/>
        <include href="include/DTr1_RTO_PQ_PQ.sch"/>
        <include href="include/DTr1_RTO_QTY_QTY.sch"/>
        <include href="include/DTr1_RTO.sch"/>
        <include href="include/DTr1_SD.TEXT.sch"/>
        <include href="include/DTr1_URL.sch"/>
        <include href="include/DTr1_TEL.sch"/>
        <include href="include/DTr1_TEL.AT.sch"/>
        <include href="include/DTr1_TEL.EPSOS.sch"/>
        <include href="include/DTr1_URL.NL.EXTENDED.sch"/>
    </pattern>
    
    <pattern>
        <rule context="hl7:MCCI_IN200101/hl7:id">
            <extends rule="II"/>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:creationTime">
            <extends rule="TS"/>
            <let name="datatypeName" value="substring-after(string(@xsi:type),':')"/>
            <assert role="error" test="not(@xsi:type) or string(@xsi:type)='TS' or substring-after(string(@xsi:type),':')='TS'"
                >Batch: creationTime moet datatype TS hebben. Gevonden '<value-of select="$datatypeName"/>'</assert>
            <assert role="error" test="string-length(@value)&gt;13"
                >Batch: creationTime moet minimaal op de seconde nauwkeurig zijn</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:versionCode">
            <extends rule="CS"/>
            <assert role="error" test="@code='NICTIZEd2005-Okt'"
                >Batch: versionCode '<value-of select="@code"/>' moet 'NICTIZEd2005-Okt' zijn</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:interactionId">
            <extends rule="II"/>
            <assert role="error" test="@root='2.16.840.1.113883.1.6' and @extension='MCCI_IN200101'"
                >Batch: @root moet '2.16.840.1.113883.1.6' zijn en @extension moet 'MCCI_IN200101' zijn</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:profileId">
            <extends rule="II"/>
            <assert role="error" test="@root='2.16.840.1.113883.2.4.3.11.1' and (@extension='810')"
                >Batch: profileId '<value-of select="@extension"/>' moet gelijk zijn aan 810. </assert>
            <assert role="error" test="not(following-sibling::hl7:profileId)"
                >Batch: er mag maar één profileId worden gebruikt</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:referenceControlId">
            <extends rule="II"/>
            <assert role="error" test="false()"
                >Batch: <value-of select="local-name(..)"/>/<value-of select="local-name()"/> mag niet worden gebruikt</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:name">
            <extends rule="SC"/>
            <assert role="error" test="false()"
                >Batch: <value-of select="local-name(..)"/>/<value-of select="local-name()"/> mag niet worden gebruikt</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:batchComment">
            <extends rule="ST"/>
            <assert role="error" test="false()"
                >Batch: <value-of select="local-name(..)"/>/<value-of select="local-name()"/> mag niet worden gebruikt</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:transmissionQuantity">
            <extends rule="INT"/>
            <let name="messageCount" value="count(../hl7:sender/following-sibling::*)"/>
            <assert role="error" test="number(@value) = $messageCount"
                >Batch: <value-of select="local-name(..)"/>/<value-of select="local-name()"/> '<value-of select="@value"/>' moet 
                overeenkomen met het aantal berichten '<value-of select="$messageCount"/>'</assert>
        </rule>
        <!-- acknowledgement algemeen, adjacent to hl7:creationTime -->
        <rule context="hl7:MCCI_IN200101/hl7:acknowledgement">
            <assert role="error" test="@typeCode='AA'"
                >Batch: @typeCode moet 'AA' zijn</assert>
            <assert role="error" test="hl7:targetMessage/hl7:id[@root and @extension] or hl7:targetTransmission/hl7:id[@root and @extension]"
                >Batch: in antwoordinteracties moet de interactie waarop wordt geantwoord, worden geïdentificeerd in het element targetTransmission/id</assert>
        </rule>
        <!-- acknowledgementDetail -->
        <rule context="hl7:MCCI_IN200101/hl7:acknowledgement/hl7:acknowledgementDetail">
            <assert role="error" test="false()"
                >Batch: <value-of select="local-name(..)"/>/<value-of select="local-name()"/> is niet van toepassing in een positieve bevestiging</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:receiver">
            <assert role="error" test="not(@typeCode) or @typeCode='RCV'"
                >Batch: receiver/@typeCode moet 'RCV' zijn indien aanwezig</assert>
            <assert role="error" test="count(../hl7:receiver)=1"
                >Batch: receiver mag slechts éénmaal voorkomen</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:receiver/hl7:device/hl7:id">
            <extends rule="II"/>
            <assert role="error" test="@root='2.16.840.1.113883.2.4.6.6' and not(@extension='1')"
                >De ontvanger van deze interactie moet een AORTA applicatie zijn, en kan niet de ZIM zijn</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:respondTo">
            <assert role="error" test="false()"
                >Batch: <value-of select="local-name(..)"/>/<value-of select="local-name()"/> mag niet worden gebruikt</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:sender">
            <assert role="error" test="not(@typeCode) or @typeCode='SND'"
                >Batch: sender/@typeCode moet 'SND' zijn indien aanwezig</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:sender/hl7:device/hl7:id">
            <extends rule="II"/>
            <assert role="error" test="@root='2.16.840.1.113883.2.4.6.6' and @extension='1'"
                >De zender van deze interactie moet de ZIM zijn</assert>
        </rule>
        
        <!-- receiver or sender device -->
        <rule context="hl7:MCCI_IN200101/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:desc">
            <assert role="error" test="not(.)"
                >Batch: <value-of select="local-name(..)"/>/device/descr mag niet gebruikt worden.</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:existenceTime">
            <assert role="error" test="not(.)"
                >Batch: <value-of select="local-name(..)"/>/device/existenceTime mag niet gebruikt worden.</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:manufacturerModelName">
            <assert role="warning" test="not(.)"
                >Batch: <value-of select="local-name(..)"/>/device/manufacturerModelName niet gebruiken.</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:agencyFor">
            <assert role="error" test="not(@classCode) or @classCode='AGNT'"
                >Batch: <value-of select="local-name(../..)"/>/<value-of select="local-name(..)"/>/agencyFor/@classCode moet, indien aanwezig de waarde "AGNT" bevatten</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:agencyFor/hl7:representedOrganization">
            <assert role="error" test="not(@classCode) or @classCode='ORG'"
                >Batch: <value-of select="local-name(../../..)"/>/<value-of select="local-name(../..)"/>/agencyFor/representedOrganization/@classCode moet, indien aanwezig de waarde "ORG" bevatten</assert>
            <assert role="error" test="not(@determinerCode) or @determinerCode='INSTANCE'"
                >Batch: <value-of select="local-name(../../..)"/>/<value-of select="local-name(../..)"/>/agencyFor/representedOrganization/@determinerCode moet, indien aanwezig de waarde "INSTANCE" bevatten</assert>
            <assert role="error" test="count(hl7:id)=1"
                >Batch: <value-of select="local-name(../../..)"/>/<value-of select="local-name(../..)"/>/agencyFor/representedOrganization/id mag maar één maal voorkomen</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:agencyFor/hl7:representedOrganization/hl7:id">
            <extends rule="II"/>
            <assert role="error" test="(@root='2.16.528.1.1007.3.3' and @extension) or (@root='2.16.840.1.113883.2.4.3.11' and @extension='7')"
                >Batch: <value-of select="local-name(../../../..)"/>/<value-of select="local-name(../../..)"/>/agencyFor/representedOrganization/id moet een UZI-registerabonneenummer zijn of het Klantenloket</assert>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:agencyFor/hl7:representedOrganization/hl7:name">
            <extends rule="ON"/>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:agencyFor/hl7:representedOrganization/hl7:telecom">
            <extends rule="TEL"/>
        </rule>
        <rule context="hl7:MCCI_IN200101/hl7:*[local-name()='receiver' or local-name()='sender']/hl7:device/hl7:location">
            <assert role="error" test="not(.)"
                >Batch: <value-of select="local-name(..)"/>/device/location mag niet gebruikt worden.</assert>
        </rule>
    </pattern>
</schema>
